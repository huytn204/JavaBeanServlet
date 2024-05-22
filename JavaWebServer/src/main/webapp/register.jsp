<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/20/2024
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Form</title>
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

    form h1{
        text-align: center;
        color: red;
    }


    .captcha-form {
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .captcha-form input[type="text"], .captcha-form input[type="text"]:disabled {
    width: 200px;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    text-align: center;
    font-size: 20px;
    }
    .captcha-form input[type="email"], .captcha-form input[type="text"]:disabled{
        width: 200px;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
        font-size: 20px;
    }
    .zip-code{
        margin-left: 85px;
    }
    .max{
        margin-left: 85px;
    }
    .code{
        margin-top: 15px;
    }
    .captcha-form button {
    padding: 10px 15px;
    border: none;
    background-color: #007BFF;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    }
    .captcha-form button:hover {
    background-color: #0056b3;
    }
    .captcha-form button{
        text-align: center;
    }
    </style>
</head>
<body>

<form class="captcha-form" onsubmit="return validateCaptcha()" action="register" method="post">
    <h1>Register</h1>
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required><br>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="firstName" required><br>

    <label for="email">Email Address:</label>
    <input type="email" id="email" name="email" required>
    <br>

    <label for="dob">Date of Birth:</label>
    <select name="month" id="month" required>
        <option value="" disabled selected>Month</option>
        <option value="01">January</option>
        <option value="02">February</option>
        <option value="03">March</option>
        <option value="04">April</option>
        <option value="05">May</option>
        <option value="06">June</option>
        <option value="07">July</option>
        <option value="08">August</option>
        <option value="09">September</option>
        <option value="10">October</option>
        <option value="11">November</option>
        <option value="12">December</option>
    </select>

    <select name="day" id="day" required>
        <option value="" disabled selected>Day</option>
        <% for (int i = 1; i <= 31; i++) { %>
        <option value="<%= String.format("%02d", i) %>"><%= i %></option>
        <% } %>
    </select>

    <select name="year" id="year" required>
        <option value="" disabled selected>Year</option>
        <% for (int i = 2024; i >= 1900; i--) { %>
        <option value="<%= i %>"><%= i %></option>
        <% } %>
    </select><br>

    <div class="code">
        <label for="code">Zip Code:</label>
        <input type="text" id="code" name="code" required>
    </div>


    <div>
        <input class="zip-code" type="text" id="generated-captcha" disabled>
    </div>
    <input class="max" type="text" id="user-captcha" required><br>
    <button type="submit">Continue</button>
</form>

<script>
    function generateCaptcha() {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let captcha = '';
        for (let i = 0; i < 6; i++) {
            captcha += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return captcha;
    }

    function validateCaptcha() {
        const generatedCaptcha = document.getElementById('generated-captcha').value;
        const userCaptcha = document.getElementById('user-captcha').value;
        if (generatedCaptcha === userCaptcha) {
            return true;
        } else {
            alert('Zip Code không hợp lệ, vui lòng thử lại.');
            return false;
        }
    }

    // Generate and display CAPTCHA when the page loads
    document.getElementById('generated-captcha').value = generateCaptcha();
</script>

</body>
</html>
