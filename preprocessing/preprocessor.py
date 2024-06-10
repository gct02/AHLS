import random
from heuristics.random_search import ACTransformsRS

class PreProcessor:
    def __init__(self, exact_design_ir, ac_transforms, exact_design_ir_host=None):
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
        self.exact_design_ir = exact_design_ir
        self.ac_transforms = ac_transforms
        self.exact_design_ir_host = exact_design_ir_host

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