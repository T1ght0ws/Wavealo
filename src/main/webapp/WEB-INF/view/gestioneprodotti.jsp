<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestione Prodotti - Wavealo</title>
    </head>
    <body>
        <h1>Gestione Prodotti</h1>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
        <a href="${pageContext.request.contextPath}/gestioneordini">Gestione Ordini</a>

        <h2>Aggiungi prodotto</h2>
        <form action="${pageContext.request.contextPath}/gestioneprodotti" method="post">
            <input type="hidden" name="action" value="aggiungi"/>
            <label>Nome:</label>
            <input type="text" name="nome" required/><br/>
            <label>Prezzo:</label>
            <input type="number" step="0.01" name="prezzo" required/><br/>
            <label>Quantità:</label>
            <input type="number" name="quantita" required/><br/>
            <label>Descrizione:</label>
            <textarea name="descrizione" required></textarea><br/>
            <label>Marca:</label>
            <input type="text" name="marca" required/><br/>
            <label>Immagine:</label>
            <input type="text" name="immagine" required/><br/>
            <label>Categoria:</label>
            <input type="number" name="categoriaId" required/><br/>
            <button type="submit">Aggiungi</button>
        </form>

        <h2>Lista prodotti</h2>
        <c:forEach var="p" items="${prodotti}">
            <div>
                <h3>${p.nome} - €${p.prezzo}</h3>
                <p>${p.marca} | ${p.descrizione}</p>

                <form action="${pageContext.request.contextPath}/gestioneprodotti" method="post">
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
                    <input type="hidden" name="action" value="cancella"/>
                    <input type="hidden" name="id" value="${p.id}"/>
                    <button type="submit">Cancella</button>
                </form>
            </div>
        </c:forEach>
    </body>
</html>