import numpy as np
import math

def MSE(exact_result, approx_result):
    # Normalize the results
    max_exact = max(exact_result)
    min_exact = min(exact_result)
    range_exact = max_exact - min_exact
    if range_exact == 0:
        range_exact = 1
    exact_result = np.array([(x - min_exact) / range_exact for x in exact_result])

    max_approx = max(approx_result)
    min_approx = min(approx_result)
    range_approx = max_approx - min_approx
    if range_approx == 0:
        range_approx = 1
    approx_result = np.array([(x - min_approx) / range_approx for x in approx_result])
    
    return np.mean([(x - y) ** 2 for x, y in zip(exact_result, approx_result)])

def RMSE(exact_result, approx_result):
    return math.sqrt(MSE(exact_result, approx_result))

def accuracy(exact_result, approx_result):
    n = len(exact_result)
    if n == 0:
        return 1
    correct = 0
    for i in range(n):
        if exact_result[i] == approx_result[i]:
            correct += 1
    return correct / n

def error_rate(exact_result, approx_result):
    n = len(exact_result)
    if n == 0:
        return 1
    wrong = 0
    for i in range(n):
        if exact_result[i] != approx_result[i]:
            wrong += 1
    return wrong / n

