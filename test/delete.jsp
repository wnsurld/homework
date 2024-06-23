<%@ include file="dbconn.jsp" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PreparedStatement pstmt = null;
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        pstmt = conn.prepareStatement("DELETE FROM post WHERE id = ?");
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
        response.sendRedirect("main.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 %>