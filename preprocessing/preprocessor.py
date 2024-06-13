import random, subprocess
from pathlib import Path
from os import environ
from sys import argv

from heuristics.random_search import ACTransformsRS
from exceptions.ahls_exceptions import UpdateMDError, InstrumentationError
from design_eval import ahls_error

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as ahls_error:
    print(f"Error: Environment variable {ahls_error.args[0]} not defined.")
    raise

class AHLSPreProcessor:
    def __init__(self, kernel_ir_path : Path, ac_transforms : Path, populate_io_path : Path, host_ir_path : Path=None):
        '''
        Parameters
        ----------
        * kernel_ir_path : Path
            Path to the exact IR of the design kernel (i.e. the design functions that are being synthesized).
        * ac_transforms : List
            List of available AC transformations (i.e., AC techniques applied to design constructs).
        * populate_io_path : Path
            Path to the IR of the function that populates the input/output data of the design.
        * host_ir_path : Path, optional
            Path to the exact design IR host, which is an IR having a main function that process input files
            (passed as command line arguments), calls the design's top function and write its results to an 
            output file. Not needed if the design's top function is the main function itself, correctly process
            the inputs and output the results of its operations.
        '''
        self.__exact_data_stats_file_path = Path("data_stats.txt")
        self.__profiler_path = Path("profiler.bc")
        
        self.__exact_kernel_ir_path = kernel_ir_path
        self.__design_dir = self.__exact_kernel_ir_path.parent
        self.__design_name = self.__exact_kernel_ir_path.stem

        self.__populate_io_path = populate_io_path
        self.__exact_host_ir_path = host_ir_path

        self.__exact_design_ir_path = None
        if self.__exact_host_ir_path is None:
            self.__exact_design_ir_path = self.__exact_kernel_ir_path
        else:
            self.link_design_host()

        self.__ac_transforms = ac_transforms

    def link_design_host(self):
        self.__exact_design_ir_path = self.__design_name + ".bc"
        link_cmd = f"{LLVM_LINK} {self.__exact_kernel_ir_path} {self.__exact_host_ir_path} -o {self.__exact_design_ir_path}"

        try:
            subprocess.check_output(link_cmd, stderr=subprocess.STDOUT, shell=True)
        except subprocess.CalledProcessError as error:
            raise InstrumentationError(self.__exact_kernel_ir_path.as_posix(), error.returncode, error.output)

    def update_md(self):
        output_path = self.__design_name + ".md.bc"

        # Update operation metadata (include ID and signedness information)
        update_md_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {self.__exact_design_ir_path} > {output_path}"

        try: 
            subprocess.check_output(update_md_cmd, stderr=subprocess.STDOUT, shell=True)
        except subprocess.CalledProcessError as error:
            raise UpdateMDError(self.__exact_design_ir_path.as_posix(), error.returncode, error.output)
    
    def instrument(self):
        profiled_ir_path = self.__design_name + ".pf.0.bc"

        # Insert calls to profile functions after each binary operation and a call 
        # to a function that writes the profile data to the file in data_stats_file_path
        profile_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -profile -pf {self.__exact_data_stats_file_path} \
                        < {self.__exact_design_ir_path} > {profiled_ir_path}"

        try:
            subprocess.check_output(profile_cmd, stderr=subprocess.STDOUT, shell=True)
        except subprocess.CalledProcessError as error:
            raise InstrumentationError(self.__exact_design_ir_path.as_posix(), error.returncode, error.output)

        # Link the profiled IR with the profiler and the function that populates the input/output data
        output_path = self.__design_name + "_instrumented.bc"
        link_cmd = f"{LLVM_LINK} {profiled_ir_path} {self.__profiler_path} {self.__populate_io_path} -o {output_path}"

        try:
            subprocess.check_output(link_cmd, stderr=subprocess.STDOUT, shell=True)
        except subprocess.CalledProcessError as error:
            raise InstrumentationError(self.__exact_design_ir_path.as_posix(), error.returncode, error.output)
        
        self.__instrumented_design_ir_path = Path(output_path)

    if False:
        def apply_transforms(self, design_ir, ac_transforms):
            pass

        def generate_training_dataset(self, exact_design_ir, ac_transforms, exact_design_ir_host=None):
            '''
            Parameters
            ----------
            * exact_design_ir : Path
                Path to the exact (non-approximated) design IR.
            * ac_transforms : List
                List of available AC transformations (i.e., AC techniques applied to design constructs).
            * exact_design_ir_host : Path, optional
                Path to the exact design IR host, which is an IR having a main function that calls 
                the design's top function and write its results to an output file. Not needed if the 
                design's top function is the main function itself and output the results of its operations.
            '''
            random_search = ACTransformsRS(ac_transforms, n_iter=100)
            ac_permutations = random_search.generate_permutations()
            approx_designs = [self.apply_transforms(exact_design_ir, transforms) for transforms in ac_permutations]