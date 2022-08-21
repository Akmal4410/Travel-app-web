from flask import *
from werkzeug.utils import secure_filename

from dbcon import *

app = Flask(__name__)


@app.route("/logincode",methods=['post'])
def logincode():
    uname = request.form['username']
    password = request.form['password']
    q = "select * from login where username=%s and password=%s and usertype='user'"
    val = uname, password
    res = selectonetwo(q, val)
    if res is None:
        return jsonify({'task': 'invalid'})
    else:
        return jsonify({'task': 'success', 'lid': res[0]})


@app.route("/userregistration",methods=['post'])
def userregistration():
    try:
        fname = request.form['fname']
        lname = request.form['lname']
        gender = request.form['gender']
        dob = request.form['dob']
        email = request.form['email']
        phoneno = request.form['phoneno']
        post = request.form['post']
        place = request.form['place']
        pin = request.form['pin']
        username = request.form['username']
        password = request.form['password']
        image = request.files['files']
        print(image)
        file = secure_filename(image.filename)
        image.save("static/image/" + file)
        qry = "insert into login values(null,%s,%s,'user')"
        value = (username, password)
        lid = iud(qry, value)
        qry1 = "insert into users values(null,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val = (str(lid), fname, lname, gender, dob, email, phoneno, post, place, pin)
        iud(qry1, val)
        qry1 = "insert into user_certificate values(null,%s,%s)"
        val = (str(lid),file)
        iud(qry1, val)
        return jsonify({'task': 'success'})
    except Exception as e:
        return jsonify({'task': 'already exist'})


@app.route("/searchplacebyrating", methods=['post'])
def searchplacebyrating():
    qry = "SELECT `place`.*,avg(`placerating`.`rating`) FROM `placerating` left JOIN `place` ON " \
          "`place`.`place_id`=`placerating`.`place_id` group by `place`.`place_id` ORDER BY `rating` DESC "
    result  =androidselectallnew(qry)
    return jsonify(result)


@app.route("/addratingtoplace", methods=['post'])
def addratingtoplace():
    place_id = request.form['place_id']
    user_id = request.form['user_id']
    rating = request.form['rating']
    qry = "INSERT INTO `placerating` VALUES(null, %s, %s, curdate(), %s)"
    values = (place_id,user_id,rating)
    iud(qry, values)
    return jsonify({'task': 'success'})


@app.route('/viewpackage', methods=['post'])
def viewpackage():
    qry = "SELECT `packages`.*,`travelagencies`.`agency_name` FROM `travelagencies` JOIN `packages` ON `packages`.`travel_agency_login_id`=`travelagencies`.`agency_login_id`"
    result = androidselectallnew(qry)

    print(result)
    return jsonify(result)


@app.route('/packagebooking',methods=['pid=1&post','post','pid=1&get'])
def packagebooking():
    packageid = request.form['packageid']
    print(packageid)
    userid = request.form['userid']
    date = request.form['date']
    qry = "insert into packagesbooking values(null,%s,%s,%s,'pending')"
    values = (packageid, userid, date)
    iud(qry, values)
    return jsonify({'task': 'success'})


@app.route('/viewpackagestatus', methods=['post','pid=1&POST'])
def viewpackagestatus():
    id=request.form['id']
    qry = "SELECT `packagesbooking`.* ,`packages`.`package_details`,`packages`.`food_availability`,`packages`.`rate` FROM `packages` JOIN `packagesbooking` ON `packages`.`packages_id`=`packagesbooking`.`packages_id` where `packagesbooking`.`user_login_id`=%s ORDER BY `packagesbooking`.`packages_booking_id` DESC"

    val=(id)
    result = androidselectall(qry,val)
    return jsonify(result)


@app.route('/viewroomdetails', methods=['post'])
def viewroomdetails():
    qry = "SELECT `roomdetails`.*, `hotel`.`hotel_name`,`hotel`.`photo` FROM `hotel` JOIN `roomdetails` ON `hotel`.`hotel_login_id` = `roomdetails`.`hotel_login_id`"

    result = androidselectallnew(qry)
    print(result)
    return jsonify(result)


@app.route('/roombooking', methods=['post'])
def roombooking():
    roomid = request.form['roomid']
    userid = request.form['userid']
    date=request.form['date']
    qry = "insert into roombooking values(null, %s, %s, 'pending',%s)"
    values = (roomid, userid,date)
    iud(qry,values)
    return jsonify({'task': 'success'})


@app.route('/viewroomstatus', methods=['post'])
def viewroomstatus():
    id = request.form['id']
    qry = "SELECT `roombooking`.*, `roomdetails`.`room_details`,`roomdetails`.`a/c_type`,`roomdetails`.`bed_type`,`roomdetails`.`price` FROM `roomdetails` JOIN `roombooking` ON `roomdetails`.`room_id` = `roombooking`.`room_id` where `roombooking`.`user_login_id` = %s ORDER BY `roombooking`.`room_booking_id` DESC"
    value = id
    result = androidselectall(qry,value)
    return jsonify(result)


