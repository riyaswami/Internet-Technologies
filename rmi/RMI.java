/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rmi;

import java.io.*;
import static java.lang.Integer.parseInt;
import java.net.*;
import java.lang.reflect.*;

/**
 *
 * @author Dell
 */
public class RMI {


    /**
     * @param args the command line arguments
     */
    //initialize socket and input stream
    private Socket          socket   = null;
    private ServerSocket    server   = null;
    private DataInputStream in       =  null;
    private DataOutputStream out     = null;
    Class cl =null;
    Class paramType[] = null;
    Object paramVal[] = null;
 
    // constructor with port
    public RMI(int port) 
    {
        // starts server and waits for a connection
        try
        {
            server = new ServerSocket(port);
            System.out.println("Server started");
 
            System.out.println("Waiting for a client ...");
 
            socket = server.accept();
            System.out.println("Client accepted");

            in = new DataInputStream(
                new BufferedInputStream(socket.getInputStream()));
            out  = new DataOutputStream(socket.getOutputStream());
 
            String line = "";
            
                try
                {
                    line = in.readUTF();
                //    System.out.println(line);
                    check(line);
                }
                catch(Exception i)
                {
                    System.out.println("error: "+i);
                }
            
            System.out.println("Closing connection");
 
            // close connection
            socket.close();
            in.close();
        }
        catch(IOException i)
        {
            System.out.println(i);
        }
    }
    public RMI()
    {
    }
    public static void main(String args[])
    {
        RMI server = new RMI(5000);
    }

    void check(String s) throws IOException         
    {
        
        String ele[]=s.split(";");
        try{
            
        //    String methodType=ele[1];
        //    for(int i=0;i<ele.length;i++){
        //    System.out.println(ele[i]);}
            cl=Class.forName(ele[0]);
            String methodName = ele[2];
            int noArgs = Integer.parseInt(ele[3]);
            paramType=new Class[noArgs];
            paramVal=new Object[noArgs];
            if(ele.length>4){
                
                String type=""; 
                for(int i=4,j=0;i<ele.length;i+=2,j++)
                {
                    type = ele[i];
                    
                    if (type.equalsIgnoreCase("int"))
                    {
                        paramType[j] = int.class;
			paramVal[j] = Integer.parseInt(ele[i + 1]);
                    }
                    else if(type.equals("double"))
                    {
                        paramType[j] = double.class;
			paramVal[j] = Double.parseDouble(ele[i + 1]);
                    }
                    else if(type.equals("boolean"))
                    {
                        paramType[j] = Boolean.class;
			paramVal[j] = Boolean.parseBoolean(ele[i + 1]);
                    }
                    else if(type.equals("String"))
                    {
                        paramType[j] = String.class;
			paramVal[j] = (ele[i + 1]);
                    }
                    else if(type.equals("char"))
                    {
                        paramType[j] = char.class;
			paramVal[j] = (ele[i + 1]).charAt(0);
                    }
                    else if(type.equals("float"))
                    {
                        paramType[j] = float.class;
			paramVal[j] = Float.parseFloat(ele[i + 1]);
                    }
                    else
                    {
                        System.out.println("noo");
                        out.writeUTF("Invalid Statement");
                    }
                    
                }
            }
        //    for(int i=0;i<Integer.parseInt(ele[3]);i++){
         //   System.out.println(paramType[i]+" "+paramVal[i]);}
            Object o = cl.newInstance();
            Method m= o.getClass().getMethod(methodName, paramType);
         //   System.out.println("here");
            out.writeUTF(m.invoke(o, paramVal) + "");
        
        }
        catch (ClassNotFoundException e) 
        {
            out.writeUTF("no class found");
	}
        catch (IOException e) 
        {
            out.writeUTF("invalid message ");
	} 
        catch (IllegalAccessException e) 
        {
            out.writeUTF(e + "");
	} 
        catch (InstantiationException e) 
        {
            out.writeUTF("cannot instantiatized");
	} 
        catch (NoSuchMethodException e) 
        {
            out.writeUTF("no method found");
        } 
        catch (InvocationTargetException e) 
        {
            out.writeUTF("invalid agrument");
        }
    
    }



}