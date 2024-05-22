<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/21/2024
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .content h1{
            text-align: center;
            color: red;
        }


        .content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="content">
    <h1>Registration Successful</h1>
    <p>Here are your details:</p>
    <ul>
        <li>First Name: ${user.firstName}</li>
        <li>Last Name: ${user.lastName}</li>
        <li>Date of Birth: ${user.dateOfBirth}</li>
        <li>Email: ${user.email}</li>
        <li>ZIP Code: ${user.zip}</li>
    </ul>
</div>

</body>
</html>
