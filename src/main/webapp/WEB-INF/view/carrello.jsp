<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Carrello - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo</h1>
    <div>
        <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</nav>

<div class="container">
    <h1>Carrello</h1>

    <c:if test="${empty sessionScope.carrello}">
        <p>Il carrello è vuoto</p>
    </c:if>

    <c:if test="${not empty sessionScope.carrello}">
        <c:forEach var="item" items="${sessionScope.carrello}">
            <div class="carrello-item">
                <div>
                    <h2>${item.prodotto.nome}</h2>
                    <p>Prezzo: <span class="prezzo">€${item.prodotto.prezzo}</span></p>
                    <p>Quantità: ${item.quantita}</p>
                </div>
                <form action="${pageContext.request.contextPath}/carrello" method="post">
                    <input type="hidden" name="token" value="${sessionScope.token}"/>
                    <input type="hidden" name="action" value="rimuovi" />
                    <input type="hidden" name="idProdotto" value="${item.prodotto.id}" />
                    <button type="submit">Rimuovi</button>
                </form>
            </div>
        </c:forEach>

        <form action="${pageContext.request.contextPath}/carrello" method="post">
            <input type="hidden" name="token" value="${sessionScope.token}"/>
            <input type="hidden" name="action" value="svuota"/>
            <button type="submit">Svuota carrello</button>
        </form>

        <a href="${pageContext.request.contextPath}/checkout">Procedi al checkout</a>
    </c:if>
</div>
</body>
</html>