<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewProjectDetails.aspx.cs" Inherits="VerwaltenProjectManagement.viewProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    



    <%-- Main part of the page --%>
    <div class="container-fluid">
        <div class="row">
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2>Project Details</h2>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <div class="mb-3">
                                    <asp:Label ID="lblProjectTitle" runat="server" Text="Project Title" AssociatedControlID="tbxProjectTitle"></asp:Label>
                                    <asp:TextBox CssClass="form-control form-control-lg" ID="tbxProjectTitle" runat="server"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <asp:Label ID="lblProjDesc" runat="server" Text="Project Description" AssociatedControlID="tbxProjDesc"></asp:Label>
                                    <asp:TextBox ID="tbxProjDesc" runat="server" TextMode="MultiLine" Rows="5" CssClass ="form-control"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <asp:Label ID="lblProjCoords" runat="server" Text="Project Coordinator(s)" AssociatedControlID="tbxCoordinators"></asp:Label>
                                    <asp:TextBox ID="tbxCoordinators" runat="server" CssClass ="form-control"></asp:TextBox>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" AssociatedControlID="tbxStartDate"></asp:Label>
                                    <asp:TextBox ID="tbxStartDate" runat="server" CssClass ="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblEndDate" runat="server" Text="End Date" AssociatedControlID="tbxEndDate"></asp:Label>
                                    <asp:TextBox ID="tbxEndDate" runat="server" CssClass ="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblPStatus" runat="server" Text="Status" AssociatedControlID="ddlPStatus"></asp:Label>
                                <asp:DropDownList ID="ddlPStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Ongoing" Value="Ongoing" />
                                    <asp:ListItem Text="Completed" Value="Completed" />
                                    <asp:ListItem Text="Cancelled" Value="Cancelled" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mt-3 mb-3">
                                <asp:Button ID="btnBack" CssClass="btn btn-secondary" runat="server" Text="Back" OnClick="btnBack_Click" />
                            </div>
                            <div class="col-md-4 mt-3 mb-3">
                                <asp:Button ID="btnUpdateProj" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdateProj_Click" />
                            </div>
                            <div class="col-md-4 mt-3 mb-3">
                                <asp:Button ID="btnDeleteProj" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDeleteProj_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2>Project Tasks</h2>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblTaskID"  runat="server" Text="Task ID" AssociatedControlID="tbxTaskID"></asp:Label>
                                <asp:TextBox ID="tbxTaskID" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Button CssClass="btn btn-primary mt-2 mb-2" ID="btnAddTask" runat="server" Text="Add Task" data-toggle="modal" data-target="#modTaskDetails" OnClick="btnAddTask_Click"/>
                            </div>
                            <div class="col-md-3">
                                <asp:Button CssClass="btn btn-secondary mt-2 mb-2" ID="btnEditTask" runat="server" Text="Edit Task" OnClick="btnEditTask_Click"/>
                            </div>
                            <div class="col-md-3">
                                <asp:Button CssClass="btn btn-info mt-2 mb-2" ID="btnViewTasks" runat="server" Text="View Tasks" OnClick="btnViewTasks_Click"/>
                            </div>
                            <div class="col-md-3">
                                <asp:Button CssClass="btn btn-danger mt-2 mb-2" ID="btnDeleteTask" runat="server" Text="Delete Task" OnClientClick="if ( !confirm('Are you sure you want to delete ? ')) return false;" OnClick="btnDeleteTask_Click" />
                            </div>
                        </div>

                        <div runat="server" id="viewTasks" class="row">
                            <asp:SqlDataSource ID="sqlTasks" runat="server" ConnectionString="<%$ ConnectionStrings:verwaltenDBConnectionString2 %>" SelectCommand="SELECT [task_id], [task_name], [task_description], [in_charge], [starting_date], [ending_date], [status] FROM [task_master_tbl] WHERE ([assoc_project] = @assoc_project)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="assoc_project" SessionField="project" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="gdvTasks" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="task_id" DataSourceID="sqlTasks">
                                    <Columns>
                                        <asp:BoundField DataField="task_id" HeaderText="task_id" ReadOnly="True" SortExpression="task_id" />
                                        <asp:BoundField DataField="task_name" HeaderText="task_name" SortExpression="task_name" />
                                        <asp:BoundField DataField="task_description" HeaderText="task_description" SortExpression="task_description" />
                                        <asp:BoundField DataField="in_charge" HeaderText="in_charge" SortExpression="in_charge" />
                                        <asp:BoundField DataField="starting_date" HeaderText="starting_date" SortExpression="starting_date" />
                                        <asp:BoundField DataField="ending_date" HeaderText="ending_date" SortExpression="ending_date" />
                                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="row" id="addOrEditTasks" runat="server">
                            <div class="col">

                                <div class="row">
                                    <div class="mb-3">
                                        <asp:Label ID="lblTaskTitle" runat="server" Text="Task Name" AssociatedControlID="tbxTaskTitle"></asp:Label>
                                        <asp:TextBox CssClass="form-control" ID="tbxTaskTitle" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="mb-3">
                                        <asp:Label ID="lblTaskDesc" runat="server" Text="Task Description" AssociatedControlID="tbxTaskDesc"></asp:Label>
                                        <asp:TextBox ID="tbxTaskDesc" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="mb-3">
                                        <asp:Label ID="lblInCharge" runat="server" Text="In-charge" AssociatedControlID="tbxInCharge"></asp:Label>
                                        <asp:TextBox ID="tbxInCharge" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblTStartDate" runat="server" Text="Start Date" AssociatedControlID="tbxTStartDate"></asp:Label>
                                        <asp:TextBox ID="tbxTStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblTEndDate" runat="server" Text="End Date" AssociatedControlID="tbxTEndDate"></asp:Label>
                                        <asp:TextBox ID="tbxTEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblTStatus" runat="server" Text="Status" AssociatedControlID="ddlTStatus"></asp:Label>
                                        <asp:DropDownList ID="ddlTStatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Ongoing" Value="Ongoing" />
                                            <asp:ListItem Text="Completed" Value="Completed" />
                                            <asp:ListItem Text="Cancelled" Value="Cancelled" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 mb-3">
                                        <asp:Button CssClass="btn btn-primary" ID="btnAddTaskModal" runat="server" Text="Add Task" OnClick="btnAddTaskModal_Click" />
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <asp:Button CssClass="btn btn-secondary" ID="btnUpdateTaskModal" runat="server" Text="Update Task" OnClick="btnUpdateTaskModal_Click" />
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <asp:Button CssClass="btn btn-danger" ID="btnDeleteTaskModal" runat="server" Text="Delete Task" OnClick="btnDeleteTaskModal_Click" />
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <asp:Button CssClass="btn btn-light" ID="btnExitModal" runat="server" Text="Exit" OnClick="btnExitModal_Click" />
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
