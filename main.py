import requests.utils
from flask import *
from werkzeug.utils import secure_filename
import os

from dbcon import *

app = Flask(__name__)
app.secret_key = 'qwert'


@app.route('/')
def main():
    session.clear()

    return render_template("login.html")


@app.route('/addhotelcomplaint', methods=['post'])
def addhotelcomplaint():
    return render_template("add hotel Complaint.html")


@app.route('/addhotelcomplaint1', methods=['post'])
def addhotelcomplaint1():
    hcomplaint = request.form['textfield']
    qry = "insert into complaints values(null,%s,%s,curdate(),'pending')"
    val = (session['lid'], hcomplaint)
    iud(qry, val)
    return render_template("add hotel Complaint.html")


@app.route('/addhotelregistration', methods=['post'])
def addhotelregistration():
    return render_template("Add hotel registration.html")


@app.route('/addhotelregistration1', methods=['post'])
def addhotelregistration1():
    try:
        hotelName = request.form['textfield']
        place = request.form['textfield2']
        post = request.form['textfield3']
        pin = request.form['textfield4']
        email = request.form['textfield5']
        phone = request.form['textfield6']
        image = request.files['textfield7']
        file = secure_filename(image.filename)
        image.save("static/image/" + file)
        type = request.form['textfield8']
        username = request.form['textfield9']
        password = request.form['textfield10']
        qry = "insert into login values(null, %s, %s, 'hotel')"
        val = (username, password)
        aid = iud(qry, val)
        qry = "INSERT INTO `hotel` VALUES(NULL, %s, %s, %s,%s,%s,%s,%s,%s,%s)"
        val = (str(aid), hotelName, place, post, pin, email, phone, file, type)
        iud(qry, val)
        return '''<script> alert("registration Successful");window.location="/viewhotel"</script>'''
    except Exception as e:
        return '''<script> alert("already exist");window.location="/viewhotel"</script>'''


@app.route('/edithotel')
def edithotel():
    id = request.args.get('id')
    session['hid'] = id
    qry = "select * from hotel where hotel_login_id = %s"
    value = id
    s = selectonetwo(qry, value)
    return render_template("edithotel.html", result=s)


@app.route('/updatehotel', methods=['post'])
def updatehotel():
    hotelName = request.form['textfield']
    place = request.form['textfield2']
    post = request.form['textfield3']
    pin = request.form['textfield4']
    email = request.form['textfield5']
    phone = request.form['textfield6']
    image = request.files['textfield7']
    file = secure_filename(image.filename)
    image.save("./static/image/" + file)
    type = request.form['textfield8']
    qry = "update hotel set hotel_name=%s, place=%s, post=%s, pin=%s, email=%s, phone=%s,photo=%s, type=%s where hotel_login_id =%s"
    value = (hotelName, place, post, pin, email, phone, file, type, str(session['hid']))
    iud(qry, value)
    return redirect('/viewhotel')


@app.route('/deletehotel')
def deletehotel():
    id = request.args.get('id')
    qry = "delete from hotel where hotel_login_id = %s"
    value = id
    iud(qry, value)
    qry1 = "delete from login where login_id = %s"
    iud(qry1, value)
    qry2 = "delete from roomdetails where hotel_login_id = %s"
    iud(qry2, value)
    return '''<script> alert("deleted  Successful");window.location="/viewhotel"</script>'''


@app.route('/addhotelreport')
def addhotelreport():
    return render_template("Add hotel report.html")


@app.route('/userchat')
def userchat():
    qry = "select * from users"
    s = selectall(qry)
    return render_template("userChat.html",val=s)

# @app.route('/chat1')
# def chat1():
#     if 'lid' in session:
#         id = str(request.args.get('id'))
#         nm = request.args.get('nm')
#         session['id'] = id
#         session['nm'] = nm
#         qry = "SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
#         val = (id, str(session['lid']), str(session['lid']), id)
#         print(val)
#         result = selectalltwo(qry, val)
#         return render_template("chat1.html", val=result, nm=nm, id=str(session['lid']))
#     else:
#         return   '''<script> alert("please login");window.location="/"</script>'''


# @app.route('/chatinsert1',methods=['post'])
# def chatinsert1():
#     msg=request.form['textfield']
#     id=session['id']
#     nm=session['nm']
#     qry="insert into chat values(null,%s,curdate(),%s,%s)"
#     val=(id,msg,str(session['lid']))
#     iud(qry,val)
#     qry="SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
#     val=(id,str(session['lid']),str(session['lid']),id)
#     result=selectalltwo(qry,val)
#     return render_template("chat1.html",val=result,nm=nm,id=str(session['lid']))


