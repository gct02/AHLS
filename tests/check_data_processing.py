import torch

DATASET_DIR = 'estimators/area/dataset'


if __name__ == '__main__':
    data_path = 'estimators/area/dataset/test/processed/BACKPROP_1.pt'
    data = torch.load(data_path)
    torch.set_printoptions(edgeitems=1e10, linewidth=100, sci_mode=False)
    with open('tests/BACKPROP_1_pt.txt', 'w') as f:
        f.write(f'x: {data.x}\n')
        f.write(f'edge_index: {data.edge_index}\n')
        f.write(f'graph_attr: {data.graph_attr}\n')
        f.write(f'y: {data.y}\n')