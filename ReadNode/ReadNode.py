# -*- coding: utf-8 -*-
import sys, os
import argparse # работаем с аргументами командной строки
import xlrd     # работаем с XLS документом на чтение
version = "0.0.1"

class ReadNode(object):
    #здесь храним информацию из таблицы node.dat
     dicnode={"NODEID":"","NODENAME":""}

    #здесь храним информацию из таблицы ne_hostname.dat 
     dicnehostname={"NODEID":"","HOSTNAME":"","HOSTNAME1":"","HOSTNAME2":"","GEOSYS_UNIT_ID":""}

    #здесь храним информацию из таблицы mn_node_version.dat
     dicmnnodeversion = {"DB_RELEASE":"","DATA_RELEASE":""}

     # Здесь смотрим информацию о структуре полей из таблицы board.dat для CS
     # tableboard=[{"NODEID":"", "BOARDNR":"", "PARENT_BOARDNR":"", "BOARD_POS":"", "BOARD_TYPE":"", "BOARD_EQUIP":"",
     #          "BOARD_OOSI":"", "REQ_BOARD_ID":"", "ACT_BOARD_ID":"", "BOARD_SERIALNR":"", "BOARD_DSC":"",
     #          "BOARD_PROFILE_TYPE":"", "BOARD_PROFILE_ID":"", "S_NODE":"", "GEOSYS_UNIT_ID":""},
     #              {"NODEID":"", "BOARDNR":"", "PARENT_BOARDNR":"", "BOARD_POS":"", "BOARD_TYPE":"", "BOARD_EQUIP":"",
     #          "BOARD_OOSI":"", "REQ_BOARD_ID":"", "ACT_BOARD_ID":"", "BOARD_SERIALNR":"", "BOARD_DSC":"",
     #          "BOARD_PROFILE_TYPE":"", "BOARD_PROFILE_ID":"", "S_NODE":"", "GEOSYS_UNIT_ID":""}]
     #
     # Здесь смотрим информацию о структуре полей из таблицы board.dat для MG(CMI)
     # tableboard=[{"NODEID":"", "BOARDNR":"", "PARENT_BOARD":"", "BOARD_POS":"", "BOARD_TYPE":"", "BOARD_EQUIP":"",
     #              "BOARD_OOSI":"", "REQ_BOARD_ID":"", "ACT_BOARD_ID":"", "BOARD_SERIALNR":"", "BOARD_DSC":"",
     #              "BOARD_PROFILE_TYPE":"", "BOARD_PROFILE_ID":""}]


     boardCS=[]
     boardMG=[]
     boardCCS=[]
     boardLIM=[]
              
     # массив с найденными релизами в xml
     releases = [] 
     version = "" # версия пакета
     # массив с описанием выводимых полей xml
     description_releases = ['Version release: ','MN Release: ','SN Release: ','DB Release: ','DATA Release: ','Preinstallation: ','Info: '] 

# инициализация, принимает как аргумент путь и деректорию
# где находятся файлы экспорта
#
     def __init__(self, namedir, typenode="default"):
         self.namedir = namedir
         self.typenode = typenode
         #self.typenode = typenode.lower()
         

