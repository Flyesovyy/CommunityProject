﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="CommWebApp.Forms.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--#include file="/includes/bootstrap.html"-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/includes/gridview.css" rel="stylesheet" />
    <style type="text/css">
        .right {
            float: right;
            margin-right: 190px;
            margin-top: 40px;
        }

        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 26px;
            width: 20px;
        }
        .auto-style3 {
            width: 20px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <%--START OF NAV BAR --%>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/Forms/DashBoard.aspx">
                <img src="/images/trpr.png" width="96" height="54" alt="trpr-logo" /></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="/Forms/DashBoard.aspx">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/InstructionPage.aspx">Instructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/SubmitPage.aspx">Submission</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <label class="mr-4">Hello <%: Context.User.Identity.GetUserName()  %></label>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>
        <div class="container">

            <div class="col-lg-4 float-right mt-5">
                <div class="cardright border border-secondary rounded p-1">
                    <article class="card-group-item">
                        <%--                        <header class="card-header">
                            <h6 class="title">Useful Information </h6>
                        </header>--%>
                        <div class="filter-content">
                            <div class="list-group list-group-flush">
                                <a href="#" class="list-group-item">New submissions<span class="float-right badge badge-light round">142</span> </a>
                                <a href="#" class="list-group-item">Articles in review<span class="float-right badge badge-light round">3</span>  </a>
                                <a href="#" class="list-group-item">Proof pages complete<span class="float-right badge badge-light round">32</span>  </a>
                                <a href="#" class="list-group-item">Ready for final publication <span class="float-right badge badge-light round">12</span>  </a>
                            </div>
                            <!-- list-group .// -->
                        </div>
                    </article>
                    <!-- card-group-item.// -->
                </div>
            </div>

            <div class=" col-lg-5">
                <h2 class="mt-3">Search Criterias:</h2>
                <br />
                <table class="w-100 text-left">
                    <tr>
                        <td>Title:</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtTitleFilter" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Current Status:</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="ddlFilterStatus" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="dsStatusDDL" DataTextField="Name" DataValueField="Id">
                                <asp:ListItem Value="2">Select..</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Date between:<br />
                            <br />
                            and</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtDateStart" runat="server" TextMode="Date"></asp:TextBox>
                        &nbsp;<asp:TextBox CssClass="form-control" ID="txtDateEnd" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button CssClass="btn btn-outline-info" ID="btnFilter" runat="server" Text="Apply" />
                <br />

            </div>

            <div>
                <br />
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Green" ></asp:Label>
                <br />
                <asp:GridView CssClass="table table-bordered table-sm" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="postDS" OnSelectedIndexChanged="DashBoardGV_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Current Status" HeaderText="Status" SortExpression="Current Status" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                        <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" Visible="False" />
                        <asp:BoundField DataField="PostId" HeaderText="PostId" SortExpression="PostId" Visible="False" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Assign" />
                    </Columns>
                    <EmptyDataTemplate>
                        There are no records that fit your search query, try changing Search Criterias
                    </EmptyDataTemplate>
                    <HeaderStyle CssClass=" thead-light" />
                </asp:GridView>
                <br />


                                <asp:Panel ID="panelAssociate" Visible="false" runat="server" Width="464px">
                                    <table class="w-100">
                                        <tr>
                                            <td class="auto-style1">Associate Editor 1</td>
                                            <td class="auto-style2">&nbsp;</td>
                                            <td class="auto-style1">Associate Editor 2</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList CssClass="form-control" ID="ddlAssEdit1" runat="server" AppendDataBoundItems="True" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                                    <asp:ListItem Value="-1">Select one..</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style3">
                                                &nbsp;</td>
                                            <td>
                                                <asp:DropDownList ID="ddlAssEdit2" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                                    <asp:ListItem Value="-1">Select one..</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button CssClass="btn btn-outline-success" ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>


                <br />
                <br />
            </div>
            <div>
                <h2 class="mt-3">Articles to be reviewed</h2>
                <asp:GridView CssClass="table table-bordered table-sm" ID="gvReview" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,Id1,Id2" DataSourceID="dsReviews" OnSelectedIndexChanged="gvReview_SelectedIndexChanged">
                    <Columns>                        
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Name" HeaderText="Status" SortExpression="Name" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Review" />
                    </Columns>
                    <EmptyDataTemplate>
                        You do not have any Revision assigned to you yet.
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <br />
            </div>
            <div>
                <h2 class="mt-3">My Journal Posts</h2>
                <asp:GridView CssClass="table table-bordered table-sm" ID="gvArticles" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,Id1" DataSourceID="dsArticlesAuthor">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Name" HeaderText="Status" SortExpression="Name" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id"
                    DataNavigateUrlFormatString="Comments.aspx?post={0}"
                      Text="View Comments" />
                    </Columns>
                    <EmptyDataTemplate>
                        You do not have any submitted articles yet.
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="postDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Post.Id, Post.Title, Post.CurrentStatusId, Post.CreatedOn, Post.CreatedBy, Post.LastModifiedOn, Post.LastModifiedBy, AspNetUserRoles.UserId, AspNetUserRoles.RoleId, AspNetUserRoles.PostId, Post.PublishedOn, Status.Name AS [Current Status] FROM Post INNER JOIN AspNetUserRoles ON Post.Id = AspNetUserRoles.PostId INNER JOIN Status ON Post.CurrentStatusId = Status.Id WHERE (Post.CurrentStatusId = @status) AND (Post.Title LIKE '%' + @title + '%') AND (Post.CreatedOn BETWEEN @start AND @end )">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlFilterStatus" DefaultValue="2" Name="status" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtTitleFilter" ConvertEmptyStringToNull="False" DefaultValue="" Name="title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateStart" DefaultValue="01/01/0001" Name="start" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateEnd" DefaultValue="12/30/3000" Name="end" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="allUsersDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT { fn CONCAT(AspNetUsers.FirstName + ' ', AspNetUsers.LastName) } AS Users, AspNetUsers.Id, AspNetRoles.Id AS RolesID FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id WHERE (AspNetRoles.Id = N'2')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="addAssociateDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO AspNetUserRoles(UserId, RoleId, PostId) VALUES (@selectUser, N'2', @post)" SelectCommand="SELECT AspNetUserRoles.* FROM AspNetUserRoles">
                <InsertParameters>
                    <asp:Parameter Name="selectUser" />
                    <asp:Parameter Name="post" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsStatusDDL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, Name FROM Status"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsReviews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM Post
JOIN AspNetUserRoles ON Post.Id = AspNetUserRoles.PostId
JOIN Status ON Status.Id = Post.CurrentStatusId
WHERE RoleId = 2 AND CurrentStatusId = 3 AND UserId = @User">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="User" QueryStringField="currentUserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsArticlesAuthor" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Post]
JOIN Status ON Status.Id = Post.CurrentStatusId
WHERE ([CreatedBy] = @CreatedBy)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="CreatedBy" QueryStringField="currentUserId" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
