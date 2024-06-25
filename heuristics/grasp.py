from heuristics.heuristic import Heuristic
from heuristics.random_search import RandACT
from estimators.rf_regressor import RFRegressor
from pathlib import Path
import random

class GRASP(Heuristic):
    def __init__(self, ac_transforms, trained_estimator_path: Path, n_iter=100):
        self.n_iter = n_iter
        self.estimator = RFRegressor(trained_estimator_path)
        self.ac_transforms = ac_transforms

    

    

    
    