@app.route('/viewpost', methods=['post'])
def viewpost():
    qry = "SELECT `post`.*, `users`.`first_name`,`users`.`last_name` FROM `post` JOIN `users` WHERE `post`.`user_id`=`users`.`user_login_id`"
    result = androidselectallnew(qry)
    print(result)
    return jsonify(result)


@app.route('/addpost1', methods=['post'])
def addpost1():
    userid = request.form['userid']
    print(userid)
    qry = "select * from post where `post`.`user_id` = %s"
    values = (userid)
    res = androidselectall(qry, values)
    return jsonify(res)


@app.route('/viewblog', methods=['post'])
def viewblog():
    qry = "SELECT `blog`.*, `users`.`first_name`,`users`.`last_name` FROM `blog` JOIN `users` WHERE `blog`.`user_id`=`users`.`user_login_id`"
    result = androidselectallnew(qry)
    print(result)
    return jsonify(result)


@app.route('/viewplace', methods=['post'])
def viewplace():
    qry = "select * from place"
    result = androidselectallnew(qry)
    print(result)
    return jsonify(result)


@app.route('/postphoto', methods=['post'])
def postphoto():
    userid = request.form['userid']
    post = request.form['post']
    image = request.files['files']
    print(image)
    file = secure_filename(image.filename)
    image.save("static/image/" + file)
    qry = "insert into post values(null, %s, %s, %s, curdate())"
    values = (userid, file, post)
    iud(qry,values)
    return jsonify({'task':'success'})


@app.route('/manageblog', methods=['post'])
def manageblog():
    userid = request.form['userid']
    qry = "select * from  blog where `blog``blog`.`user_id`= %s"
    values = (userid)
    res=androidselectall(qry,values)
    return jsonify(res)


@app.route('/viewcomments', methods=['post'])
def viewcomments():
    qry = "select * from comment"
    result = androidselectallnew(qry)
    return jsonify(result)

@app.route('/viewothercomments', methods=['post'])
def viewothercomments():
    pid = request.form['pid']
    print(pid)
    qry = "SELECT `users`.*,`comment`.* FROM `users` JOIN `comment` ON `comment`.`user_id`=`users`.`user_login_id` WHERE `comment`.`post_id`=%s"
    val = pid
    result = androidselectall(qry,val)
    print(result)
    return jsonify(result)

@app.route('/addcomment', methods=['post'])
def addcomment():
    postid = request.form['postid']
    userid = request.form['userid']
    comment = request.form['comment']
    qry = "insert into comment values(null,%s,%s,%s,curdate())"
    values = (postid, userid, comment)
    iud(qry, values)
    return jsonify({'task' : 'success'})


@app.route('/viewcomment', methods=['post'])
def viewcomment():
    pid=request.form['pid']
    uid=request.form['uid']
    print(pid)
    qry = "SELECT `comment`.*,`users`.`first_name`,`users`.`last_name` FROM `users` JOIN `comment` ON `comment`.`user_id`=`users`.`user_login_id`  JOIN `post` ON  `post`.`post_id`=`comment`.`post_id` WHERE `comment`.`post_id`=%s and `post`.`user_id`=%s"
    val = (pid,uid)
    result = androidselectall(qry,val)
    return jsonify(result)


@app.route('/addblog', methods=['post'])
def addblog():
    userid = request.form['userid']
    post = request.form['blog']
    image = request.files['files']
    print(image)
    file = secure_filename(image.filename)
    image.save("static/image/" + file)
    qry = "insert into blog values(null, %s, %s, %s, curdate())"
    values = (userid, post, file)
    iud(qry, values)
    return jsonify({'task': 'success'})


@app.route('/viewfeedback', methods=['post','/viewfeedback'])
def viewfeedback():
    qry = "SELECT `feedback`.*,`users`.`first_name`,`users`.`last_name` FROM `feedback` JOIN `users` ON `feedback`.`user_id` = `users`.`user_login_id`"
    result = androidselectallnew(qry)
    return jsonify(result)


@app.route('/addfeedback', methods=['post','pid=1&POST'])
def addfeedback():
    feedback = request.form['feedback']
    userid = request.form['userid']
    qry = "insert into feedback values(null, %s,curdate(), %s)"
    values = (feedback, userid)
    iud(qry, values)
    return jsonify({'task' : 'success'})


@app.route('/viewusers', methods=['post'])
def viewusers():
    id = request.form['id']
    qry = "select * from users where user_login_id != %s"
    val=(id)

    result = androidselectall(qry,val)
    return jsonify(result)


@app.route('/viewtravelagency', methods=['post'])
def viewtravelagency():
    qry = "select * from travelagencies"
    result = androidselectallnew(qry)
    print(result)
    return jsonify(result)


