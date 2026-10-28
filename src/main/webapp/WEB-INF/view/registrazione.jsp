<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrazione - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo</h1>
    <div>
        <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
        <a href="${pageContext.request.contextPath}/loginUtente">Login</a>
    </div>
</nav>

<div class="container">
    <h1>Registrazione</h1>

    <c:if test="${not empty errore}">
        <p class="errore">${errore}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/registrazione" method="post">
        <input type="hidden" name="token" value="${sessionScope.token}"/>
        <label>Nome:</label>
        <input type="text" name="nome" required/>
        <label>Cognome:</label>
        <input type="text" name="cognome" required/>
        <label>Email:</label>
        <input type="email" name="email" required/>
        <label>Password:</label>
        <input type="password" name="password" required/>
        <button type="submit">Registrati</button>
    </form>

    <a href="${pageContext.request.contextPath}/loginUtente">Hai già un account? Accedi</a>
</div>
</body>
</html>