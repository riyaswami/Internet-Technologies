/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rmi_imp;

import java.io.*;
import java.net.*;
import java.lang.reflect.*;
import java.util.Scanner;

/**
 *
 * @author Dell
 */
public class RMI_IMP {


    /**
     * @param args the command line arguments
     */
    //initialize socket and input stream
    private Socket socket     = null;
    private DataInputStream  input   = null;
    private DataOutputStream out     = null;
    private DataInputStream in       =  null;
 
    // constructor to put ip address and port
    public RMI_IMP(String address, int port) throws IOException
    {
        // establish a connection
        try
        {
            socket = new Socket(address, port);
            System.out.println("Connected");
 
            // takes input from terminal
            input  = new DataInputStream(System.in);
 
            // sends output to the socket

            out    = new DataOutputStream(socket.getOutputStream());
            in = new DataInputStream(
                new BufferedInputStream(socket.getInputStream()));
        }
        catch(UnknownHostException u)
        {
            System.out.println(u);
        }
        catch(IOException i)
        {
            System.out.println(i);
        }
 
        // string to read message from input
        
 //       input.readLine();
        
        
            try
            {
                input();
                
            }
            catch(IOException i)
            {
                System.out.println(i);
            }
        
 
        // close the connection
        try
        {
            input.close();
            out.close();
            socket.close();
        }
        catch(IOException i)
        {
            System.out.println(i);
        }
    }
 
    public static void main(String args[]) throws IOException
    {
       RMI_IMP rmi = new RMI_IMP("127.0.0.1", 5000);
    }
    void input() throws IOException
    {
        Scanner sc= new Scanner(System.in);
        System.out.println("Enter the class Name: ");
        String line = sc.next()+";";
        System.out.println("Enter the method Type: ");
        line+=sc.next()+";";
        System.out.println("Enter the method name: ");
        line+=sc.next()+";";
        System.out.println("Enter the number of parameters: ");
        int a=sc.nextInt();
        line+=a+";";
        for(int i=1;i<=a;i++)
        {
            System.out.println("Enter the  Type of "+ i+"th arguement: ");
            line+=sc.next()+";";
            System.out.println("Enter the  value of "+ i+"th arguement: ");
            line+=sc.next()+";";
        }
        
        line=line.substring(0, line.length()-1);
       // System.out.println(line);
        out.writeUTF(line);
        System.out.println("SUM : "+in.readUTF());
    }
}