using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ingreso
{
    public partial class Cotizacion : System.Web.UI.Page
    {
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string nombre = this.HiddenField1.Value;
            string apellido = this.HiddenField2.Value;
            string direccion = this.HiddenField3.Value;
            string telefono = this.HiddenField4.Value;
            string nacimiento = this.HiddenField5.Value;
            string id = this.HiddenField6.Value;
            string email = this.HiddenField7.Value;

            AcesoDatos ac = new AcesoDatos();

            if (nombre == "")
            {
                this.Msg.Text = "No ha ingresado su nombre";
                return;
            }

            if (apellido == "")
            {
                this.Msg.Text = "No ha ingresado su apellido";
                return;
            }

            if (direccion == "")
            {
                this.Msg.Text = "No ha ingresado su dirección";
                return;
            }

            if (telefono == "")
            {
                this.Msg.Text = "No ha ingresado su télefono";
                return;
            }

            if (nacimiento == "")
            {
                this.Msg.Text = "No ha ingresado su fecha de nacimiento";
                return;
            }

            if (id == "")
            {
                this.Msg.Text = "No ha ingresado su id";
                return;
            }

            if (email == "")
            {
                this.Msg.Text = "No ha ingresado su E-mail";
                return;
            }
            else
            {

                ac.Ejecutar("insert into clientes(nombre,apellido,email,direccion,telefono,nacimiento,id) values('" + nombre + "','" + direccion + "','" + email + "','" + direccion + "','" + telefono + "','" + nacimiento + "','" + id + "')");
                Response.Redirect("ProcesoCotizacion.aspx");
                this.HiddenField1.Value = "";
                this.HiddenField2.Value = "";
                this.HiddenField3.Value = "";
                this.HiddenField4.Value = "";
                this.HiddenField5.Value = "";
                this.HiddenField6.Value = "";
                this.HiddenField7.Value = "";


            }

           

          



        }
    }
}