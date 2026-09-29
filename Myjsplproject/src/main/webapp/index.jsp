```jsp
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Management System</title>

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

    padding: 35px 20px 60px;

    background:
        radial-gradient(
            circle at 10% 10%,
            rgba(99,102,241,.35),
            transparent 30%
        ),

        radial-gradient(
            circle at 90% 90%,
            rgba(6,182,212,.30),
            transparent 30%
        ),

        linear-gradient(
            135deg,
            #0f172a,
            #1e293b
        );

    color: #1e293b;
}


/* =====================================
   MAIN TITLE
===================================== */

.main-title {

    text-align: center;

    color: white;

    font-size: 42px;

    font-weight: 700;

    letter-spacing: 1px;

    margin-bottom: 35px;

    text-shadow:
        0 5px 20px rgba(0,0,0,.4);

    animation: titleShow .7s ease;
}


@keyframes titleShow {

    from {
        opacity: 0;
        transform: translateY(-20px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }

}


/* =====================================
   COMMON CARD
===================================== */

fieldset {

    border: none;

    border-radius: 24px;

    padding: 35px;

    margin: 25px auto;

    max-width: 850px;

    box-shadow:
        0 20px 50px rgba(0,0,0,.25);

    transition:
        transform .3s ease,
        box-shadow .3s ease;
}


fieldset:hover {

    transform: translateY(-4px);

    box-shadow:
        0 25px 60px rgba(0,0,0,.32);
}


/* =====================================
   INSERT CARD
===================================== */

.insert-card {

    background:
        linear-gradient(
            135deg,
            #ffffff,
            #eef2ff
        );
}


/* =====================================
   UPDATE CARD
===================================== */

.update-card {

    background:
        linear-gradient(
            135deg,
            #ffffff,
            #f5f3ff
        );
}


/* =====================================
   DELETE CARD
===================================== */

.delete-card {

    background:
        linear-gradient(
            135deg,
            #ffffff,
            #fff1f2
        );
}


/* =====================================
   CARD TITLES
===================================== */

fieldset h1 {

    text-align: center;

    font-size: 25px;

    color: #1e293b;

    margin-bottom: 25px;
}


/* =====================================
   TABLE
===================================== */

table {

    width: 100%;

    max-width: 650px;

    margin: auto;

    border-collapse: separate;

    border-spacing: 0 14px;
}


td {

    padding: 5px 8px;

    font-size: 16px;
}


td:first-child {

    width: 40%;

}


label {

    font-weight: 600;

    color: #475569;
}


/* =====================================
   INPUT / SELECT
===================================== */

input[type="text"],
input[type="date"],
select {

    width: 100%;

    padding: 13px 15px;

    border: 2px solid #e2e8f0;

    border-radius: 12px;

    background: #f8fafc;

    color: #334155;

    font-size: 15px;

    outline: none;

    transition: all .3s ease;
}


input[type="text"]:focus,
input[type="date"]:focus,
select:focus {

    border-color: #6366f1;

    background: white;

    box-shadow:
        0 0 0 4px rgba(99,102,241,.12);
}


select {

    cursor: pointer;
}


/* =====================================
   SUBMIT BUTTON
===================================== */

input[type="submit"] {

    border: none;

    padding: 12px 28px;

    border-radius: 12px;

    color: white;

    font-size: 15px;

    font-weight: 600;

    cursor: pointer;

    background:
        linear-gradient(
            135deg,
            #6366f1,
            #4f46e5
        );

    box-shadow:
        0 8px 20px rgba(79,70,229,.25);

    transition: all .3s ease;
}


input[type="submit"]:hover {

    transform: translateY(-3px);

    box-shadow:
        0 12px 25px rgba(79,70,229,.4);
}


/* =====================================
   BUTTON AREA
===================================== */

.button-area {

    text-align: center;

}


/* =====================================
   VIEW STUDENT CARD
===================================== */

.view-card {

    max-width: 1000px;

    margin: 0 auto 35px;

    padding: 35px;

    border-radius: 24px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    gap: 30px;

    background:
        linear-gradient(
            135deg,
            rgba(255,255,255,.97),
            rgba(239,246,255,.97)
        );

    box-shadow:
        0 20px 50px rgba(0,0,0,.25);
}


/* =====================================
   STUDENT COUNT
===================================== */

.student-count {

    min-width: 190px;

    padding: 22px;

    text-align: center;

    border-radius: 18px;

    background: white;

    box-shadow:
        0 10px 25px rgba(0,0,0,.12);
}


.student-count h3 {

    color: #475569;

    font-size: 15px;

    margin-bottom: 8px;

}


.count {

    font-size: 52px;

    font-weight: 800;

    color: #10b981;
}


/* =====================================
   VIEW CONTENT
===================================== */

.view-content {

    flex: 1;

    text-align: center;
}


.view-content h1 {

    color: #1e293b;

    font-size: 27px;

    margin-bottom: 18px;
}


/* =====================================
   VIEW BUTTON
===================================== */

.btn {

    border: none;

    padding: 14px 35px;

    border-radius: 50px;

    color: white;

    font-size: 16px;

    font-weight: 700;

    cursor: pointer;

    background:
        linear-gradient(
            135deg,
            #06b6d4,
            #2563eb
        );

    box-shadow:
        0 8px 20px rgba(37,99,235,.3);

    transition: all .3s ease;
}


.btn:hover {

    transform: translateY(-4px);

    box-shadow:
        0 14px 28px rgba(37,99,235,.4);
}


.btn:active {

    transform: scale(.97);
}


/* =====================================
   CARD COLOR ACCENTS
===================================== */

.insert-card h1 {
    color: #4f46e5;
}


.update-card h1 {
    color: #7c3aed;
}


.delete-card h1 {
    color: #dc2626;
}


/* =====================================
   MOBILE RESPONSIVE
===================================== */

@media (max-width: 700px) {

    body {
        padding: 25px 12px 40px;
    }


    .main-title {

        font-size: 28px;

        margin-bottom: 25px;
    }


    .view-card {

        flex-direction: column;

        padding: 25px 18px;
    }


    .student-count {

        width: 100%;

        max-width: 220px;
    }


    .view-content {

        width: 100%;
    }


    .view-content h1 {

        font-size: 22px;
    }


    fieldset {

        padding: 25px 15px;

        border-radius: 18px;
    }


    fieldset h1 {

        font-size: 21px;
    }


    table,
    tbody,
    tr,
    td {

        display: block;

        width: 100%;
    }


    td:first-child {

        width: 100%;

        margin-bottom: 5px;
    }


    td {

        padding: 5px 0;
    }


    input[type="submit"] {

        width: 100%;

        margin-top: 8px;
    }

}


/* =====================================
   SMALL MOBILE
===================================== */

@media (max-width: 400px) {

    .main-title {
        font-size: 24px;
    }

    .count {
        font-size: 42px;
    }

}

</style>

</head>


<body>


<!-- =====================================
     MAIN TITLE
===================================== -->

<h1 class="main-title">

    🎓 Student Management System

</h1>


<%

int totalStudents = 0;

try {

    Class.forName(
        "com.mysql.cj.jdbc.Driver"
    );


    Connection con =
        DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/javajsp",
            "root",
            "Priyanth@499257"
        );


    PreparedStatement ps =
        con.prepareStatement(
            "SELECT COUNT(*) FROM student"
        );


    ResultSet rs =
        ps.executeQuery();


    if (rs.next()) {

        totalStudents =
            rs.getInt(1);

    }


    rs.close();

    ps.close();

    con.close();


}
catch (Exception e) {

    e.printStackTrace();

}

%>


<!-- =====================================
     VIEW STUDENTS
===================================== -->

<div class="view-card">


    <div class="student-count">

        <h3>
            Total Students
        </h3>

        <div class="count">

            <%=totalStudents%>

        </div>

    </div>


    <div class="view-content">

        <h1>
            View Student Details
        </h1>


        <form action="select.jsp">

            <button
                type="submit"
                class="btn">

                👨‍🎓 View Students

            </button>

        </form>

    </div>


</div>



<!-- =====================================
     INSERT STUDENT
===================================== -->

<form
    action="process.jsp"
    method="GET">


    <fieldset class="insert-card">


        <h1>
            ➕ Insert Student Details
        </h1>


        <table>


            <tr>

                <td>
                    <label>
                        First Name
                    </label>
                </td>

                <td>

                    <input
                        type="text"
                        name="firstnameform"
                        placeholder="Enter first name"
                        required>

                </td>

            </tr>


            <tr>

                <td>
                    <label>
                        Last Name
                    </label>
                </td>

                <td>

                    <input
                        type="text"
                        name="lastnameform"
                        placeholder="Enter last name"
                        required>

                </td>

            </tr>


            <tr>

                <td>
                    <label>
                        Department
                    </label>
                </td>

                <td>

                    <select
                        name="departmentForm"
                        required>

                        <option value="">
                            Select Department
                        </option>

                        <option>
                            Computer Science
                        </option>

                        <option>
                            Computer Application
                        </option>

                        <option>
                            Computer Engineering
                        </option>

                        <option>
                            Mechanical Engineering
                        </option>

                        <option>
                            Petrochemical
                        </option>

                        <option>
                            EEE
                        </option>

                    </select>

                </td>

            </tr>


            <tr>

                <td>
                    <label>
                        Phone Number
                    </label>
                </td>

                <td>

                    <input
                        type="text"
                        name="phonenumberform"
                        placeholder="Enter phone number"
                        required>

                </td>

            </tr>


            <tr>

                <td>
                    <label>
                        Date of Birth
                    </label>
                </td>

                <td>

                    <input
                        type="date"
                        name="Dateform"
                        required>

                </td>

            </tr>


            <tr>

                <td colspan="2">

                    <div class="button-area">

                        <input
                            type="submit"
                            value="Insert Student">

                    </div>

                </td>

            </tr>


        </table>

    </fieldset>

</form>



<!-- =====================================
     UPDATE STUDENT
===================================== -->

<form
    action="Update.jsp"
    method="GET">


    <fieldset class="update-card">


        <h1>
            ✏️ Update Student Details
        </h1>


        <div class="button-area">

            <input
                type="submit"
                value="Update Student">

        </div>


    </fieldset>

</form>



<!-- =====================================
     DELETE STUDENT
===================================== -->

<form
    action="delete.jsp"
    method="GET">


    <fieldset class="delete-card">


        <h1>
            🗑️ Delete Student Details
        </h1>


        <div class="button-area">

            <input
                type="submit"
                value="Delete Student">

        </div>


    </fieldset>

</form>


</body>

</html>
```
