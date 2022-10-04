﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogIn.aspx.cs" Inherits="VerwaltenProjectManagement.userLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2>Member Login</h2>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="mb-3">
                                    <asp:Label ID="Label1" AssociatedControlID="TextBox1" runat="server" Text="Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder ="Name"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="Label2" AssociatedControlID="TextBox2" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder ="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="d-grid gap-2 mb-3">
                                    <asp:Button CssClass="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Log-In" />
                                </div>
                                <div class="d-grid gap-2 mb-3">
                                    <a href="userSignUp.aspx" class="btn btn-info btn-lg" id="Button2">Sign-Up</a>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
