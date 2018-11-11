/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class start extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>INDEX</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>database manager</h1><form ><fieldset>\n" +
            "    <legend>CHOICES</legend>\n<center>" +
                    
            "    <br><a href=\"create_db\">CREATE DATABASE</a><br>" +
            "    <br><a href=\"show_db\">SHOW DATABASES</a><br>" +
            "    <br><a href=\"tb_show\">SHOW TABLES</a><br>" +
            "    <br><a href=\"show_dt\">SHOW DATA</a><br>" +
            "    <br><a href=\"show_strct\">SHOW STRUCTURE</a><br>" +
            "    <br><a href=\"create_tb\">CREATE TABLE</a><br>" +
            "    <br><a href=\"insert_data\">INSERT DATA</a>" +
            "  </center></fieldset>\n" +
            "</form>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        if(request.getParameter("create")!=null)
        {
        try (PrintWriter out = response.getWriter()) {
            out.println("<script>alert('database created')"+(String)request.getAttribute("db_name")+"</script>");
        }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
