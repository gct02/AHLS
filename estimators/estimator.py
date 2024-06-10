from abc import ABC, abstractmethod

class Estimator(ABC):
    @abstractmethod
    def train(self, dataset):
        '''
        Parameters
        ----------
        * dataset : List
            List of pairs (T, (error, QoR)) where T is a set of transformations and 
            error and QoR are, respectively,the error and QoR metrics of the design 
            having undergone the transformations in T.
        '''
        pass

    @abstractmethod
    def estimate(self, ac_transforms):
        '''
        Parameters
        ----------
        ac_transforms : List
            List of AC transformations (i.e., AC techniques applied to design constructs)
            whose error and QoR metrics are to be estimated.
        '''
        pass
