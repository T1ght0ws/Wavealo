<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>I miei ordini - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo</h1>
    <div>
        <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
        <a href="${pageContext.request.contextPath}/carrello">Carrello</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</nav>

<div class="container">
    <h1>I miei ordini</h1>

    <c:if test="${empty ordini}">
        <p>Non hai ancora effettuato ordini</p>
    </c:if>

    <c:forEach var="o" items="${ordini}">
        <div class="ordine-card">
            <h2>Ordine #${o.id}</h2>
            <p>Data: ${o.dataOrdine}</p>
            <p>Spedizione: ${o.via} ${o.numeroCivico}, ${o.citta} ${o.CAP}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>