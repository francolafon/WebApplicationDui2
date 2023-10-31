<%@ Page Title="Alumnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alumnos.aspx.cs" Inherits="WebApplicationDui2.Alumnos" %>

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
        }

        .icon-image {
            max-width: 80%; /* Ajusta el tamaño de la imagen según tu preferencia */
        }
    </style>
    <main aria-labelledby="title">
        <div class="icon-container">
            <img src="Images\alumno.png" alt="Icono" class="icon-image" />
        </div>
        <div class="title-container">
            <h1 id="titulo1">Alumnos</h1>
        </div>
        <br />
        <div class="title-container">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="div-1 text-center">
                            <asp:Label ID="lblTitulo" Font-Size="25px" ForeColor="White" Text=" Alumnos" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre : "></asp:Label>
                        <asp:TextBox ID="txtNombre" Enabled="false" Font-Bold="true" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Label ID="lblDni" runat="server" Text="DNI : "></asp:Label>
                        <asp:TextBox ID="txtDNI" Enabled="false" Font-Bold="true" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-6 align-middle ">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado : "></asp:Label>&nbsp;
                        <asp:DropDownList ID="ddlEstado" runat="server" AutoPostBack="true" Height="26px" Enabled="false" Width="80px">
                            <asp:ListItem Text="Alta" Value="A" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Baja" Value="B"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-6 align-middle">
                            <asp:Button ID="btnFirst" ToolTip="Primero" CssClass="btn btn-outline-secondary" runat="server" Text="Primero" OnClick="btnFirst_Click" />
                            <asp:Button ID="btnPrev" ToolTip="Anterior" CssClass="btn btn-outline-secondary" runat="server" Text="anterior" OnClick="btnPrev_Click" />
                            <asp:Button ID="btnNext" ToolTip="Próximo" CssClass="btn btn-outline-secondary" runat="server" Text="siguiente" OnClick="btnNext_Click" />
                            <asp:Button ID="btnLast" ToolTip="Último" CssClass="btn btn-outline-secondary" runat="server" Text="Último" OnClick="btnLast_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-lg-3">
                <asp:Label ID="lblConf" ForeColor="Red" Font-Bold="true" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </main>
    <br />
</asp:Content>
