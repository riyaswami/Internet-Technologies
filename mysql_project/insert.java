/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class insert extends HttpServlet {
    String db_name,tb_name,no;
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
        if(request.getParameterMap().containsKey("sub_in"))
            {
            try {
                db_name = request.getParameter("db");
                tb_name = request.getParameter("tb");
                
                String []val=request.getParameterValues("val");
                
                
                Database d=new Database();
                d.insert(db_name, tb_name,val);
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
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>create table</title>");            
            out.println("</head>");
            out.println("<body><center>");
            out.println("<form >Enter the name of database: <input type =\"text\" name=\"db\" value=\""
                    + db_name+ "\">"
                    + "Enter the name of table: <input type =\"text\" name=\"tb\" value=\""+tb_name+"\"><br><br>"
                    + "<Table border=1>");
            Database d=new Database();
            ResultSet rs=d.fetch_info(tb_name, db_name);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            //request.setAttribute("db",db_name);
            String cm[]=new String[columnCount];
            for (int i = 1; i <= columnCount; i++ ) {
                cm[i-1]= rsmd.getColumnName(i);
            
            }
            for (int i = 0; i <columnCount; i++ ) {
                out.println("<th>"+cm[i]+"</th>");
            
            }
            out.println("<tr>");
                for (int j = 0; j < columnCount; j++ ) {
                    out.println("<td><input type =\"text\" name=\"val\" required></td>");
                }
                out.println("</tr>");
                /*out.println("<tr><td><input type =\"text\" name=\"nm\"required></td>"
                        + "<td><input type =\"text\" name=\"ty\" required></td>"
                        + "<td><input type =\"text\" name=\"si\" required></td></tr>");*/
            
            out.println("</table><br><input type =\"hidden\" name=\"col_count\" value=\""+columnCount+"\">"
                    + "<input type =\"submit\" name=\"sub_in\">"
                    +"<br><a href=\""+request.getHeader("referer")+"\"/>back</center></body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
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