@app.route('/userchat2')
def userchat2():
        id = str(request.args.get('id'))
        print(id)
        nm = request.args.get('nm')
        session['id'] = id
        session['nm'] = nm
        qry = "SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
        val = (id, str(session['lid']), str(session['lid']), id)


        result = selectalltwo(qry, val)
        print(result)
        return render_template("chat2.html", val=result, nm=nm, id=str(session['lid']))


@app.route('/chatinsert2',methods=['post'])
def chatinsert2():
    msg=request.form['textfield']
    id=session['id']
    nm=session['nm']
    qry="insert into chat values(null,%s,curdate(),%s,%s)"
    val=(id,msg,str(session['lid']))
    iud(qry,val)
    qry = "SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
    val = (id, str(session['lid']), str(session['lid']), id)


    result=selectalltwo(qry,val)
    return render_template("chat2.html",val=result,nm=nm,id=str(session['lid']))





@app.route('/addhotelreport1', methods=['post'])
def addhotelreport1():
    image = request.files['file']
    file = secure_filename(image.filename)
    image.save("static/reports/" + file)
    qry = "insert into report values(null,%s, %s, curdate())"
    value = (file, session['lid'])
    iud(qry, value)
    return '''<script> alert("Report added Successfully");window.location="/hotelhome"</script>'''


@app.route('/addpackages', methods=['post'])
def addpackages():
    return render_template("Add packages.html")


@app.route('/addpackages1', methods=['post'])
def addpackages1():
    packagedetails = request.form['textfield']
    foodavailability = request.form['textfield2']
    rate = request.form['textfield3']
    qry = "insert into packages values(null, %s,%s,%s,%s)"
    val = (session['lid'], packagedetails, foodavailability, rate)
    iud(qry, val)
    return '''<script> alert("registration Successful");window.location="/viewpackages"</script>'''


@app.route('/addplace', methods=['post'])
def addplace():
    return render_template("add place.html")


@app.route('/addplace1', methods=['post'])
def addplace1():
    place = request.form['textfield']
    lattitude = request.form['textfield2']
    longitude = request.form['textfield3']
    description = request.form['textfield4']
    image = request.files['file']
    file = secure_filename(image.filename)
    image.save("static/placeimage/" + file)
    qry = "insert into place values(null, %s, %s, %s ,%s ,%s,%s)"
    val = (session['lid'], place, lattitude, longitude, description, file)
    iud(qry, val)
    return '''<script> alert("place added Successfully");window.location="/viewplace"</script>'''


@app.route('/addroomdetails', methods=['post'])
def addroomdetails():
    return render_template("add room details.html")


@app.route('/addroomdetails1', methods=['post'])
def addroomdetails1():
    roomdetails = request.form['textfield']
    price = request.form['textfield2']
    actype = request.form['radio']
    bedtype = request.form['textfield4']
    qry = "insert into roomdetails values(null, %s,%s,%s,%s,%s)"
    val = (str(session['lid']), roomdetails, price, actype, bedtype)
    iud(qry, val)
    return '''<script> alert("registration Successful");window.location="/viewroomdetails"</script>'''


@app.route('/addtravelagency', methods=['post'])
def addtravelagency():
    return render_template("ADD TRAVEL AGENCY.html")


@app.route('/addtravelagency1', methods=['post'])
def addtravelagency1():
    try:
        tname = request.form['textfield']
        place = request.form['textfield2']
        post = request.form['textfield3']
        pin = request.form['textfield4']
        email = request.form['textfield5']
        phoneno = request.form['textfield6']
        uname = request.form['textfield7']
        password = request.form['textfield8']
        qry = "insert into login values(null,%s,%s,'travelagency')"
        val = (uname, password)
        aid = iud(qry, val)
        qry = "INSERT INTO `travelagencies` VALUES(NULL,%s,%s,%s,%s,%s,%s,%s)"
        val = (str(aid), tname, place, post, pin, email, phoneno)
        iud(qry, val)
        return '''<script> alert("registration Successful");window.location="/viewtravelagency"</script>'''
    except Exception as e:
        return '''<script> alert("already exist");window.location="/viewtravelagency"</script>'''


@app.route('/edittravelagency')
def edittravelagency():
    id = request.args.get('id')
    qry = "select * from travelagencies where agency_login_id = %s"
    value = id
    session['tid'] = id
    s = selectonetwo(qry, value)
    return render_template('edittravelagency.html', result=s)