# функция удаляет знак переноса каретки \n в конце строки и форматирует
     def formatstring(self,temp_string):
          i =0
          temp_item = ""
          for key in range(len(temp_string)-1):            # обрабатываем каждую строку
                    temp_item += temp_string[key]
          temp_item = temp_item.replace("\'","").split(",") # удаляем '
          return temp_item

    

     # читаем таблицу node.dat 
     def read_node(self):
             node_path = self.namedir+'\\node.dat' #строим путь до файла
             # если файл существует
             if os.path.isfile(node_path):
                try:
                    with open(node_path,"r")as nodes: # читаем  файл
                        temp_string = nodes.readline() # удаляем '
                        temp_string = self.formatstring(temp_string) # формат строки
                        self.dicnode['NODEID']=temp_string[0]           # читаем NODEID
                        self.dicnode['NODENAME']=temp_string[1]         # читаем NODENAME 
                except Exception:
                   print("\nПроблема с чтением файла: "+node_path+"\n")
             else: print("\nОтсутствует файл: %s\n" %node_path)

     # печать с форматированием данных node.dat
     def print_node(self,file_node):
             # временный массив для сохранения и печати подготовленных отформатированных строк
             node = []
             # форматирование строк с данными и добавление в массив hostname
             node.append('-------------------------------------------------')
             node.append("NODEID:\t\t\t\t"+ self.dicnode["NODEID"])
             node.append("NODENAME:\t\t\t"+ self.dicnode["NODENAME"])
             # цикл для записи в файл массива hostname
             for item in node:
                 file_node.write(item+"\n")         
        
     # читаем таблицу ne_hostname.dat
     def read_ne_hostname(self):
             node_path = self.namedir+'\\ne_hostname.dat' #строим путь до файла
             # если файл существует
             if os.path.isfile(node_path):
                  try:
                      with open(node_path,"r")as nodes: # читаем  файл
                          temp_string = nodes.readline() # удаляем '
                          temp_string = self.formatstring(temp_string)       # формат строки
                          self.dicnehostname['NODEID']=temp_string[0]           # читаем NODEID
                          self.dicnehostname['HOSTNAME']=temp_string[1]         # читаем HOSTNAME
                          self.dicnehostname['HOSTNAME1']=temp_string[2]         # читаем HOSTNAME1
                          self.dicnehostname['HOSTNAME2']=temp_string[3]         # читаем HOSTNAME2
                          if len(temp_string)==5:                            # для старых пакетов не анализируем параметр GEOSYS_UNIT_ID
                             self.dicnehostname['GEOSYS_UNIT_ID']=temp_string[4]         # читаем GEOSYS_UNIT_ID
                  except Exception:
                         print("\nПроблема с чтением файла: "+node_path+"\n")
             else: print("\nОтсутствует файл: %s\n" %node_path)

     # печать с форматированием данных ne_hostname.dat
     def print_ne_hostname(self,dict,file_node):
          # временный массив для сохранения и печати подготовленных отформатированных строк
          hostname = []
          # форматирование строк с данными и добавление в массив hostname
          hostname.append("HOSTNAME:\t\t\t"+ dict["HOSTNAME"])
          hostname.append("HOSTNAME1:\t\t\t"+ dict["HOSTNAME1"])
          hostname.append("HOSTNAME2:\t\t\t"+ dict["HOSTNAME2"])
          hostname.append("GEOSYS_UNIT_ID:\t\t"+ dict["GEOSYS_UNIT_ID"])
          # цикл для записи в файл массива hostname
          for item in hostname:
               file_node.write(item+"\n")

     # читаем таблицу mn_node_version.dat                            
     def read_mn_node_version(self):
               node_path = self.namedir+'\\mn_node_version.dat' #строим путь до файла
               # если файл существует
               if os.path.isfile(node_path):
                  try:
                           
                      with open(node_path,"r")as nodes: # читаем  файл
                          temp_string = nodes.readline() # удаляем '
                          temp_string = self.formatstring(temp_string) # формат строки
                          self.dicmnnodeversion["DB_RELEASE"]=temp_string[0]           # читаем NODEID
                          self.dicmnnodeversion["DATA_RELEASE"]=temp_string[1]         # читаем NODENAME
                          #dbrelease=temp_string[0]           # читаем NODEID 
                          #datarelease=temp_string[1]         # читаем NODENAME
                          dbrelease = self.dicmnnodeversion["DB_RELEASE"]
                          datarelease = self.dicmnnodeversion["DATA_RELEASE"]  
                      if dbrelease != '' and datarelease != '':
                          return True
                      else: 
                          print("Файл mn_node_version.dat пустой")
                          return False

                  except Exception:
                      print("\nПроблема с чтением файла: "+node_path+"\n")
                      return False
               else: 
                   print("\nОтсутствует файл: %s\n" %node_path)
                   return False

     # печать с форматированием данных mn_node_version.dat
     def print_mn_node_version(self,dict,file_node):
             # временный массив для сохранения и печати подготовленных отформатированных строк
             version = []
             # форматирование строк с данными и добавление в массив version
             version.append("DB_RELEASE:\t\t\t"+ dict["DB_RELEASE"])
             version.append("DATA_RELEASE:\t\t"+ dict["DATA_RELEASE"])
             # цикл для записи в файл массива version
             for item in version:
               file_node.write(item+"\n")

     #def read_board_type(tempstring,typenode):
     #    self

     # читаем таблицу board.dat          
     def read_board(self):
             node_path = self.namedir+'\\board.dat' #строим путь до файла           
             # если файл существует
             if os.path.isfile(node_path):
                try:
                    with open(node_path,"r")as nodes: # читаем  файл
                        temp_strings = nodes.readlines()     # читаем миссив из файла                     
                        #read_board_type(temp_strings,self.typenode)
                        
                        if self.typenode == 'cs' or self.typenode == "mg":
                           for temp_string in temp_strings:     # каждую строку в массиве обрабатываем в цикле. Для CS будет две строки
                               temp_string = self.formatstring(temp_string)   # формат строки
                               # создаем пустой словарь   
                               boardCSlocal={}
                               # добавляем в словарь информацию о плате(board) 
                               boardCSlocal["NODEID"]=temp_string[0]
                               boardCSlocal["BOARDNR"]=temp_string[1]
                               boardCSlocal["PARENT_BOARDNR"]=temp_string[2]
                               boardCSlocal["BOARD_POS"]=temp_string[3]
                               boardCSlocal["BOARD_TYPE"]=temp_string[4]
                               boardCSlocal["BOARD_EQUIP"]=temp_string[5]
                               boardCSlocal["BOARD_OOSI"]=temp_string[6]
                               boardCSlocal["REQ_BOARD_ID"]=temp_string[7]
                               boardCSlocal["ACT_BOARD_ID"]=temp_string[8]
                               boardCSlocal["BOARD_SERIALNR"]=temp_string[9]
                               boardCSlocal["BOARD_DSC"]=temp_string[10]
                               boardCSlocal["BOARD_PROFILE_TYPE"]=temp_string[11]
                               boardCSlocal["BOARD_PROFILE_ID"]=temp_string[12]
                               if len(temp_string) > 13:
                                 boardCSlocal["S_NODE"]=temp_string[13]
                                 boardCSlocal["GEOSYS_UNIT_ID"]=temp_string[14]
                               else:
                                 boardCSlocal["S_NODE"]=""
                                 boardCSlocal["GEOSYS_UNIT_ID"]=""
                               # добавляем словрь в массив boardCS
                               self.boardCS.append(boardCSlocal)  
                        else: print("Не удалось автомаически распознать тип продукта,\n\
попробуйте указать тип узла явным образом используя дополнительный аргумент: -t [cs,ccs,mg]")                     
                except Exception:
                    print("\nПроблема с чтением файла: "+node_path+"\n")
             else: print("\nОтсутствует файл: %s\n" %node_path)

     # печать с форматированием данных board.dat
     def print_board(self,file_node): 
         # временный массив для сохранения и печати подготовленных отформатированных строк
         board = []
         if self.typenode == 'cs' or self.typenode == "mg":  
             boardCS = self.boardCS          
             # форматирование строк с данными и добавление в массив board
             board.append("-------------------------------------------------")
             board.append('BOARDNR:\t\t\t'+boardCS[0]['BOARDNR']+'\t\t\t\t| '+boardCS[1]['BOARDNR'])
             board.append('PARENT_BOARDNR:\t\t'+boardCS[0]["PARENT_BOARDNR"]+'\t\t\t| '+boardCS[1]["PARENT_BOARDNR"])
             board.append('BOARD_POS:\t\t\t'+boardCS[0]["BOARD_POS"]+'\t\t\t\t| '+boardCS[1]["BOARD_POS"])
             board.append('BOARD_TYPE:\t\t\t'+boardCS[0]["BOARD_TYPE"]+'\t\t\t\t| '+boardCS[1]["BOARD_TYPE"])
             board.append('BOARD_EQUIP:\t\t'+boardCS[0]["BOARD_EQUIP"]+'\t\t\t\t| '+boardCS[1]["BOARD_EQUIP"])
             board.append('BOARD_OOSI:\t\t\t'+boardCS[0]["BOARD_OOSI"]+'\t\t\t\t| '+boardCS[1]["BOARD_OOSI"])
             board.append('REQ_BOARD_ID:\t\t'+boardCS[0]["REQ_BOARD_ID"]+'\t\t| '+boardCS[1]["REQ_BOARD_ID"])
             board.append('ACT_BOARD_ID:\t\t'+boardCS[0]["ACT_BOARD_ID"]+'\t\t| '+boardCS[1]["ACT_BOARD_ID"])
             board.append('BOARD_SERIALNR:\t\t'+boardCS[0]["BOARD_SERIALNR"]+'\t| '+boardCS[1]["BOARD_SERIALNR"])
             board.append('BOARD_DSC:\t\t\t'+boardCS[0]["BOARD_DSC"]+'\t\t\t| '+boardCS[1]["BOARD_DSC"])
             board.append('BOARD_PROFILE_TYPE: '+boardCS[0]["BOARD_PROFILE_TYPE"]+'\t\t\t\t| '+boardCS[1]["BOARD_PROFILE_TYPE"])
             board.append('BOARD_PROFILE_ID:\t'+boardCS[0]["BOARD_PROFILE_ID"]+'\t\t\t\t| '+boardCS[1]["BOARD_PROFILE_ID"])
             board.append('S_NODE:\t\t\t\t'+boardCS[0]["S_NODE"]+'\t\t\t\t| '+boardCS[1]["S_NODE"])
             board.append('GEOSYS_UNIT_ID:\t\t'+boardCS[0]["GEOSYS_UNIT_ID"]+'\t\t\t\t| '+boardCS[1]["GEOSYS_UNIT_ID"])
             board.append("-------------------------------------------------")

             # цикл для записи в файл массива board
             for item in board:
                 file_node.write(item+"\n")       
         else: return False
           
     # печать обработанных данных xml
     def print_release_xml(self,releases,description_releases,version,file_node):
                 xml = []
                 # печатаем результат        
                 if(len(releases)!=0):                
                     for item in releases:
                         xml.append(version)  
                         temp = item[1:]
                         for key in range(len(temp)):
                             xml.append(description_releases[key]+ temp[key])                            
                         xml.append("-------------------------------------------------")
                     for item in xml:
                         file_node.write(item+"\n")
        
     # функция общей печати данных    
     def print_nodes(self):
             tmpfile= "info_from_NODE_"+self.dicnode["NODEID"]+".txt"
             try:
                 file_node =open(tmpfile,"w")
                 self.print_node(file_node)
                 self.print_ne_hostname(self.dicnehostname,file_node)
                 self.print_mn_node_version(self.dicmnnodeversion,file_node)
                 #self.print_board(self.boardCS,file_node)
                 self.print_board(file_node)
                 self.print_release_xml(self.releases,self.description_releases,self.version,file_node)  
                 file_node.close()
                 print("\nОтчет сгенерирован в файле: "+tmpfile+"\n")
             except Exception:
                    print("\nЕсть проблемы с созданием и записью файла отчета!!!\n")
             finally: file_node.close() 
              
     def read_release_xml(self):
            dbrelease = self.dicmnnodeversion["DB_RELEASE"]
            datarelease = self.dicmnnodeversion["DATA_RELEASE"]
         #if dbrelease != '' and datarelease != '':
            # определяем путь к текущему расположению скрипта 
            BASE_DIR = os.path.dirname(os.path.abspath(__file__))
            # определяем файл xls для парсинга
            name = os.path.join(BASE_DIR,'Версии ПО MN V5_6.xls')
          
            #переменные
            index_cs6112 = 0
            index_cs6113 = 0
            index_cs6114 = 0
            index_cs6115 = 0
            index_ce6111 = 0
            index_li6121 = 0
            index_mg6112 = 0
            index_mg6113 = 0
            index_mg6113cx = 0
            index_mg6114 = 0
            index_mg6131 = 0

            count = 0
            #description = ['Version release: ','MN Release: ','SN Release: ','DB Release: ','DATA Release: ','Preinstallation: ','Info: '] # массив с описанием выводимых полей
            # проверяем на существование и начинаем обрабатывать
            if os.path.isfile(name): # если файл существует, то выполняем парсинг
               rb = xlrd.open_workbook(name,formatting_info=True)
               sheet = rb.sheet_by_index(1)  # выбираем вторую закладку
               # читаем построчно 
               for rownum in range(sheet.nrows):        
                   arrayrow = sheet.row_values(rownum)
                   count += 1  # счетчик строк
                   # ищем и запоминаем номера индексов разделов продуктов
                   if(arrayrow[0] == "CS6112AX xxx"):
                      index_cs6112 = count
                   elif(arrayrow[0] == "CS6113AX xxx"):
                      index_cs6113 = count
                   elif(arrayrow[0] == "CS6114AX xxx"):
                      index_cs6114 = count
                   elif(arrayrow[0] == "CS6115AX(BX) xxx"):
                      index_cs6115 = count
                   elif(arrayrow[0] == "CE6111AX xxx"):
                      index_ce6111 = count
                   elif(arrayrow[0] == "LI6121AXxxx"):
                       index_li6121 = count
                   elif(arrayrow[0] == "MG6112AX xxx"):
                       index_mg6112 = count
                   elif(arrayrow[0] =="MG6113BX xxx"):
                       index_mg6113 = count
                   elif(arrayrow[0] == "MG6113CX xxx"):
                       index_mg6113cx = count
                   elif(arrayrow[0] == "MG6114AX xxx"):
                        index_mg6114 = count
                   elif(arrayrow[0] == "MG6131AX xxx"):
                       index_mg6131 = count
                   # сразу за проход ищем запрошенный релиз
                   elif(arrayrow[3]== dbrelease and arrayrow[4]== datarelease):
                       temparray = []
                       temparray.append(count) # сохраняем строку в которой найден релиз
                       for item in arrayrow:   # считываем строку с релизом в массив
                           temparray.append(item)
                       self.releases.append(temparray) # может буть несколько пакетов с одинаковым релизом
               # Если нашли релиз, то определяем его тип cs,mg,ccs
               if len(self.releases) !=0 :           
                   if(self.releases[0][0] > index_cs6112 and self.releases[0][0] < index_cs6113):
                      self.version='CS6112AX:'
                      self.typenode = "cs"
                   elif (self.releases[0][0] > index_cs6113 and self.releases[0][0] < index_cs6114):
                      self.version='CS6113AX:'
                      self.typenode = "cs"
                   elif (self.releases[0][0] > index_cs6114 and self.releases[0][0] < index_cs6115):
                      self.version='CS6114AX:'
                      self.typenode = "cs"
                   elif (self.releases[0][0] > index_cs6115 and self.releases[0][0] < index_ce6111):
                      self.version='CS6115AX:'
                      self.typenode = "cs"
                   elif(self.releases[0][0] > index_ce6111 and self.releases[0][0] < index_li6121):
                      self.version='CE6111AX:'
                      self.typenode = "ccs"    
                   elif(self.releases[0][0] > index_li6121 and self.releases[0][0] < index_mg6112):
                      self.version='LI6121AX:'
                      self.typenode = "li" 
                   elif(self.releases[0][0] > index_mg6112 and self.releases[0][0] < index_mg6113):
                      self.version='MG6112AX:'
                      self.typenode = "mg" 
                   elif(self.releases[0][0] > index_mg6113 and self.releases[0][0] < index_mg6113cx):
                      self.version='MG6113BX:'
                      self.typenode = "mg"
                   elif(self.releases[0][0] > index_mg6113cx and self.releases[0][0] < index_mg6114):
                      self.version='MG6113CX:'
                      self.typenode = "mg"  
                   elif(self.releases[0][0] > index_mg6114 and self.releases[0][0] < index_mg6131):
                      self.version='MG6114AX:'
                      self.typenode = "mg" 
                   elif(self.releases[0][0] > index_mg6131):
                      self.version='MG6131AX:'
                      self.typenode = "mg"             
                   return True
               else: 
                   print("В файле 'Версии ПО MN V5_6.xls' нет данной версии ПО,\n\
попробуйте указать тип узла явным образом используя дополнительный аргумент: -t [cs,ccs,mg]")
                   return False                                                                                     
            else: 
                 print("Отсутствует файл 'Версии ПО MN V5_6.xls' в директории "+BASE_DIR)
                 return False                
         #else: 
         #    print("В экспорте отсутствует файл mn_node_version.dat, либо он пустой")
         #    return False
                            
