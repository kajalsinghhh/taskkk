from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark = SparkSession.builder \
    .appName("Denormalization and Parquet Writing") \
    .getOrCreate()


students_df = spark.read.csv("students.csv", header=True)
courses_df = spark.read.csv("courses.csv", header=True)
enrollments_df = spark.read.csv("enrollments.csv", header=True)


denormalized_df = enrollments_df.join(students_df, on="StudentID", how="inner") \
    .join(courses_df, on="CourseID", how="inner") \
    .select("StudentID", "StudentName", "CourseID", "CourseName")


denormalized_df.write.parquet("denormalized_table.parquet")

spark.stop()
