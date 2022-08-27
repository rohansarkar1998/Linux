import pandas as pd
#from openpyxl.workbook import Workbook
df=pd.read_csv('Football')
df.to_excel('Player.xlsx','Sheet1')
