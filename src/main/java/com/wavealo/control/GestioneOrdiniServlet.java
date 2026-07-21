package com.wavealo.control;

import com.wavealo.dao.OrdineDAO;
import com.wavealo.model.Amministratore;
import com.wavealo.model.Ordine;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GestioneOrdiniServlet", value = "/gestioneordini")
public class GestioneOrdiniServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        Amministratore amministratore = (Amministratore) session.getAttribute("amministratore");
        if(amministratore == null){
            response.sendRedirect(request.getContextPath() + "/loginAmministratore");
        }else{
            try{
                OrdineDAO ordineDAO = new OrdineDAO();
                List<Ordine> ordini = ordineDAO.getAllOrdini();
                request.setAttribute("ordini", ordini);
                request.getRequestDispatcher("/WEB-INF/view/gestioneordini.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Amministratore amministratore = (Amministratore) session.getAttribute("amministratore");
        if (amministratore == null) {
            response.sendRedirect(request.getContextPath() + "/loginAmministratore");
            return;
        }

        String filtro = request.getParameter("filtro");

        try {
            OrdineDAO ordineDAO = new OrdineDAO();
            List<Ordine> ordini;

            if (filtro.equals("data")) {
                java.sql.Date dataInizio = java.sql.Date.valueOf(request.getParameter("dataInizio"));
                java.sql.Date dataFine = java.sql.Date.valueOf(request.getParameter("dataFine"));
                ordini = ordineDAO.getOrdiniByData(dataInizio, dataFine);

            } else if (filtro.equals("cliente")) {
                int utenteId = Integer.parseInt(request.getParameter("utenteId"));
                ordini = ordineDAO.getOrdineByUtente(utenteId);

            } else {
                ordini = ordineDAO.getAllOrdini();
            }

            request.setAttribute("ordini", ordini);
            request.getRequestDispatcher("/WEB-INF/view/gestioneordini.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