# END CLASS my_node         

# Функция разбора аргументов командной строки и предоставления справки в стиле unix  
# Используется функция argparse   
def createParser():
    parser = argparse.ArgumentParser(
        prog = 'ReadNode',
        description = "Чтение основных данных из таблиц экспорта\n\
        узлов CS,CCS,MG для продуктов SI2000/SI3000.\n\
        Разработано для версии Python 3.4 и выше.",
        epilog = "(c) Май 2016 vpalex@mail.ru. Автор программы, как всегда,\
        не несет никакой ответственности",
        add_help=False    
    )
    parent_group = parser.add_argument_group(title="Параметры")
    parent_group.add_argument('--help','-h',action='help',help='Справка')
    parser.add_argument('directory', help="Обязательный параметр: Имя папки с экспортом. Например: ne5101.") # первый обязательный аргумент указывает директорию экспорта
    parser.add_argument('-t', choices=['CS','cs','CCS','ccs','MG','mg'], help="Обязательный параметр: Тип узла - CS,CCS,MG. Например: -t cs. ") # второй аргумент определяет тип узла: CS, CCS, MG
    parser.add_argument('--version','-v', action = 'version',help = 'Вывести номер версии',version = '%(prog)s {}'.format(version)) # показывают версию
    return parser
# END Parser

