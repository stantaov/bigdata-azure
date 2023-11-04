from pyspark.sql import SparkSession
import random

def is_point_inside_unit_circle(p):
    x, y = random.random(), random.random()
    return 1 if x*x + y*y < 1 else 0

if __name__ == "__main__":
    spark = SparkSession.builder \
        .appName("PiEstimation") \
        .getOrCreate()
    
    num_samples = 100000

    count = spark.sparkContext.parallelize(range(0, num_samples)).map(is_point_inside_unit_circle).reduce(lambda a, b: a + b)

    print("Pi is roughly %f" % (4.0 * count / num_samples))

    spark.stop()
