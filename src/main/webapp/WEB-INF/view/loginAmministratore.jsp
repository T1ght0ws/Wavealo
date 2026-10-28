<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Amministratore - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo Admin</h1>
</nav>

<div class="container">
    <h1>Login Amministratore</h1>

    <c:if test="${not empty errore}">
        <p class="errore">${errore}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/loginAmministratore" method="post">
        <input type="hidden" name="token" value="${sessionScope.token}"/>
        <label>Email:</label>
        <input type="email" name="email" required/>
        <label>Password:</label>
        <input type="password" name="password" required/>
        <button type="submit">Accedi</button>
    </form>
</div>
</body>
</html>