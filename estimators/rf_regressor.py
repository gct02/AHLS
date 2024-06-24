from sklearn import ensemble
from estimators.estimator import Estimator
import joblib

class RFRegressor(Estimator):
    def __init__(self, preprocessor, n_estimators=100):
        self.n_estimators = n_estimators
        self.rf_regressor = ensemble.RandomForestRegressor(n_estimators=self.n_estimators)
        self.preprocessor = preprocessor
        self.is_trained = False

    def train(self, dataset):
        samples, labels = self.preprocessor.process(dataset)
        self.rf_regressor.fit(samples, labels)
        self.is_trained = True

    def estimate(self, sample):
        if not self.is_trained:
            raise Exception("Estimator not trained")
        return self.rf_regressor.predict(sample)
    
    def evaluate(self, dataset):
        samples, labels = self.preprocessor.process(dataset)
        return self.rf_regressor.score(samples, labels)
    
    def save(self, path):
        joblib.dump(self.rf_regressor, path)
        
