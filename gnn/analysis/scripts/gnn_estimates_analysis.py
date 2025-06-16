

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from numpy.typing import NDArray
from sklearn.cluster import KMeans



def cluster_predictions(
    predictions: NDArray[np.float_],
) -> NDArray[np.int_]:
    if predictions.ndim > 2:
        predictions = predictions.reshape(predictions.shape[0], -1)

    model = KMeans(n_clusters=5)
    clusters = model.fit_predict(predictions)
    return clusters


def extract_predictions(predictions_path):
    with open(predictions_path, 'r') as f:
        lines = f.readlines()
    lines = lines[1:] # Skip header

    result_list = []
    for line in lines:
        idx, target, pred = line.strip().split(',')
        result = {"idx": int(idx), "pred": float(pred), "target": float(target)}
        result_list.append(result)

    return pd.DataFrame(result_list)


def plot_clusters(df):
    targets_preds = df["pred"].to_numpy()
    targets_preds = np.append(
        targets_preds.reshape(-1, 1), 
        df["target"].to_numpy().reshape(-1, 1), axis=1
    )

    if targets_preds.ndim > 2:
        targets_preds = targets_preds.reshape(targets_preds.shape[0], -1)

    model = KMeans(n_clusters=4)
    clusters = model.fit_predict(targets_preds)
    
    for i in range(len(np.unique(clusters))):
        cluster_solutions = df[clusters == i]["idx"].tolist()
        print(f"\nCluster {i}:")
        print(cluster_solutions)

    n_clusters = len(np.unique(clusters))
    cmap = plt.get_cmap('viridis')
    colors = cmap(np.linspace(0, 1, n_clusters))
    for i in range(n_clusters):
        cluster_data = df.loc[clusters == i]
        plt.scatter(
            cluster_data["pred"], cluster_data["target"],
            color=colors[i], label=f'Cluster {i} ({cluster_data["idx"].iloc[0]})',
            edgecolors="white", linewidth=0.7, alpha=0.6, s=60
        )

    plt.legend()
    plt.xlabel("Predictions", fontsize=14)
    plt.ylabel("Targets", fontsize=14)
    plt.title(f'AES: Predictions vs Targets\n', fontsize=16, pad=20)
    plt.grid(True, linestyle="--", linewidth=0.5, alpha=0.5)
    plt.tight_layout()
    plt.show()
    plt.close()


if __name__ == "__main__":
    import sys

    predictions_path = sys.argv[1]

    predictions = extract_predictions(predictions_path)
    # clusters = cluster_predictions(predictions)

    # eps = float(1e-8)
    # for i in range(len(np.unique(clusters))):
    #     cluster_solutions = predictions[clusters == i]["idx"].tolist()
    #     print(f"\nCluster {i}:")
    #     print(cluster_solutions)

    #     cluster_preds = predictions[clusters == i]["pred"].tolist()
    #     visited = set()
    #     for idx, pred in zip(cluster_solutions, cluster_preds):
    #         visited.add(idx)
    #         for idx_, pred_ in zip(cluster_solutions, cluster_preds):
    #             if idx_ not in visited and abs(pred_ - pred) == 0:
    #                 print(f"Prediction for {idx} and {idx_} are equal.")

    plot_clusters(predictions)