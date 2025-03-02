import numpy as np
import matplotlib.pyplot as plt
from argparse import ArgumentParser

def get_last_epoch_residuals(log_file):
    with open(log_file, 'r') as f:
        lines = f.readlines()
    last_epoch_idx = int(lines[-1].split(',')[0])
    last_epoch_lines = [l for l in lines if l.startswith(f'{last_epoch_idx},')]
    last_epoch_residuals = [float(l.split(',')[-1]) for l in last_epoch_lines]
    return last_epoch_residuals

def plot_residuals(residuals):
    residuals = np.array(residuals).flatten()
    plt.figure(figsize=(12, 8), dpi=150)
    plt.hist(residuals, bins=100, color='blue', alpha=0.7)
    plt.xlabel('Residual')
    plt.ylabel('Frequency')
    plt.show()
    plt.close()

def parse_args():
    parser = ArgumentParser()
    parser.add_argument('-l', '--log_file', required=True, help='Path to log file')
    args = parser.parse_args()
    return args

def mad(residuals):
    median = np.median(residuals)
    return np.mean(np.abs(residuals - median))
    
if __name__ == '__main__':
    args = parse_args()

    last_epoch_residuals = get_last_epoch_residuals(args.log_file)
    last_epoch_residuals = np.array(last_epoch_residuals)

    print(f'Mean residual: {np.mean(last_epoch_residuals)}')
    print(f'Median residual: {np.median(last_epoch_residuals)}')
    print(f'Std residual: {np.std(last_epoch_residuals)}')
    print(f'Median absolute deviation: {mad(last_epoch_residuals)}')

    plot_residuals(last_epoch_residuals)
    