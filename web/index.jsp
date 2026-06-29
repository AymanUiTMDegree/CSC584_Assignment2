<!DOCTYPE html> 
<html> 
<head> 
    <title>Personal Profile Generator</title>
    <style>
        /** --FOR FUTURE USE--
        Color pallete used:
            - DeepCool inspired color accent:
            - Teal / Cyan Background: #0A7D82 to #109B9F
            - Pure White (Hardware & Text): #FFFFFF
            - Off-White / Light Gray (Chassis Highlights): #EAEAEA
            - Dark Navy Blue (Text Background Shadow): #081E26
        **/
        
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

        form {
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
            color: #333333;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 22px;
        }

        label {
            display: block;
            color: #555555;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: inherit;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            border-color: #4a90e2;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4a90e2;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 5px;
        }

        input[type="submit"]:hover {
            background-color: #357abd;
        }
    </style>
</head> 
<body> 
    <%@ include file="WEB-INF/jspf/navbar.jspf" %>

    <div class="main-container">
        <form action="ProfileController" method="post"> 
            <h2>Insert your personal details</h2> 
            <label>Full Name:</label>
            <input type="text" name="fullname" required>
            <label>Student ID:</label>
            <input type="text" name="studentid" required pattern="[0-9]{10,}">
            <label>Email:</label>
            <input type="email" name="email" required>
            <label>Academic Program:</label>
            <input type="text" name="program" required>
            <label>Hobbies:</label>
            <input type="text" name="hobbies">
            <label>Professional Bio:</label>
            <textarea name="bio" rows="4"></textarea> 
            <input type="submit" value="Register"> 
        </form> 
    </div>
</body> 
</html>