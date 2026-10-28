<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestione Prodotti - Wavealo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Wavealo Admin</h1>
    <div>
        <a href="${pageContext.request.contextPath}/gestioneordini">Gestione Ordini</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</nav>

<div class="container">
    <h1>Gestione Prodotti</h1>

    <h2>Aggiungi prodotto</h2>
    <form action="${pageContext.request.contextPath}/gestioneprodotti" method="post">
        <input type="hidden" name="token" value="${sessionScope.token}"/>
        <input type="hidden" name="action" value="aggiungi"/>
        <label>Nome:</label>
        <input type="text" name="nome" required/>
        <label>Prezzo:</label>
        <input type="number" step="0.01" name="prezzo" required/>
        <label>Quantità:</label>
        <input type="number" name="quantita" required/>
        <label>Descrizione:</label>
        <textarea name="descrizione" required></textarea>
        <label>Marca:</label>
        <input type="text" name="marca" required/>
        <label>Immagine:</label>
        <input type="text" name="immagine" required/>
        <label>Categoria ID:</label>
        <input type="number" name="categoriaId" required/>
        <button type="submit">Aggiungi</button>
    </form>

    <h2>Lista prodotti</h2>
    <c:forEach var="p" items="${prodotti}">
        <div class="prodotto-card">
            <h3>${p.nome} — <span class="prezzo">€${p.prezzo}</span></h3>
            <p>${p.marca} | ${p.descrizione}</p>

            <form action="${pageContext.request.contextPath}/gestioneprodotti" method="post">
                <input type="hidden" name="token" value="${sessionScope.token}"/>
                <input type="hidden" name="action" value="modifica"/>
                <input type="hidden" name="id" value="${p.id}"/>
                <input type="text" name="nome" value="${p.nome}"/>
                <input type="number" step="0.01" name="prezzo" value="${p.prezzo}"/>
                <input type="number" name="quantita" value="${p.quantita}"/>
                <input type="text" name="descrizione" value="${p.descrizione}"/>
                <input type="text" name="marca" value="${p.marca}"/>
                <input type="text" name="immagine" value="${p.immagine}"/>
                <input type="number" name="categoriaId" value="${p.categoriaId}"/>
                <button type="submit">Modifica</button>
            </form>

            <form action="${pageContext.request.contextPath}/gestioneprodotti" method="post">
                <input type="hidden" name="token" value="${sessionScope.token}"/>
                <input type="hidden" name="action" value="cancella"/>
                <input type="hidden" name="id" value="${p.id}"/>
                <button type="submit">Cancella</button>
            </form>
        </div>
    </c:forEach>
</div>
</body>
</html>