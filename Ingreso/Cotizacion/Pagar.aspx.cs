using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;


namespace Ingreso
{
    public partial class Pagar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ImagenCaptcha();
            }

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

        private void ImagenCaptcha()
        {
            string codigo = GenerateRandomCode();

            // Create a CAPTCHA image using the text stored in the Session object.
            RandomImage ci = new RandomImage(codigo, 300, 75);
            // Change the response headers to output a JPEG image.
            //Response.Clear();
            //Response.ContentType = "image/jpeg";
            // Write the image to the response stream in JPEG format.
            string imagePath = MapPath("~/Images/captcha.Bmp");
            if (File.Exists(imagePath))
                File.Delete(imagePath);

            ci.Image.Save(imagePath, ImageFormat.Bmp);
            // Dispose of the CAPTCHA image object.
            ci.Dispose();

            //  this.Image1.ImageUrl = "~/Account/CImage.ashx?codigo=" + codigo;
            this.Image1.ImageUrl = "~/Images/captcha.Bmp";
            this.Image1.Width = 225;
            this.Image1.Height = 75;
            this.Image1.DataBind();

            this.HiddenField1.Value = codigo;
        }

        public string GenerateRandomCode()
        {
            Random r = new Random();
            string s = "";
            for (int j = 0; j < 5; j++)
            {
                int i = r.Next(3);
                int ch;
                switch (i)
                {
                    case 1:
                        ch = r.Next(0, 9);
                        s = s + ch.ToString();
                        break;
                    case 2:
                        ch = r.Next(65, 90);
                        s = s + Convert.ToChar(ch).ToString();
                        break;
                    case 3:
                        ch = r.Next(97, 122);
                        s = s + Convert.ToChar(ch).ToString();
                        break;
                    default:
                        ch = r.Next(97, 122);
                        s = s + Convert.ToChar(ch).ToString();
                        break;
                }
                r.NextDouble();
                r.Next(100, 1999);
            }
            return s;
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ImagenCaptcha();
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            string CodPed = this.HiddenField2.Value;
            string Email = this.HiddenField3.Value;
            string Nit = this.HiddenField4.Value;
            string Nom = this.HiddenField5.Value;
            string Apel = this.HiddenField6.Value;
            string Direc = this.HiddenField7.Value;
            string Nutj = this.HiddenField8.Value;
            string Codtj = this.HiddenField9.Value;
            string Fechv = this.HiddenField10.Value;
            string Mon = this.HiddenField11.Value;
            string Totalp = this.HiddenField12.Value;

            AcesoDatos a = new AcesoDatos();
            if (CodPed == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Codigo de Pedido";
                return;
            }

            if (Email == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Email";
                return;
            }

            if (Nit== "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Nit";
                return;
            }

            if (Nom == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Nombre";
                return;
            }

            if (Apel == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Apellido";
                return;
            }
            if (Direc == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Dirección";
                return;
            }
            if (Nutj == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Número de Tarjeta";
                return;
            }
            if (Codtj == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Codigo de Tarjeta";
                return;
            }
            if (Fechv == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Fecha de Vencimiento";
                return;
            }
            if (Mon == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio de Moneda";
                return;
            }
            if (Totalp == "")
            {
                this.Msg.Text = "Ha dejado el campo vacio el Total";
                return;
            }

            if ()
            {

            }
            else
            {

            }



        }
    }
}