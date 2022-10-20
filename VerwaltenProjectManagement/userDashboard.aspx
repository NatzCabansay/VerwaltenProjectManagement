<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="VerwaltenProjectManagement.userDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
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
                                    <asp:Label ID="lblUserID" AssociatedControlID="tbxUserID" runat="server" Text="userID"></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true" ID="tbxUserID" runat="server" placeholder ="User ID"></asp:TextBox>
                                </div>
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
                                    <asp:ListItem Text="Select" Value="Select" />
                                    <asp:ListItem Text="Male" Value="Male" />
                                    <asp:ListItem Text="Female" Value="Female" />
                                    <asp:ListItem Text="Non-Binary" Value="Non-Binary" />
                                    <asp:ListItem Text="Prefer Not To Say" Value="Prefer Not To Say" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="mb-3">
                                    <asp:Label ID="lblContactNo" AssociatedControlID="tbxContactNo" runat="server" Text="Contact No."></asp:Label>
                                    <asp:TextBox CssClass="form-control-plaintext" ReadOnly="true"  ID="tbxContactNo" runat="server" placeholder ="Contact No."></asp:TextBox>
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

                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblProjID"  runat="server" Text="Project ID" AssociatedControlID="tbxProjID"></asp:Label>
                                <asp:TextBox ID="tbxProjID" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button CssClass="btn btn-primary mt-2 mb-2" ID="btnAddProj" runat="server" Text="Add Project" OnClick="btnAddProj_Click1" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button CssClass="btn btn-secondary mt-2 mb-2" ID="btnEditProj" runat="server" Text="Edit Project" OnClick="btnEditProj_Click1" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button CssClass="btn btn-danger mt-2 mb-2" ID="btnDeleteProj" runat="server" Text="Delete Project" OnClick="btnDeleteProj_Click" OnClientClick="if ( !confirm('Are you sure you want to delete ? ')) return false;" />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="sqlProjs" runat="server" ConnectionString="<%$ ConnectionStrings:verwaltenDBConnectionString2 %>" SelectCommand="SELECT [project_id], [project_name], [project_description], [coordinator], [starting_date], [ending_date], [status] FROM [project_master_tbl] WHERE ([assoc_user] = @assoc_user)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="assoc_user" SessionField="username" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="gdvProjects" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="project_id" DataSourceID="sqlProjs">
                                    <Columns>
                                        <asp:BoundField DataField="project_id" HeaderText="project_id" ReadOnly="True" SortExpression="project_id" />
                                        <asp:BoundField DataField="project_name" HeaderText="project_name" SortExpression="project_name" />
                                        <asp:BoundField DataField="project_description" HeaderText="project_description" SortExpression="project_description" />
                                        <asp:BoundField DataField="coordinator" HeaderText="coordinator" SortExpression="coordinator" />
                                        <asp:BoundField DataField="starting_date" HeaderText="starting_date" SortExpression="starting_date" />
                                        <asp:BoundField DataField="ending_date" HeaderText="ending_date" SortExpression="ending_date" />
                                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
