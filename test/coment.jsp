<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String coment = request.getParameter("comentWrite");

    Statement stmt = null;

    try {
        String sql = "INSERT INTO coment(coment) VALUES('" + coment + "')";
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);

        response.sendRedirect("main.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (stmt != null)
            stmt.close();
        if (conn != null)
            conn.close();
    }
%>
