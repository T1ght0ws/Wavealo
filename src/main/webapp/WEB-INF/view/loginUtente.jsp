<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo</h1>
    <div>
        <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
        <a href="${pageContext.request.contextPath}/registrazione">Registrati</a>
    </div>
</nav>

<div class="container">
    <h1>Login</h1>

    <c:if test="${not empty errore}">
        <p class="errore">${errore}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/loginUtente" method="post">
        <input type="hidden" name="token" value="${sessionScope.token}"/>
        <label>Email:</label>
        <input type="email" name="email" required/>
        <label>Password:</label>
        <input type="password" name="password" required/>
        <button type="submit">Accedi</button>
    </form>

    <a href="${pageContext.request.contextPath}/registrazione">Non hai un account? Registrati</a>
</div>
</body>
</html>