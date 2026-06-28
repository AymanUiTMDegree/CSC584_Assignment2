<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head> 
    <title>Profile Generation Successful</title> 
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
            color: #109B9F;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 22px;
        }

        .info-group {
            margin-bottom: 18px;
            border-bottom: 1px solid #d0d0d0;
            padding-bottom: 10px;
        }

        .info-group:last-of-type {
            border-bottom: none;
            margin-bottom: 25px;
        }

        .label {
            display: block;
            color: #555555;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .value {
            color: #333333;
            font-size: 15px;
            font-weight: 500;
            word-wrap: break-word;
        }

        .empty-value {
            color: #95a5a6;
            font-style: italic;
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
            margin-bottom: 10px;
        }

        .btn-back:hover {
            background-color: #357abd;
        }

        .btn-view-all {
            display: block;
            text-align: center;
            width: 100%;
            background-color: #109B9F;
            color: white;
            padding: 12px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            box-sizing: border-box; 
            transition: background-color 0.3s ease;
        }

        .btn-view-all:hover {
            background-color: #0A7D82;
        }
    </style>
</head> 
<body> 
    <div class="profile-card">
        <h2>Digital Business Card Created</h2> 
        
        <div class="info-group">
            <span class="label">Full Name:</span>
            <span class="value">${not empty profile.name ? profile.name : name}</span>
        </div>
        
        <div class="info-group">
            <span class="label">Student ID:</span>
            <span class="value">${not empty profile.studID ? profile.studID : id}</span>
        </div>
        
        <div class="info-group">
            <span class="label">Email Address:</span>
            <span class="value">${not empty profile.email ? profile.email : email}</span>
        </div>
        
        <div class="info-group">
            <span class="label">Academic Program:</span>
            <span class="value">${not empty profile.program ? profile.program : program}</span>
        </div>
        
        <div class="info-group">
            <span class="label">Hobbies:</span>
            <span class="value">
                ${not empty hobbies ? hobbies : '<span class="empty-value">No hobbies added</span>'}
            </span>
        </div> 
        
        <div class="info-group">
            <span class="label">Professional Bio:</span>
            <span class="value">
                ${not empty bio ? bio : '<span class="empty-value">No bio added</span>'}
            </span>
        </div>
        
        <a href="index.html" class="btn-back">Back to Form</a> 
        <a href="view-all.jsp" class="btn-view-all">View All Profiles</a>
    </div>
</body> 
</html>