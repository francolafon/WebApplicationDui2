<%@ Page Title="Profesores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profesores.aspx.cs" Inherits="WebApplicationDui2.Profesores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <style>
            .icon-container {
                display: inline-block;
                border-radius: 50%;
                background-color: #ffffff; /* Color del círculo */
                width: 200px; /* Ancho del círculo */
                height: 200px; /* Altura del círculo */
                box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Sombra 3D */
                text-align: center;
                line-height: 200px; /* Alineación vertical */
                float: left; /* Alinea el icono a la izquierda */
            }

            .title-container {
                margin-left: 240px; /* Aumenta el valor del margen izquierdo para mover el título hacia la derecha */
                /*line-height: 240px;*/ /* Alineación vertical para que esté centrado verticalmente */
            }

            .icon-image {
                max-width: 80%; /* Ajusta el tamaño de la imagen según tu preferencia */
            }
        </style>
        <main aria-labelledby="title" >
            <div class="icon-container">
                <img src="Images\profe.png" alt="Icono" class="icon-image" />
            </div>
            <div class="title-container">
                <h1 id="titulo1">Profesores</h1>
            </div>
     <br />
        <div class="title-container">
            <div class="container mt-4">
                <div id="divGrilla" runat="server" class="row ">
                    <div class="col-lg-10 form-group form-group-inline ">
                        <asp:GridView ID="gvProf" DataKeyNames="id" AllowPaging="false" runat="server"
                            HeaderStyle-BackColor="#c0c0c0"
                            Font-Bold="true"
                            AutoGenerateColumns="false" AllowSorting="true" Style="font-size: 0.9em;"
                            CssClass="table table-bordered table-hover text-center" ShowFooter="false" ShowHeaderWhenEmpty="false"
                            OnRowCommand="gvProf_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="ACCIONES">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-outline-secondary" Width="75px"
                                            CommandName="Editando" CommandArgument='<%#Eval("id") %>'
                                            ToolTip="Editar Fila" Text="Editar" />
                                    </ItemTemplate>
                                     <ItemStyle Width="120px" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true"/>
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" ReadOnly="true" />
                                <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" ReadOnly="true" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
               <div class="container">
    <div id="divControl" runat="server" visible="false">
        <div class="row">
            <div class="col-lg-2">
                <asp:Label ID="lblId" runat="server" Text="Id : "></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtId" Font-Bold="true" runat="server" Enabled="false"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-2">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre : "></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtNombre" Font-Bold="true" runat="server"></asp:TextBox>
            </div>
          </div>
        <br />
         <div class="row">
            <div class="col-lg-2">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido : "></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtApellido" Font-Bold="true" runat="server" ></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-outline-secondary" 
                     OnClick="btnGuardar_Click"
                    ToolTip="Guardar" Text="Guardar" />
                <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-outline-secondary" 
                    CommandName="Cancelando" OnClick="btnCancelar_Click"
                    ToolTip="Volver" Text="Cancelar" />
            </div>
        </div>
    </div>
</div>
                <!-- Resto de tu contenido -->
            </div>
        </div>
    </main>
</asp:Content>
