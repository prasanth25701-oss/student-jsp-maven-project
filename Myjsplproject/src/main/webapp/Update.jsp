<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Details</title>

<style>

/* =========================
   GLOBAL
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    min-height: 100vh;
    padding: 40px 20px;
    background:
        radial-gradient(circle at top left, #6366f1, transparent 35%),
        radial-gradient(circle at bottom right, #06b6d4, transparent 35%),
        linear-gradient(135deg, #0f172a, #1e293b);
    color: #1e293b;
}


/* =========================
   MAIN CONTAINER
========================= */

.page-container {
    max-width: 850px;
    margin: auto;
}


/* =========================
   HEADER
========================= */

.page-header {
    text-align: center;
    color: white;
    margin-bottom: 25px;
}

.page-header h1 {
    font-size: 32px;
    font-weight: 700;
    letter-spacing: .5px;
}

.page-header p {
    margin-top: 8px;
    color: #cbd5e1;
    font-size: 15px;
}


/* =========================
   SEARCH CARD
========================= */

.dropdown {
    background: rgba(255,255,255,.95);
    padding: 22px;
    border-radius: 18px;
    display: flex;
    align-items: center;
    gap: 15px;
    box-shadow: 0 15px 40px rgba(0,0,0,.25);
    margin-bottom: 25px;
}

.dropdown label {
    font-weight: 600;
    color: #334155;
    white-space: nowrap;
}

.dropdown select {
    flex: 1;
    padding: 12px 15px;
    border: 2px solid #e2e8f0;
    border-radius: 10px;
    outline: none;
    font-size: 15px;
    background: #f8fafc;
    transition: .3s;
}

.dropdown select:focus {
    border-color: #6366f1;
    box-shadow: 0 0 0 4px rgba(99,102,241,.12);
}


/* =========================
   BUTTON
========================= */

input[type="submit"] {
    border: none;
    padding: 12px 22px;
    border-radius: 10px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    color: white;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    box-shadow: 0 6px 15px rgba(79,70,229,.3);
    transition: all .3s ease;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 22px rgba(79,70,229,.4);
}


/* =========================
   STUDENT CARD
========================= */

.display-student {
    background: rgba(255,255,255,.97);
    border-radius: 20px;
    padding: 35px;
    box-shadow: 0 20px 50px rgba(0,0,0,.25);
}

.display-student::before {
    content: "Student Information";
    display: block;
    font-size: 22px;
    font-weight: 700;
    color: #1e293b;
    margin-bottom: 25px;
}


/* =========================
   TABLE
========================= */

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 15px;
}

td {
    padding: 5px;
}

table td:first-child {
    width: 25px;
}

table td:nth-child(3) {
    width: 160px;
}

label {
    font-weight: 600;
    color: #475569;
}


/* =========================
   CHECKBOX
========================= */

input[type="checkbox"] {
    width: 19px;
    height: 19px;
    cursor: pointer;
    accent-color: #6366f1;
}


/* =========================
   INPUT FIELDS
========================= */

input[type="text"],
input[type="date"] {
    width: 100%;
    padding: 13px 15px;
    border: 2px solid #e2e8f0;
    border-radius: 10px;
    outline: none;
    background: #f8fafc;
    font-size: 15px;
    color: #334155;
    transition: all .3s ease;
}

input[type="text"]:focus,
input[type="date"]:focus {
    border-color: #6366f1;
    background: white;
    box-shadow: 0 0 0 4px rgba(99,102,241,.12);
}

input[type="text"]::placeholder {
    color: #94a3b8;
}


/* =========================
   UPDATE BUTTON
========================= */

.update-btn {
    margin-top: 15px;
    padding-top: 20px;
}

.update-btn input {
    width: auto;
    min-width: 220px;
}


/* =========================
   BACK BUTTON
========================= */

.cancel {
    text-align: center;
    margin-top: 20px;
}

.cancel input {
    background: rgba(255,255,255,.12);
    border: 1px solid rgba(255,255,255,.3);
    box-shadow: none;
    backdrop-filter: blur(10px);
}

.cancel input:hover {
    background: rgba(255,255,255,.2);
}


/* =========================
   MOBILE RESPONSIVE
========================= */

