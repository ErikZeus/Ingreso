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

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cotizacion/Pagar.aspx");
        }
    }
}