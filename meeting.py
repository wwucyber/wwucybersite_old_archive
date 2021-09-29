import os
import datetime
currentdir = os.getcwd()
full_path = currentdir + '/content/minutes_page.md'
file = open(full_path, "a")
#create date variable
current_date = str(datetime.datetime.today()).split()[0]
#create hyperlink to meeting minutes markdown in main "directory" post for minutes
file.write(f"[2021-09-28](https://wwucyber.com/minutes/{current_date}.md)\n")
#create said post in hugo
os.system(f"hugo new \"minutes/{current_date}.md\"")