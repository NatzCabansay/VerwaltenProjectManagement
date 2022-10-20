<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userForgotPassword.aspx.cs" Inherits="VerwaltenProjectManagement.userForgotPassword" %>
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
                                    <h2>Forgot Password</h2>
                                </center>
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
                                    <div class="d-grid gap-2 mb-3">
                                        <asp:Button CssClass="btn btn-primary btn-lg" ID="btnChangePass" runat="server" Text="Change Password" OnClick="btnChangePass_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
