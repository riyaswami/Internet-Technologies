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
public class Client { 

    public static void main(String[] args) throws IOException, SQLException{
        Bank b=new Bank();
        
        ResultSet r=null;
        System.out.println("Login!!");
        BufferedReader reader= new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter your Account Number : ");
        String account=reader.readLine();
        System.out.println("Enter your Pin : ");
        String pin=reader.readLine();
        String chpin=new String(pin);
        int i=0;
        while(!b.login(account, pin) && i<3){
            System.out.println("Invalid Account Number or password!!! Try Again : ");
            reader= new BufferedReader(new InputStreamReader(System.in));
            System.out.println("Enter your Account Number : ");
            account=reader.readLine();
            System.out.println("Enter your Pin : ");
            pin=reader.readLine();
            i++;
        }
        if(i==3)
        {
            System.out.println("Try logging in after some time!!!");
        }
        else{
        System.out.println("Withdraw Money(enter 1):");
        System.out.println("Deposit Money (enter 2):");
        System.out.println("View Details (enter 3):");
        System.out.println("View Last transaction (enter 4):");
        System.out.println("Change your pin (enter 5):");
        System.out.println("EXIT(enter 6):");
            
        System.out.println("Enter your Choice : ");
        reader= new BufferedReader(new InputStreamReader(System.in));
        int ch = Integer.parseInt(reader.readLine());
        
        while(true){
            if(ch==6)
            {
                System.out.println("THANK YOU VISITING...");
                b.close_conn();
                break;
            }
            switch (ch)
            {
            case 1:
                System.out.println("Enter the Amount : ");
                reader= new BufferedReader(new InputStreamReader(System.in));
                int amt = Integer.parseInt(reader.readLine());
                
                r=b.withdraw(amt, account);
                if(r!=null){
                r.next();
                System.out.println("Account No : "+account);
                System.out.println("Transaction id : "+r.getString("transaction_id"));
                System.out.println("Current Balance : "+r.getString("balance"));}
                break;
            case 2:
                System.out.println("Enter the Amount : ");
                reader= new BufferedReader(new InputStreamReader(System.in));
                int amount = Integer.parseInt(reader.readLine());
                
                r=b.deposit(account,amount);
                r.next();
                System.out.println("Account No : "+account);
                System.out.println("Transaction id : "+r.getString("transaction_id"));
                System.out.println("Current Balance : "+r.getString("balance"));
                break;
            case 3:
                
                r=b.info(account);
                r.next();
                System.out.println("Account No : "+account);
                do{
                System.out.print("Transaction id : "+r.getString("transaction_id")+"      Action: "+r.getString("action")+"  Amount: "+r.getString("amount"));
                System.out.println("   Current Balance : "+r.getString("balance")+"   Date : " +r.getDate("timestamp")+"   Time : " +r.getTime("timestamp"));}while(r.next());
                break;
            case 4:
                r=b.last_info(account);
                r.next();
                System.out.println("Account No : "+account);
                System.out.print("Transaction id : "+r.getString("transaction_id")+"      Action: "+r.getString("action")+"  Amount: "+r.getString("amount"));
                System.out.println("   Current Balance : "+r.getString("balance")+"   Date : " +r.getDate("timestamp")+"   Time : " +r.getTime("timestamp"));
                break;
            case 5:
            /*    System.out.println("Enter your pin : ");
                reader= new BufferedReader(new InputStreamReader(System.in));
                String newpin = reader.readLine();
                i=0;
                while(newpin.equals(chpin) && i<3)
                {
                    System.out.println("Re-enter your pin : ");
                    reader= new BufferedReader(new InputStreamReader(System.in));
                    newpin = reader.readLine();
                    i++;
                }
                if(i==3)
                {
                    System.out.println("ABORTING !!!Try Again!!! ");
                    break;
                }
                else if(newpin.equals(chpin))
                {*/
                    System.out.println("Enter New pin : ");
                    reader= new BufferedReader(new InputStreamReader(System.in));
                    String newpin = reader.readLine();
                    b.Change_pin(account, newpin);
                    System.out.println("Pin Changed Successfully ");
                    break;
                //}
            default:
                System.out.println("Enter a valid option..");
                
            
            }
            System.out.println("Enter your Choice : ");
            reader= new BufferedReader(new InputStreamReader(System.in));
            ch = Integer.parseInt(reader.readLine());
        }
            
    }
    }
    
}


