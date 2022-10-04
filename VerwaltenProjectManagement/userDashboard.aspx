﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="VerwaltenProjectManagement.userDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Your Profile</h3>
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
                                    <asp:Label ID="Label1" AssociatedControlID="TextBox1" runat="server" Text="First Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="TextBox1" runat="server" placeholder ="First Name"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="Label2" AssociatedControlID="TextBox2" runat="server" Text="Middle Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="TextBox2" runat="server" placeholder ="Middle Name"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="Label3" AssociatedControlID="TextBox3" runat="server" Text="Last Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="TextBox3" runat="server" placeholder ="Last Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="Label4" AssociatedControlID="TextBox4" runat="server" Text="Date of Birth"></asp:Label>
                                   <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="LabelDD1" AssociatedControlID="DropDownList1" runat="server" Text="Gender"></asp:Label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList1" Enabled="false" runat="server">
                                    <asp:ListItem Text="Select" Value="select" />
                                    <asp:ListItem Text="Male" Value="male" />
                                    <asp:ListItem Text="Female" Value="female" />
                                    <asp:ListItem Text="Non-Binary" Value="nonbinary" />
                                    <asp:ListItem Text="Prefer Not To Say" Value="prefer_not_to_say" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="mb-3">
                                    <asp:Label ID="Label5" AssociatedControlID="TextBox5" runat="server" Text="Contact No."></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="TextBox5" runat="server" placeholder ="Contact No."></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="Label6" AssociatedControlID="TextBox6" runat="server" Text="E-mail Address"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="TextBox6" runat="server" placeholder ="E-mail Address" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="Label7" AssociatedControlID="TextBox7" runat="server" Text="Full Address"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="TextBox7" runat="server" placeholder ="Full Address" TextMode="Multiline" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Your Projects</h3>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
