package Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AcessoServlet", urlPatterns = {"/index"})
public class AcessoServlet extends HttpServlet {

    /*SERVLET CRIADO SÓ PARA INICIAR A SESSÃO, GUARDANDO O NOME DO USUÁRIO LOGADO A CRITÉRIO DE EXEMPLO.*/

    private static String INDEX = "index.jsp";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initSession(request);

        String forward = INDEX;
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void initSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("sessaoUsuario", "Matheus");
    }
}