####################################################################################
#                               Главный алгоритм скрипта                           #                                
####################################################################################
if __name__ == '__main__':
  parser = createParser() 
  if len(sys.argv[1:]) != 0: # Если есть аргументы в командной строке
    namespace = parser.parse_args(sys.argv[1:]) # Сохраняем аргументы в виде массива
    
    #выполнить проверку наличия директории 
    if(os.path.exists(namespace.directory)): # если директория с экспортом существует, то выполняем парсинг
        print("\nВыбрана директория с экспортом: {}!".format(namespace.directory))
        # если в командной строке указывается дополнительный(необязательный аргумент) -  тип экспорта напримет: -t cs
        if namespace.t:
            typenode = namespace.t.lower() # перевом в строчный формат          
            my_node = ReadNode(namespace.directory,typenode) # создаём экземпляр класса c типом узла указанным в аргументе -t:  cs, mg, ....
        else:
            my_node = ReadNode(namespace.directory) # если нет дополнительного аргумента с типом узла, то создаем объект только с указанием расположения директории экспорта
            # если файл mn_node_version.dat читается и не пустой
        if my_node.read_mn_node_version():
            my_node.read_release_xml() #  то пытаемся определить тип экспорта и версию пакета в файле 'Версии ПО MN V5_6.xls'                       
        else:
            print("Не удается определить тип узла, введите тип узла явным бразом,\n\
                   используя дополнительный аргумент -t [cs,mg,ccs...]\n")   
        # создаем и выводим на печать, таблицы, которые не зависят от типа узла и таблицы версии ПО: ne_hostname, node         
        my_node.read_node() # Читаем таблицу node.dat
        my_node.read_ne_hostname() # Читаем таблицу ne_hostname.dat
        my_node.read_board() # Читаем таблицу board.dat
        my_node.print_nodes() # Печатаем обработанные данные
           
    else:
        print("каталог "+namespace.d+" не существует\n")
  else: # Если в командной строке нет аргументов, то выводим help
      parser.print_help()

       



