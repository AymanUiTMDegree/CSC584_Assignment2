<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ProfileDAO.ProfileDAO"%>
<%@page import="Profile.Profile"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ProfileDAO dao = new ProfileDAO();
    Profile p = dao.getProfile(id);
    
    if(p == null) {
        response.sendRedirect("view-all.jsp");
        return;
    }
    pageContext.setAttribute("p", p);
%>
<!DOCTYPE html> 
<html> 
<head> 
    <title>Digital Business Card</title> 
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #5cc7cc;
            margin: 0;          
            padding: 0;         
            min-height: 100vh;       
            box-sizing: border-box; 
            display: flex;
            flex-direction: column;
        }

        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 35px;
            box-sizing: border-box;
        }

        .profile-card {
            background-color: #ffffff;
            padding: 35px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 450px;
            box-sizing: border-box; 
        }

        h2 {
            text-align: center;
            color: #109B9F;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 22px;
        }

        .info-group {
            margin-bottom: 18px;
            font-size: 15px;
            line-height: 1.4;
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 8px;
        }

        .label {
            font-weight: bold;
            color: #109B9F;
            display: block;
            margin-bottom: 4px;
        }

        .value {
            color: #333333;
            word-break: break-word;
        }

        .empty-value {
            color: #95a5a6;
            font-style: italic;
        }

        .btn-export, .btn-back {
            display: block;
            width: 100%;
            padding: 12px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            box-sizing: border-box;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-export {
            background-color: #27ae60;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 25px;
        }

        .btn-export:hover {
            background-color: #219150;
        }

        .btn-back {
            background-color: #4a90e2;
            color: white;
            margin-top: 15px;
        }

        .btn-back:hover {
            background-color: #357abd;
        }

        /* Print Override Media Query Stylesheet */
        @media print {
            body { background: white; padding: 0; }
            nav, .navbar, .btn-export, .btn-back { display: none !important; }
            .main-container { padding: 0; }
            .profile-card { box-shadow: none; border: none; max-width: 100%; padding: 0; }
            h2 { color: #000; text-align: left; border-bottom: 2px solid #000; padding-bottom: 5px; }
            .label { color: #000; }
        }
    </style>
</head> 
<body> 
    <%@ include file="WEB-INF/jspf/navbar.jspf" %>

    <div class="main-container">
        <div class="profile-card">
            <h2>Digital Business Card</h2>
            
            <div class="info-group">
                <span class="label">Full Name:</span>
                <span class="value">${p.name}</span>
            </div>
            
            <div class="info-group">
                <span class="label">Student ID:</span>
                <span class="value">${p.studID}</span>
            </div>
            
            <div class="info-group">
                <span class="label">Email Address:</span>
                <span class="value">${p.email}</span>
            </div>
            
            <div class="info-group">
                <span class="label">Academic Program:</span>
                <span class="value">${p.program}</span>
            </div>
            
            <div class="info-group">
                <span class="label">Hobbies:</span>
                <span class="value">
                    <% if (p.getHobbies() != null && !p.getHobbies().trim().isEmpty()) { %>
                        ${p.hobbies}
                    <% } else { %>
                        <span class="empty-value">No hobbies added</span>
                    <% } %>
                </span>
            </div> 
            
            <div class="info-group">
                <span class="label">Professional Bio:</span>
                <span class="value">
                    <% if (p.getBio() != null && !p.getBio().trim().isEmpty()) { %>
                        ${p.bio}
                    <% } else { %>
                        <span class="empty-value">No bio added</span>
                    <% } %>
                </span>
            </div>
            
            <button class="btn-export" onclick="window.print()">Export to PDF</button> 
            <a href="view-all.jsp" class="btn-back">Go Back</a>
        </div>
    </div>
</body> 
</html>