@app.route('/updatetravelagency', methods=['post'])
def updatetravelagency():
    tname = request.form['textfield']
    place = request.form['textfield2']
    post = request.form['textfield3']
    pin = request.form['textfield4']
    email = request.form['textfield5']
    phoneno = request.form['textfield6']
    qry = "update travelagencies set agency_name=%s, place=%s, post=%s, pin=%s,email=%s, phone=%s  where agency_login_id = %s"
    value = (tname, place, post, pin, email, phoneno, str(session['tid']))
    iud(qry, value)

    return redirect('/viewtravelagency')


@app.route('/deletetravelagency')
def deletetravelagency():
    id = request.args.get('id')
    qry = "delete from travelagencies where agency_login_id = %s"
    value = id
    iud(qry, value)
    qry1 = "delete from login where login_id = %s"
    iud(qry1, value)
    qry2 = "delete from packages where travel_agency_login_id = %s"
    iud(qry2, value)
    return '''<script> alert("deteted successfuly");window.location="/viewtravelagency"</script>'''


@app.route('/addtravelagencycomplaints', methods=['post'])
def addtravelagencycomplaint():
    return render_template("ADD TRAVEL AGENCY complaints.html")


@app.route('/addtravelagencycomplaints1', methods=['post'])
def addtravelagencycomplaint1():
    tcomplaint = request.form['textfield']
    qry = "insert into complaints values(null, %s, %s, curdate(), 'Pending')"
    val = (session['lid'], tcomplaint)
    iud(qry, val)
    return '''<script> alert("Complaints send succesfully");window.location="/viewtravelagencycomplaints"</script>'''


@app.route('/addtravelagencyreport')
def addtravelagencyreport():
    return render_template("add travel agency report.html")


@app.route('/addtravelagencyreport1', methods=['post'])
def addtravelagencyreport1():
    image = request.files['file']
    file = secure_filename(image.filename)
    image.save("static/reports/" + file)
    qry = "insert into report values(null,%s, %s, curdate())"
    value = (file, session['lid'])
    iud(qry, value)
    return '''<script> alert("Report added Successfully");window.location="/travelagencyhome"</script>'''


@app.route('/adminhome')
def adminhome():
    return render_template("admin home.html")


@app.route('/feedback')
def feedback():
    qry = "SELECT users.`first_name`, users.`last_name` , feedback.`feedback`, feedback.`date` FROM feedback JOIN " \
          "users ON feedback.`user_id` = users.`user_login_id` "
    res = selectall(qry)
    return render_template("Feed Back.html", result=res)


@app.route('/viewreports1', methods=['post'])
def viewreports1():
    type = request.form['select2']
    qry = "SELECT `report`.`date`,`report`.`report` FROM `report` JOIN `login` ON " \
          "`report`.`trave_hotel_login_id`=`login`.`login_id` WHERE `login`.`usertype`=%s "
    value = type
    res = selectalltwo(qry, value)
    return render_template('view report.html', result=res)


@app.route('/hotelhome')
def hotelhome():
    return render_template("Hotel home.html")


@app.route('/reply')
def reply():
    id = request.args.get('id')
    session['cid'] = id
    return render_template("reply.html")


@app.route('/sendreply', methods=['post'])
def sendreply():
    reply = request.form['textfield']
    print(reply)
    qry = "update complaints set replay=%s where complaint_id = %s"
    value = (reply, str(session['cid']))
    print(str(session['cid']))
    iud(qry, value)
    return redirect('/viewcomplaint')


@app.route('/travelagencyhome')
def travelagencyhome():
    return render_template("travel agency home.html")


@app.route('/viewcomplaint')
def viewcomplaint():
    return render_template("view Complaint.html")

@app.route('/searchcomplaints',methods=['post'])
def searchcomplaints():
    type=request.form['select2']

    if type=="travelagency":
        qry="SELECT `travelagencies`.`agency_name`,`complaints`.* FROM `complaints` JOIN `travelagencies` ON " \
            "`travelagencies`.`agency_login_id`=`complaints`.`user_id` WHERE `complaints`.`replay`='pending' "
    elif type=="hotel":
        qry="SELECT `hotel`.`hotel_name`,`complaints`.* FROM `complaints` JOIN `hotel` ON `hotel`.`hotel_login_id`=`complaints`.`user_id` WHERE `complaints`.`replay`='pending'"
    elif type=="user":
        qry = "SELECT `users`.`first_name`,`users`.`last_name`,`complaints`.* FROM `complaints` JOIN `users` ON " \
              "`users`.`user_login_id`=`complaints`.`user_id` WHERE `complaints`.`replay`='pending' "
    s = selectall(qry)
    return render_template("view Complaint.html",  result=s,type = type )


