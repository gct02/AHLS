import os

class PreProcessor:
    def __init__(self):
        self.features = None
        self.labels = None

    def process(self, dataset):
        self.features = []
        self.labels = []
        directory = os.fsencode(dataset)
        for samples_file in os.listdir(directory):
            with open(os.path.join(directory, samples_file), 'r') as f:
                f.readline() # Skip header
                samples = [line.split(',') for line in f.readlines()]
                for row in samples:
                    self.features.append([int(row[0]), int(row[1]), int(row[2])])
                    self.labels.append([int(row[3]), int(row[4]), int(row[5]), float(row[6])])
        return self.features, self.labels