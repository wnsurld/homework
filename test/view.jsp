<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, org.apache.commons.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    PreparedStatement cstmt = null;
    ResultSet crs = null;
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        pstmt = conn.prepareStatement("SELECT * FROM post WHERE id = ?");
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        
        cstmt = conn.prepareStatement("SELECT * FROM coment");
        crs = cstmt.executeQuery();
        if (rs.next()) {
           String file = rs.getString("file_name");
 %>
 
 <html>
    <head>
        <title>게시물</title>
        <style>
            body {
                background-color: wheat;
            }
            section {
                border: 2px solid black;
                width: 70%;
                padding: 10px;
                margin: 5px;
            }
            article {
                width: 70%;
            }
            footer {
                clear: both;
                text-align: center;
                margin: 10px;
            }
            .comentw {
                float: left;    
                margin: 0 auto;
            }
            .coment {
                clear: both;
                float: left;
            }
            .img {
                border: 2px solid black;
                border-radius: 5px;
            }
            .del {
                float: left;
            }
        </style>
    </head>
    <body>
        <header>
            <h2><%= rs.getString("title") %></h2>
        </header>
        <section>
            <article>
                <textarea name="content" rows="20" cols="80" readonly><%= rs.getString("content") %></textarea><br>
            </article>
            <article>
                <% if (file != null) { %>
                    <img src="uploads/<%= file %>" alt="첨부 파일">
                    <% } %>
            </article>
        </section>
        <section>
            <img class="img" src="안좋아요.png" onclick="this.src='좋아요.png'" alt="좋아요" width="60" height="60">
        </section>
        <section>
            <form action="coment.jsp" method="post">
                <textarea name="comentWrite" rows="2" cols="74" class="comentw"></textarea>
                <input type="submit" value="등록" style="width: 43; height: 36;">
            </form>
        </section>
        <section>
            <% while(crs.next()) { %>
                <article>
                    <textarea name="coment" rows="2" cols="74" class="coment" readonly><%= crs.getString("coment") %></textarea>
                    <form action="comentDelete.jsp" method="post">
                        <input type="hidden" name="id" value="<%= crs.getInt("id") %>">
                        <input type="submit" value="삭제" class="del" style="width: 43; height: 36;">
                    </form>
                    <img class="img" src="안좋아요.png" onclick="this.src='좋아요.png'" alt="좋아요" width="38" height="31">
                </article>
            <% } %>
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
            if (crs != null) crs.close();
            if (pstmt != null) pstmt.close();
            if (cstmt != null) cstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 %>