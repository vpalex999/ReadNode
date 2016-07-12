# -*- coding: utf-8 -*-
import sys, os
import argparse


class ReadNode(object):
    #здесь храним информацию из таблицы node.dat
     dicnode={"NODEID":"","NODENAME":""}
    #здесь храним информацию из таблицы ne_hostname.dat 
     dicnehostname={"NODEID":"","HOSTNAME":"","HOSTNAME1":"","HOSTNAME2":"","GEOSYS_UNIT_ID":""}

    #здесь храним информацию из таблицы mn_node_version.dat
     dicmnnodeversion = {"DB_RELEASE":"","DATA_RELEASE":""}

     #здесь храним информацию из таблицы board.dat
     tableboard = [{"NODEID":"", "BOARDNR":"", "PARENT_BOARDNR":"", "BOARD_POS":"", "BOARD_TYPE":"", "BOARD_EQUIP":"",
               "BOARD_OOSI":"", "REQ_BOARD_ID":"", "ACT_BOARD_ID":"", "BOARD_SERIALNR":"", "BOARD_DSC":"",
               "BOARD_PROFILE_TYPE":"", "BOARD_PROFILE_ID":"", "S_NODE":"", "GEOSYS_UNIT_ID":""},
                   {"NODEID":"", "BOARDNR":"", "PARENT_BOARDNR":"", "BOARD_POS":"", "BOARD_TYPE":"", "BOARD_EQUIP":"",
               "BOARD_OOSI":"", "REQ_BOARD_ID":"", "ACT_BOARD_ID":"", "BOARD_SERIALNR":"", "BOARD_DSC":"",
               "BOARD_PROFILE_TYPE":"", "BOARD_PROFILE_ID":"", "S_NODE":"", "GEOSYS_UNIT_ID":""}]



# инициализация, принимает как аргумент путь и деректорию
# где находятся файлы экспорта
#
     def __init__(self, namedir, typenode):
         self.namedir = namedir
         self.typenode = typenode.lower()
         

