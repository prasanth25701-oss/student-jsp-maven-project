<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,com.MyData.Data,java.sql.ResultSet"
    isELIgnored="false"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Select Students</title>

<style>

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
        radial-gradient(circle at top left, #667eea, transparent 35%),
        radial-gradient(circle at bottom right, #00f2fe, transparent 35%),
        linear-gradient(135deg, #141e30, #243b55);
}

h2 {
    text-align: center;
    color: white;
    margin-bottom: 30px;
    font-size: 32px;
    font-weight: 700;
    letter-spacing: 0.5px;
}

.table-container {
    width: 95%;
    max-width: 1250px;
    margin: auto;

    overflow-x: auto;

    background: rgba(255, 255, 255, 0.96);
    padding: 25px;

    border-radius: 24px;

    box-shadow:
        0 25px 60px rgba(0, 0, 0, 0.35);

    animation: fadeIn 0.6s ease;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    overflow: hidden;
}

thead th {
    padding: 17px 15px;

    background: linear-gradient(135deg, #2563eb, #4f46e5);

    color: white;
    font-size: 16px;
    font-weight: 600;

    white-space: nowrap;
}

thead th:first-child {
    border-top-left-radius: 14px;
}

thead th:last-child {
    border-top-right-radius: 14px;
}

tbody td {
    padding: 15px;

    font-size: 15px;
    color: #374151;

    text-align: center;

    border-bottom: 1px solid #e5e7eb;

    white-space: nowrap;
}

tbody tr {
    background: white;
    transition: 0.25s ease;
}

tbody tr:nth-child(even) {
    background: #f8fafc;
}

tbody tr:hover {
    background: #eef2ff;
    transform: scale(1.005);
}

tbody tr:last-child td {
    border-bottom: none;
}

tbody td:first-child {
    font-weight: 700;
    color: #4f46e5;
}

form {
    text-align: center;
}

input[type="submit"] {
    margin-top: 25px;

    padding: 13px 30px;

    border: none;
    border-radius: 30px;

    background: linear-gradient(135deg, #111827, #374151);

    color: white;

    font-size: 16px;
    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}

input[type="submit"]:hover {
    transform: translateY(-3px);

    box-shadow:
        0 10px 25px rgba(0, 0, 0, 0.3);
}

@keyframes fadeIn {

    from {
        opacity: 0;
        transform: translateY(25px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@media (max-width: 768px) {

    body {
        padding: 25px 10px;
    }

    h2 {
        font-size: 25px;
    }

    .table-container {
        width: 100%;
        padding: 15px;
        border-radius: 18px;
    }

    thead th {
        padding: 14px 12px;
        font-size: 14px;
    }

    tbody td {
        padding: 12px 10px;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
    }
}

</style>

</head>

<body>

<h2>🎓 Student Details</h2>

<%

ResultSet rs = null;

Data ob1 = (Data) application.getAttribute("data");

rs = ob1.Select_Student();

%>

<div class="table-container">

<table>

<thead>

<tr>
    <th>Student ID</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Department</th>
    <th>Phone Number</th>
    <th>Date of Birth</th>
</tr>

</thead>

<tbody>

<%

while (rs.next()) {

%>

<tr>

    <td>
        <%=rs.getInt("id")%>
    </td>

    <td>
        <%=rs.getString("first_name")%>
    </td>

    <td>
        <%=rs.getString("last_name")%>
    </td>

    <td>
        <%=rs.getString("Department")%>
    </td>

    <td>
        <%=rs.getString("phone_number")%>
    </td>

    <td>
        <%=rs.getString("DOB")%>
    </td>

</tr>

<%

}

%>

</tbody>

</table>

<form action="index.jsp">

    <input
        type="submit"
        value="⬅ Back to Home">

</form>

</div>

</body>

</html>