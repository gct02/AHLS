class ClangException(Exception):
    def __init__(self, bytecode, error_code, output):
        self.error_code = error_code
        self.output = output
        super().__init__(f"Clang failed while compiling {bytecode}. Error code {error_code}. stderr: {output}.")

class AHLSPassException(Exception):
    pass

class UpdateMDError(AHLSPassException):
    def __init__(self, bytecode, error_code, output):
        self.bytecode = bytecode
        self.error_code = error_code
        self.output = output
        super().__init__(f"Failed to update metadata of {bytecode}. Error code: {error_code}. stderr: {output}.")

class InstrumentationError(AHLSPassException):
    def __init__(self, bytecode, error_code, output):
        self.bytecode = bytecode
        self.error_code = error_code
        self.output = output
        super().__init__(f"Failed to instrument {bytecode}. Error code: {error_code}. stderr: {output}.")

class V2CError(AHLSPassException):
    def __init__(self, bytecode, error_code, output):
        self.bytecode = bytecode
        self.error_code = error_code
        self.output = output
        super().__init__(f"Failed to apply v2c transformation to {bytecode}. Error code: {error_code}. stderr: {output}.")
