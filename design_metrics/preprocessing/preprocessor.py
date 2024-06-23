
class PreProcessor:
    def __init__(self):
        self.samples = None
        self.labels = None

    def process(self, dataset):
        with open(dataset, 'r') as f:
            f.readline() # Skip header
            data = [line.split(',') for line in f.readlines()]
            self.samples = [[int(row[0]), int(row[1]), int(row[2])] for row in data]
            self.labels = [[int(row[3]), int(row[4]), int(row[5]), float(row[6])] for row in data]
        return self.samples, self.labels