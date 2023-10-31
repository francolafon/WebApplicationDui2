using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDui2
{
    public partial class Profesores : Page
    {
        int idSel;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargarGrilla();
            }
        }
        protected void cargarGrilla()
        {
            string pSQL = "SELECT * FROM terciario.profesores;";

            ConexionBd mconex = new WebApplicationDui2.ConexionBd();
            string cadConex = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            if (cadConex.Equals(""))
            {
                return;
            }

            mconex.cadenaConexion = cadConex;

            DataTable dt = mconex.ejecutarSelect(pSQL) as DataTable;

            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0] != DBNull.Value)
            {
                ViewState.Add("tablaTot", dt);
                gvProf.DataSource = dt;
                gvProf.DataBind();
            }

        }

        //protected void EditarProfesor()
        //{
        //    idSel = VariablesGlobales.IdProfesor;
        //    // Asegúrate de que idSel tenga el valor correcto antes de usarlo en la consulta SQL
        //    if (idSel != 0)
        //    {
        //        string pSQL = "UPDATE terciario.profesores SET Apellido ='" + txtApellido.Text + "', Nombre='" + txtNombre.Text + "' WHERE id=" + idSel + ";";

        //        ConexionBd mconex = new WebApplicationDui2.ConexionBd();
        //        string cadConex = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        //        if (cadConex.Equals(""))
        //        {
        //            return;
        //        }

        //        mconex.cadenaConexion = cadConex;
        //        try
        //        {
        //            mconex.ejecutarSelect(pSQL);
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine(ex.Message);
        //        }
        //    }
        //}
        protected void EditarProfesor()
        {
            idSel = VariablesGlobales.IdProfesor;
            // Asegúrate de que idSel tenga el valor correcto antes de usarlo en la consulta SQL
            if (idSel != 0)
            {
                // Validar que los campos no estén vacíos
                if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtApellido.Text))
                {
                    // Mostrar un mensaje de error o realizar alguna acción apropiada
                    lblMensaje.Text = "El nombre y el apellido son obligatorios.";
                    return;
                }

                // Validar que los campos no contengan números ni caracteres especiales
                string nombre = txtNombre.Text;
                string apellido = txtApellido.Text;
                if (!EsTextoValido(nombre) || !EsTextoValido(apellido))
                {
                    // Mostrar un mensaje de error o realizar alguna acción apropiada
                    lblMensaje.Text = "El nombre y el apellido no deben contener números ni caracteres especiales.";
                    return;
                }

                string pSQL = "UPDATE terciario.profesores SET Apellido ='" + txtApellido.Text + "', Nombre='" + txtNombre.Text + "' WHERE id=" + idSel + ";";

                ConexionBd mconex = new WebApplicationDui2.ConexionBd();
                string cadConex = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                if (cadConex.Equals(""))
                {
                    return;
                }

                mconex.cadenaConexion = cadConex;
                try
                {
                    mconex.ejecutarSelect(pSQL);
                    divGrilla.Visible = true;
                    divControl.Visible = false;
                    cargarGrilla();
                    lblMensaje.Text = "";
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        private bool EsTextoValido(string texto)
        {
            // Expresión regular para permitir solo letras y espacios
            Regex regex = new Regex("^[a-zA-Z\\s]+$");
            return regex.IsMatch(texto);
        }


        protected void gvProf_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            string nId = e.CommandArgument.ToString();
            VariablesGlobales.IdProfesor = Convert.ToInt32(nId);
            if (e.CommandName.Equals("Editando"))
            {
                // recupero de viewstate los datos guardados obtenidos en cargarGrilla 
                DataTable dt = (DataTable)ViewState["tablaTot"];

                // transformo el datatable en dataview
                DataView dv = dt.AsDataView();
                dv.RowFilter = "id = " + nId;

                divGrilla.Visible = false;
                divControl.Visible = true;

                txtId.Text = nId;
                txtNombre.Text = dv[0].Row[1].ToString();
                txtApellido.Text = dv[0].Row[2].ToString();
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            divGrilla.Visible = true;
            divControl.Visible = false;
            lblMensaje.Text = "";
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            EditarProfesor();  
        }

        

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            divGrilla.Visible = true;
            divControl.Visible = false;
            cargarGrilla();
            lblMensaje.Text = "";
        }
    }
}