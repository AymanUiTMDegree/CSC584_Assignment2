<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ProfileDAO.ProfileDAO"%>
<%
    String idParam = request.getParameter("id");
    if (idParam != null) {
        try {
            int studID = Integer.parseInt(idParam);
            ProfileDAO dao = new ProfileDAO();
            dao.deleteProfile(studID);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    response.sendRedirect("view-all.jsp");
%>