@media (max-width: 700px) {

    body {
        padding: 25px 12px;
    }

    .page-header h1 {
        font-size: 25px;
    }

    .dropdown {
        flex-direction: column;
        align-items: stretch;
    }

    .dropdown label {
        margin-bottom: 5px;
    }

    .display-student {
        padding: 20px 15px;
    }

    table,
    tbody,
    tr,
    td {
        display: block;
        width: 100% !important;
    }

    table tr {
        margin-bottom: 15px;
    }

    table td:nth-child(3) {
        margin-bottom: 5px;
    }

    table td:first-child {
        display: none;
    }

    .update-btn input {
        width: 100%;
    }
}

</style>
</head>

<body>

<div class="page-container">

    <div class="page-header">
        <h1>Update Student Details</h1>
        <p>Select a student and update their information</p>
    </div>


    <!-- DATABASE CONNECTION -->

    <sql:setDataSource
        var="myDB"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/javajsp"
        user="root"
        password="Priyanth@499257"/>


    <!-- GET STUDENT IDS -->

    <sql:query var="student" dataSource="${myDB}">
        SELECT id FROM student;
    </sql:query>


    <!-- SEARCH STUDENT -->

    <form action="Update.jsp">

        <div class="dropdown">

            <label>Student ID</label>

            <select name="stud_id">

                <option value="">Select Student ID</option>

                <c:forEach var="row" items="${student.rows}">

                    <option value="${row.id}">
                        ${row.id}
                    </option>

                </c:forEach>

            </select>

            <input type="submit" value="Search">

        </div>

    </form>


    <!-- GET SELECTED STUDENT -->

    <sql:query var="stud" dataSource="${myDB}">

        SELECT * FROM student WHERE id=?

        <sql:param value="${param.stud_id}"/>

    </sql:query>


    <!-- STUDENT DETAILS -->

    <div class="display-student">

        <form action="Update-process.jsp">

            <table>

                <c:forEach var="rows" items="${stud.rows}">

                    <tr>
                        <td colspan="4">
                            <input
                                type="hidden"
                                value="${param.stud_id}"
                                name="stud-id">
                        </td>
                    </tr>


                    <!-- FIRST NAME -->

                    <tr>

                        <td></td>

                        <td>
                            <input
                                type="checkbox"
                                name="myfield"
                                value="first_name">
                        </td>

                        <td>
                            <label>First Name</label>
                        </td>

                        <td>
                            <input
                                type="text"
                                name="first_nameInput"
                                placeholder="Enter first name"
                                value="${rows.first_name}">
                        </td>

                    </tr>


                    <!-- LAST NAME -->

                    <tr>

                        <td></td>

                        <td>
                            <input
                                type="checkbox"
                                name="myfield"
                                value="last_name">
                        </td>

                        <td>
                            <label>Last Name</label>
                        </td>

                        <td>
                            <input
                                type="text"
                                name="last_nameInput"
                                placeholder="Enter last name"
                                value="${rows.last_name}">
                        </td>

                    </tr>


                    <!-- DEPARTMENT -->

                    <tr>

                        <td></td>

                        <td>
                            <input
                                type="checkbox"
                                name="myfield"
                                value="department">
                        </td>

                        <td>
                            <label>Department</label>
                        </td>

                        <td>
                            <input
                                type="text"
                                name="departmentInput"
                                placeholder="Enter department"
                                value="${rows.department}">
                        </td>

                    </tr>


                    <!-- PHONE -->

                    <tr>

                        <td></td>

                        <td>
                            <input
                                type="checkbox"
                                name="myfield"
                                value="phone_number">
                        </td>

                        <td>
                            <label>Phone Number</label>
                        </td>

                        <td>
                            <input
                                type="text"
                                name="phone_numberInput"
                                placeholder="Enter phone number"
                                value="${rows.phone_number}">
                        </td>

                    </tr>


                    <!-- DOB -->

                    <tr>

                        <td></td>

                        <td>
                            <input
                                type="checkbox"
                                name="myfield"
                                value="DOB">
                        </td>

                        <td>
                            <label>Date of Birth</label>
                        </td>

                        <td>
                            <input
                                type="date"
                                name="DOBInput"
                                value="${rows.DOB}">
                        </td>

                    </tr>


                    <!-- UPDATE -->

                    <tr>

                        <td colspan="4" align="center">

                            <div class="update-btn">

                                <input
                                    type="submit"
                                    value="Update Student Details">

                            </div>

                        </td>

                    </tr>

                </c:forEach>

            </table>

        </form>

    </div>


    <!-- BACK BUTTON -->

    <div class="cancel">

        <form action="index.jsp">

            <input
                type="submit"
                value="← Back to Home">

        </form>

    </div>

</div>

</body>
</html>