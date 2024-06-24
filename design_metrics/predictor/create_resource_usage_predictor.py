from estimators.rf_regressor import RFRegressor
from design_metrics.preprocessing.preprocessor import PreProcessor

if __name__ == "__main__":
    training_set_path = "design_metrics/dataset/training"
    test_set_path = "design_metrics/dataset/test"

    preprocessor = PreProcessor()

    rf_regressor = RFRegressor(preprocessor)
    rf_regressor.train(training_set_path)
    score = rf_regressor.evaluate(test_set_path)

    # Save the model
    rf_regressor.save("design_metrics/models/resource_usage_estimator.joblib")

    print(f"R^2 score: {score}")
