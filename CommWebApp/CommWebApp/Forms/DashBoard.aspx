﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="CommWebApp.Forms.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--#include file="/includes/bootstrap.html"-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style type="text/css">
        .right {
            float: right;
            margin-right: 190px;
            margin-top: 40px;
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
                    <li class="nav-item"><a class="nav-link" href="/Forms/InstructionPage.aspx">Incstructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/SubmitPage.aspx">Submistion</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class="col-lg-3 right">
        <div class="cardright border border-secondary rounded p-1">
            <article class="card-group-item">
                <header class="card-header">
                    <h6 class="title">Usefull Information </h6>
                </header>
                <div class="filter-content">
                    <div class="list-group list-group-flush">
                        <a href="#" class="list-group-item">Articles to Review <span class="float-right badge badge-light round">142</span> </a>
                        <a href="#" class="list-group-item">New Articles<span class="float-right badge badge-light round">3</span>  </a>
                        <a href="#" class="list-group-item">Some Info <span class="float-right badge badge-light round">32</span>  </a>
                        <a href="#" class="list-group-item">Ready to Submit <span class="float-right badge badge-light round">12</span>  </a>
                    </div>
                    <!-- list-group .// -->
                </div>
            </article>
            <!-- card-group-item.// -->
        </div>
            </div>

        <div class="container">
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
                            <asp:DropDownList CssClass="form-control" ID="ddlFilterStatus" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Date: From
                                <br />
                            <br />
                            To</td>
                        <td>
                            <input type="date" name="date" class="form-control" value="" />
                            <input type="date" name="date0" class="form-control mt-2" value="" /></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button CssClass="btn btn-outline-info" ID="btnFilter" runat="server" Text="Apply" />
                <asp:Button CssClass="btn" ID="btnA" runat="server" Text="Associate" OnClick="btnA_Click" />
                <asp:Button CssClass="btn" ID="btnR" runat="server" Text="Review " OnClick="btnR_Click" Visible="False" />
                <br />

            </div>

            <div>
                <br />
                <asp:GridView CssClass="table table-bordered table-sm" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TableDS">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="CurrentStatusId" HeaderText="Current Status" SortExpression="CurrentStatusId" />
                        <asp:CheckBoxField DataField="ReadyToPublish" HeaderText="Ready To Publish" SortExpression="ReadyToPublish" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        <asp:TemplateField HeaderText="Associate Editor 1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DSRoles" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Associate Editor 2 ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="DSRoles" DataTextField="Name" DataValueField="Id">
                                    <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass=" thead-light" />
                </asp:GridView>
                <asp:GridView CssClass="table table-bordered table-sm" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TableDS">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="CurrentStatusId" HeaderText="Current Status" SortExpression="CurrentStatusId" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" />
                    </Columns>
                    <HeaderStyle CssClass=" thead-light" />

                </asp:GridView>
                <br />
            </div>
            <asp:ObjectDataSource ID="TableDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TRPRLibrary.TRPR_databaseDataSetTableAdapters.PostTA" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_Id" Type="Int32" />
                    <asp:Parameter Name="Original_LastModifiedOn" Type="Object" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="CurrentStatusId" Type="Int32" />
                    <asp:Parameter Name="ReadyToPublish" Type="Boolean" />
                    <asp:Parameter Name="CreatedOn" Type="DateTime" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CurrentUserId" Type="String" />
                    <asp:Parameter Name="LastModifiedBy" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="CurrentStatusId" Type="Int32" />
                    <asp:Parameter Name="ReadyToPublish" Type="Boolean" />
                    <asp:Parameter Name="CreatedOn" Type="DateTime" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CurrentUserId" Type="String" />
                    <asp:Parameter Name="LastModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_Id" Type="Int32" />
                    <asp:Parameter Name="Original_LastModifiedOn" Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="DSRoles" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TRPRLibrary.TRPR_databaseDataSetTableAdapters.TARoles" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_Id" Type="String" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Original_Id" Type="String" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
