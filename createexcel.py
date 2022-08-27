import csv
import xlsxwriter

input_file = '/home/osboxes/ResultofUsers'
#output_file = '/home/osboxes/testing.csv'

wb = xlsxwriter.workbook('/home/osboxes/testing.xlsx')
worksheet = wb.add_worksheet()

with open(input_file, 'r') as data:
	reader = csv.reader(data, delimiter=',')
	for row in reader:
		ws.append(row)


wb.save(output_file)
