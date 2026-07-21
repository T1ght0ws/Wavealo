<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Catalogo - Wavealo</title>
    </head>
    <body>
        <h1>Catalogo</h1>

        <a href="${pageContext.request.contextPath}/carrello">Carrello</a>

        <c:if test="${not empty sessionScope.utente}">
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </c:if>
        <c:if test="${empty sessionScope.utente}">
            <a href="${pageContext.request.contextPath}/loginUtente">Login</a>
            <a href="${pageContext.request.contextPath}/registrazione">Registrati</a>
        </c:if>

        <c:forEach var="p" items="${prodotti}">
            <div>
                <h2>${p.nome}</h2>
                <p>${p.marca}</p>
                <p>${p.prezzo}</p>
                <p>${p.descrizione}</p>
                <form action="${pageContext.request.contextPath}/carrello" method="post">
                    <input type="hidden" name="action" value="aggiungi"/>
                    <input type="hidden" name="idProdotto" value="${p.id}"/>
                    <button type="submit">Aggiungi al carrello</button>
                </form>
            </div>
        </c:forEach>
    </body>
</html>