import random
from heuristics.heuristic import Heuristic

class RandACT(Heuristic):
    def __init__(self, ac_transforms, n_iter=100):
        '''
        Parameters
        ----------
        * ac_transforms : List
            List of available AC transformations (i.e., ACTs applied to design constructs).
        * n_iter : int, optional
            Number of iterations to run the random search. If not provided, it is settled to 100.
        '''
        self.n_iter = n_iter
        self.ac_transforms = ac_transforms

    def generate_permutation(self, selected_permutations=[]):
        '''
        Parameters
        ----------
        * selected_permutations : List, optional
            Permutations of AC transformations that were already chosen (so they are not chosen again).
            If not provided, is assumed to be an empty list.
        '''
        n_ac_transforms = len(self.ac_transforms)
        while new_permutation in selected_permutations:
            sample_size = random.randint(1, n_ac_transforms)
            new_permutation = random.sample(self.ac_transforms, sample_size)
            # TODO: Verify if the permutation satisfy the design constraints (e.g., no conflicting transformations)

        return new_permutation

    def generate_permutations(self):
        n_ac_transforms = len(self.ac_transforms)
        n_permutations = 2 ** n_ac_transforms

        if n_permutations < self.n_iter:
            self.n_iter = n_permutations

        permutations = [[]]
        for _ in range(self.n_iter):
            new_permutation = self.generate_permutation(permutations)
            permutations.append(new_permutation)

        return permutations