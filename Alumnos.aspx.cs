using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDui2
{
    public partial class Alumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarControles();
            }
        }

        protected void CargarControles()
        {
            string pSQL = "SELECT * FROM terciario.alumnos;";

            ConexionBd mconex = new ConexionBd();
            string cadConex = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            if (cadConex.Equals(""))
            {
                return;
            }

            mconex.cadenaConexion = cadConex;

            DataTable dt = mconex.ejecutarSelect(pSQL) as DataTable;

            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0] != DBNull.Value)
            {
                ViewState.Add("tabla", dt);
                ViewState.Add("NROFILA", 0);

                actualizarControles(0);
            }
            else
                ViewState["NROFILA"] = null;

        }

        protected void actualizarControles(int index = 0)
        {
            DataTable dt = (DataTable)ViewState["tabla"];

            int i = 0;
            int ini = (int)ViewState["NROFILA"];

            switch (index)
            {
                case 0:
                    i = 0;
                    break;

                case -1:
                    if (ini > 0) i = ini - 1;
                    break;

                case 1:
                    if (ini < dt.Rows.Count - 1) i = ini + 1;
                    break;

                default:
                    i = dt.Rows.Count - 1;
                    break;
            }

            txtDNI.Text = dt.Rows[i]["DNI"].ToString();
            txtNombre.Text = dt.Rows[i]["NOMBRE"].ToString();
            //ddlEstado.SelectedValue = dt.Rows[i]["ESTADO"].ToString();

            ViewState["NROFILA"] = i;
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            actualizarControles(-1);
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            actualizarControles(0);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            actualizarControles(+1);
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            actualizarControles(+500000);
        }

    }
}
