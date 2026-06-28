<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>

<%@page import="ProfileDAO.ProfileDAO"%>
<%
    ProfileDAO dao = new ProfileDAO();
    pageContext.setAttribute("listProfiles", dao.selectAllProfiles());
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #5cc7cc; padding: 35px; }
        .container { background-color: #fff; padding: 35px; border-radius: 8px; width: 100%; max-width: 1000px; margin: 0 auto; }
        h2 { text-align: center; color: #109B9F; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background-color: #109B9F; color: white; padding: 12px; text-align: left; }
        td { padding: 12px; border-bottom: 1px solid #eaeaea; }
        .empty-value { color: #95a5a6; font-style: italic; }
        .btn-back { display: inline-block; background-color: #4a90e2; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registered Student Profiles</h2>
        
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>Academic Program</th>
                    <th>Hobbies</th>
                    <th>Bio</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="profile" items="${listProfiles}">
                    <tr>
                        <td><strong><c:out value="${profile.studID}"/></strong></td>
                        <td><c:out value="${profile.name}"/></td>
                        <td><c:out value="${profile.email}"/></td>
                        <td><c:out value="${profile.program}"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty profile.hobbies}">
                                    <c:out value="${profile.hobbies}"/>
                                </c:when>
                                <c:otherwise>
                                    <span class="empty-value">None</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty profile.bio}">
                                    <c:out value="${profile.bio}"/>
                                </c:when>
                                <c:otherwise>
                                    <span class="empty-value">None</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty listProfiles}">
                    <tr>
                        <td colspan="6" style="text-align: center; color: #7f8c8d;">No profiles found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <a href="index.html" class="btn-back">Register New Profile</a>
    </div>
</body>
</html>