@app.route('/viewhotelcomplaint')
def viewhotelcomplaint():
    qry = "select * from complaints where user_id=%s"
    val = (str(session['lid']))
    result = selectalltwo(qry, val)
    return render_template("view hotel Complaint.html", result=result)


@app.route('/viewpackagebooking')
def viewpackagebooking():
    qry = "SELECT packagesbooking.date, users.first_name ,users.last_name, packages.package_details, packages.rate,packages.food_availability,`packagesbooking`.`packages_booking_id`,`packagesbooking`.`user_login_id`,`user_certificate`.`certificate` FROM users JOIN packagesbooking ON users.user_login_id=packagesbooking.user_login_id JOIN packages ON packages.packages_id =packagesbooking.packages_id    JOIN `user_certificate` ON `user_certificate`.`uid`=`users`.`user_login_id` WHERE packagesbooking.status = 'pending' AND  `packages`.`travel_agency_login_id` = %s"

    value = session['lid']
    result = selectalltwo(qry,value)
    return render_template("view package booking.html", result=result)


@app.route('/acceptpackagebooking')
def acceptpackagebooking():
    id = request.args.get('id')
    qry = "update packagesbooking set status='accept' where packages_booking_id =%s"
    value = id
    iud(qry, value)
    return '''<script> alert("Package Accepted");window.location="/viewpackagebooking"</script>'''


@app.route('/rejectpackagebooking')
def rejectpackagebooking():
    id = request.args.get('id')
    qry = "update packagesbooking set status='reject' where packages_booking_id =%s"
    value = id
    iud(qry, value)
    return '''<script> alert("Package Rejected");window.location="/viewpackagebooking"</script>'''


@app.route('/viewpackages')
def viewpackages():
    qry = "select * from packages where travel_agency_login_id = %s"
    value = session['lid']
    result = selectalltwo(qry,value)
    return render_template("view packages.html", result=result)


@app.route('/editpackages')
def editpackages():
    id = request.args.get('id')
    session['pid'] = id
    qry = "select * from packages where packages_id = %s"
    value = id
    result = selectonetwo(qry, value)
    return render_template("editpackages.html", result=result)


@app.route('/updatepackages', methods=['post'])
def updatepackages():
    packagedetails = request.form['textfield']
    foodavailability = request.form['textfield2']
    rate = request.form['textfield3']
    qry = "UPDATE `packages` SET `package_details` = %s,`food_availability` = %s, `rate` = %s WHERE `packages_id` = %s"
    value = (packagedetails, foodavailability, rate, str(session['pid']))
    iud(qry, value)
    return '''<script> alert("Updated successfuly");window.location="/viewpackages"</script>'''


@app.route('/deletepackages')
def deletepackages():
    id = request.args.get('id')
    qry = "delete from packages where packages_id = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("deteted successfuly");window.location="/viewpackages"</script>'''


@app.route('/viewpaymentdetails')
def viewpaymentdetails():
    qry = "SELECT `paymentdetails`.`payment_details`,`users`.`first_name`,`users`.`last_name`,`users`.`phone_no`,"\
          "`users`.`place`,`paymentdetails`.`date`,`paymentdetails`.`status`, `paymentdetails`.`payment_id`FROM users JOIN `paymentdetails` ON "\
          "`paymentdetails`.`user_login_id`=`users`.`user_login_id` JOIN `packages` ON " \
          "`packages`.`packages_id`=`paymentdetails`.`package_id` WHERE"\
          "`packages`.`travel_agency_login_id` = %s "
    value = session['lid']
    result = selectalltwo(qry,value)
    return render_template("view payment details.html", result=result)


@app.route('/acceptpayment')
def acceptpayment():
    id = request.args.get('id')
    qry = "update paymentdetails set status = 'paid' where payment_id = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("Payment Accepted");window.location="/viewpaymentdetails"</script>'''


@app.route('/rejectpayment')
def rejectpayment():
    id = request.args.get('id')
    qry = "update paymentdetails set status = 'Not paid' where payment_id = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("Payment not succesful");window.location="/viewpaymentdetails"</script>'''


@app.route('/viewplace')
def viewplaces():
    qry = "select * from place where agency_login_id = %s"
    value = session['lid']
    result = selectalltwo(qry,value)
    return render_template("view place.html", result=result)


