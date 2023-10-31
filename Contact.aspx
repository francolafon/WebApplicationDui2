<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplicationDui2.Contact" %>

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
    <main aria-labelledby="title">
        <div class="icon-container">
            <img src="Images\contac.png" alt="Icono" class="icon-image" />
        </div>
        <div class="title-container">
            <h1 id="titulo1">Contacto</h1>
        </div>
        <br />
        <address class="title-container">
            Para mas información puede llamar al 0800 111 2222.<br />
            También puede visitarnos en Calle Santa Rosa N°4000, barrio Centro, Cordoba Capital, Argentina.<br />
        </address>
        <address class="title-container">
            <strong>Soporte:</strong> <a href="mailto:Support@example.com" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">francolafon@gmail.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Support@example.com" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">francolafon@gmail.com</a><br />
        </address>
        <br />
    </main>
    <h4 id="titulo2">Dejenos sus datos y nosotros nos comunicamos con usted:</h4>
    <hr />
    <div class="form-group">
        <label for="FirstName">Nombre:</label>
        <asp:TextBox runat="server" ID="FirstName" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="LastName">Apellido:</label>
        <asp:TextBox runat="server" ID="LastName" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="Email">Correo:</label>
        <asp:TextBox runat="server" ID="Email" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="Query">Consulta:</label>
            <asp:TextBox runat="server" ID="Query" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="PhoneNumber">Número de teléfono:</label>
            <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <asp:Button runat="server" ID="btn_enviar" Text="Enviar" CssClass="btn btn-outline-secondary" OnClick="btn_enviar_Click" />
</asp:Content>
