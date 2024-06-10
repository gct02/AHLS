from sklearn import ensemble
from estimator import Estimator
from heuristics.random_search import RandomSearch

class RFRegressor(Estimator):
    def __init__(self, n_estimators=100):
        self.n_estimators = n_estimators
        self.rf_regressor = ensemble.RandomForestRegressor(n_estimators=self.n_estimators)
        self.is_trained = False

    def train(self, dataset):
        pass

    def estimate(self, ac_transforms):
        pass
