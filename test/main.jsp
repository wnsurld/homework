<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        pstmt = conn.prepareStatement("SELECT * FROM post");
        rs = pstmt.executeQuery(); %>
<html>
<head>
    <title>게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: wheat;
        }
        .header_main {
            text-align: center;
        }
        nav {
            margin-bottom: 50px;
        }
        .sec_main {
            background-color: white;
            border: 2px solid black;
            width: 70%;
            margin: auto;
            margin-bottom: 20px;
            padding: 20px;
        }
        .art_main {
            border: 2px solid black;
            width: 90%;
            height: 30%;
            margin: auto;
            margin-bottom: 20px;
        }
        .header_1 {
            border-bottom: 1px solid black;
            padding: 5px;
        }
        .art_1 {
            border-bottom: 1px solid black;
            height: 70%;
            padding: 5px;
        }
        .foot_1 {
            text-align: right;
            padding: 5px;
        }
    </style>
</head>
<body>
    <header class="header_main">
        <h1>SNS</h1>
    </header>
    <nav>
        <form action="write.jsp" method="post">
            <button type="submit">게시물 작성</button>
        </form>
    </nav>
    <section class="sec_main">     
        <% while(rs.next()) { %>
            <article class="art_main">
                <header class="header_1">
                    <a href="view.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("title") %></a>
                </header>
                <article class="art_1">
                    <%= rs.getString("content") %>
                </article>
                <footer class="foot_1">
                    <a href="edit.jsp?id=<%= rs.getInt("id") %>">수정</a>|
                    <a href="delete.jsp?id=<%= rs.getInt("id") %>">삭제</a>
                </footer>
            </article>
        <% } %>
    </section>
</body>
</html>
<%
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