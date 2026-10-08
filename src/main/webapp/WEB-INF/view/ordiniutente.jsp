<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>I miei ordini - Wavealo</title>
    </head>
    <body>
        <h1>I miei ordini</h1>

        <a href="${pageContext.request.contextPath}/catalogo">Torna al catalogo</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

        <c:if test="${empty ordini}">
            <p>Non hai ancora effettuato ordini</p>
        </c:if>

        <c:forEach var="o" items="${ordini}">
            <div>
                <h2>Ordine #${o.id}</h2>
                <p>Data: ${o.dataOrdine}</p>
                <p>Spedizione: ${o.via} ${o.numeroCivico}, ${o.citta} ${o.CAP}</p>
            </div>
        </c:forEach>
    </body>
</html>