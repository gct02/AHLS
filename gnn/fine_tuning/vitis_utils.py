import os
import sys
import time
import signal
import shutil
import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path
from random import randrange

import psutil

from domain.design_tool import DesignTool
from domain.solution import Solution
from exceptions.time_exceeded_exception import TimeExceededException


class Vitis(DesignTool):
    MAX_RAM_USAGE = 70  # in percentage
    DIRECTIVES_FILENAME = './domain/directives.tcl'
    SCRIPT_PATH = './domain/callVitis.sh'
    PROCESS_NAME = 'vitis_hls'
    VIVADO_PROCESS_NAME = 'vivado'
    FF_VALUE = 1
    LUT_VALUE = 2
    DSP_VALUE = 345.68
    BRAM_VALUE = 547.33

    def __init__(self, max_ram_usage=MAX_RAM_USAGE, directives_filename=DIRECTIVES_FILENAME):
        self._max_ram_usage = max_ram_usage
        self._directives_filename = directives_filename
        self._script_path = self.SCRIPT_PATH
        self._process_name = self.PROCESS_NAME
        self._vivado_process_name = self.VIVADO_PROCESS_NAME

        if sys.platform == 'win32':
            self._process_name = 'vitis_hls.exe'
            self._script_path = './domain/callVitis.bat'

    def run_synthesis_test(self, solution: Solution, time_limit=None, solution_saver=None):
        if time_limit is None:
            time_limit = float('inf')
        if time_limit <= 0:
            raise Exception(f"****{self._process_name} has exceeded max time usage****")

        results = {
            'FF': randrange(10),
            'DSP': randrange(1),
            'LUT': randrange(10),
            'BRAM': randrange(2),
            'resources': randrange(3),
            'latency': randrange(4)
        }
        solution.set_results(results)
        return solution

    def check_run_completion(self, solution_dir):
        impl_dir = Path(solution_dir) / 'impl/verilog/project.runs/impl_1/'
        log_path = impl_dir / 'runme.log'
        if not log_path.is_file():
            return False

        with open(log_path, 'r') as f:
            lines = f.readlines()
            for line in lines:
                if 'route_design completed successfully' in line:
                    util_rpt = impl_dir / 'bd_0_wrapper_utilization_placed.rpt'
                    power_rpt = impl_dir / 'bd_0_wrapper_power_routed.rpt'
                    timing_rpt = impl_dir / 'bd_0_wrapper_timing_summary_routed.rpt'
                    return util_rpt.is_file() and power_rpt.is_file() and timing_rpt.is_file()
                
        return False

    def alt_run_synth(self, solution: Solution, timeout=None, sol_saver=None, benchmark='', sol_count=1):
        if timeout is not None and timeout <= 0:
            raise Exception(f"Trying to run {self._process_name} with time limit <= 0")

        self._write_directives_into_file(solution.directives)
        print(f'** Starting run {sol_count} **')

        try:
            process = subprocess.Popen([self._script_path], start_new_session=True)
            process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            print(f'Timeout for run {sol_count} ({timeout}s) expired')
            print('Terminating process group...')
            os.killpg(os.getpgid(process.pid), signal.SIGKILL)

        completed = self.check_run_completion(benchmark, sol_count)
        if completed:
            print(f'Run {sol_count} was successful!')

        return completed

    def run_synth(self, solution: Solution, timeout=None, sol_saver=None, benchmark='', sol_count=1):
        is_done = False
        finished_rpts = False

        if timeout is not None and timeout <= 0:
            raise Exception(f"Trying to run {self._process_name} with time limit <= 0")

        if timeout is None:
            timeout = float('inf')

        self._write_directives_into_file(solution.directives)
        print(f'** Starting run {sol_count} **')

        process = subprocess.Popen([self._script_path])
        start_time = time.time()
        parent_pid = process.pid
        parent_process = psutil.Process(parent_pid)

        while parent_process.is_running() and parent_process.status() != psutil.STATUS_ZOMBIE:
            time.sleep(60)
            is_done, finished_rpts = self.check_run_completion(benchmark, sol_count)
            elapsed_time = time.time() - start_time
            if elapsed_time > timeout or finished_rpts:
                print('########################################################')
                if finished_rpts:
                    print(f'Run {sol_count} was successful! Killing processes...')
                else:
                    if not is_done:
                        print(f'Run {sol_count} exceeded time limit! Killing processes...')
                    else:
                        print(f'Run {sol_count} was successful but reports were not generated! Killing processes...')
                print('########################################################')
                for child in parent_process.children(recursive=True):
                    child.kill()
                parent_process.kill()
                print('Finished killing processes')

        is_done, finished_rpts = self.check_run_completion(benchmark, sol_count)
        return is_done

    def _write_directives_into_file(self, directives):
        print('Directives used:')
        print(directives)
        with open(self._directives_filename, "w") as directives_file:
            for value in directives.values():
                if value:
                    directives_file.write(value + '\n')
                print(value)

    def _kill_ongoing_vitis_process_if_any(self):
        directory = './Raise_dse'
        while os.path.exists(directory):
            time.sleep(3)
            try:
                shutil.rmtree(directory)
            except Exception as error:
                print(error)
            for proc in psutil.process_iter(['name']):
                if proc.name() == self._process_name:
                    print(f'Killed process {proc.name()}!')
                    proc.kill()
                    break

    def _kill_ongoing_vivado_process_if_any(self):
        directory = './Raise_dse'
        while os.path.exists(directory):
            time.sleep(3)
            try:
                shutil.rmtree(directory)
            except Exception as error:
                print(error)
            for proc in psutil.process_iter(['name']):
                if proc.name() == self._vivado_process_name:
                    print(f'Killed process {proc.name()}!')
                    proc.kill()
                    break

    def _monitor_vitis_process(self, time_limit, solution_saver):
        vitis_is_running = True
        start_time = time.time()
        while vitis_is_running:
            time.sleep(3)
            vitis_is_running = False
            for proc in psutil.process_iter(['name']):
                if proc.name() == self._process_name:
                    vitis_is_running = True
                    try:
                        memory_use = proc.memory_percent()
                    except Exception as e:
                        print(e)
                        break
                    if memory_use > self._max_ram_usage:
                        proc.kill()
                        raise Exception(f"****{self._process_name} has exceeded max RAM usage****")
                    if time.time() - start_time >= time_limit:
                        proc.kill()
                        raise TimeExceededException(f"****{self._process_name} has exceeded max time usage****")
                    if solution_saver:
                        solution_saver.save(None, './time_stamps/timeStampFiller')
                    break

    def _monitor_vivado_process(self, time_limit, solution_saver):
        vivado_is_running = True
        start_time = time.time()
        while vivado_is_running:
            time.sleep(3)
            vivado_is_running = False
            for proc in psutil.process_iter(['name']):
                if proc.name() == self._vivado_process_name:
                    vivado_is_running = True
                    try:
                        memory_use = proc.memory_percent()
                    except Exception as e:
                        print(e)
                        break
                    if memory_use > self._max_ram_usage:
                        proc.kill()
                        raise Exception(f"****{self._vivado_process_name} has exceeded max RAM usage****")
                    if time.time() - start_time >= time_limit:
                        proc.kill()
                        raise TimeExceededException(f"****{self._vivado_process_name} has exceeded max time usage****")
                    if solution_saver:
                        solution_saver.save(None, './time_stamps/timeStampFiller')
                    break

 
