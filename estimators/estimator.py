from abc import ABC, abstractmethod

class Estimator(ABC):
    @abstractmethod
    def train(self, dataset):
        pass

    @abstractmethod
    def estimate(self, sample):
        pass
