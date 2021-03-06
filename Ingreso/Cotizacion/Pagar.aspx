﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagar.aspx.cs" Inherits="Ingreso.Pagar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="../js/scripts.js"></script>
    <link href="../css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../css/960.css" rel="stylesheet" type="text/css" />
    <link href="../css/coolMenu.css" rel="stylesheet" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="../css/S.css" type="text/css" media="all" />
    <script type="text/javascript" src="../js/modernizr-1.6.min.js"></script>

    <style>
        .no-fouc {
            display: none;
        }

        body {
            font-family: 'Open Sans', 'Roboto', 'Arial Narrow','serif';
        }

            body a {
                font-family: 'Open Sans', 'Roboto', 'Arial Narrow','serif';
                font-size: 18px;
            }

        .tp-caption.boxshadow2, .boxshadow2 {
            font-size: 28px;
            line-height: 66px;
            color: #0273bc;
            text-decoration: none;
            padding: 20px 20px 20px 20px;
            width: 100%;
            display: block;
            text-align: center;
            background-color: rgba(255,255,255,0.8);
            border-width: 0px;
            border-color: rgb(34,34,34);
            border-style: none;
        }


        #rev_slider_22_1_wrapper .tp-loader.spinner4 div {
            background-color: #fff !important;
        }

        input[type=text] {
            padding: 5px;
            border: 2px solid #ccc;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

            input[type=text]:focus {
                border-color: #333;
            }

        input[type=submit] {
            padding: 5px 15px;
            background: #004BCD;
            color: white;
            border: 0 none;
            cursor: pointer;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

            input[type=submit]:hover {
                background-color: #1E1E1E;
                color: white; /* SET COLOR IN BLACK */
            }
        .auto-style1 {
            width: 210px;
            height: 98px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="marine-content-wrapper">


            <!-- Header -->
            <header id="header" class="style1 sticky-header">
            </header>
        </div>
        <!-- /Main Header -->


        <!-- Lower Header -->
        <div id="lower-header">

            <div class="container">

                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">

                        <div class="lower-logo">
                            &nbsp;<a href="#" title="Seguros Unity" rel="home"><img class="auto-style1" src="../Images/TarjetasdeCredito.png" alt="logoUnity"></a></div>

                        <!-- Main Navigation -->
                        <div id="mega-menu-wrap-primary" class="mega-menu-wrap">
                            <asp:Literal ID="coolMenu" runat="server" />
                        </div>
                        <!-- /Main Navigation -->

                        <!-- Search Box -->
                        <div id="search-box" class="align-right">
                        </div>
                        <!-- /Search Box -->
                    </div>

                </div>

            </div>

        </div>
        <!-- /Lower Header -->



        <!-- /Header -->


        <!-- Marine Content Inner -->



        <div id="nos">
            <div>
                <div class="wpb_wrapper">
                    <div style="background-image: url(http://localhost:49266/Images/BackGround.jpg); background-size: cover;">

                        <p style="text-align: center;"></p>
                        <div class="col-lg-4 col-md-4 col-sm-12"></div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <h2 style="text-align: center; " class="ui-state-error-text" >Ingresa la información para Comprar tu Seguro</h2>
                            <p style="text-align: center;">
                            </p>
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Codigo de Pedido*" class="form-control" id="CodigoP" onchange="LlenarValorA();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Email*" class="form-control" id="EmailP" onchange="LlenarValorB();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Nit*" class="form-control" id="NitP" onchange="LlenarValorC();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Nombre*" class="form-control" id="NomP"  onchange="LlenarValorD();"/>

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Apellido*" class="form-control" id="ApeP" onchange="LlenarValorE();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Dirreciòn*" class="form-control" id="DirecP" onchange="LlenarValorF();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Nùmero de tarjeta de credito*" class="form-control" id="NuTarP" onchange="LlenarValorG();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Codigo de la tarjeta de credito*" class="form-control" id="CodTarP" onchange="LlenarValorH();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="date" name="name" value="Fecha de Vencimiento" class="form-control" id="FecVP" onchange="LlenarValorI();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Moneda*" class="form-control" id="MonP"  onchange="LlenarValorJ();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="email" placeholder="Total a Pagar*" class="form-control" id="TPP" onchange="LlenarValorK();" />

                            </div>
                            <br />
                            <div class="iconic-input">
                                <input type="text" name="name" placeholder="Captcha*" class="form-control" id="TxTCaptcha" />

                            </div>
                            <br />
                            <asp:Image ID="Image1" runat="server" />
                            <br />
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Re Captcha">
                            </dx:ASPxButton>
                            <br />
                            <dx:ASPxButton ID="ASPxButton2" runat="server" Height="30px" OnClick="ASPxButton2_Click" Text="Pagar" Theme="iOS" Width="159px">
                            </dx:ASPxButton>
                            <asp:Label ID="Msg" runat="server" ForeColor="#CC3300" Text="."></asp:Label>
                            <br />
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                            <asp:HiddenField ID="HiddenField3" runat="server" />
                            <asp:HiddenField ID="HiddenField4" runat="server" />
                            <asp:HiddenField ID="HiddenField5" runat="server" />
                            <asp:HiddenField ID="HiddenField6" runat="server" />
                            <asp:HiddenField ID="HiddenField7" runat="server" />
                            <asp:HiddenField ID="HiddenField8" runat="server" />
                            <asp:HiddenField ID="HiddenField9" runat="server" />
                            <asp:HiddenField ID="HiddenField10" runat="server" />
                            <asp:HiddenField ID="HiddenField11" runat="server" />
                            <asp:HiddenField ID="HiddenField12" runat="server" />
                            <asp:HiddenField ID="HiddenField13" runat="server" />
                            <br />
                            &nbsp;<div id="msg"></div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <br />
                        </div>
                        <br />
                        <div class="clearfix"></div>
                        <br />
                    </div>
                </div>
            </div>
        </div>







        <!-- Footer -->
        <footer id="footer" style="background-color: #1E1E1E; color: white;">


            <!-- Main Footer -->
            <div id="main-footer" class="smallest-padding">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div id="text-2" class="widget widget_text">
                                <div class="textwidget">
                                    <img src="../Images/Unity%20regional%20-%20%20logo%20en%20blanco.png" alt="logo" style="width:101px; height:53px;" />
                                    <p style="text-align: justify;">Seguros Ducruet. </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3">
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div id="text-16" class="widget widget_text">
                                <h4>Delegación Bilbao</h4>
                                <div class="textwidget">
                                    <ul class="iconic-list">

                                        <li>
                                            <i class="icons icon-location-7"></i>
                                            Ducruet Panama<br />
                                            C/ Rodríguez Arias, 15, 7ª planta
                                            <br />
                                            48008 Bilbao - Bizkaia
                                        </li>

                                        <li>
                                            <i class="icons icon-mobile-6"></i>
                                            Teléfono: (+34) 944 15 96 88 
                                            <br />
                                            Fax: (+34) 944 15 71 76
                                        </li>

                                        <li>
                                            <i class="icons icon-mail-7"></i>
                                            contacto@ducruet.es
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div id="text-5" class="widget widget_text">
                                <h4>Delegación Vitoria</h4>
                                <div class="textwidget">
                                    <ul class="iconic-list">

                                        <li>
                                            <i class="icons icon-location-7"></i>
                                            Seguros Ducruet<br />
                                            C/ Vicente Goikoetxea, 6, 1ª - Oficina 4F
                                            <br />
                                            01008 Vitoria-Gasteiz - Araba
                                        </li>

                                        <li>
                                            <i class="icons icon-mobile-6"></i>
                                            Teléfono: (+34) 945 20 27 97 
                                            <br />
                                            Fax: (+34) 944 15 71 76
                                        </li>

                                        <li>
                                            <i class="icons icon-mail-7"></i>
                                            contacto@ducruet.es
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- /Main Footer -->

            <!-- Lower Footer -->
            <div id="lower-footer">
                <div class="container">
                    <span class="copyright">© 2016 Tu seguro tu mejor amigo.</span>
                </div>
            </div>
            <!-- /Lower Footer -->

        </footer>
        <!-- /Footer -->



        <!-- /Marine Conten Wrapper -->

        <div class="media_for_js"></div>
        <div id="added_items"></div>

    </form>
</body>
      <script type="text/javascript">
        function LlenarValorA() {
            var ver = document.getElementById("CodigoP").value;
 
            $("#HiddenField2").val(ver);
        }
        function LlenarValorB() {
            var ver = document.getElementById("EmailP").value;
   
            $("#HiddenField3").val(ver);
        }
        function LlenarValorC() {
            var ver = document.getElementById("NitP").value;
  
            $("#HiddenField4").val(ver);
        }
        function LlenarValorD() {
            var ver = document.getElementById("NomP").value;
      
            $("#HiddenField5").val(ver);
        }
        function LlenarValorE() {
            var ver = document.getElementById("ApeP").value;
      
            $("#HiddenField6").val(ver);
        }
        function LlenarValorF() {
            var ver = document.getElementById("DirecP").value;
    
            $("#HiddenField7").val(ver);
        }
        function LlenarValorG() {
            var ver = document.getElementById("NuTarP").value;
    
            $("#HiddenField8").val(ver);
        }
        function LlenarValorH() {
            var ver = document.getElementById("CodTarP").value;

            $("#HiddenField9").val(ver);
        }
        function LlenarValorI() {
            var ver = document.getElementById("FecVP").value;

            $("#HiddenField10").val(ver);
        }
        function LlenarValorJ() {
            var ver = document.getElementById("MonP").value;

            $("#HiddenField11").val(ver);
        }
        function LlenarValorK() {
            var ver = document.getElementById("TPP").value;

            $("#HiddenField12").val(ver);
        }
    </script>
</html>