@app.route('/viewhotel', methods=['post'])
def viewhotel():
    qry = "select * from hotel"
    result = androidselectallnew(qry)
    return jsonify(result)


@app.route('/chatinsert', methods=['post'])
def chatinsert():
    toid = request.form['to_id']
    message = request.form['message']
    fromid = request.form['from_id']
    print(toid,fromid,message)
    qry = "insert into chat values(null, %s, curdate(), %s, %s)"
    value = (toid, message, fromid)
    iud(qry, value)
    return jsonify({'task':'success'})

@app.route('/Viewchat', methods=['GET', 'POST'])
def Viewchat():
    uid = request.form['uid']
    fid = request.form['fid']
    qry = "select * from chat where (from_id=%s and to_id=%s) or (from_id=%s and to_id=%s )order by date_time,chat.chat_id asc"
    val=(uid,fid,fid,uid)
    res=androidselectall(qry,val)
    return jsonify(res)

@app.route('/viewplacebyrating', methods=['post'])
def viewplacebyrating():
    print(request.form)
    name = request.form['name']
    qry="SELECT `place`.*,AVG(`placerating`.`rating`) AS avgrating FROM `place` LEFT JOIN `placerating` ON `place`.`place_id`=`placerating`.`place_id` WHERE `place`.`place` LIKE '"+name+"%' GROUP BY `place`.`place_id` "
    val=()
    # print("select * from place where place like %s ")
    res = androidselectallnew(qry)
    print(res)
    return jsonify(res)

@app.route("/bankdetails", methods=['post'])
def bankdetails():
    lid = request.form['lid']
    print(lid)
    bname = request.form['bankname']
    ifsc = request.form['ifsc']
    key = request.form['key']
    acno = request.form['acno']
    pkid = request.form['pkid']
    print(bname,ifsc,key,acno,pkid)
    qry = "select * from bank_account where  user_loginid=%s and bankname=%s and ifsc=%s and keyno=%s and accountno=%s"
    value = (lid,bname,ifsc,key,str(acno))
    print(value)
    res = selectonetwo(qry,value)
    print(res)
    if res is None:
        return jsonify({'task': 'invalid'})
    else:
        id=res[0]
        amt=res[6]
        qry="SELECT `packages`.`rate` FROM `packages` JOIN `packagesbooking` ON `packagesbooking`.`packages_id`=`packages`.`packages_id` WHERE `packagesbooking`.`packages_booking_id`=%s"
        value = pkid
        s=selectonetwo(qry,value)
        pr=s[0]
        if(amt<pr):
            return jsonify({'task': 'insufficent'})
        else:
            blce=int(amt)-int(pr)
            qry = "update  bank_account set cash = %s where bankid=%s"
            value = str(blce),id
            iud(qry,value)
            qry1= "update packagesbooking set status ='paid' where packages_booking_id=%s"
            value1 = pkid
            iud(qry1,value1)
            qry = "INSERT INTO `paymentdetails` VALUES(NULL,%s,%s,%s,'paid',CURDATE())"
            val = (lid, pkid, pr)
            iud(qry, val)
            return jsonify({'task': 'success'})


@app.route("/bankdetails1", methods=['post'])
def bankdetails1():
    lid = request.form['lid']
    print(lid)
    bname = request.form['bankname']
    ifsc = request.form['ifsc']
    key = request.form['key']
    acno = request.form['acno']
    rid = request.form['rid']
    print(bname,ifsc,key,acno,rid)
    qry = "select * from bank_account where  user_loginid=%s and bankname=%s and ifsc=%s and keyno=%s and accountno=%s"
    value = (lid,bname,ifsc,key,str(acno))
    print(value)
    res = selectonetwo(qry,value)
    print(res)
    if res is None:
        return jsonify({'task': 'invalid'})
    else:
        id=res[0]
        amt=res[6]
        qry="SELECT `roomdetails`.`price` FROM `roomdetails` JOIN `roombooking` ON `roombooking`.`room_id`=`roomdetails`.`room_id` WHERE `roombooking`.`room_booking_id`=%s"
        value = rid
        s=selectonetwo(qry,value)
        pr=s[0]
        if(amt<pr):
            return jsonify({'task': 'insufficent'})
        else:
            blce=int(amt)-int(pr)
            qry = "update  bank_account set cash = %s where bankid=%s"
            value = blce,id
            iud(qry,value)
            qry1= "update `roombooking` set status ='paid' where `room_booking_id`=%s"
            value1 = rid
            iud(qry1,value1)
            qry="INSERT INTO `hotelpayment` VALUES(NULL,%s,%s,%s,'paid',CURDATE())"
            val=(lid,rid,pr)
            iud(qry,val)
            return jsonify({'task': 'success'})




app.run(host="0.0.0.0", port=5000)