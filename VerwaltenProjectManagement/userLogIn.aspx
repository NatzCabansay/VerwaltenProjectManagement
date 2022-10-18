<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogIn.aspx.cs" Inherits="VerwaltenProjectManagement.userLogIn" %>
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
                                    <asp:Label ID="lblUserID" AssociatedControlID="tbxUserID" runat="server" Text="User ID"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="tbxUserID" runat="server" placeholder ="User ID"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updpPassword" runat="server">
                                    <ContentTemplate>
                                        <div class="mb-3">
                                            <asp:Label ID="lblPassword" AssociatedControlID="tbxPassword" runat="server" Text="Password"></asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="tbxPassword" runat="server" placeholder ="Password" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="mb-3">
                                            <asp:LinkButton class="nav-link" ID="lnkForgotPassword" runat="server" OnClick="lnkForgotPassword_Click">Forgot Password</asp:LinkButton>
                                        </div>
                                        
                                        <div class="mb-3">
                                        <asp:CheckBox ID="cbxShowPass" runat="server" Text="Show Password" AutoPostBack="true" OnCheckedChanged="cbxShowPass_CheckedChanged"/>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="d-grid gap-2 mb-3">
                                    <asp:Button CssClass="btn btn-primary btn-lg" ID="btnLogin" runat="server" Text="Log-In" OnClick="btnLogin_Click" />
                                </div>
                                <div class="d-grid gap-2 mb-3">
                                    <a href="userSignUp.aspx" class="btn btn-info btn-lg" id="btnSignUp">Sign-Up</a>
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
