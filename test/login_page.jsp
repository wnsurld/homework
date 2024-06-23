<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <style>
        body {
            background-color: wheat;
        }

        header {
            text-align: center;
        }
        
        section {
            border: 2px solid black;
            text-align: center;
            margin: auto;
            padding: 20px;
            width: 50%;
        }

        footer {
            border: 2px solid black;
            text-align: center;
            width: 53%;
            margin: auto;
            margin-top: 20px;
            padding: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>SNS</h1><br>
    </header>
    <section>
        <form method="post" action="login.jsp">
            아이디:  <input type="text" name="id"><br>
            패스워드:<input type="password" name="password"><br>
            <br><input type="submit" value="로그인" style="height: 40;"><br>
        </form>
    </section>
    <footer>
        <br><a href="register.jsp">회원가입</a>
    </footer>
</body>
</html>