<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrazione - Wavealo</title>
    </head>
    <body>
        <h1>Registrazione</h1>
        <c:if test="${not empty errore}">
            <p style="color:red">${errore}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/registrazione" method="post">
            <label>Nome:</label>
            <input type="text" name="nome" required/><br>
            <label>Cognome:</label>
            <input type="text" name="cognome" required/><br>
            <label>Email:</label>
            <input type="email" name="email" required/><br>
            <label>Password:</label>
            <input type="password" name="password" required/><br>
            <button type="submit">Registrati</button>

            <a href="${pageContext.request.contextPath}/loginUtente">Hai già un account? Accedi</a>
        </form>
    </body>
</html>