import os
import datetime

currentdir = os.getcwd()
full_path = currentdir + '/content/minutes_page.md'
#open file in append mode
file = open(full_path, "a")

#create date variable
current_date = str(datetime.datetime.today()).split()[0]

#create hyperlink to meeting minutes in main "directory" post for minutes
file.write(f"[{current_date}](https://wwucyber.com/minutes/{current_date})\n")

#create said post in hugo
os.system(f"hugo new \"minutes/{current_date}.md\"")

#write stuff to new markdown file
#1. Parse data from .docx files and insert into md post.
#2. 