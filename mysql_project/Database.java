/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class Database extends HttpServlet {

    final String sql = "jdbc:mysql://localhost/";
    
    final String user = "root";
    final String password = "";
    
    Connection conn = null;
    Statement stmt = null;
    Database() throws ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");}
    
    void create_database(String db_name) throws SQLException
    {
        try{
            conn = DriverManager.getConnection(sql, user, password);
            stmt = conn.createStatement();
        
      
            String query = "CREATE DATABASE if not exists "+db_name;
            
            stmt.executeUpdate(query);
            //System.out.println(db_name+"database created");
            }
        catch(Exception e){
            System.out.println("error: "+e);
            }
    }
    void create_table(String db_name,String tb_name,String[] nm,String ty[],String si[]) throws SQLException
    {
        try{
        conn = DriverManager.getConnection(sql+db_name, user, password);
        stmt = conn.createStatement();
        String query="CREATE TABLE if not exists "+ tb_name +" (";
        for (int i =0 ;i<nm.length; i++){
            if(i==nm.length-1)
            {
                query +=nm[i]+" "+ty[i]+ "("+si[i]+" )) ";
            }
            else query +=nm[i]+" "+ty[i]+ "("+si[i]+" ), ";
        }
        System.out.println(query);
        stmt.executeUpdate(query);
        
        System.out.println("table created");
        }
        catch(Exception e)
        {
            System.out.println("Exception: "+e);
        }
        
    }
    void insert(String db_name,String tb_name,String[] val) throws SQLException
    {
        try{
        conn = DriverManager.getConnection(sql+db_name, user, password);
        stmt = conn.createStatement();
        String query="insert into "+ tb_name +" values( ";
        for (int i =0 ;i<val.length; i++){
        
            if(i==val.length-1)
            {
                query +="'"+val[i]+"'";
            }
            else
                query +="'"+val[i]+"', ";
        }
        query +=" ) ";
     
        
        System.out.println(query);
        stmt.executeUpdate(query);
        
        System.out.println("inserted");
        }

        catch(Exception e)
        {
            System.out.println("Exception: "+e);
        }
        
    }
    ResultSet fetch_info(String tb_name,String db_name) throws SQLException{
        
        conn = DriverManager.getConnection(sql+db_name, user, password);
        stmt = conn.createStatement();
        String query = "SELECT * FROM "+db_name+"."+tb_name;
        System.out.println(query);
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res = Stmt.executeQuery();
        return res;
        
        
    }
    ResultSet databses(String db_name) throws SQLException{
        conn = DriverManager.getConnection(sql+db_name, user, password);
        stmt = conn.createStatement();
        String query = "SHOW DATABASES";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res = Stmt.executeQuery();
        return res;
    }
    ResultSet tables(String db_name) throws SQLException{
        conn = DriverManager.getConnection(sql+db_name, user, password);
        stmt = conn.createStatement();
        String query = "SHOW tables";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res = Stmt.executeQuery();
        return res;
    }
    ResultSet show_strt(String db_name,String tb_name) throws SQLException{
        conn = DriverManager.getConnection(sql+db_name, user, password);
        stmt = conn.createStatement();
        String query = "DESC "+db_name+"."+tb_name;
        System.out.println(query);
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res = Stmt.executeQuery();
        return res;
    }
    void close_conn() throws SQLException
    {
        stmt.close();
        conn.close();
    }



}
