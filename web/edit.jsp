<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ProfileDAO.ProfileDAO"%>
<%@page import="Profile.Profile"%>
<%
    ProfileDAO dao = new ProfileDAO();
    
    // Process form update submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int studID = Integer.parseInt(request.getParameter("studentid"));
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String program = request.getParameter("program");
        String hobbies = request.getParameter("hobbies");
        String bio = request.getParameter("bio");
        
        Profile updated = new Profile(studID, name, email, program, hobbies, bio, "default.jpg");
        try {
            dao.updateProfile(updated);
            response.sendRedirect("view-all.jsp");
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }
    }

    // Load initial data for the form fields
    int id = Integer.parseInt(request.getParameter("id"));
    Profile p = dao.getProfile(id);
    pageContext.setAttribute("p", p);
%>
<!DOCTYPE html> 
<html> 
<head> 
    <title>Edit Student Profile</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #5cc7cc;
            margin: 0;           
            padding: 0;         
            min-height: 100vh;     
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

        form {
            background-color: #ffffff;
            padding: 35px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 500px;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #109B9F;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 24px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333333;
            font-weight: 600;
            font-size: 14px;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }

        input[readonly] {
            background-color: #eaeaea;
            color: #7f8c8d;
            cursor: not-allowed;
            border-color: #dcdcdc;
        }

        input[type="text"]:focus, input[type="email"]:focus, textarea:focus {
            border-color: #4a90e2;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"], .btn-cancel {
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

        input[type="submit"] {
            background-color: #109B9F;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 5px;
        }

        input[type="submit"]:hover {
            background-color: #0d8387;
        }

        .btn-cancel {
            background-color: #e74c3c;
            color: white;
            margin-top: 15px;
        }

        .btn-cancel:hover {
            background-color: #c0392b;
        }
    </style>
</head> 
<body> 
    <%@ include file="WEB-INF/jspf/navbar.jspf" %>

    <div class="main-container">
        <form action="edit.jsp" method="post"> 
            <h2>Modify Profile Details</h2> 
            
            <label>Student ID:</label>
            <input type="text" name="studentid" value="${p.studID}" readonly>
            
            <label>Full Name:</label>
            <input type="text" name="fullname" value="${p.name}" required>
            
            <label>Email:</label>
            <input type="email" name="email" value="${p.email}" required>
            
            <label>Academic Program:</label>
            <input type="text" name="program" value="${p.program}" required>
            
            <label>Hobbies:</label>
            <input type="text" name="hobbies" value="${p.hobbies}">
            
            <label>Professional Bio:</label>
            <textarea name="bio" rows="5">${p.bio}</textarea>
            
            <input type="submit" value="Save Profile Changes"> 
            <a href="view-all.jsp" class="btn-cancel">Cancel and Go Back</a>
        </form> 
    </div>
</body> 
</html>