# Example of calculating class probabilities on various event 
from math import sqrt
from math import pi
from math import exp
 
# Split the dataset by class values, returns a dictionary
def separate_by_class(dataset):
	separated = dict()
	for i in range(len(dataset)):
		vector = dataset[i]
		class_value = vector[-1]
		if (class_value not in separated):
			separated[class_value] = list()
		separated[class_value].append(vector)
	return separated
 
# Calculate the mean of a list of numbers
def mean(numbers):
	return sum(numbers)/float(len(numbers))
 
# Calculate the standard deviation of a list of numbers
def stdev(numbers):
	avg = mean(numbers)
	variance = sum([(x-avg)**2 for x in numbers]) / float(len(numbers)-1)
	return sqrt(variance)
 
# Calculate the mean, stdev and count for each column of dataset
def summarize_dataset(dataset):
	summaries = [(mean(column), stdev(column), len(column)) for column in zip(*dataset)]
	del(summaries[-1])
	return summaries
 
# Split dataset by class then calculate statistics for each row
def summarize_by_class(dataset):
	separated = separate_by_class(dataset)
	summaries = dict()
	for class_value, rows in separated.items():
		summaries[class_value] = summarize_dataset(rows)
	return summaries
 
# Calculate the Gaussian probability distribution function for x
def calculate_probability(x, mean, stdev):
	exponent = exp(-((x-mean)**2 / (2 * stdev**2 )))
	return (1 / (sqrt(2 * pi) * stdev)) * exponent
 
# Calculate the probabilities of predicting each class for a given row
def calculate_class_probabilities(summaries, row):
	total_rows = sum([summaries[label][0][2] for label in summaries])
	probabilities = dict()
	for class_value, class_summaries in summaries.items():
		probabilities[class_value] = summaries[class_value][0][2]/float(total_rows)
		for i in range(len(class_summaries)):
			mean, stdev, _ = class_summaries[i]
			probabilities[class_value] *= calculate_probability(row[i], mean, stdev)
	return probabilities
 
# Test calculating class probabilities
dataset = [[8.393533211,2.331273381,0],
	[4.118564483,1.781539638,0],
	[1.343808831,3.368360954,0],
	[3.582294042,5.67917911,0],
	[2.280362439,6.866990263,0],
	[6.423436942,4.696522875,1],
	[5.745051997,3.533989803,1],
	[7.172168622,2.511101045,1],
	[9.792783481,3.424088941,1],
        [7.756051997,6.533989803,1],
	[ 6.533989803,2.511101045,0],
        [4.118564483,1.781539638,1],
	[9.343808831,3.368360954,0],
	[3.582294042,5.67917911,0],
	[2.280362439,6.866990263,0],
	[6.423436942,4.696522875,1],
	[5.745051997,3.533989803,1],
	[11.172168622,7.511101045,1],
	[9.792783481,3.424088941,1],
        [1.745051997,6.533989803,0],
	[6.792783481,3.424088941,0],
	[4.548745297,2.215436103,0],
	[3.621543158,8.456315487,0],
	[7.939820817,0.791637231,1]]
summaries = summarize_by_class(dataset)
probabilities = calculate_class_probabilities(summaries, dataset[0])
# Print the calaculated probabilities
print(probabilities)
