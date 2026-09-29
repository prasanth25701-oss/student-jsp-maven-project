<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Deleted</title>

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
        radial-gradient(circle at top left, #ff6b6b, transparent 35%),
        radial-gradient(circle at bottom right, #845ef7, transparent 35%),
        linear-gradient(135deg, #141e30, #243b55);
}

.box {
    width: 500px;
    max-width: 100%;
    padding: 45px 35px;
    text-align: center;

    background: rgba(255, 255, 255, 0.96);
    border-radius: 25px;

    box-shadow:
        0 25px 60px rgba(0, 0, 0, 0.35);

    animation: popup 0.5s ease;
}

.icon {
    width: 85px;
    height: 85px;
    margin: 0 auto 20px;

    display: flex;
    justify-content: center;
    align-items: center;

    border-radius: 50%;
    background: #dcfce7;
    color: #16a34a;

    font-size: 45px;

    animation: scale 0.6s ease;
}

h1 {
    color: #16a34a;
    font-size: 28px;
    margin-bottom: 15px;
}

.message {
    color: #6b7280;
    font-size: 16px;
    margin-bottom: 30px;
}

.success-btn {
    display: inline-block;
    padding: 13px 30px;

    background: linear-gradient(135deg, #2563eb, #4f46e5);
    color: white;

    border: none;
    border-radius: 30px;

    font-size: 16px;
    font-weight: 600;
    text-decoration: none;

    cursor: pointer;
    transition: 0.3s;
}

.success-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 25px rgba(37, 99, 235, 0.35);
}

.error {
    color: #dc2626;
}

.error-icon {
    background: #fee2e2;
    color: #dc2626;
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

@keyframes scale {
    from {
        transform: scale(0);
    }

    to {
        transform: scale(1);
    }
}

@media (max-width: 500px) {
    .box {
        padding: 35px 20px;
    }

    h1 {
        font-size: 23px;
    }

    .icon {
        width: 70px;
        height: 70px;
        font-size: 35px;
    }

    .success-btn {
        width: 100%;
    }
}
</style>

</head>

<body>

<div class="box">

<%
Connection con = null;
PreparedStatement ps = null;

try {

    int id = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/javajsp",
        "root",
        "Priyanth@499257"
    );

    ps = con.prepareStatement(
        "delete from student where id=?"
    );

    ps.setInt(1, id);

    int result = ps.executeUpdate();

    if (result > 0) {
%>

        <div class="icon">✓</div>

        <h1>Student Deleted Successfully!</h1>

        <p class="message">
            The student record has been successfully removed from the database.
        </p>

<%
    } else {
%>

        <div class="icon error-icon">✕</div>

        <h1 class="error">Student Not Found</h1>

        <p class="message">
            The selected student record does not exist.
        </p>

<%
    }

} catch (Exception e) {
%>

    <div class="icon error-icon">✕</div>

    <h1 class="error">Error Occurred</h1>

    <p class="message">
        <%=e%>
    </p>

<%
}
%>

    <a href="index.jsp" class="success-btn">
        🏠 Back to Main Page
    </a>

</div>

</body>
</html>