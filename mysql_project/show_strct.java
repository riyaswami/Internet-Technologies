/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
public class show_strct extends HttpServlet {
    String db_name,tb_name;
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
            if(request.getParameterMap().containsKey("show"))
            {
                db_name = request.getParameter("db");
            tb_name= request.getParameter("tb");
            System.out.println(db_name);
            
            try(PrintWriter out = response.getWriter()) {
                Database a=new Database();
                ResultSet rs=a.show_strt(db_name, tb_name);
                out.println("<table border=1>");
                out.println("<th>fields</th><th>type</th> ");
                while(rs.next())
                {
                    String f=rs.getString("Field");
                    
                    f=rs.getString("Field");
                    out.println("<tr><td>"+f+"</td>");
                    f=rs.getString("Type");
                    out.println("<td>"+f+"</td></tr>");
                }
                out.println("</table></body>");
                out.println("</html>");
                
               //response.sendRedirect("start");
                
            }   catch (SQLException ex) {
                    Logger.getLogger(show_strct.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(show_strct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Table Structure</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<form>Enter the name of the database: <input type=\"txt\" id=\"db\" name=\"db\" ");
                   // + "value=\""+request.getParameter("db")+"\"/>");
            out.println("<form>Enter the name of the table: <input type=\"txt\" id=\"tb\" name=\"tb\"");
                  //  + " value=\""+request.getParameter("tb")+"\"/>");
            out.println("<br><input type=\"submit\" value= \"show\" id=\"show\" name= \"show\" /></form>");
        //    out.println("<h1>Servlet show_strct at " + request.getContextPath() + "</h1>");
            
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
