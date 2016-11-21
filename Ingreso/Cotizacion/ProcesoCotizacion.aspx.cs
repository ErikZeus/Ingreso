using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ingreso
{
    public partial class ProcesoCotizacion : System.Web.UI.Page
    {
        AcesoDatos Ac = new AcesoDatos();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> locations = new List<string>(); // however this initialized 
            locations.Add("Home");
            locations.Add("Cotizador");

            StringBuilder sb = new StringBuilder();

            sb.Append("<ul id='coolMenu'  >");

            for (int i = 0; i < locations.Count; i++)
            {
                if (locations[i].ToString() == "Cotizador")
                {
                    sb.Append("<li id=\"tab" + i.ToString() + "\" ><a href=\"" + locations[i] + "\">" + locations[i].ToString() + "</a><ul  ><li><a href='#'>Hellenico</a></li><li><a href='#'>Genere</a></li><li><a href='#'>Indulgentia</a></li></ul></li>");
                }
                else {
                    sb.Append("<li id=\"tab" + i.ToString() + "\" ><a href=\"" + locations[i] + "\">" + locations[i].ToString() + "</a></li>");
                }
            }
           
            sb.Append("</ul>");

            coolMenu.Text = sb.ToString();

            if (!IsPostBack)
            {
                CargarCombo();
            }


        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string PrimaA = this.HiddenField1.Value;
            string PrimaM = this.HiddenField2.Value;
            string Codigo = this.HiddenField3.Value;
            string Nom = this.HiddenField4.Value;
            string Telefono = this.HiddenField5.Value;
            string Direccion = this.HiddenField6.Value;
            string Email = this.HiddenField7.Value;

            AcesoDatos ac = new AcesoDatos();

            if (Codigo == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Codigo";
                return;
            }

            if (Nom == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de nombre";
                return;
            }

            if (Telefono == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Télefono";
                return;
            }

            if (Direccion == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Direccion";
                return;
            }

            if (Email == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de E-mail";
                return;
            }
            else
            {

                ac.Ejecutar("uptade into clientes(nombre,email,direccion,telefono) values('" + Nom + "','" + Email + "','" + Direccion + "','" + Telefono + "' )");
             
                this.HiddenField1.Value = "";
                this.HiddenField2.Value = "";
                this.HiddenField3.Value = "";
                this.HiddenField4.Value = "";
                this.HiddenField5.Value = "";
                this.HiddenField6.Value = "";
                this.HiddenField7.Value = "";



                Response.Redirect("~/Cotizacion/Pagar.aspx");

            }

            
        }

        private void CargarCombo()
        {

            this.ASPxComboBox1.DataSource = Ac.Regresaunatabla("Select indice, Planes from Planes");
            this.ASPxComboBox1.ValueField = "indice";
            this.ASPxComboBox1.TextField = "Planes";
            this.ASPxComboBox1.DataBind();

        }

    }
}