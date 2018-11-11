/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class create_db extends HttpServlet {

    static String db_name;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet create_db</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<form action = \"db_crd\">Enter the name of the database: <input type=\"txt\" id=\"cr_db\" name=\"cr_db\" required/>");
            out.println("<input type=\"submit\" value= \"create\" id=\"create\" name= \"create\" /></form>");
            out.println("<br><a href=\""+request.getHeader("referer")+"\"/>back</body></html>");
        }
       // String buttonClicked = request.getParameter("create");
        if(request.getParameter("create")!=null)
            db_name = request.getParameter("cr_db");
           // System.out.println(db_name);
            
            try {
                Database a=new Database();
                a.create_database(db_name);
                
                //request.setAttribute("db_name", db_name);
               // RequestDispatcher rd= request.getRequestDispatcher("start");
              //  rd.forward(request,response);
               //response.sendRedirect("start");
                
               
                
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(create_db.class.getName()).log(Level.SEVERE, null, ex);
            }
        /*    try (PrintWriter out = response.getWriter())
            {
                out.println("<script alert('created');/>");
            }
        */   
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
