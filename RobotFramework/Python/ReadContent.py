import json

def read_file_content1():
    file=open('/home/shivampathak/Shivam/TestFiles/request.json','r')
    jsonfile = file.read()
    json_con = json.loads(jsonfile)
    return json_con