@app.route('/editplace')
def editplace():
    id = request.args.get('id')
    session['pid'] = id
    qry = "select * from place where place_id = %s"
    value = id
    result = selectonetwo(qry, value)
    return render_template("editplace.html", result=result)


@app.route('/updateplace', methods=['post'])
def updateplace():
    place = request.form['textfield']
    lattitude = request.form['textfield2']
    longitude = request.form['textfield3']
    description = request.form['textfield4']
    image = request.files['file']
    file = secure_filename(image.filename)
    image.save("static/placeimage/" + file)
    qry = "update place set place=%s, latitude=%s, longitude=%s, description=%s, image=%s where place_id=%s"
    value = (place, lattitude, longitude, description, file, str(session['pid']))
    iud(qry, value)
    return '''<script> alert("Updated successfuly");window.location="/viewplace"</script>'''


@app.route('/deleteplace')
def deleteplace():
    id = request.args.get('id')
    qry = "delete from place where place_id = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("deleted successfully");window.location="/viewplace"</script>'''


@app.route('/viewreport')
def viewreport():
    return render_template("view report.html")


@app.route('/viewroombooking')
def viewroombooking():
    qry = "SELECT `roomdetails`.`room_id`,`roomdetails`.`room_details`,`users`.`first_name`,`users`.`last_name`," \
          "`users`.`place`,`users`.`phone_no`,`roomdetails`.`price`,`roombooking`.`date`,`roombooking`.`room_booking_id`,`roombooking`.`user_login_id` FROM `roombooking` JOIN " \
          "`users` ON `users`.`user_login_id`=`roombooking`.`user_login_id` JOIN `roomdetails`ON " \
          "`roomdetails`.`room_id`=`roombooking`.`room_id` WHERE `roombooking`.`status`='pending'  AND `roomdetails`.`hotel_login_id` = %s order by roombooking.room_booking_id desc"
    value = session['lid']
    result = selectalltwo(qry, value)
    print(result)
    return render_template("view room booking.html", result=result)


@app.route('/acceptroom')
def acceptroom():
    id = request.args.get('id')
    qry = "update roombooking set status='accept' where room_booking_id =%s"
    value = id
    iud(qry, value)
    return '''<script> alert("Roombooking Accepted");window.location="/viewroombooking"</script>'''


@app.route('/rejectroom')
def rejectroom():
    id = request.args.get('id')
    qry = "update roombooking set status='rejected' where room_booking_id = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("Roombooking Rejected");window.location="/viewroombooking"</script>'''


@app.route('/viewroomdetails')
def viewroomdetails():
    qry = "select * from roomdetails where hotel_login_id = %s"
    value = session['lid']
    result = selectalltwo(qry,value)
    return render_template("View room details.html", result=result)


@app.route('/editroom')
def editroom():
    id = request.args.get('id')
    session['rid'] = id
    qry = "select * from roomdetails where room_id = %s"
    value = id
    result = selectonetwo(qry, value)
    return render_template("editroom.html", result=result)


@app.route('/updateroom', methods=['post'])
def updateroom():
    roomdetails = request.form['textfield']
    price = request.form['textfield2']
    actype = request.form['textfield3']
    bedtype = request.form['textfield4']
    qry = "UPDATE roomdetails SET room_details=%s, price=%s, `a/c_type`=%s,bed_type=%s WHERE room_id=%s"
    value = (roomdetails, price, actype, bedtype, str(session['rid']))
    iud(qry, value)
    return '''<script> alert("Updated successfuly");window.location="/viewroomdetails"</script>'''


@app.route('/deleteroom')
def deleteroom():
    id = request.args.get('id')
    qry = "delete from roomdetails where room_id = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("deteted successfuly");window.location="/viewroomdetails"</script>'''


@app.route('/viewhotelpayment')
def viewhotelpayment():
    qry = "SELECT `hotelpayment`.`payment_details`,`users`.`first_name`,`users`.`last_name`,`users`.`place`," \
          "`users`.`phone_no`,`roombooking`.`date`,`roombooking`.`status`,`hotelpayment`.`payment_id` FROM `roombooking` JOIN `users` ON " \
          "`users`.`user_login_id`=`roombooking`.`user_login_id` JOIN `hotelpayment` ON " \
          "`hotelpayment`.`room_id`=`roombooking`.`room_booking_id` WHERE `hotelpayment`.`status`='paid' AND `roombooking`.`room_id` IN(SELECT `room_id` FROM `roomdetails` WHERE `hotel_login_id`="+str(session['lid'])+")"
    print(qry,"=====================================")
    result = selectall(qry)
    return render_template("viewhotelpayment.html", result=result)


