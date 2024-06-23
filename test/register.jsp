<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <style>
        body {
            background-color: wheat;
        }

        header {
          text-align: center;  
        }

        section {
            width: 50%;
            margin: auto;
        }
    </style>
</head>
<body>
    <header>
        <h1>회원가입</h1>
    </header>
    <section>
        <fieldset>            
            <legend>회원정보입력</legend>
            <form method="post" action="info.jsp">
            <label for="id">아이디</label>
            <input type="text" name="id" id="id"/><br>
            <label for="password">패스워드</label>
            <input type="password" name="password" id="password"/><br />
            <br><input type="submit" name="submit" value="제출" />

            </form>       
        </fieldset>
    </section>
</body>
</html>