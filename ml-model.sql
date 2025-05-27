CREATE OR REPLACE MODEL `data-proc-revature.final_dataset.sales_prediction_model`
OPTIONS(
  model_type = 'linear_reg',
  input_label_cols = ['Sale']
) AS
SELECT
  Qty,
  Category,
  Product,
  Country,
  Sale
FROM
  `data-proc-revature.final_dataset.final_sales`
WHERE
  Sale IS NOT NULL
#test
SELECT
  *,
  predicted_Sale
FROM
  ML.PREDICT(
    MODEL `data-proc-revature.final_dataset.sales_prediction_model`,
    (
      SELECT
        Qty,
        Category,
        Product,
        Country
      FROM
        `data-proc-revature.final_dataset.final_sales`
      WHERE Sale IS NULL -- or any data for prediction
    )
  );
