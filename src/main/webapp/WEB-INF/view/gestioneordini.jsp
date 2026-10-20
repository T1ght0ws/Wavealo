<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestione Ordini - Wavealo</title>
</head>
<body>
    <h1>Gestione Ordini</h1>

    <a href="${pageContext.request.contextPath}/logout">Logout</a>
    <a href="${pageContext.request.contextPath}/gestioneprodotti">Gestione Prodotti</a>

    <h2>Filtra ordini</h2>
    <form action="${pageContext.request.contextPath}/gestioneordini" method="post">
        <input type="hidden" name="filtro" value="data">
        <label>Da:</label>
        <input type="date" name="dataInizio" required>
        <label>A:</label>
        <input type="date" name="dataFine" required>
        <button type="submit">Filtra per data</button>
    </form>

    <form action="${pageContext.request.contextPath}/gestioneordini" method="post">
        <input type="hidden" name="filtro" value="cliente">
        <label>ID Cliente:</label>
        <input type="number" name="utenteId" required>
        <button type="submit">Filtra per cliente</button>
    </form>

    <form action="${pageContext.request.contextPath}/gestioneordini" method="post">
        <input type="hidden" name="filtro" value="tutti">
        <button type="submit">Mostra tutti</button>
    </form>

    <h2>Lista ordini</h2>
    <c:if test="${empty ordini}">
        <p>Nessun ordine trovato</p>
    </c:if>

    <c:forEach var="o" items="${ordini}">
        <div>
            <h3>Ordine #${o.id}</h3>
            <p>Cliente ID: ${o.utenteId}</p>
            <p>Data: ${o.dataOrdine}</p>
            <p>Spedizione: ${o.via} ${o.numeroCivico}, ${o.citta} ${o.CAP}</p>
        </div>
    </c:forEach>
</body>
</html>