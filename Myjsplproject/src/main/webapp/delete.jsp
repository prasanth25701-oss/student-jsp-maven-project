<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student</title>

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
        radial-gradient(circle at top left, #ff6b6b, transparent 35%),
        radial-gradient(circle at bottom right, #845ef7, transparent 35%),
        linear-gradient(135deg, #141e30, #243b55);
}

.container {
    width: 700px;
    max-width: 100%;
    margin: auto;
    padding: 35px;
    border-radius: 24px;
    background: rgba(255, 255, 255, 0.96);
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.35);
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #1f2937;
    font-size: 32px;
}

select,
input[type="text"] {
    width: 100%;
    padding: 14px 16px;
    margin: 8px 0 18px;
    border: 1px solid #d1d5db;
    border-radius: 12px;
    font-size: 16px;
    outline: none;
    transition: 0.3s;
    background: #f9fafb;
}

select:focus,
input[type="text"]:focus {
    border-color: #6366f1;
    box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.12);
}

label {
    display: block;
    font-weight: 600;
    color: #374151;
    margin-top: 5px;
}

.btn {
    width: 100%;
    padding: 14px 20px;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    color: white;
    transition: 0.3s;
}

.search {
    background: linear-gradient(135deg, #2563eb, #4f46e5);
    margin-bottom: 15px;
}

.search:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(37, 99, 235, 0.35);
}

.delete {
    background: linear-gradient(135deg, #ef4444, #dc2626);
}

.delete:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(220, 38, 38, 0.35);
}

.cancel {
    background: #6b7280;
}

.cancel:hover {
    background: #4b5563;
    transform: translateY(-2px);
}

.buttons {
    display: flex;
    gap: 15px;
    margin-top: 15px;
}

.buttons .btn {
    flex: 1;
}

.btm {
    margin-top: 5px;
}

.btm input {
    width: 200px;
    padding: 12px 18px;
    border: none;
    border-radius: 30px;
    background: linear-gradient(135deg, #111827, #374151);
    color: white;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

.btm input:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(0, 0, 0, 0.25);
}

hr {
    border: none;
    height: 1px;
    background: #e5e7eb;
    margin: 15px 0;
}

@media (max-width: 600px) {
    body {
        padding: 20px 12px;
    }

    .container {
        padding: 25px 20px;
    }

    h1 {
        font-size: 26px;
    }

    .buttons {
        flex-direction: column;
    }

    .btm input {
        width: 100%;
    }
}
</style>

</head>

<body>

<div class="container">

    <h1>🗑️ Delete Student</h1>

    <form method="post">

        <select name="id">
            <option>Select Student</option>

            <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/javajsp",
                    "root",
                    "Priyanth@499257"
                );

                ps = con.prepareStatement("select id from student");
                rs = ps.executeQuery();

                while (rs.next()) {
            %>

                <option value="<%=rs.getInt(1)%>">
                    <%=rs.getInt(1)%>
                </option>

            <%
                }

            } catch (Exception e) {
                out.println(e);
            }
            %>

        </select>

        <button class="btn search">🔍 Search Student</button>

    </form>

    <div class="btm">
        <form action="index.jsp">
            <input type="submit" value="🏠 Back to Home">
        </form>
    </div>

    <%
    if (request.getParameter("id") != null) {

        int id = Integer.parseInt(request.getParameter("id"));

        ps = con.prepareStatement(
            "select * from student where id=?"
        );

        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
    %>

        <hr>

        <form action="deletepage.jsp" method="post">

            <label>ID</label>
            <input type="text"
                   name="id"
                   value="<%=rs.getInt("id")%>"
                   readonly>

            <label>First Name</label>
            <input type="text"
                   value="<%=rs.getString("first_name")%>"
                   readonly>

            <label>Last Name</label>
            <input type="text"
                   value="<%=rs.getString("last_name")%>"
                   readonly>

            <label>Department</label>
            <input type="text"
                   value="<%=rs.getString("department")%>"
                   readonly>

            <label>Mobile Number</label>
            <input type="text"
                   value="<%=rs.getString("phone_number")%>"
                   readonly>

            <label>Date Of Birth</label>
            <input type="text"
                   value="<%=rs.getString("DOB")%>"
                   readonly>

            <div class="buttons">

                <button class="btn delete">
                    🗑️ Delete Student
                </button>

                <button
                    type="button"
                    class="btn cancel"
                    onclick="location='index.jsp'">
                    ✕ Cancel
                </button>

            </div>

        </form>

    <%
        }
    }
    %>

</div>

</body>
</html>