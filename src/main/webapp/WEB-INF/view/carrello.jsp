<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Carrello - Wavealo</title>
    </head>
    <body>
        <h1>Carrello</h1>

        <a href="${pageContext.request.contextPath}/catalogo">Torna al catalogo</a>

        <c:if test="${empty sessionScope.carrello}">
            <p>Il carrello è vuoto</p>
        </c:if>

        <c:if test="${not empty sessionScope.carrello}">
            <c:forEach var="item" items="${sessionScope.carrello}">
                <div>
                    <h2>${item.prodotto.nome}</h2>
                    <p>Prezzo: €${item.prodotto.prezzo}</p>
                    <p>Quantità: ${item.quantita}</p>
                    <form action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="action" value="rimuovi" />
                        <input type="hidden" name="idProdotto" value="${item.prodotto.id}" />
                        <button type="submit">Rimuovi</button>
                    </form>
                </div>
            </c:forEach>

            <form action="${pageContext.request.contextPath}/carrello" method="post">
                <input type="hidden" name="action" value="svuota"/>
                <button type="submit">Svuota carrello</button>
            </form>

            <a href="${pageContext.request.contextPath}/checkout">Procedi al checkout</a>
        </c:if>
    </body>
</html>