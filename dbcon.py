import pymysql
def selectall(query):
    con=pymysql.connect(host='localhost',port=3306,user='root',password='12345678',db='travel app')
    cmd=con.cursor()
    cmd.execute(query)
    result=cmd.fetchall()
    con.commit()
    return result

def selectone(query):
    con=pymysql.connect(host='localhost',port=3306,user='root',password='12345678',db='travel app')
    cmd=con.cursor()
    cmd.execute(query)
    result=cmd.fetchone()
    con.commit()
    return result


def iud(query,values):
    con = pymysql.connect(host='localhost', port=3306, user='root', password='12345678', db='travel app')
    cmd = con.cursor()
    cmd.execute(query,values)
    result = cmd.lastrowid
    con.commit()
    return result

def selectalltwo(query,values):
    con=pymysql.connect(host='localhost',port=3306,user='root',password='12345678',db='travel app')
    cmd=con.cursor()
    cmd.execute(query,values)
    result=cmd.fetchall()
    con.commit()
    return result

def selectonetwo(query,values):
    con=pymysql.connect(host='localhost',port=3306,user='root',password='12345678',db='travel app')
    cmd=con.cursor()
    print(query,values)
    cmd.execute(query,values)
    result=cmd.fetchone()
    print(result)
    con.commit()
    return result


def androidselectall(q,val):
    con=pymysql.connect(host='localhost',port=3306,user='root',passwd='12345678',db='travel app')
    cmd=con.cursor()
    cmd.execute(q,val)
    s=cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    print(json_data)
    for result in s:
        json_data.append(dict(zip(row_headers, result)))
    return json_data

def androidselectallnew(q):
    con=pymysql.connect(host='localhost',port=3306,user='root',passwd='12345678',db='travel app')
    cmd=con.cursor()
    cmd.execute(q)
    s=cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    print(json_data)
    for result in s:
        json_data.append(dict(zip(row_headers, result)))
    return json_data



