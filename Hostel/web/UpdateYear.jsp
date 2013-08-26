<%-- 
    Document   : UpdateYear
    Created on : 23 Jun, 2013, 4:02:51 PM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.Hostel.*,java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
        int updateid[]=new int[100];
        int nextyear=Integer.parseInt(request.getParameter("newyear"));
        System.out.println(nextyear);
        String id[]=request.getParameterValues("checkme");
        String next=null;
        for(int i=0;i<id.length;i++)
         {
                updateid[i]=Integer.parseInt(id[i]);
                String query1="update student set toyear="+nextyear+" where id="+updateid[i];
                String query3="update student set std=std+1 where id="+updateid[i];
                System.out.println(query1);
                String query2="insert into studentyear values("+updateid[i]+","+nextyear+")";
                HostelDatabase hd=new HostelDatabase();
                int i1=hd.insertStatement(query1);
                int i2=hd.insertStatement(query3);
                int j1=hd.insertStatement(query2);
                if(i1>0&j1>0)
                    {
                        next="AddNewYear.jsp";
                    }
                    else
                        {
                            next="AddNewYear.jsp?update=false";
                        }
               
        }
         response.sendRedirect(next);
        
%>