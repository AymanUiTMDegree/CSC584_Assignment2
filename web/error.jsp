<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head> 
    <title>Profile Generation Failed</title> 
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #5cc7cc;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;           
            padding: 35px;         
            min-height: 100vh;     
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
            color: #e74c3c;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 22px;
        }

        .error-message {
            color: #555555;
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 15px;
        }

        ul {
            padding-left: 20px;
            margin-bottom: 30px;
            color: #333333;
            font-size: 14px;
            line-height: 1.6;
        }

        li {
            margin-bottom: 8px;
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
    <div class="profile-card">
        <h2>Profile Generation Failed!</h2> 
        <div class="error-message">
            Please ensure: 
        </div>
        <ul> 
            <li>All required fields are filled</li>
            <li>Student ID contains numbers only and in valid format</li> 
            <li>Email contains @ symbol</li> 
        </ul> 
        <a href="index.html" class="btn-back">Try Again</a> 
    </div>
</body> 
</html>