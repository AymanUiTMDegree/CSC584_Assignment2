<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head> 
    <title>Profile Generation Failed</title> 
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
            padding: 40px 35px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 450px;
            box-sizing: border-box;
            text-align: center;
        }

        .error-icon {
            font-size: 50px;
            color: #e74c3c;
            margin-bottom: 15px;
            line-height: 1;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 15px;
            color: #2c3e50;
            font-weight: 700;
            font-size: 24px;
        }

        .error-message {
            background-color: #fdf2f2;
            border-left: 4px solid #e74c3c;
            color: #c0392b;
            font-size: 15px;
            font-weight: 600;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 30px;
            text-align: left;
        }

        .btn-back {
            display: block;
            text-align: center;
            width: 100%;
            background-color: #4a90e2;
            color: white;
            padding: 12px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            box-sizing: border-box;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #357abd;
        }
    </style>
</head> 
<body> 
    <%@ include file="WEB-INF/jspf/navbar.jspf" %>

    <div class="main-container">
        <div class="profile-card">
            <div class="error-icon">⚠️</div>
            <h2>Registration Failed</h2> 
            
            <div class="error-message">
                The student profile you entered already exists in the database.
            </div>
            
            <a href="index.jsp" class="btn-back" onclick="window.history.back(); return false;">Try Again</a>
        </div>
    </div>
</body> 
</html>