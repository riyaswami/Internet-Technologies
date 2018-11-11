/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;
import java.sql.*;
/**
 *
 * @author Dell
 */
public class Bank {

    /**
     * @param args the command line arguments
     */ 
    final String sql = "jdbc:mysql://localhost/";
    
    final String user = "root";
    final String password = "Sunworks123";
    
    Connection conn = null;
    Statement stmt = null;
    Bank(){}
    Bank(int i) {
        try
        {
            create_database();
            create_user_table();
        }catch(SQLException e){
            e.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
      //finally block used to close resources
        try{
            if(stmt!=null)
                stmt.close();
        }catch(SQLException se2){
        }// nothing we can do
        try{
            if(conn!=null)
                conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        }
    
    }
    void create_database() throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(sql, user, password);
            stmt = conn.createStatement();
      
            String query = "CREATE DATABASE if not exists ABC_BANK";
            
            stmt.executeUpdate(query);
            System.out.println("database created");
    }
    void create_user_table() throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "CREATE TABLE if not exists USERS " +
                    "(id int NOT NULL AUTO_INCREMENT,"+
                   " ACC_NO VARCHAR(16)   NOT NULL, "+
                   " PIN VARCHAR(4), "+
                   " LAST_NAME  VARCHAR(20), " + 
                   " FIRST_NAME VARCHAR(20), " + 
                   " AGE INTEGER, " + 
                   " GENDER VARCHAR(2), PRIMARY KEY(id,ACC_NO))";
        stmt.executeUpdate(query);
        
