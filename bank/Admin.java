/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
public class Admin  {
    public static void main(String[] a) throws IOException, SQLException
    {
        
        Bank b=new Bank(1);
        while(true){
        System.out.println("Choose an option!!:");
        System.out.println("1. Create new User");
        System.out.println("2. View Details of a single account");
        System.out.println("3. View Details");
        System.out.println("4. Edit info of a user");
        System.out.println("5. Exit");
        System.out.println("Enter your Choice : ");
        BufferedReader reader= new BufferedReader(new InputStreamReader(System.in));
        int ch = Integer.parseInt(reader.readLine());
        if(ch==1){
        System.out.println("Creating new Account:");
        System.out.println("Enter the Pin you want to create (4 digits): ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        String pin =reader.readLine();
        System.out.println("Enter First Name: ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        String fn = reader.readLine();
        System.out.println("Enter Last Name: ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        String ln = reader.readLine();
        System.out.println("Enter Age(18-105): ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        int age = Integer.parseInt(reader.readLine());
        System.out.println("Enter Gender:(F/M/O) ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        String gen = reader.readLine();
        while(gen.length()!=1)
        {
            System.out.println("RE-Enter Gender: ");
            reader= new BufferedReader(new InputStreamReader(System.in));
            gen = reader.readLine();
        }
        while(age<18 || age>99)
        {
            System.out.println("RE-Enter  Correct Age(It should be between 18 to 99) : ");
            reader= new BufferedReader(new InputStreamReader(System.in));
            age = Integer.parseInt(reader.readLine());
       }
        String acc=b.create_user(pin, fn, ln, age, gen);
        System.out.println("User Added Successfully");
        System.out.println("Account No : "+acc);
        System.out.println("Current balance: 100");
    }
    else if(ch==2)
    {
        System.out.println("Enter account no.:");
        reader= new BufferedReader(new InputStreamReader(System.in));
        String acc=(reader.readLine());
        ResultSet r =b.fetch_info(acc);
        r.next();
        System.out.println("Account No : "+r.getString("acc_no"));
            System.out.print("FIRST NAME : "+r.getString("FIRST_NAME")+"      LAST_NAME: "+r.getString("LAST_NAME"));
            System.out.println("     AGE : "+r.getString("age")+"     GENDER: "+r.getString("gender"));
        }
    else if(ch==3)
    {
        ResultSet r =b.view_users();
        r.next();
        System.out.println("Account No : "+r.getString("acc_no"));
         do{
            System.out.print("FIRST NAME : "+r.getString("FIRST_NAME")+"      LAST_NAME: "+r.getString("LAST_NAME"));
            System.out.println("     AGE : "+r.getString("age")+"     GENDER: "+r.getString("gender"));}while(r.next());
    }
    else if(ch==4)
    {
        System.out.println("Enter account no.:");
        reader= new BufferedReader(new InputStreamReader(System.in));
        String acc=(reader.readLine());
        int in[]=new int[4];
        String new_fn=null,new_ln=null,new_gen=null;
        int new_age=0;
        System.out.println("change first_name:(0/1): ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        in[0]=Integer.parseInt(reader.readLine());
        if(in[0]==1){
        System.out.println("Enter new first name: ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        new_fn=(reader.readLine());}
        System.out.println("change last_name:(0/1): ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        in[1]=Integer.parseInt(reader.readLine());
        if(in[1]==1){
        System.out.println("Enter new last name: ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        new_ln=(reader.readLine());}
        System.out.println("change age:(0/1): ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        in[2]=Integer.parseInt(reader.readLine());
        if(in[2]==1){
        System.out.println("Enter new age: ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        new_age=Integer.parseInt(reader.readLine());}
        System.out.println("change gender:(0/1): ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        in[3]=Integer.parseInt(reader.readLine());
        if(in[3]==1){
        System.out.println("Enter new gender: ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        new_gen=(reader.readLine());}
        
        b.edit_user_info(acc,new_fn,new_ln,new_gen,new_age,in);
    }
    else
    {
        b.close_conn();
        break;
    }
    }
    }

    
}
