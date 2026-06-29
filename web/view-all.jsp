<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<%@page import="ProfileDAO.ProfileDAO"%>
<%@page import="Profile.Profile"%>
<%@page import="java.util.List"%>

<%
    ProfileDAO dao = new ProfileDAO();
    List<Profile> directProfilesList = dao.selectAllProfiles();
    
    pageContext.setAttribute("listProfiles", directProfilesList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
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
            align-items: flex-start;
            padding: 35px;
            box-sizing: border-box;
        }

        .container {
            background-color: #ffffff;
            padding: 35px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 1150px; 
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

        .controls-wrapper {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
            width: 100%;
        }

        .control-group {
            display: flex;
            flex-direction: column;
        }

        .control-group.search-main {
            flex: 1;
        }

        .control-label {
            font-size: 14px;
            font-weight: 600;
            color: #333333;
            margin-bottom: 6px;
        }

        .search-select, .sort-select {
            padding: 12px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 15px;
            background-color: #f9f9f9;
            color: #333;
            cursor: pointer;
            outline: none;
            min-width: 180px;
            height: 47px;
            box-sizing: border-box;
        }

        .search-box {
            width: 100%;
            padding: 12px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
            outline: none;
            height: 47px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            font-size: 14px;
            table-layout: fixed; 
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

        th:nth-child(1) { width: 10%; } /* ID */
        th:nth-child(2) { width: 20%; } /* Name */
        th:nth-child(3) { width: 17%; } /* Email */
        th:nth-child(4) { width: 10%; } /* Program */
        th:nth-child(5) { width: 15%; } /* Hobbies */
        th:nth-child(6) { width: 15%; } /* Bio */
        th:nth-child(7) { width: 12%; } /* Actions Column */

        td {
            padding: 12px;
            border-bottom: 1px solid #eaeaea;
            color: #333333;
            word-break: break-word;
            vertical-align: middle;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .empty-value {
            color: #95a5a6;
            font-style: italic;
        }

        .action-container {
            display: flex;
            flex-direction: column; 
            gap: 5px;             
            width: 100%;
        }

        .btn-action {
            display: block;
            width: 100%;
            padding: 5px 0;
            border-radius: 4px;
            font-size: 11px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
            transition: opacity 0.2s ease;
            box-sizing: border-box;
        }

        .btn-action:hover {
            opacity: 0.85;
        }

        .btn-view {
            background-color: #34495e;
            color: white;
        }

        .btn-edit {
            background-color: #f39c12;
            color: white;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
    <%@ include file="WEB-INF/jspf/navbar.jspf" %>

    <div class="main-container">
        <div class="container">
            <h2>Registered Student Profiles</h2>
            
            <div class="controls-wrapper">
                <div class="control-group">
                    <label class="control-label" for="searchFilter">Search By:</label>
                    <select id="searchFilter" class="search-select" onchange="filterProfiles()">
                        <option value="0">Student ID</option>
                        <option value="1">Full Name</option>
                        <option value="2">Email Address</option>
                        <option value="3">Academic Program</option>
                    </select>
                </div>
                
                <div class="control-group search-main">
                    <label class="control-label" for="searchInput">&nbsp;</label> <input type="text" id="searchInput" class="search-box" onkeyup="filterProfiles()" placeholder="Type to search data fields...">
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="sortFilter">Sort By:</label>
                    <select id="sortFilter" class="sort-select" onchange="sortProfiles()">
                        <option value="0-asc">Student ID (Ascending ↑)</option>
                        <option value="0-desc">Student ID (Descending ↓)</option>
                        <option value="1-asc">Full Name (Ascending ↑)</option>
                        <option value="1-desc">Full Name (Descending ↓)</option>
                        <option value="2-asc">Email Address (Ascending ↑)</option>
                        <option value="2-desc">Email Address (Descending ↓)</option>
                        <option value="3-asc">Academic Program (Ascending ↑)</option>
                        <option value="3-desc">Academic Program (Descending ↓)</option>
                    </select>
                </div>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Full Name</th>
                        <th>Email Address</th>
                        <th>Academic Program</th>
                        <th>Hobbies</th>
                        <th>Bio</th>
                        <th>Actions</th>
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
                            <td>
                                <div class="action-container">
                                    <a href="view.jsp?id=${profile.studID}" class="btn-action btn-view">View</a>
                                    <a href="edit.jsp?id=${profile.studID}" class="btn-action btn-edit">Edit</a>
                                    <a href="delete.jsp?id=${profile.studID}" class="btn-action btn-delete" onclick="return confirm('Are you sure you want to delete this profile?');">Delete</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <tr id="noMatchRow" style="display: none;">
                        <td colspan="7" style="text-align: center; padding: 30px; color: #e74c3c; font-weight: bold;">
                            No match result.
                        </td>
                    </tr>

                    <c:if test="${empty listProfiles}">
                        <tr>
                            <td colspan="7" style="text-align: center; padding: 30px; color: #7f8c8d;">
                                No record profiles found in the database system.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

        </div>
    </div>

    <script>
        function filterProfiles() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const columnIndex = parseInt(document.getElementById("searchFilter").value);
            const rows = document.querySelectorAll("#profileTableBody tr:not(#noMatchRow)");
            let hasMatch = false;

            rows.forEach(row => {
                if (row.cells.length < 7) return;

                const targetCellText = row.cells[columnIndex].textContent.toLowerCase();
                const matches = targetCellText.includes(input);

                row.style.display = matches ? "" : "none";
                
                if (matches) {
                    hasMatch = true;
                }
            });

            document.getElementById("noMatchRow").style.display = hasMatch ? "none" : "";
            sortProfiles();
        }

        function sortProfiles() {
            const tableBody = document.getElementById("profileTableBody");
            const valueTuple = document.getElementById("sortFilter").value.split("-");
            const columnIndex = parseInt(valueTuple[0]);
            const direction = valueTuple[1];

            const rowsArray = Array.from(tableBody.querySelectorAll("tr:not(#noMatchRow)"));

            rowsArray.sort((rowA, rowB) => {
                let cellA = rowA.cells[columnIndex].textContent.trim();
                let cellB = rowB.cells[columnIndex].textContent.trim();

                if (columnIndex === 0) {
                    return direction === "asc" ? parseInt(cellA) - parseInt(cellB) : parseInt(cellB) - parseInt(cellA);
                }

                return direction === "asc" ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
            });

            rowsArray.forEach(row => tableBody.appendChild(row));
            
            const noMatchRow = document.getElementById("noMatchRow");
            if (noMatchRow) {
                tableBody.appendChild(noMatchRow);
            }
        }

        window.addEventListener("DOMContentLoaded", sortProfiles);
    </script>
</body>
</html>