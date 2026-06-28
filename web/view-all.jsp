<%-- 
    Document   : view-all.jsp
    Created on : 28 Jun 2026, 10:56:32 pm
    Author     : maima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #5cc7cc;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin: 0;          
            padding: 35px;         
            min-height: 100vh;       
            box-sizing: border-box; 
        }

        .container {
            background-color: #ffffff;
            padding: 35px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 1000px; /* Wider container to accommodate the database table layout */
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

        /* Search input bar styling matching form fields */
        .search-box {
            width: 100%;
            padding: 12px;
            margin-bottom: 25px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .search-box:focus {
            border-color: #4a90e2;
            outline: none;
        }

        /* Database table styling layout */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            font-size: 14px;
        }

        th {
            background-color: #109B9F;
            color: white;
            text-align: left;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 12px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eaeaea;
            color: #333333;
            word-break: break-word;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .empty-value {
            color: #95a5a6;
            font-style: italic;
        }

        .btn-back {
            display: inline-block;
            text-align: center;
            background-color: #4a90e2;
            color: white;
            padding: 12px 25px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registered Student Profiles</h2>
        
        <input type="text" id="searchInput" class="search-box" onkeyup="filterProfiles()" placeholder="Search by name, ID, or academic program...">
        
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
            <tbody id="profileTableBody">
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
                        <td colspan="6" style="text-align: center; padding: 30px; color: #7f8c8d;">
                            No record profiles found in the database system.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <a href="index.html" class="btn-back">Register New Profile</a>
    </div>

    <script>
        function filterProfiles() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let tableBody = document.getElementById("profileTableBody");
            let rows = tableBody.getElementsByTagName("tr");

            for (let i = 0; i < rows.length; i++) {
                // Skip processing the fallback placeholder empty row if present
                if(rows[i].cells.length < 6) continue;
                
                let idCell = rows[i].cells[0].textContent || rows[i].cells[0].innerText;
                let nameCell = rows[i].cells[1].textContent || rows[i].cells[1].innerText;
                let programCell = rows[i].cells[3].textContent || rows[i].cells[3].innerText;
                
                // Match search string query across IDs, Full Names, or Academic fields
                if (idCell.toLowerCase().indexOf(input) > -1 || 
                    nameCell.toLowerCase().indexOf(input) > -1 || 
                    programCell.toLowerCase().indexOf(input) > -1) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>