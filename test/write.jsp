<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>게시물 작성</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                background-color: wheat;
            }
            header {
                text-align: center;
            }
            section {
                border: 2px solid black;
                padding: 10px;
                margin: 5px;
            }
            footer {
                text-align: center;
                margin: 10px;
            }
        </style>    
    </head>
    <body>
        <header>
            <h1>게시물 작성</h1>
        </header>
        <section>
            <form action="upload.jsp" method="post" enctype="multipart/form-data">
                제목<br>
                <input type="text" name="title"><br><br>
                <textarea name="content" rows="20" cols="80" placeholder="내용을 입력하세요."></textarea><br>
                <br>파일 선택: <input type="file" name="file"><br>
                <br><input type="submit" value="작성 완료">
            </form>
        </section>
        <footer>
            <a href="main.jsp">홈으로</a>
        </footer>
    </body>
</html>