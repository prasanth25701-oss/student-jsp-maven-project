<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert Student</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;

    background:
        radial-gradient(circle at top left, #667eea, transparent 35%),
        radial-gradient(circle at bottom right, #00f2fe, transparent 35%),
        linear-gradient(135deg, #141e30, #243b55);
}

.container {
    width: 520px;
    max-width: 100%;
    padding: 45px 35px;

    text-align: center;

    background: rgba(255, 255, 255, 0.96);
    border-radius: 25px;

    box-shadow:
        0 25px 60px rgba(0, 0, 0, 0.35);

    animation: popup 0.5s ease;
}

.success {
    width: 90px;
    height: 90px;

    margin: 0 auto 20px;

    display: flex;
    justify-content: center;
    align-items: center;

    border-radius: 50%;

    background: #dcfce7;
    color: #16a34a;

    font-size: 52px;
    font-weight: bold;

    animation: successAnimation 0.7s ease;
}

h1 {
    color: #16a34a;
    font-size: 29px;
    margin-bottom: 15px;
}

p {
    color: #6b7280;
    margin: 20px 0 30px;
    font-size: 17px;
}

input[type="submit"] {
    border: none;
    padding: 14px 32px;

    border-radius: 30px;

    background: linear-gradient(135deg, #2563eb, #4f46e5);

    color: white;
    font-size: 16px;
    font-weight: 600;

    cursor: pointer;
    transition: 0.3s;
}

input[type="submit"]:hover {
    transform: translateY(-3px);

    box-shadow:
        0 10px 25px rgba(37, 99, 235, 0.35);
}

@keyframes popup {

    from {
        opacity: 0;
        transform: translateY(30px) scale(0.95);
    }

    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

@keyframes successAnimation {

    0% {
        transform: scale(0);
    }

    70% {
        transform: scale(1.15);
    }

    100% {
        transform: scale(1);
    }
}

@media (max-width: 600px) {

    .container {
        padding: 35px 20px;
    }

    h1 {
        font-size: 24px;
    }

    .success {
        width: 75px;
        height: 75px;
        font-size: 42px;
    }

    input[type="submit"] {
        width: 100%;
    }
}

</style>

</head>

<body>

<sql:setDataSource
    var="myDB"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/javajsp"
    user="root"
    password="Priyanth@499257"/>

<%

String fName = (String) request.getAttribute("fName");
String lName = (String) request.getAttribute("lName");
String dept = (String) request.getAttribute("dept");
String phNo = (String) request.getAttribute("phNo");
String dDate = (String) request.getAttribute("dDate");

SimpleDateFormat sd =
    new SimpleDateFormat("yyyy-MM-dd'Y'hh:mm");

java.sql.Date sDate = null;

try {

    java.util.Date uDate = sd.parse(dDate);

    sDate = new java.sql.Date(uDate.getTime());

}
catch (ParseException pe) {

    pe.printStackTrace();

}

%>

<sql:update dataSource="${myDB}" var="n">

    insert into student
    (first_name, last_name, department, phone_number, DOB)
    values (?,?,?,?,?)

    <sql:param value="<%=fName%>"/>
    <sql:param value="<%=lName%>"/>
    <sql:param value="<%=dept%>"/>
    <sql:param value="<%=phNo%>"/>
    <sql:param value="<%=dDate%>"/>

</sql:update>

<div class="container">

    <div class="success">
        ✓
    </div>

    <h1>
        Student Added Successfully!
    </h1>

    <p>
        ${n} record inserted into the database.
    </p>

    <form action="index.jsp">

        <input
            type="submit"
            value="🏠 Back to Home">

    </form>

</div>

</body>
</html>