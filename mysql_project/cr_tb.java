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
public class cr_tb extends HttpServlet {
    String tb_name,db_name;
    String nm[],ty[],si[];
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
        
        if(request.getParameterMap().containsKey("sub_tb"))
            {
            try {
                db_name = request.getParameter("db");
                tb_name = request.getParameter("tb");
                nm=request.getParameterValues("nm");
                ty=request.getParameterValues("ty");
                si=request.getParameterValues("si");
                Database d=new Database();
                d.create_table(db_name, tb_name, nm, ty, si);
                response.sendRedirect("start");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cr_tb.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cr_tb.class.getName()).log(Level.SEVERE, null, ex);
            }
                
            }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            db_name=request.getParameter("db");
            tb_name = request.getParameter("tb");
            String no=request.getParameter("no");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>create table</title>");            
            out.println("</head>");
            out.println("<body><center>");
            out.println("<form >Enter the name of database: <input type =\"text\" name=\"db\" value=\""
                    + db_name+ "\">"
                    + "Enter the name of table: <input type =\"text\" name=\"tb\" value=\""+tb_name+"\">"
                    + "Enter the number of coumn(s): <input type =\"number\" name=\"no\" value=\""+no+"\"><br><br>"
                    + "<Table><th>Name</th><th>Type</th><th>Size</th>");
            for(int i=0 ; i< Integer.parseInt(no) ; i++)
            {
                out.println("<tr><td><input type =\"text\" name=\"nm\"required></td>"
                        + "<td><input type =\"text\" name=\"ty\" required></td>"
                        + "<td><input type =\"text\" name=\"si\" required></td></tr>");
            }
            out.println("</table><br><input type =\"submit\" name=\"sub_tb\">"
                    +"<br><a href=\""+request.getHeader("referer")+"\"/>back</center></body>");
            out.println("</html>");
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
