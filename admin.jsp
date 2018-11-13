
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="riya swami" content="">
    <link rel="icon" href="icon.ico">

    <title>Sign in</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style/signin.css" rel="stylesheet">

    <style type="text/css">
    #div{
        background-color: #F5F5F5;
        width: 402px;
        height: 353px;
        background-clip: inherit;
        align-content: center;
        border-style: outset;
        border-radius: 20px;
       }
    </style>
        <%--include file="/Database.java" --%>  
        <%@page import="ar_surveys.Database"%>
        <%!boolean res;%>
    <%
        if(request.getParameterMap().containsKey("sub"))
        {
        Database m=new Database();
         res=m.login(request.getParameter("username"),request.getParameter("password"));
         System.out.println(res);
        if (res)
        {
            
            response.sendRedirect("adminPanel.jsp");
        }
        }
    %>
    <input type="hidden" name="res" value="<%=res%>">
    <script type="text/javascript">var a= document.getElementsByName("res")[0].value;if(!a){alert("Invalid Credentials");}</script>
</head>

  <body>
 
    <div class="container">
       <center>
       <div id="div">
      <form class="form-signin">
        <h2 id="sign" class="form-signin-heading">Please sign in</h2>
          <div id="message" style="color:red; font-weight:bold"></div>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input  type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="password" type="password"  class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button id="login" class="btn btn-lg btn-primary btn-block" onclick="login()">Sign in</button>
         <hr style="color: #f00; background-color: silver; height: 2px;">
            
      </form>

      </div>
      </center>
    </div> <!-- /container -->

     

  </body>
</html>
