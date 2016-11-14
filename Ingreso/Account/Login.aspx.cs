using System;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace Ingreso {
    public partial class Login : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack)
            {
                ImagenCaptcha();
            }
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
        protected void btnLogin_Click(object sender, EventArgs e) {
            if(IsValid) {
                IngresoEjecutivo In = new IngresoEjecutivo();
                if (tbUserName.Text == "")
                {
                    this.lblMensaje.Text = "Debe llenar su usurio para ingresar.";
                    return;
                }
                if (tbPassword.Text == "")
                {
                    this.lblMensaje.Text = "Debe llenar su contraseña para ingresar.";
                    return;
                }

                if (this.txtimgcode.Text != this.HiddenField1.Value.ToString()) //this.Session["CaptchaImageText"].ToString())
                {
                    this.lblMsgCaptcha.Text = "Codigo de Imagen no Valido Trate Nuevamente.";
                    ImagenCaptcha();
                    return;

                }



                In.Usuario(this.tbUserName.Text.ToString().Trim());
                In.Contraseña(this.tbPassword.Text.ToString().Trim());

                if (In.Validar())
                {
                    Response.Redirect("~/Cotizacion/Cotizacion.aspx");
                }
                else {
                       this.lblMensaje.Text = "Usuario Invalido Trate Nuevamente";
                }


            }
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
    }
}


public class RandomImage
{
    //Default Constructor
    public RandomImage() { }
    //property
    public string Text
    {
        get { return this.text; }
    }
    public Bitmap Image
    {
        get { return this.image; }
    }
    public int Width
    {
        get { return this.width; }
    }
    public int Height
    {
        get { return this.height; }
    }
    //Private variable
    private string text;
    private int width;
    private int height;
    private Bitmap image;
    private Random random = new Random();
    //Methods declaration
    public RandomImage(string s, int width, int height)
    {
        this.text = s;
        this.SetDimensions(width, height);
        this.GenerateImage(s);
    }
    public void Dispose()
    {
        GC.SuppressFinalize(this);
        this.Dispose(true);
    }
    protected virtual void Dispose(bool disposing)
    {
        if (disposing)
            this.image.Dispose();
    }
    private void SetDimensions(int width, int height)
    {
        if (width <= 0)
            throw new ArgumentOutOfRangeException("width", width,
            "Argument out of range, must be greater than zero.");
        if (height <= 0)
            throw new ArgumentOutOfRangeException("height", height,
            "Argument out of range, must be greater than zero.");
        this.width = width;
        this.height = height;
    }
    private void GenerateImage(string codigo)
    {
        Bitmap bitmap = new Bitmap
        (this.width - 10, this.height, PixelFormat.Format32bppArgb);
        Graphics g = Graphics.FromImage(bitmap);
        g.SmoothingMode = SmoothingMode.AntiAlias;
        Rectangle rect = new Rectangle(0, 0, this.width - 10, this.height);
        HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti,
        Color.LightGray, Color.White);
        g.FillRectangle(hatchBrush, rect);
        SizeF size;
        float fontSize = rect.Height + 1;
        Font font;

        do
        {
            fontSize--;
            font = new Font(FontFamily.GenericSansSerif, fontSize, FontStyle.Bold);
            size = g.MeasureString(this.text, font);
        } while (size.Width > rect.Width);
        StringFormat format = new StringFormat();
        format.Alignment = StringAlignment.Center;
        format.LineAlignment = StringAlignment.Center;
        GraphicsPath path = new GraphicsPath();
        //path.AddString(this.text, font.FontFamily, (int) font.Style,
        // font.Size, rect, format);
        path.AddString(codigo, font.FontFamily, (int)font.Style, 65, rect, format);
        float v = 4F;
        PointF[] points =
        {
  new PointF(this.random.Next(rect.Width) / v, this.random.Next(
  rect.Height) / v),
  new PointF(rect.Width - this.random.Next(rect.Width) / v,
  this.random.Next(rect.Height) / v),
  new PointF(this.random.Next(rect.Width) / v,
  rect.Height - this.random.Next(rect.Height) / v),
  new PointF(rect.Width - this.random.Next(rect.Width) / v,
  rect.Height - this.random.Next(rect.Height) / v)
  };
        Matrix matrix = new Matrix();
        matrix.Translate(0F, 0F);
        path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);
        hatchBrush = new HatchBrush(HatchStyle.Percent10, Color.Black, Color.SkyBlue);
        g.FillPath(hatchBrush, path);
        int m = Math.Max(rect.Width, rect.Height);
        for (int i = 0; i < (int)(rect.Width * rect.Height / 30F); i++)
        {
            int x = this.random.Next(rect.Width);
            int y = this.random.Next(rect.Height);
            int w = this.random.Next(m / 50);
            int h = this.random.Next(m / 50);
            g.FillEllipse(hatchBrush, x, y, w, h);
        }
        font.Dispose();
        hatchBrush.Dispose();
        g.Dispose();
        this.image = bitmap;
    }


    public static string GenerateRandomCode()
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
}









