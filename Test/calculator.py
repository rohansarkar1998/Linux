from datetime import datetime
while  True: 
	num1 = int(input("Enter first num"))
	num2= int(input("Enter second number"))
	choice = int(input("1 for add 2 for sub 3 for mul 4 for div"))
	res=0
	str2=""
	if choice == 1 :
		res = num1+num2
		str2=str2+"+"
	elif choice == 2:
		res = num1-num2
		str2=str2+"-"
	elif choice == 3:
		res = num1*num2
		str2=str2+"*"
	elif choice == 4:
		res = num1/num2
		str2=str2+"/"
	line=""
	t=datetime.now()
	line=line+str(t)
	file = open("CalculatorLogs", "a")
	line = line+" "+str(num1)+" "+str2+" "+str(num2)+" = "+str(res)+"\n"
	print (line)
	file.writelines(line)
	cal = input("Want another 1 for yes ")
	if cal!=1:
		break
file.close()
