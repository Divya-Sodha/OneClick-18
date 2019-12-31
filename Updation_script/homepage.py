from Tkinter import * # imports
import Tkinter
import os, sys
import Tkinter as tk
import ttk
from Tkinter import StringVar

import glob
import tkMessageBox
from time import gmtime, strftime

city = {}
def database_backup():
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Database backup is started.")
	fp.close()
	os.system("bash scripts/database_backup.sh")


def log_backup():
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Log backup is started.")
	fp.close()
	os.system("bash scripts/log_backup.sh")


def adding_learner():
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Adding Learner setup is started.")
	fp.close()
	os.system("bash scripts/adding_learner.sh")


def export_learner():
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Export Learner is started.")
	fp.close()
	os.system("bash scripts/export_learner.sh")


def platform_setup():
	# print(pex_file)
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Platform setup is started.")
	fp.close()
	command = "bash scripts/platform_setup.sh "
	os.system(command)


def hotspot_setup():
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Hotspot setup is started.")
	fp.close()
	os.system(" bash scripts/setup_hotspot.sh")



def nginx_setup():
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Nginx setup is started.")
	fp.close()
	os.system("bash scripts/nginx_setup.sh")

def Facility(param):
	print(city[param].get())


def hide_me(event):
    event.widget.pack_forget()

def online_setup():
	command = "bash scripts/online_setup.sh "
	fp = open("/home/kolibri/Desktop/Updation_script/updation.log","a+")
	fp.write("\n "+strftime("%a, %d %b %Y %H:%M:%S", gmtime())+ "  Online setup is started.")
	fp.close()
	os.system(command)

win = tk.Tk()                           # Create instance
win.title("Kolibri Platform Setup")                 # Add a title
tabControl = ttk.Notebook(win)          # Create Tab Control
tab1 = ttk.Frame(tabControl)            # Create a tab


tabControl.add(tab1, text='Platform Setup')      # Add the tab
intVar = tk.IntVar()
intVar.set(0)

button = Tkinter.Button(tab1, text="Platform", width=25,command=platform_setup)#platform_setup(pex_files[intVar.get()]))
button.pack()
tabControl.pack(expand=1, fill="both")  # Pack to make visible

tab2 = ttk.Frame(tabControl)
tabControl.add(tab2, text='Backup')

button = Tkinter.Button(tab2, text="Database", width=25,command=database_backup)
button.pack()
button1 = Tkinter.Button(tab2, text="Log", width=25,command=log_backup)
button1.pack()
tabControl.pack(expand=1, fill="both")


tab3 = ttk.Frame(tabControl)
tabControl.add(tab3, text='Learner_Automation')
button = Tkinter.Button(tab3, text="Adding_learner", width=25,command=adding_learner)
button.pack()
button = Tkinter.Button(tab3, text="Export_learner", width=25,command=export_learner)
button.pack()
tabControl.pack(expand=1, fill="both")


tab5 = ttk.Frame(tabControl)
tabControl.add(tab5, text='NGINX')
button = Tkinter.Button(tab5, text="nginx_setup", width=25,command=nginx_setup)
button.pack()
tabControl.pack(expand=1, fill="both")

tab4 = ttk.Frame(tabControl)
tabControl.add(tab4, text='Online installation')

intVar1 = tk.IntVar()
intVar1.set(0)

button = Tkinter.Button(tab4, text="Setup", width=25,command=online_setup)
button.pack()

button = Tkinter.Button(tab4, text="Hotspot Setup", width=25,command=hotspot_setup)
button.pack()


tabControl.pack(expand=1, fill="both")
































# tab5 = ttk.Frame(tabControl)
# tabControl.add(tab5, text='Facility Change')


# tabControl1 = ttk.Notebook(tab5)

# cities = os.listdir("/home/kolibri/Desktop/Updation_script/DB/")
# var1 = {}
# for k in range(0,len(cities)):
# 	var1[cities[k]] = cities[k]
# 	city[k] = []

# k=0
# tab_name = "tab5_"+str(k+1)
# tab_name = ttk.Frame(tabControl1)
# tabControl1.add(tab_name, text=cities[k])      # Add the tab
# tabControl1.pack(expand=1, fill="both")
# var1[cities[k]] = IntVar()
# var1[cities[k]].set(0)
# city_school = os.listdir("/home/kolibri/Desktop/Updation_script/DB/"+cities[k])
# for i in range(0,len(city_school)):
# 	city[cities[k]].append(city_school(i))
# 	R1 = Radiobutton(tab_name, text=city_school[i], variable=var1[cities[k]], value=i)
# 	R1.pack( anchor = W )
# button_5 = Tkinter.Button(tab_name, text="Submit", width=25,command=lambda: Facility(0))
# button_5.pack()


# k=1
# tab_name = "tab5_"+str(k+1)
# tab_name = ttk.Frame(tabControl1)
# tabControl1.add(tab_name, text=cities[k])      # Add the tab
# tabControl1.pack(expand=1, fill="both")
# var1[cities[k]] = IntVar()
# var1[cities[k]].set(0)
# city_school = os.listdir("/home/kolibri/Desktop/Updation_script/DB/"+cities[k])
# for i in range(0,len(city_school)):
# 	city[cities[k]].append(city_school(i))
# 	R1 = Radiobutton(tab_name, text=city_school[i], variable=var1[cities[k]], value=i)
# 	R1.pack( anchor = W )
# button_5 = Tkinter.Button(tab_name, text="Submit", width=25,command=lambda: Facility(1))
# button_5.pack()

# k=2
# tab_name = "tab5_"+str(k+1)
# tab_name = ttk.Frame(tabControl1)
# tabControl1.add(tab_name, text=cities[k])      # Add the tab
# tabControl1.pack(expand=1, fill="both")
# var1[cities[k]] = IntVar()
# var1[cities[k]].set(0)
# city_school = os.listdir("/home/kolibri/Desktop/Updation_script/DB/"+cities[k])
# for i in range(0,len(city_school)):
# 	city[cities[k]].append(city_school(i))
# 	R1 = Radiobutton(tab_name, text=city_school[i], variable=var1[cities[k]], value=i)
# 	R1.pack( anchor = W )
# button_5 = Tkinter.Button(tab_name, text="Submit", width=25,command=lambda: Facility(2))
# button_5.pack()

# k=3
# tab_name = "tab5_"+str(k+1)
# tab_name = ttk.Frame(tabControl1)
# tabControl1.add(tab_name, text=cities[k])      # Add the tab
# tabControl1.pack(expand=1, fill="both")
# var1[cities[k]] = IntVar()
# var1[cities[k]].set(0)
# city_school = os.listdir("/home/kolibri/Desktop/Updation_script/DB/"+cities[k])
# for i in range(0,len(city_school)):
# 	city[cities[k]].append(city_school(i))
# 	R1 = Radiobutton(tab_name, text=city_school[i], variable=var1[cities[k]], value=i)
# 	R1.pack( anchor = W )
# button_5 = Tkinter.Button(tab_name, text="Submit", width=25,command=lambda: Facility(3))
# button_5.pack()




# tabControl.pack(expand=1, fill="both")

win.geometry("600x500")
win.mainloop()
