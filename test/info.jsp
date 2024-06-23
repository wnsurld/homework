<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>info</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String passwd = request.getParameter("password");

        Statement stmt = null;

        try {
            String sql = "INSERT INTO info(id, passwd) VALUES('" + id + "','" + passwd + "')";
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("회원가입에 성공했습니다.");
        } catch (SQLException ex) {
                out.println("회원가입에 실패했습니다.<br>");
                out.println("SQLException: " + ex.getMessage());
            } finally {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            }
        %>
</body>
</html>
    