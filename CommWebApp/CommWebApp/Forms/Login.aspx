﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CommWebApp.Forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TRPR | Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/popper.js"></script>
    <style type="text/css">
        body {
            margin: auto;
            font-size: 16px;
            font-family: Arial;
            max-width: 100%;
            height: 100%;
            background-size: cover;
            background-image: url("/images/backg.jpg");
            
        }
       

        .center {
           
            margin: 0 auto;
            width: 30%;
            padding: 70px 0;
            text-align: center;
            position: center;
        }
        .txtbox {
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                width: 325px;
                border: 1.3px solid #848484;
                border-color: deepskyblue;
   
            }
        .chkbox {
            border-color: deepskyblue;
        }
        .footer #button{
	width:35px;
	height:35px;
	border: #727172 12px solid;
	border-radius:35px;
	margin:0 auto;
	position:relative;
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
}
.footer #button:hover{
	width:35px;
	height:35px;
	border: #3A3A3A 12px solid;
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
	position:relative;
}
.footer {
	bottom:0;
	left:0;
	position:fixed;
    width: 100%;
    height: 2em;
    overflow:hidden;
    margin:0 auto;
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
	z-index:999;
}
.footer:hover {
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
	height: 10em;
}
.footer #container{
	margin-top:5px;
	width:100%;
height:100%;
  position:relative;
  top:0;
  left:0;
	background: #3A3A3A;
}
.footer #cont{
  position:relative;
  top:-45px;
  right:190px;
	width:150px;
	height:auto;
	margin:0 auto;
}
.footer_center{
	width:500px;
	float:left;
  text-align:center;
}
.footer h3{
	font-family: 'Helvetica';
	font-size: 30px;
	font-weight: 100;
	margin-top:70px;
	margin-left:40px;
}
    </style>
</head>
<body>
    <form runat="server">
        <div class="row">
            <div class="card-header bg-transparent text-white">
            <%: DateTime.Now.Date.ToLongDateString() %>
            </div>
        </div>
        <div class="row">        
            <div class="col-sm-4 offset-4 jumbotron">
                <section id="loginForm">
                    <div class="form-horizontal">
                        <asp:Image src="/images/trpr.png" Alt="company-logo" ID="logo" runat="server" Height="150px" Width="220px"/><br /><br />
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </asp:PlaceHolder>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Email" CssClass="txtbox form-control" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="text-danger" ErrorMessage="The email field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="txtbox form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <div class="checkbox">
                                    <asp:CheckBox runat="server" ID="RememberMe" />
                                    <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Log in" CssClass="btn btn-info" OnClick="btnLogin_Click" />
                            </div>
                        </div>
                    </div>
                    <p>
                        <asp:HyperLink class="col-md-offset-2 col-md-10" runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">New to TRPR? Register now!</asp:HyperLink>
                    </p>
                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                        <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>
            </div>
        </div>
    </form>
     <%--<div class="card-header bg-transparent text-white mb-5">
           <%: DateTime.Now.Date.ToLongDateString() %>
    </div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4 jumbotron">
            <form class="text-center" id="form1" runat="server">
                
            <asp:Image src="/images/trpr.png" Alt="company-logo" ID="logo" runat="server" Height="150px" Width="220px"/><br /><br />
            <asp:TextBox ID="txtUser" placeholder="Username" runat="server" TabIndex="1" CssClass="txtbox"  style="text-align: center" ></asp:TextBox><br /><br />
            <asp:TextBox ID="txtPass" placeholder="Password" runat="server" TextMode="Password" TabIndex="1" CssClass="txtbox"  style="text-align: center"></asp:TextBox><br /><br />
            <asp:Button ID="btnLogin" type="button" CssClass="btn btn-info" runat="server" Text="Login" OnClick="btnLogin_Click" style="text-align: center" Height="50px" Width="120px" /> 
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="alert-danger"></asp:Label>
                <br />
                <asp:Label ID="lblCreateAcc" runat="server" Text="<a href='CreateAccount.aspx'>Create an Account</a>"></asp:Label><br />
                <asp:Label ID="lvlForgotPass" runat="server" Text="<a href='CreateAccount.aspx'>Forgot Password?</a>"></asp:Label>
    </form>

            </div>--%>
   <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
	   <h3>Footer Text Will Go Here When Available</h3>
</div>
</div>
</div>
</div>

</body>
</html>