# функция удаляет знак переноса каретки \n в конце строки и форматирует
     def formatstring(self,temp_string):
          i =0
          temp_item = ""
          for key in range(len(temp_string)-1):            # обрабатываем каждую строку
                    temp_item += temp_string[key]
          temp_item = temp_item.replace("\'","").split(",") # удаляем '
         # temp_item = temp_item.split(",")            # разделяем строки в массив
          return temp_item

    

     # читаем таблицу node.dat 
     def read_node(self):
             node_path = self.namedir+'\\node.dat' #строим путь до файла
             try:
                 with open(node_path,"r")as nodes: # читаем  файл
                      temp_string = nodes.readline() # удаляем '
                      temp_string = self.formatstring(temp_string) # формат строки
                      self.dicnode['NODEID']=temp_string[0]           # читаем NODEID
                      self.dicnode['NODENAME']=temp_string[1]         # читаем NODENAME 
             except Exception:
                print("\nПроблема с чтением файла: "+node_path+"\n")

     # печать с форматированием данных node.dat
     def print_node(self,file_node):
             self.file_node = file_node
             node = []
             node.append('-------------------------------------------------')
             node.append("NODEID:             "+ self.dicnode["NODEID"])
             node.append("NODENAME:           "+ self.dicnode["NODENAME"])
             for item in node:
                 print(item)
                 file_node.write(item+"\n")         
        
     # читаем таблицу ne_hostname.dat
     def read_ne_hostname(self):
             node_path = self.namedir+'\\ne_hostname.dat' #строим путь до файла
             try:
                  with open(node_path,"r")as nodes: # читаем  файл
                    temp_string = nodes.readline() # удаляем '
                    temp_string = self.formatstring(temp_string)       # формат строки
                    self.dicnehostname['NODEID']=temp_string[0]           # читаем NODEID
                    self.dicnehostname['HOSTNAME']=temp_string[1]         # читаем HOSTNAME
                    self.dicnehostname['HOSTNAME1']=temp_string[2]         # читаем HOSTNAME1
                    self.dicnehostname['HOSTNAME2']=temp_string[3]         # читаем HOSTNAME2
                    self.dicnehostname['GEOSYS_UNIT_ID']=temp_string[4]         # читаем GEOSYS_UNIT_ID
             except Exception:
                  print("\nПроблема с чтением файла: "+node_path+"\n")
     
     # печать с форматированием данных ne_hostname.dat
     def print_ne_hostname(self,dict,file_node):
          self.dict = dict
          self.file_node = file_node
          hostname = []
          hostname.append("HOSTNAME:           "+ self.dict["HOSTNAME"])
          hostname.append("HOSTNAME1:          "+ self.dict["HOSTNAME1"])
          hostname.append("HOSTNAME2:          "+ self.dict["HOSTNAME2"])
          hostname.append("GEOSYS_UNIT_ID:     "+ self.dict["GEOSYS_UNIT_ID"])
          for item in hostname:
               print(item)
               file_node.write(item+"\n")
                                 
     def read_mn_node_version(self):
               node_path = self.namedir+'\\mn_node_version.dat' #строим путь до файла
               try:
                   with open(node_path,"r")as nodes: # читаем  файл
                      temp_string = nodes.readline() # удаляем '
                      temp_string = self.formatstring(temp_string) # формат строки
                      self.dicmnnodeversion["DB_RELEASE"]=temp_string[0]           # читаем NODEID
                      self.dicmnnodeversion["DATA_RELEASE"]=temp_string[1]         # читаем NODENAME 
               except Exception:
                    print("\nПроблема с чтением файла: "+node_path+"\n")

     def print_mn_node_version(self,dict,file_node):
             self.dict = dict
             self.file_node = file_node
             version = []
             version.append("DB_RELEASE:         "+ self.dict["DB_RELEASE"])
             version.append("DATA_RELEASE:       "+ self.dict["DATA_RELEASE"])
             for item in version:
               print(item)
               file_node.write(item+"\n")

     # читаем таблицу board.dat          
     def read_board(self):
             node_path = self.namedir+'\\board.dat' #строим путь до файла
             try:
                 i =0
                 with open(node_path,"r")as nodes: # читаем  файл
                     temp_strings = nodes.readlines()     # читаем миссив из файла 
                     for temp_string in temp_strings:     # каждую строку в массиве обрабатываем в цикле
                        temp_string = self.formatstring(temp_string)   # формат строки   
                        self.tableboard[i]["NODEID"]=temp_string[0]
                        self.tableboard[i]["BOARDNR"]=temp_string[1]
                        self.tableboard[i]["PARENT_BOARDNR"]=temp_string[2]
                        self.tableboard[i]["BOARD_POS"]=temp_string[3]
                        self.tableboard[i]["BOARD_TYPE"]=temp_string[4]
                        self.tableboard[i]["BOARD_EQUIP"]=temp_string[5]
                        self.tableboard[i]["BOARD_OOSI"]=temp_string[6]
                        self.tableboard[i]["REQ_BOARD_ID"]=temp_string[7]
                        self.tableboard[i]["ACT_BOARD_ID"]=temp_string[8]
                        self.tableboard[i]["BOARD_SERIALNR"]=temp_string[9]
                        self.tableboard[i]["BOARD_DSC"]=temp_string[10]
                        self.tableboard[i]["BOARD_PROFILE_TYPE"]=temp_string[11]
                        self.tableboard[i]["BOARD_PROFILE_ID"]=temp_string[12]
                        self.tableboard[i]["S_NODE"]=temp_string[13]
                        self.tableboard[i]["GEOSYS_UNIT_ID"]=temp_string[14]
                        i+=1
             except Exception:
               print("\nПроблема с чтением файла: "+node_path+"\n")

     # печать с форматированием данных board.dat
     def print_board(self,dict,file_node): 
             self.dict = dict
             self.file_node = file_node
             board1 = dict[0]
             board2 = dict[1]
             board=[]
             board.append("-------------------------------------------------")
             board.append('BOARDNR:            '+board1['BOARDNR']+'            | '+board2['BOARDNR'])
             board.append('PARENT_BOARDNR:     '+board1["PARENT_BOARDNR"]+'         | '+board2["PARENT_BOARDNR"])
             board.append('BOARD_POS:          '+board1["BOARD_POS"]+'            | '+board2["BOARD_POS"])
             board.append('BOARD_TYPE:         '+board1["BOARD_TYPE"]+'           | '+board2["BOARD_TYPE"])
             board.append('BOARD_EQUIP:        '+board1["BOARD_EQUIP"]+'            | '+board2["BOARD_EQUIP"])
             board.append('BOARD_OOSI:         '+board1["BOARD_OOSI"]+'            | '+board2["BOARD_OOSI"])
             board.append('REQ_BOARD_ID:       '+board1["REQ_BOARD_ID"]+'    | '+board2["REQ_BOARD_ID"])
             board.append('ACT_BOARD_ID:       '+board1["ACT_BOARD_ID"]+' | '+board2["ACT_BOARD_ID"])
             board.append('BOARD_SERIALNR:     '+board1["BOARD_SERIALNR"]+'   | '+board2["BOARD_SERIALNR"])
             board.append('BOARD_DSC:          '+board1["BOARD_DSC"]+'        | '+board2["BOARD_DSC"])
             board.append('BOARD_PROFILE_TYPE: '+board1["BOARD_PROFILE_TYPE"]+'            | '+board2["BOARD_PROFILE_TYPE"])
             board.append('BOARD_PROFILE_ID:   '+board1["BOARD_PROFILE_ID"]+'            | '+board2["BOARD_PROFILE_ID"])
             board.append('S_NODE:             '+board1["S_NODE"]+'            | '+board2["S_NODE"])
             board.append('GEOSYS_UNIT_ID:     '+board1["GEOSYS_UNIT_ID"]+'            | '+board2["GEOSYS_UNIT_ID"])
             board.append("-------------------------------------------------")

             for item in board:
                 print(item)
                 file_node.write(item+"\n")       
           
     # печать обработанных данных
     def print_nodes(self):
             tmpfile= "info_from_NODE_"+self.dicnode["NODEID"]+".txt"
             try:
                 file_node =open(tmpfile,"w")
                 self.print_node(file_node)
                 self.print_ne_hostname(self.dicnehostname,file_node)
                 self.print_mn_node_version(self.dicmnnodeversion,file_node)
                 self.print_board(self.tableboard,file_node)  
                 file_node.close()
                 print("\nОтчет сгенерирован в файле: "+tmpfile+"\n")
             except Exception:
                    print("\nЕсть проблемы с созданием и записью файла отчета!!!\n")
             finally: file_node.close() 
              
