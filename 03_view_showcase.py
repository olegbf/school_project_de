### Cкрипт выводит агреггированную информацию в графическом виде             

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cx_Oracle as ora
import matplotlib.pyplot as plt
# from matplotlib.backends.backend_pdf import PdfPages

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

#####
l_summer = l_cursor.execute(" select * from t_aggr_s ")

x_data_s = []
height_s = []
fig, axs = plt.subplots()

for i in l_summer:
    x_data_s.append(i[0])
    height_s.append(i[1])

axs.bar(x_data_s, height_s, color = 'green')
axs.set_ylabel('Кол-во медалей')

fig.suptitle('Страны, завоевавшие 10 и более золотых медалей на летней олимпиад\
е (до 2014г.)')
fig.set_size_inches(19,4.5)

plt.savefig('summer.png')

#####
l_winter = l_cursor.execute(" select * from t_aggr_w ")

x_data_w = []
height_w = []
fig, axs = plt.subplots()

for i in l_winter:
    x_data_w.append(i[0])
    height_w.append(i[1])

axs.bar(x_data_w, height_w)
axs.set_ylabel('Кол-во медалей')

fig.suptitle('Страны, завоевавшие 10 и более золотых медалей на зимней олимпиад\
е (до 2014г.)')
fig.set_size_inches(9.5,4.4)

plt.savefig('winter.png')

#####
l_dict = l_cursor.execute(" select * from t_aggr_dict ")

x_data_d = []
height_d = []
fig, axs = plt.subplots()

for i in l_dict:
    x_data_d.append(i[0])
    height_d.append(i[1])

axs.bar(x_data_d, height_d, color = 'red')
axs.set_ylabel('ВВП')

fig.suptitle('Страны с ВВП более $5000 и населением более 50 млн. человек')
fig.set_size_inches(9.5,4.4)

plt.savefig('dict.png')

plt.show()

l_cursor.close()
l_conn_ora.close()
