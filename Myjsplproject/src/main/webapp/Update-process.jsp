```jsp
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="sql"
    uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Update Process</title>


<style>

/* =====================================
   RESET
===================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;

    font-family: "Segoe UI", Arial, sans-serif;
}


/* =====================================
   BODY
===================================== */

body {

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 20px;

    background:
        radial-gradient(
            circle at 15% 20%,
            rgba(99,102,241,.35),
            transparent 30%
        ),

        radial-gradient(
            circle at 85% 80%,
            rgba(6,182,212,.30),
            transparent 30%
        ),

        linear-gradient(
            135deg,
            #0f172a,
            #1e293b
        );

    overflow: hidden;
}


/* =====================================
   SUCCESS CONTAINER
===================================== */

.container {

    width: 550px;

    max-width: 100%;

    text-align: center;

    padding: 45px 40px;

    background:
        rgba(255,255,255,.96);

    border-radius: 28px;

    box-shadow:
        0 30px 70px rgba(0,0,0,.35);

    animation: showCard .6s ease;

}


/* =====================================
   CARD ANIMATION
===================================== */

@keyframes showCard {

    from {

        opacity: 0;

        transform:
            translateY(40px)
            scale(.95);

    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);

    }

}


/* =====================================
   SUCCESS ICON
===================================== */

.success {

    width: 105px;

    height: 105px;

    margin: 0 auto 25px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 50%;

    font-size: 58px;

    font-weight: bold;

    color: white;

    background:
        linear-gradient(
            135deg,
            #10b981,
            #059669
        );

    box-shadow:
        0 12px 30px rgba(16,185,129,.35);

    animation: successPop .7s ease;
}


/* =====================================
   ICON ANIMATION
===================================== */

@keyframes successPop {

    0% {

        opacity: 0;

        transform: scale(.3);

    }

    60% {

        transform: scale(1.15);

    }

    100% {

        transform: scale(1);

    }

}


/* =====================================
   TITLE
===================================== */

h1 {

    color: #111827;

    font-size: 29px;

    font-weight: 700;

    margin-bottom: 12px;

}


/* =====================================
   DESCRIPTION
===================================== */

p {

    color: #64748b;

    font-size: 16px;

    line-height: 1.6;

    margin-bottom: 30px;

}


/* =====================================
   BUTTON
===================================== */

input[type="submit"] {

    border: none;

    padding: 14px 32px;

    border-radius: 14px;

    color: white;

    font-size: 16px;

    font-weight: 600;

    cursor: pointer;

    background:
        linear-gradient(
            135deg,
            #6366f1,
            #4f46e5
        );

    box-shadow:
        0 8px 22px rgba(79,70,229,.30);

    transition: all .3s ease;

}


input[type="submit"]:hover {

    transform: translateY(-4px);

    box-shadow:
        0 14px 30px rgba(79,70,229,.42);

}


input[type="submit"]:active {

    transform: scale(.97);

}


/* =====================================
   MOBILE
===================================== */

@media (max-width: 600px) {

    body {

        padding: 15px;

    }


    .container {

        padding: 35px 22px;

        border-radius: 22px;

    }


    .success {

        width: 85px;

        height: 85px;

        font-size: 45px;

    }


    h1 {

        font-size: 23px;

    }


    p {

        font-size: 14px;

    }


    input[type="submit"] {

        width: 100%;

    }

}

</style>

</head>


<body>


<%

/* =====================================
   GET STUDENT ID
===================================== */

int myid =
    Integer.parseInt(
        request.getParameter("stud-id")
    );


/* =====================================
   GET SELECTED FIELDS
===================================== */

String[] myfield =
    request.getParameterValues("myfield");


/* =====================================
   BUILD UPDATE QUERY
===================================== */

String update_query =
    "UPDATE student SET ";


for(int i = 0; i < myfield.length; i++) {

    if(i < myfield.length - 1) {

        update_query +=
            myfield[i] + "=?,";

    }
    else {

        update_query +=
            myfield[i] + "=? WHERE id=?;";

    }

}

%>


<c:set
    var="sql_updatequery"
    value="<%=update_query%>"/>


<c:set
    var="stud_id"
    value="<%=myid%>"/>


<!-- =====================================
     DATABASE CONNECTION
===================================== -->

<sql:setDataSource

    var="myDB"

    driver="com.mysql.cj.jdbc.Driver"

    url="jdbc:mysql://localhost:3306/javajsp"

    user="root"

    password="Priyanth@499257"/>


<!-- =====================================
     UPDATE DATABASE
===================================== -->

<sql:update
    var="student"
    dataSource="${myDB}">


    ${sql_updatequery}


<%

for(int i = 0;
    i < myfield.length;
    i++) {


    String fieldname =
        myfield[i] + "Input";


    /* ==============================
       DATE FIELD
    ============================== */

    if(myfield[i].equals("DOB")) {

        SimpleDateFormat sdate =
            new SimpleDateFormat(
                "yyyy-MM-dd"
            );


        java.util.Date jdate =
            sdate.parse(
                request.getParameter(fieldname)
            );


        java.sql.Date sqldate =
            new java.sql.Date(
                jdate.getTime()
            );

%>


        <sql:param
            value="<%=sqldate%>"/>


<%

    }

    /* ==============================
       OTHER FIELDS
    ============================== */

    else {

        String myvalues =
            request.getParameter(
                fieldname
            );

%>


        <sql:param
            value="<%=myvalues%>"/>


<%

    }

}

%>


    <sql:param
        value="${stud_id}"/>


</sql:update>


<!-- =====================================
     SUCCESS MESSAGE
===================================== -->

<div class="container">


    <div class="success">

        ✓

    </div>


    <h1>

        Student Updated Successfully!

    </h1>


    <p>

        Your student details have been
        updated successfully.

    </p>


    <form action="index.jsp">

        <input
            type="submit"
            value="🏠 Back to Home">

    </form>


</div>


</body>

</html>
```