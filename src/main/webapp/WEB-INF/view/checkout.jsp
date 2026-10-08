<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout - Wavealo</title>
    </head>
    <body>
        <h1>Checkout</h1>
        <h2>Riepilogo ordine</h2>

        <c:forEach var="item" items="${sessionScope.carrello}">
            <div>
                <p>${item.prodotto.nome} x${item.quantita} - €${item.prodotto.prezzo}</p>
            </div>
        </c:forEach>

        <h2>Dati di spedizione</h2>
        <form action="${pageContext.request.contextPath}/checkout" method="post">
            <label>Città:</label>
            <input type="text" name="citta" required><br>
            <label>CAP:</label>
            <input type="text" name="CAP" required><br>
            <label>Via:</label>
            <input type="text" name="via" required><br>
            <label>Numero Civico:</label>
            <input type="text" name="numeroCivico" required><br>
            <button type="submit">Conferma ordine</button>
        </form>

        <a href="${pageContext.request.contextPath}/carrello">Torna al carrello</a>
    </body>
</html>
