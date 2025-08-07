import sys
import torch
from estimators.area.fine_tuning.utils import load_pretrained_model


if __name__ == "__main__":
    if len(sys.argv) != 3 and len(sys.argv) != 4:
        print("Usage: python tests/print_model_parameters.py <model_path> <model_args_path> [output_file]")
        sys.exit(1)

    if len(sys.argv) == 4:
        output_file = sys.argv[3]
    else:
        output_file = None

    model_path = sys.argv[1]
    model_args_path = sys.argv[2]

    DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    model = load_pretrained_model(
        model_path=model_path, 
        model_args_path=model_args_path,
        device=DEVICE
    )

    if output_file:
        with open(output_file, 'w') as f:
            for name, param in model.named_parameters():
                # f.write(f"{name}: {param.size()}\n")
                f.write(f"\"{name}\",\n")
    else:
        for name, param in model.named_parameters():
            print(f"{name}: {param.size()}")