@app.route('/acceptroompayment')
def acceptroompayment():
    id = request.args.get('id')
    qry = "update `hotelpayment` set status = 'paid' where `payment_id` = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("Payment Accepted");window.location="/viewhotelpayment"</script>'''


@app.route('/rejecttroompayment')
def rejecttroompayment():
    id = request.args.get('id')
    qry = "update `hotelpayment` set status = 'Not paid' where `payment_id` = %s"
    value = id
    iud(qry, value)
    return '''<script> alert("Payment Accepted");window.location="/viewhotelpayment"</script>'''


@app.route('/viewtravelagency')
def viewtravelagency():
    qry = "select * from travelagencies"
    result = selectall(qry)
    return render_template("VIEW TRAVEL AGENCY.html", result=result)


@app.route('/viewtravelagencycomplaints')
def viewtravelagencycomplaints():
    qry = "select * from complaints where user_id=%s"
    val = (str(session['lid']))
    res = selectalltwo(qry, val)
    return render_template("view travel agency complaint.html", result=res)


@app.route('/viewusers')
def viewusers():
    qry = "select * from users"
    res = selectall(qry)

    return render_template("view users.html", result=res)


@app.route('/viewhotel')
def viewhotel():
    qry = "select * from hotel"
    result = selectall(qry)
    return render_template("viewHOTEL.html", result=result)


@app.route('/logout')
def logout():
    session.clear()
    return render_template('login.html')


@app.route('/login', methods=['post'])
def login():
    uname = request.form['textfield']
    password = request.form['textfield2']
    qry = " select * from login where username = %s and password = %s"
    value = (uname, password)
    result = selectonetwo(qry, value)
    if result is None:
        return '''<script> alert("invalid username or password");window.location="/"</script>'''
    elif result[3] == "admin":
        session['lid']=result[0]
        return render_template("admin home.html")
    elif result[3] == "travelagency":
        session['lid'] = str(result[0])
        print(session['lid'],"................")
        return render_template("travel agency home.html")
    elif result[3] == "hotel":
        session['lid'] = str(result[0])
        return render_template("Hotel home.html")

@app.route('/chat1')
def chat1():
    if 'lid' in session:
        id = str(request.args.get('id'))
        nm = request.args.get('nm')
        session['id'] = id
        session['nm'] = nm
        qry = "SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
        val = (id, str(session['lid']), str(session['lid']), id)
        print(val)
        result = selectalltwo(qry, val)
        return render_template("chat1.html", val=result, nm=nm, id=str(session['lid']))
    else:
        return   '''<script> alert("please login");window.location="/"</script>'''


@app.route('/chatinsert1',methods=['post'])
def chatinsert1():
    msg=request.form['textfield']
    id=session['id']
    nm=session['nm']
    qry="insert into chat values(null,%s,curdate(),%s,%s)"
    val=(id,msg,str(session['lid']))
    iud(qry,val)
    qry="SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
    val=(id,str(session['lid']),str(session['lid']),id)
    result=selectalltwo(qry,val)
    return render_template("chat1.html",val=result,nm=nm,id=str(session['lid']))


@app.route('/chat2')
def chat2():
        id = str(request.args.get('id'))
        print(id)
        nm = request.args.get('nm')
        session['id'] = id
        session['nm'] = nm
        qry = "SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
        val = (id, str(session['lid']), str(session['lid']), id)


        result = selectalltwo(qry, val)
        print(result)
        return render_template("chat2.html", val=result, nm=nm, id=str(session['lid']))


# @app.route('/chatinsert2',methods=['post'])
# def chatinsert2():
#     msg=request.form['textfield']
#     id=session['id']
#     nm=session['nm']
#     qry="insert into chat values(null,%s,curdate(),%s,%s)"
#     val=(id,msg,str(session['lid']))
#     iud(qry,val)
#     qry = "SELECT * FROM `chat` WHERE (`from_id`=%s AND `to_id`=%s) OR (`from_id`=%s AND `to_id`=%s)"
#     val = (id, str(session['lid']), str(session['lid']), id)
#
#
#     result=selectalltwo(qry,val)
#     return render_template("chat2.html",val=result,nm=nm,id=str(session['lid']))



if __name__ == '__main__':
    app.run(debug=True,port=5000)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
