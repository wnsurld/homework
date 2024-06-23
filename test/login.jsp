<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
    <head>
        <title>login</title>
    </head>
    <body>
        <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String id = request.getParameter("id");
        String passwd = request.getParameter("password");

            try {
                String sql = "SELECT * FROM info WHERE id = ? AND passwd = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, passwd);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    session.setAttribute("id", id);
                    response.sendRedirect("main.jsp");
                } else {
                    out.println("정보가 일치 하지 않습니다.");
                }
            } catch (SQLException ex) {
                out.println("SQL Exception: " + ex.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </body>
</html>