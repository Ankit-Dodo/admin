<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AdminPanel - Login</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Mr+Dafoe&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/formStyle.css">
        <style>
            #open-modal{
                width: 45px;
                outline: none;
                border: none;
                background: transparent;
                cursor: pointer;
            }
            .game {
                margin-bottom: 20px;
            }
            .game h2 {
                color: #007BFF;
                border-bottom: 1px solid #ddd;
                padding-bottom: 5px;
            }
            .students {
                list-style-type: none;
                padding: 0;
            }
            .students li {
                margin: 5px 0;
                padding: 10px;
                border-radius: 5px;
                background-color: #f4f4f4;
                
            }
            .dark .students li{
                background-color: #292929;
                
            }
            
        </style>
    </head>
    <body>
        <%@ include file="./dashboardHeader.jsp" %>
        <%@ include file="./modal.jsp" %>
        <section>
            <div class="container">
                <div style="display: flex; justify-content: space-between; align-items: center">
                    <div>
                        <h1>Welcome, <%= request.getAttribute("adminName") %></h1>
                    </div>
                    <div class="add-user">
                        <a href="/AdminPanel/add-game.jsp">Add Games</a>
                    </div>
                </div>
            </div>
        </section>
        <section>
            
            <div class="container">
                <%
                     Map<String, List<String>> gameRegistrations = (Map<String, List<String>>) request.getAttribute("gamesList");
                     
if (gameRegistrations != null && !gameRegistrations.isEmpty()) {
    for (Map.Entry<String, List<String>> entry : gameRegistrations.entrySet()) {
        String gameName = entry.getKey();
        List<String> students = entry.getValue();
                %>
                <div class="game">
                    <h2><%= gameName %></h2>
                    <ul class="students">
                        <% for (String student : students) { %>
                        <li><%= student %></li>
                            <% } %>
                    </ul>
                </div>
                <%
                        }
                    } else {
                %>
                <p>No games or registered students found.</p>
                <%
                    }
                %>
            </div>
        </section>


        <script src="./js/modal.js"></script>
    </body>
</html>

