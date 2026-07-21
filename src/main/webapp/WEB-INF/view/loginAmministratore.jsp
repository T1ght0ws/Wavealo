<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Amministratore - Wavealo</title>
    </head>
    <body>
        <h1>Login Amministratore</h1>
        <c:if test="${not empty errore}">
            <p style="color:red">${errore}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/loginAmministratore" method="post">
            <label>Email:</label>
            <input type="email" name="email" required/><br>
            <label>Password:</label>
            <input type="password" name="password" required/><br>
            <button type="submit">Accedi</button>
        </form>
    </body>
</html>