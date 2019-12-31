# -*- coding: utf-8 -*-
from __future__ import print_function
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import NoAlertPresentException
import unittest, time, re
import sys
from os.path import join, dirname, abspath
import xlrd
from user_input import *

fname = "/home/kolibri/Desktop/Adding_Learners/studentData.xlsx"
#log_file = "/home/kolibri/Desktop/Adding_Learners/.add_learnres/learners.txt"
text_invalid_user = "Incorrect username or password"

class AddUser(unittest.TestCase):
    def setUp(self):
        # self.driver = webdriver.Firefox()
        # self.driver = webdriver.Firefox()
	self.driver = webdriver.Chrome()        
	self.driver.implicitly_wait(30)
        self.base_url = "http://localhost:8080"
        self.verificationErrors = []
        self.accept_next_alert = True
    
    def test_add_user(self):
        uname, password = self.input_from_user()
        if uname is None and password is None:
            print (" \n Please enter the correct input:")
            self.test_add_user()
        driver = self.driver
        driver.get(self.base_url + "/user#/signin")
        time.sleep(2)
	driver.find_element_by_xpath("//div[@id='username']//input[@class='ui-textbox__input']").clear()      
	driver.find_element_by_xpath("//div[@id='username']//input[@class='ui-textbox__input']").send_keys(uname)
	time.sleep(2)
	driver.find_element_by_xpath("//button[@class='login-btn button primary raised']").click()
	

	
	time.sleep(2)
	driver.find_element_by_xpath("//div[@id='password']//input[@class='ui-textbox__input']").clear()

	driver.find_element_by_xpath("//div[@id='password']//input[@class='ui-textbox__input']").send_keys(password)      
	
        time.sleep(2)
        driver.find_element_by_xpath("//button[@class='login-btn button primary raised']").click()
	time.sleep(5)
	if (text_invalid_user in self.driver.page_source):
                return False
        self.read_file_data(fname)
        
    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException as e: return False
        return True
    
    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException as e: return False
        return True
    
    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True

    def read_file_data(self, fname):   # Open the workbook
        xl_workbook = xlrd.open_workbook(fname)

        # List sheet names, and pull a sheet by name
        sheet_names = xl_workbook.sheet_names()
        # print('Sheet Names', sheet_names)

        xl_sheet = xl_workbook.sheet_by_name(sheet_names[0])

        xl_sheet = xl_workbook.sheet_by_index(0)
        # print ('Sheet name: %s' % xl_sheet.name)
	time.sleep(3)
	driver = self.driver
	driver.get("http://localhost:8080/facility/#/users")
	time.sleep(5)
        # Print all values, iterating through rows and columns
        num_cols = xl_sheet.ncols   # Number of columns
        for row_idx in range(0, xl_sheet.nrows):    # Iterate through rows
            #print ('-'*40)
            #print ('Row: %s' % row_idx)   # Print row number
            l = []
            for col_idx in range(0, num_cols):  # Iterate through columns
                cell_obj = xl_sheet.cell(row_idx, col_idx)  # Get cell object by row, col
                # print ("col:"+ str(col_idx))
                # print (cell_obj.value)
                l.append(cell_obj.value)
            if len(l) > 0:
                if l[1] != 'Username':
                	result, uname = self.create_user(l[0],l[1],l[2],l[2])
                	print ("Uname:",uname)
		        if result is None:
		            print ("User already exists")
		            pass
		        elif not result:
		            print ("umnatch data")
		        else:
		           with open("/home/kolibri/Desktop/Adding_Learners/.add_learners/"+"learneres.txt","a") as f:
		                f.write(str(uname) + " : " +"user created successfully" + "\n")
		        print ("user created successfully")
            else:
                print ("incomplete row data")

    def create_user(self, name, username, password, confirm_pass):
        """
        Used to create new user

        Args:
            name(str) = name of the user
            username(str) = user id
            password(str) = password of user account
        Returns:
            True(Boolean) = if user created successfully else False
        """
	print(name)
        try:
            if not name and not username and not password and not confirm_pass:
                return False, None
            if password != confirm_pass:
                return False, None
            driver = self.driver
	    table = driver.find_element_by_xpath("//table[@class='core-table']")
	    rows = table.find_elements(By.TAG_NAME, "tr")
	    names = []
	    for row in rows[1:]:
		row1 = row.find_elements(By.TAG_NAME, "td")
		names.append(row1[3].text)
		
		
	    time.sleep(5)
            driver.find_element_by_xpath("//button[@class='button primary raised']").click()

	    time.sleep(1)
            driver.find_element_by_css_selector("input.ui-textbox__input").clear()
            driver.find_element_by_css_selector("input.ui-textbox__input").send_keys(name)
            time.sleep(1)
            driver.find_element_by_xpath("(//input[@type='text'])[2]").clear()
            driver.find_element_by_xpath("(//input[@type='text'])[2]").send_keys(username)
	    driver.find_element_by_xpath("//input[@type='password']").clear()
            text = "Username already exists"
            

            if username in names:
		driver.find_element_by_xpath("//button[contains(text(), 'Cancel')]").click()
		return None, username 
		
	    else:
		time.sleep(2)

		driver.find_element_by_xpath("//input[@type='password']").clear()
                driver.find_element_by_xpath("//input[@type='password']").send_keys(password)
                time.sleep(2)
                driver.find_element_by_xpath("(//input[@type='password'])[2]").clear()
                driver.find_element_by_xpath("(//input[@type='password'])[2]").send_keys(confirm_pass)
                time.sleep(2)

                driver.find_element_by_xpath("//button[contains(text(), 'Create Account')]").click()
                time.sleep(1)
                return True, username
                
		#return None, username      
		
        except Exception as e:
            print (e)
            return False
    
    def input_from_user(self):
	#var = getText('enter your name')
	#print ("Var:", var)
        username = getText("\n Enter the teacher/PM Username:")
        password = getText("\n Enter the teacher/PM Password:")
        #file_name = getText("\n Enter name of the file which you want to upload the student data:")
        if username and password:
            return username, password
        else:
            return None, None


    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