# END CLASS my_node         
     
def createParser():
    parser = argparse.ArgumentParser(
        prog = 'ReadNode',
        description = 'Чтение основных данных из таблиц экспорта\
        узлов CS,CCS,MG для продуктов SI2000/SI3000.\
        Разработано для версии Python 3.4 и выше.',
        epilog = "(c) Май 2016 vpalex@mail.ru. Автор программы, как всегда,\
        не несет никакой ответственности",
        add_help=False    
    )
    parent_group = parser.add_argument_group(title="Параметры")
    parent_group.add_argument('--help','-h',action='help',help='Справка')
 
    parser.add_argument('-d', help="Обязательный параметр: Имя папки с экспортом. Например: -d ne5101.") # первый аргумент указывает директорию
    parser.add_argument('-t', choices=['CS','cs','CCS','ccs','MG','mg'], help="Обязательный параметр: Тип узла - CS,CCS,MG. Например: -t cs. ") # второй аргумент определяет тип узла: CS, CCS, MG
    return parser
# END Parser

if __name__ == '__main__':
    parser = createParser()
    namespace = parser.parse_args(sys.argv[1:])
    
    #выполнить проверку наличия директории 
    if(namespace.d and namespace.t):
       if(os.path.exists(namespace.d)): # если директория существует, то выполняем парсинг   
        typenode = namespace.t.lower()
        if(typenode == 'cs'):
           print("\nВыбрана директория с экспортом: {}!".format(namespace.d))
           my_node = ReadNode(namespace.d,typenode) # создаём экземпляр класса
           my_node.read_node()
           my_node.read_ne_hostname()
           my_node.read_mn_node_version()
           my_node.read_board()
           my_node.print_nodes()
        else:
          print("\nтип узла - "+typenode+" временно не обрабатывается\n")   
       else:
            print("каталог "+namespace.d+" не существует\n")
    else:
          parser.print_help()
           



