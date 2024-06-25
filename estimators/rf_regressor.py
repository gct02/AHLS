from sklearn import ensemble
from estimators.estimator import Estimator
import joblib

class RFRegressor(Estimator):
    def __init__(self, preprocessor, n_estimators=100):
        self.n_estimators = n_estimators
        self.rf_regressor = ensemble.RandomForestRegressor(n_estimators=self.n_estimators)
        self.preprocessor = preprocessor
        self.is_trained = False

    def __init__(self, trained_model_path, preprocessor=None):
        self.preprocessor = preprocessor
        self.load(trained_model_path)

    def train(self, dataset):
        samples, labels = self.preprocessor.process(dataset)
        self.rf_regressor.fit(samples, labels)
        self.is_trained = True
    
    def evaluate(self, dataset):
        samples, labels = self.preprocessor.process(dataset)
        return self.rf_regressor.score(samples, labels)

    def estimate(self, sample):
        if not self.is_trained:
            raise Exception("Estimator not trained")
        return self.rf_regressor.predict(sample)
    
    def save(self, path):
        joblib.dump(self.rf_regressor, path)

    def load(self, path):
        self.rf_regressor = joblib.load(path)
        self.is_trained = True
        
