from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg

# Initialize Spark session
spark = SparkSession.builder \
    .appName("Superstore Analysis") \
    .getOrCreate()

# Read CSV file into Spark DataFrame
superstore_df = spark.read.csv("Superstore.csv", header=True, inferSchema=True)

# Drop null values
superstore_df = superstore_df.dropna()

# Convert "Sales" column to decimal type
superstore_df = superstore_df.withColumn("Sales", col("Sales").cast("decimal(10,2)"))

# a) Find the total sales amount for each category of products
total_sales_by_category = superstore_df.groupBy("Category").agg(sum("Sales").alias("TotalSalesByCategory"))

# b) Find the total quantity sold for each segment
total_quantity_by_segment = superstore_df.groupBy("Segment").agg(sum("Quantity").alias("TotalQuantityBySegment"))

# c) Find the average profit per product sub-category
avg_profit_by_subcategory = superstore_df.groupBy("Sub-Category").agg(avg("Profit").alias("AverageProfitBySubcategory"))

# Show results
print("Total Sales Amount for Each Category of Products:")
total_sales_by_category.show()

print("\nTotal Quantity Sold for Each Segment:")
total_quantity_by_segment.show()

print("\nAverage Profit per Product Sub-Category:")
avg_profit_by_subcategory.show()

# Stop Spark session
spark.stop()
