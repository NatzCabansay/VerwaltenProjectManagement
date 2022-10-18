<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="VerwaltenProjectManagement.userSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Sign-Up</h3>
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
                                <asp:Label ID="lblUserID" AssociatedControlID="tbxUserID" runat="server" Text="User ID (10 characters maximum)"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="tbxUserID" runat="server" placeholder="User ID (10 chars)"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <asp:Label ID="lblFirstName" AssociatedControlID="tbxFirstName" runat="server" Text="First Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="tbxFirstName" runat="server" placeholder ="First Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <asp:Label ID="lblMidName" AssociatedControlID="tbxMidName" runat="server" Text="Middle Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="tbxMidName" runat="server" placeholder ="Middle Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <asp:Label ID="lblLastName" AssociatedControlID="tbxLastName" runat="server" Text="Last Name"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="tbxLastName" runat="server" placeholder ="Last Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblDOB" AssociatedControlID="tbxDOB" runat="server" Text="Date of Birth"></asp:Label>
                                   <asp:TextBox CssClass="form-control" ID="tbxDOB" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblGender" AssociatedControlID="ddlGender" runat="server" Text="Gender"></asp:Label>
                                <asp:DropDownList CssClass="form-control" ID="ddlGender" runat="server">
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
                                    <asp:TextBox CssClass="form-control" ID="tbxContactNo" runat="server" placeholder ="Contact No."></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblEmail" AssociatedControlID="tbxEmail" runat="server" Text="E-mail Address"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="tbxEmail" runat="server" placeholder ="E-mail Address" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblFullAddress" AssociatedControlID="tbxFullAddress" runat="server" Text="Full Address"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="tbxFullAddress" runat="server" placeholder ="Full Address" TextMode="Multiline" Rows="3"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updpPassword" runat="server">
                                    <ContentTemplate>
                                        <div class="mb-3">
                                            <asp:Label ID="lblPassword" AssociatedControlID="tbxPassword" runat="server" Text="Password"></asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="tbxPassword" runat="server" placeholder ="Password" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="mb-3">
                                            <asp:CheckBox ID="cbxShowPass" runat="server" Text="Show Password" AutoPostBack="true" OnCheckedChanged="cbxShowPass_CheckedChanged"/>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="d-grid gap-2 mb-3">
                                    <asp:Button CssClass="btn btn-primary btn-lg" ID="btnSignUp" runat="server" Text="Sign-Up" OnClick="btnSignUp_Click" />
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
