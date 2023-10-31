<%@ Page Title="Acerca de Nosotros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplicationDui2.About" %>

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
            <img src="Images\about us.png" alt="Icono" class="icon-image" />
        </div>
        <div class="title-container">
            <h1 id="titulo1">Acerca de Nosotros</h1>
        </div>
        <br />
        <h5 class="title-container">Página creada por Franco N. Lafon </h5>
        <br />
        <p class="title-container">Página piloto a modo de ilustración para el proyecto final de la Materia Programación III de la carrera Desarrollo de Software.</p>
        <p class="title-container">Para este proyecto se usó Identity de Microsoft en versión gratuita para la autenticación de usuarios con base de datos en MySQL.</p>
        <br />
        <br />
        <br />
    <br />
    </main>
</asp:Content>
