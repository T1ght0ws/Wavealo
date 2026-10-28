<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo</h1>
    <div>
        <a href="${pageContext.request.contextPath}/carrello">Carrello</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</nav>

<div class="container">
    <h1>Checkout</h1>

    <h2>Riepilogo ordine</h2>
    <c:forEach var="item" items="${sessionScope.carrello}">
        <div class="carrello-item">
            <p>${item.prodotto.nome} x${item.quantita}</p>
            <p class="prezzo">€${item.prodotto.prezzo}</p>
        </div>
    </c:forEach>

    <h2>Dati di spedizione</h2>
    <form action="${pageContext.request.contextPath}/checkout" method="post">
        <input type="hidden" name="token" value="${sessionScope.token}"/>
        <label>Città:</label>
        <input type="text" name="citta" required/>
        <label>CAP:</label>
        <input type="text" name="CAP" required/>
        <label>Via:</label>
        <input type="text" name="via" required/>
        <label>Numero Civico:</label>
        <input type="text" name="numeroCivico" required/>
        <button type="submit">Conferma ordine</button>
    </form>

    <a href="${pageContext.request.contextPath}/carrello">Torna al carrello</a>
</div>
</body>
</html>