        System.out.println("table created");
    }
    ResultSet fetch_info(String acc) throws SQLException{
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT * FROM users WHERE acc_no=?";
        PreparedStatement Stmt = conn.prepareStatement(query);
        Stmt.setString(1, acc);
        ResultSet res = Stmt.executeQuery();
        return res;
    }
    boolean login(String acc,String pin) throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT * FROM users WHERE ACC_NO = ?";
        PreparedStatement Stmt = conn.prepareStatement(query);
        
        Stmt.setString(1, acc);
        ResultSet res = Stmt.executeQuery();
        
        
        if(res!=null && res.next()&& res.getString("PIN").equals(pin))
        {
            System.out.println("WELCOME "+res.getString("First_name")+" "+res.getString("Last_name"));
            return true;
        }
        else{
            
            return false;
        }
        
    }
    ResultSet withdraw(double amount,String acc) throws SQLException{
        try{
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT balance FROM "+acc+" where timestamp=(select max(timestamp)from "+acc+")";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res=Stmt.executeQuery();
        res.next();
    //    System.out.println((int)res.getLong(1));
        if((int)res.getLong(1)>=amount){
            double bal=(int)res.getLong(1)-amount;
        //    System.out.println("amt: "+amount);
            query = "insert into "+acc+" (action,amount,balance) values ('withdraw',?,?)";
            Stmt = conn.prepareStatement(query);
            String amt=""+(amount);
            Stmt.setString(1, amt);
            Stmt.setString(2, ""+bal);
            Stmt.executeUpdate();
        }
        else
        {
            System.out.println("Insufficient amount");
        }
        query = "SELECT * FROM "+acc+" where timestamp=(select max(timestamp)from "+acc+")";
        Stmt = conn.prepareStatement(query);
        res=Stmt.executeQuery();
        return res;
        }
        catch(SQLException e)
        {
            System.out.println(e.toString());
            return null;
        }
    }
    String create_user(String pin,String fn,String ln,int age,String gen) throws SQLException{
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        int i=100000,id=0;
        String account="";
        String query="Select max(id) from users";
        ResultSet res = stmt.executeQuery(query);
        if((res)==null)
        {
            i=i+id;
        }
        else
        {
            res.next();
            long countLong = res.getLong(1);
            i+=(int)countLong+1;
            
        }
        account="ABC2900122"+i;
  //      System.out.println(account);
        query = "Insert into users (ACC_NO, PIN, LAST_NAME, FIRST_NAME, AGE, GENDER) VALUES (?,?,?,?,?,?)";
        PreparedStatement Stmt = conn.prepareStatement(query);
    //    System.out.println("query: "+Stmt.toString());
        Stmt.setString(1, account);
        Stmt.setString(2, pin);
        Stmt.setString(3, ln);
        Stmt.setString(4, fn);
        Stmt.setInt(5, age);
        Stmt.setString(6, gen);
        Stmt.executeUpdate();
        System.out.println("creating users table");
        query="create table if not exists "+account+" (transaction_id int not null primary key auto_increment,action varchar(20),amount varchar(10),balance varchar(10) default 100,"
                + "timestamp timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)";
        Stmt = conn.prepareStatement(query);
  //      System.out.println("query: "+Stmt.toString());
        Stmt.executeUpdate();
        query="insert into "+account+"(action ,amount,balance)values('deposit',100,100)";
        Stmt = conn.prepareStatement(query);
  //      System.out.println("query: "+Stmt.toString());
        Stmt.executeUpdate();
        return account;
        
    }
    ResultSet deposit(String acc,double amount) throws SQLException{
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT balance FROM "+acc+" where timestamp=(select max(timestamp)from "+acc+")";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res=Stmt.executeQuery();
        res.next();
        double bal=(int)res.getLong(1)+amount;
        query = "insert into "+acc+" (action,amount,balance) values ('deposit',?,?)";
        Stmt = conn.prepareStatement(query);
        String amt=""+(amount);
        Stmt.setString(1, amt);
        Stmt.setString(2, ""+bal);
        Stmt.executeUpdate();
        query = "SELECT * FROM "+acc+" where timestamp=(select max(timestamp)from "+acc+")";
        Stmt = conn.prepareStatement(query);
        res=Stmt.executeQuery();
        return res;
    }
    ResultSet info(String acc) throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT * FROM "+acc+"";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res=Stmt.executeQuery();
        return res;
    }
    ResultSet last_info(String acc) throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT * FROM "+acc+" where timestamp=(select max(timestamp)from "+acc+")";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res=Stmt.executeQuery();
        return res;
    }
    ResultSet Change_pin(String acc,String pin) throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "update users set pin= "+pin+" where ACC_NO = ?";
        PreparedStatement Stmt = conn.prepareStatement(query);
        Stmt.setString(1,acc);
        Stmt.executeUpdate();
        
        query = "select * from users where ACC_NO =?";
        Stmt = conn.prepareStatement(query);
        Stmt.setString(1,acc);
        ResultSet res=Stmt.executeQuery();
        return res;
    }
    ResultSet view_users() throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "SELECT * FROM users";
        PreparedStatement Stmt = conn.prepareStatement(query);
        ResultSet res=Stmt.executeQuery();
        return res;
    }
    ResultSet edit_user_info(String acc,String fn ,String ln ,String gender,int age ,int [] ch) throws SQLException
    {
        conn = DriverManager.getConnection(sql+"ABC_BANK", user, password);
        stmt = conn.createStatement();
        String query = "update users set ";
        if(ch[0]==1)
        {
            query +="First_name = "+fn+", ";
        }
        if(ch[1]==1)
        {
            query +=" last_name = "+ln+", ";
        }
        if(ch[2]==1)
        {
            query+=" age = "+age+", ";
        }
        if(ch[3]==1)
        {
            query +=" gender = "+gender+", ";
        }
        String new_q = query.substring(0, query.length() - 2);
        new_q += " where ACC_NO = ?";
        PreparedStatement Stmt = conn.prepareStatement(new_q);
        Stmt.setString(1, acc);
        Stmt.executeUpdate();
        System.out.println("Updated Successfully");
        query = "select * from users where ACC_NO =?";
        Stmt = conn.prepareStatement(query);
        Stmt.setString(1,acc);
        ResultSet res=Stmt.executeQuery();
        return res;
    }
    void close_conn() throws SQLException
    {
        stmt.close();
        conn.close();
    }
    
}
