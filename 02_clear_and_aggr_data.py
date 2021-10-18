#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed May 12 14:31:51 2021

@author: f0b
"""
import cx_Oracle as ora

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

print('________Загрузка информации в промежуточные таблицы________')

print('---> Загрузка данных в таблицу t_winter ')
l_cursor.execute('BEGIN pkg_fob.make_winter; END;')
print('done!')

print('---> Загрузка данных в таблицу t_summer')
l_cursor.execute('BEGIN pkg_fob.make_summer; END;')
print('done!')

print('---> Загрузка данных в таблицу t_dict')
l_cursor.execute('BEGIN pkg_fob.make_dict; END;')
print('done!')

print()

print('________Загрузка агрегированной информации________')
print('---> Загрузка данных в таблицу t_aggr_w')
l_cursor.execute('BEGIN pkg_fob.make_aggr_w; END;')
print('done!')

print('---> Загрузка данных в таблицу t_aggr_s')
l_cursor.execute('BEGIN pkg_fob.make_aggr_s; END;')
print('done!')

print('---> Загрузка данных в таблицу t_aggr_dict')
l_cursor.execute('BEGIN pkg_fob.make_aggr_dict; END;')
print('done!')

# close cursor and connection
l_cursor.close()
l_conn_ora.close()
