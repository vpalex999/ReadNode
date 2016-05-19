# -*- coding: utf-8 -*-
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
     def __init__(self, namedir):
         self.namedir = namedir

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
     def print_node(self):
         print('-------------------------------------------------')
         print("NODEID:             "+ self.dicnode["NODEID"])
         print("NODENAME:           "+ self.dicnode["NODENAME"])
         
        

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
     def print_ne_hostname(self,dict):
          self.dict = dict
          print("HOSTNAME:           "+ self.dict["HOSTNAME"])
          print("HOSTNAME1:          "+ self.dict["HOSTNAME1"])
          print("HOSTNAME2:          "+ self.dict["HOSTNAME2"])
          print("GEOSYS_UNIT_ID:     "+ self.dict["GEOSYS_UNIT_ID"])
                                 
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

     def print_mn_node_version(self,dict):
         self.dict = dict
         print("DB_RELEASE:         "+ self.dict["DB_RELEASE"])
         print("DATA_RELEASE:       "+ self.dict["DATA_RELEASE"])

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
         str = 'BOARDNR:            '+board1['BOARDNR']+'            | '+board2['BOARDNR']
         board.append(str)
         str = 'PARENT_BOARDNR:     '+board1["PARENT_BOARDNR"]+'         | '+board2["PARENT_BOARDNR"]
         board.append(str)
         str = 'BOARD_POS:          '+board1["BOARD_POS"]+'            | '+board2["BOARD_POS"]
         board.append(str)
         str = 'BOARD_TYPE:         '+board1["BOARD_TYPE"]+'           | '+board2["BOARD_TYPE"]
         board.append(str)
         str = 'BOARD_EQUIP:        '+board1["BOARD_EQUIP"]+'            | '+board2["BOARD_EQUIP"]
         board.append(str)
         str = 'BOARD_OOSI:         '+board1["BOARD_OOSI"]+'            | '+board2["BOARD_OOSI"]
         board.append(str)
         str = 'REQ_BOARD_ID:       '+board1["REQ_BOARD_ID"]+'    | '+board2["REQ_BOARD_ID"]
         board.append(str)
         str = 'ACT_BOARD_ID:       '+board1["ACT_BOARD_ID"]+' | '+board2["ACT_BOARD_ID"]
         board.append(str)
         str = 'BOARD_SERIALNR:     '+board1["BOARD_SERIALNR"]+'   | '+board2["BOARD_SERIALNR"]
         board.append(str)
         str = 'BOARD_DSC:          '+board1["BOARD_DSC"]+'        | '+board2["BOARD_DSC"]
         board.append(str)
         str = 'BOARD_PROFILE_TYPE: '+board1["BOARD_PROFILE_TYPE"]+'            | '+board2["BOARD_PROFILE_TYPE"]
         board.append(str)
         str = 'BOARD_PROFILE_ID:   '+board1["BOARD_PROFILE_ID"]+'            | '+board2["BOARD_PROFILE_ID"]
         board.append(str)
         str = 'S_NODE:             '+board1["S_NODE"]+'            | '+board2["S_NODE"]
         board.append(str)
         str = 'GEOSYS_UNIT_ID:     '+board1["GEOSYS_UNIT_ID"]+'            | '+board2["GEOSYS_UNIT_ID"]
         board.append(str)
         str = "-------------------------------------------------"
         board.append(str)

         for item in board:
             print(item)
         board.append(str)
         
         return board
        
# печать обработанных данных
     def print_nodes(self):
         file_node =open(self.dicnode["NODEID"]+".txt","w")

         self.print_node()
         self.print_ne_hostname(self.dicnehostname)
         self.print_mn_node_version(self.dicmnnodeversion)
         print('-------------------------------------------------')
         file_node.readline(self.print_board(self.tableboard))  

         file_node.close()



              
# END CLASS my_node         
     

     
     
my_node = ReadNode("ne5101")
my_node.read_node()
my_node.read_ne_hostname()
my_node.read_mn_node_version()
my_node.read_board()
my_node.print_nodes()




