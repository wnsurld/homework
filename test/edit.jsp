<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, org.apache.commons.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        pstmt = conn.prepareStatement("SELECT * FROM post WHERE id = ?");
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
%>
<html>
    <head>
        <title>게시물 수정</title>
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
            <h1>게시물 수정</h1>
        </header>
        <section>
            <form action="update.jsp" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                제목<br>
                <input type="text" name="title" value="<%= rs.getString("title") %>"><br><br>
                <textarea name="content" rows="20" cols="80"><%= rs.getString("content") %></textarea><br>
                <br>기존 파일: <%= rs.getString("file_name") %><br>
                <br>새 파일 선택: <input type="file" name="newFile">
                <br><input type="submit" value="수정 완료">
            </form>
        </section>
        <footer>
            <a href="main.jsp">홈으로</a>
        </footer>
    </body>
</html>
<%
        } else {
            out.println("해당 게시물을 찾을 수 없습니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 %>