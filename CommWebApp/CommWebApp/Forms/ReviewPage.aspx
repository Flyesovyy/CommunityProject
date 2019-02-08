﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="CommWebApp.Forms.ReviewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <style type="text/css">
        .auto-style1 {
            width: 377px;
            height: 107px;
        }

        .auto-style2 {
            width: 372px;
            height: 115px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!--#include file="/includes/navBar.html"-->

        <div class=" container">
            <div class="row">
                <div class="col-lg-6">
            <h2 class="mt-4">Review [File_Name]</h2>
            <br />
            <br />
            <h3>Recommendation</h3>
            <br />
            <div class="form-check jumbotron col-lg-5">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="recommendation">Accept
                </label>
            <br />
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="recommendation">Minor Revision
                </label>
            <br />
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="recommendation">Major Revision
                </label>
            <br />
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="recommendation">Reject
                </label>
            </div>
            <hr />
            <h4>Confidential comments to the Author</h4>
            <br />
            <textarea id="TextArea1" class="auto-style1" name="S1"></textarea><br />
            <br />
            <hr />
            <h4>Comments to the Author</h4>
            <br />
            <textarea id="TextArea2" class="auto-style2" name="S2"></textarea>

                </div>
                </div>
        </div>
    </form>
</body>
</html>
