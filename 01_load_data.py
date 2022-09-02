### Cкрипт забирает с сайта Kaggle датасет и загружает его в таблицы        
### СУБД Oracle.                                                             

import cx_Oracle as ora
import csv
from kaggle.api.kaggle_api_extended import KaggleApi

# Загрузка файлов датасета с сайта Kaggle.com
api = KaggleApi()
api.authenticate()

p ='/mnt/hd0/yd/PROG/Learn/Learn_DE/projects/my_proj_de2/CSV/'

# Download all files of a dataset
# Signature: dataset_download_files\
#    (dataset, path=None, force=False, quiet=True, unzip=False)
api.dataset_download_files('the-guardian/olympic-games', path = p, unzip = True)
print()
print('Файлы датасета загружены!')
print()
# Конец загрузки файлов датасета

v_usr = '/mnt/hd0/yd/PROG/Learn/Learn_DE/user.txt'
v_pass = '/mnt/hd0/yd/PROG/Learn/Learn_DE/password.txt'

# Подключение к Oracle
with open(v_usr, 'r', encoding='utf-8-sig') as fp:
    user = fp.read().rstrip()

with open(v_pass, 'r', encoding='utf-8-sig') as fp:
    password = fp.read().rstrip()

l_user = user
l_pass = password
l_tns = ora.makedsn('192.168.1.166', 1521, service_name = 'xe')

l_conn_ora = ora.connect(l_user, l_pass, l_tns)
print ("Oracle DB version: " + l_conn_ora.version)
print ("Oracle client encoding: " + l_conn_ora.encoding)
#print(l_conn_ora)
l_cursor = l_conn_ora.cursor()
print()

# Переменные для расположения файлов датасета
r1_dict = '/mnt/hd0/yd/PROG/Learn/Learn_DE/projects/my_proj_de2/CSV/dictionary.csv'
r2_winter = '/mnt/hd0/yd/PROG/Learn/Learn_DE/projects/my_proj_de2/CSV/winter.csv'
r3_summer = '/mnt/hd0/yd/PROG/Learn/Learn_DE/projects/my_proj_de2/CSV/summer.csv'

print('Импорт данных из файлов в таблицы Oracle:')
#
# Вставка из csv в olymp_dict
#
insert1 = """
INSERT INTO olymp_dict (country, code, population, vvp)
VALUES (:1, :2, :3, :4)"""

# Initialize list that will serve as a container for bind values
L1 = []

reader1 = csv.reader(open(r1_dict), delimiter=',')
next(reader1) # считывание из csv со второй строки
for row in reader1:
    L1.append(tuple(row))

# prepare insert statement
l_cursor.prepare(insert1)

# execute insert with executemany
l_cursor.executemany(None, L1)

# report number of inserted rows
print ('Inserted to olymp_dict: ' + str(l_cursor.rowcount) + ' rows.')

#
# Вставка из csv в olymp_w
#
insert2 = """
INSERT INTO olymp_w (year, city, sport, discipline, athlete,
                     country, gender, event, medal)
VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9)"""

# Initialize list that will serve as a container for bind values
L2 = []

reader2 = csv.reader(open(r2_winter), delimiter=',')
next(reader2) # считывание из csv со второй строки
for row in reader2:
    L2.append(tuple(row))

# prepare insert statement
l_cursor.prepare(insert2)

# execute insert with executemany
l_cursor.executemany(None, L2)

# report number of inserted rows
print ('Inserted to olymp_w: ' + str(l_cursor.rowcount) + ' rows.')

#
# Вставка из csv в olymp_s
#
insert3 = """
INSERT INTO olymp_s (year, city, sport, discipline, athlete,
                      country, gender, event, medal)
VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9)"""

# Initialize list that will serve as a container for bind values
L3 = []

reader3 = csv.reader(open(r3_summer), delimiter=',')
next(reader3) # считывание из csv со второй строки
for row in reader3:
    L3.append(tuple(row))

# prepare insert statement
l_cursor.prepare(insert3)

# execute insert with executemany
l_cursor.executemany(None, L3)

# report number of inserted rows
print ('Inserted to olymp_s: ' + str(l_cursor.rowcount) + ' rows.')
print('done!')

# commit
l_conn_ora.commit()

# close cursor and connection
l_cursor.close()
l_conn_ora.close()
