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
                                    <asp:Label ID="lblFirstName" AssociatedControlID="tbxFirstName" runat="server" Text="First Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="tbxFirstName" runat="server" placeholder ="First Name"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblMidName" AssociatedControlID="tbxMidName" runat="server" Text="Middle Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="tbxMidName" runat="server" placeholder ="Middle Name"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblLastName" AssociatedControlID="tbxLastName" runat="server" Text="Last Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="tbxLastName" runat="server" placeholder ="Last Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblDOB" AssociatedControlID="tbxDOB" runat="server" Text="Date of Birth"></asp:Label>
                                   <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="tbxDOB" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblGender" AssociatedControlID="ddlGender" runat="server" Text="Gender"></asp:Label>
                                <asp:DropDownList CssClass="form-control-plaintext" ID="ddlGender" Enabled="false" runat="server">
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
                                    <asp:Label ID="lblContactNo" AssociatedControlID="tbxContactNo" runat="server" Text="Contact No."></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="TextBox5" runat="server" placeholder ="Contact No."></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblEmail" AssociatedControlID="tbxEmail" runat="server" Text="E-mail Address"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="tbxEmail" runat="server" placeholder ="E-mail Address" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblFullAddress" AssociatedControlID="tbxFullAddress" runat="server" Text="Full Address"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="tbxFullAddress" runat="server" placeholder ="Full Address" TextMode="Multiline" Rows="3"></asp:TextBox>
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
