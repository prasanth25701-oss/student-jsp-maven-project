```jsp
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Sl314.mystudent.*,java.util.*,java.io.*" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Validation Failed</title>

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}


/* =========================
   BODY
========================= */

body {
    min-height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;

    padding: 30px;

    background:
        linear-gradient(
            135deg,
            #667eea 0%,
            #764ba2 50%,
            #f093fb 100%
        );

    position: relative;
    overflow: hidden;
}


/* =========================
   BACKGROUND CIRCLES
========================= */

body::before {
    content: "";

    position: absolute;

    width: 300px;
    height: 300px;

    background: rgba(255,255,255,.15);

    border-radius: 50%;

    top: -100px;
    left: -100px;

    filter: blur(2px);
}


body::after {
    content: "";

    position: absolute;

    width: 350px;
    height: 350px;

    background: rgba(255,255,255,.12);

    border-radius: 50%;

    right: -120px;
    bottom: -120px;
}


/* =========================
   ERROR BOX
========================= */

.error-box {

    width: 700px;
    max-width: 100%;

    background: rgba(255,255,255,.92);

    backdrop-filter: blur(20px);

    border: 1px solid rgba(255,255,255,.5);

    border-radius: 25px;

    overflow: hidden;

    box-shadow:
        0 30px 70px rgba(0,0,0,.30);

    position: relative;

    z-index: 2;

    animation: showBox .6s ease;
}


/* =========================
   ANIMATION
========================= */

@keyframes showBox {

    from {
        opacity: 0;
        transform: translateY(40px) scale(.96);
    }

    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }

}


/* =========================
   HEADER
========================= */

.error-header {

    padding: 25px;

    text-align: center;

    color: white;

    font-size: 30px;

    font-weight: 700;

    background:
        linear-gradient(
            135deg,
            #ff416c,
            #ff4b2b
        );

    letter-spacing: .5px;
}


/* =========================
   ERROR ICON
========================= */

.icon {

    width: 95px;
    height: 95px;

    margin: 30px auto 15px;

    display: flex;

    justify-content: center;
    align-items: center;

    font-size: 48px;

    background: #fff0f2;

    border: 8px solid #ffe1e6;

    border-radius: 50%;

    animation: shake .5s ease .3s;
}


@keyframes shake {

    0%,100% {
        transform: rotate(0);
    }

    25% {
        transform: rotate(-8deg);
    }

    75% {
        transform: rotate(8deg);
    }

}


/* =========================
   CONTENT
========================= */

.error-content {

    padding: 10px 45px 40px;

}


.error-content h2 {

    text-align: center;

    color: #1f2937;

    font-size: 21px;

    margin-bottom: 25px;

}


/* =========================
   ERROR LIST
========================= */

.error-content ul {

    list-style: none;

    padding: 0;

}


.error-content li {

    background: #fff7f8;

    border: 1px solid #ffd5dc;

    border-left: 5px solid #ff416c;

    color: #b4233c;

    padding: 15px 18px;

    margin-bottom: 13px;

    border-radius: 12px;

    font-size: 16px;

    font-weight: 600;

    box-shadow:
        0 5px 15px rgba(255,65,108,.08);

    transition: .3s ease;
}


.error-content li:hover {

    transform: translateX(5px);

    box-shadow:
        0 8px 20px rgba(255,65,108,.15);
}


/* =========================
   BUTTON AREA
========================= */

.button-area {

    text-align: center;

    margin-top: 30px;
}


/* =========================
   BACK BUTTON
========================= */

.back-btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 8px;

    padding: 13px 32px;

    color: white;

    text-decoration: none;

    font-size: 16px;

    font-weight: 600;

    border-radius: 12px;

    background:
        linear-gradient(
            135deg,
            #667eea,
            #764ba2
        );

    box-shadow:
        0 8px 20px rgba(102,126,234,.35);

    transition: all .3s ease;
}


.back-btn:hover {

    transform: translateY(-4px);

    box-shadow:
        0 13px 28px rgba(102,126,234,.45);
}


/* =========================
   MOBILE
========================= */

@media (max-width: 600px) {

    body {
        padding: 15px;
    }

    .error-header {
        font-size: 24px;
        padding: 20px;
    }

    .error-content {
        padding: 10px 20px 30px;
    }

    .error-content h2 {
        font-size: 18px;
    }

    .error-content li {
        font-size: 14px;
    }

    .icon {
        width: 75px;
        height: 75px;
        font-size: 36px;
    }

    .back-btn {
        width: 100%;
    }

}

</style>

</head>


<body>

<%

ArrayList<String> errorMsgs = new ArrayList<String>();

String firstnameString =
        request.getParameter("firstnameform");

String lastnameString =
        request.getParameter("lastnameform");

String dept =
        request.getParameter("departmentForm");

String phonenumberString =
        request.getParameter("phonenumberform");

String DateString =
        request.getParameter("Dateform");


/* FIRST NAME */

if(firstnameString == null ||
   firstnameString.trim().isEmpty()) {

    errorMsgs.add("First Name is required.");

}
else if(!firstnameString.trim().matches("[A-Za-z]+")) {

    errorMsgs.add(
        "First Name should contain only alphabets."
    );

}


/* LAST NAME */

if(lastnameString == null ||
   lastnameString.trim().isEmpty()) {

    errorMsgs.add("Last Name is required.");

}
else if(!lastnameString.trim().matches("[A-Za-z]+")) {

    errorMsgs.add(
        "Last Name should contain only alphabets."
    );

}


/* MOBILE NUMBER */

if(phonenumberString == null ||
   phonenumberString.trim().isEmpty()) {

    errorMsgs.add("Mobile Number is required.");

}
else if(!phonenumberString.trim().matches("[0-9]{10}")) {

    errorMsgs.add(
        "Mobile Number should contain exactly 10 digits."
    );

}


/* DATE OF BIRTH */

if(DateString == null ||
   DateString.trim().isEmpty()) {

    errorMsgs.add("Date of Birth is required.");

}


/* SHOW ERROR */

if(!errorMsgs.isEmpty()) {

%>


<div class="error-box">

    <div class="error-header">

        ⚠ Validation Failed

    </div>


    <div class="icon">

        ❌

    </div>


    <div class="error-content">

        <h2>
            Please fix the following errors
        </h2>


        <ul>

        <%

        for(String str : errorMsgs) {

        %>

            <li>
                ⚠ <%=str%>
            </li>

        <%

        }

        %>

        </ul>


        <div class="button-area">

            <a
                href="javascript:history.back()"
                class="back-btn">

                ⬅ Go Back

            </a>

        </div>

    </div>

</div>


<%

}
else {

    request.setAttribute(
        "fName",
        firstnameString
    );

    request.setAttribute(
        "lName",
        lastnameString
    );

    request.setAttribute(
        "dept",
        dept
    );

    request.setAttribute(
        "phNo",
        phonenumberString
    );

    request.setAttribute(
        "dDate",
        DateString
    );

%>


<jsp:forward page="insertStudent.jsp"/>


<%

}

%>


</body>

</html>
```
