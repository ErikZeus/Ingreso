<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="MantenimientoMenus.aspx.cs" Inherits="Ingreso.MantenimientoMenus" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="MainContent">

    <style>
        .CSSTableGenerator {
            margin: 0px;
            padding: 0px;
            width: 100%;
            border: 1px solid #ffffff;
            -moz-border-radius-bottomleft: 0px;
            -webkit-border-bottom-left-radius: 0px;
            border-bottom-left-radius: 0px;
            -moz-border-radius-bottomright: 0px;
            -webkit-border-bottom-right-radius: 0px;
            border-bottom-right-radius: 0px;
            -moz-border-radius-topright: 0px;
            -webkit-border-top-right-radius: 0px;
            border-top-right-radius: 0px;
            -moz-border-radius-topleft: 0px;
            -webkit-border-top-left-radius: 0px;
            border-top-left-radius: 0px;
        }

            .CSSTableGenerator table {
                height: 50%;
                margin: 0px;
                padding: 20px;
            }

            .CSSTableGenerator tr:last-child td:last-child {
                -moz-border-radius-bottomright: 0px;
                -webkit-border-bottom-right-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            .CSSTableGenerator table tr:first-child td:first-child {
                -moz-border-radius-topleft: 0px;
                -webkit-border-top-left-radius: 0px;
                border-top-left-radius: 0px;
            }

            .CSSTableGenerator table tr:first-child td:last-child {
                -moz-border-radius-topright: 0px;
                -webkit-border-top-right-radius: 0px;
                border-top-right-radius: 0px;
            }

            .CSSTableGenerator tr:last-child td:first-child {
                -moz-border-radius-bottomleft: 0px;
                -webkit-border-bottom-left-radius: 0px;
                border-bottom-left-radius: 0px;
            }

            .CSSTableGenerator tr:hover td {
                background-color: #2c6fb7;
            }

            .CSSTableGenerator td {
                vertical-align: middle;
                background-color: #80b3e5;
                border: 1px solid #ffffff;
                border-width: 0px 1px 1px 0px;
                text-align: left;
                padding: 7px;
                font-size: 10px;
                font-family: Arial;
                font-weight: normal;
                color: #fffcfc;
                width: 5px;
            }

            .CSSTableGenerator tr:last-child td {
                border-width: 0px 1px 0px 0px;
            }

            .CSSTableGenerator tr td:last-child {
                border-width: 0px 0px 1px 0px;
            }

            .CSSTableGenerator tr:last-child td:last-child {
                border-width: 0px 0px 0px 0px;
            }

            .CSSTableGenerator tr:first-child td {
                background: -o-linear-gradient(bottom, #033970 5%, #0764c1 100%);
                background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #033970), color-stop(1, #0764c1) );
                background: -moz-linear-gradient( center top, #033970 5%, #0764c1 100% );
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#033970", endColorstr="#0764c1");
                background: -o-linear-gradient(top,#033970,0764c1);
                background-color: #033970;
                border: 0px solid #ffffff;
                text-align: center;
                border-width: 0px 0px 1px 1px;
                font-size: 14px;
                font-family: Arial;
                font-weight: bold;
                color: #ffffaa;
            }

            .CSSTableGenerator tr:first-child:hover td {
                background: -o-linear-gradient(bottom, #033970 5%, #0764c1 100%);
                background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #033970), color-stop(1, #0764c1) );
                background: -moz-linear-gradient( center top, #033970 5%, #0764c1 100% );
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#033970", endColorstr="#0764c1");
                background: -o-linear-gradient(top,#033970,0764c1);
                background-color: #033970;
            }

            .CSSTableGenerator tr:first-child td:first-child {
                border-width: 0px 0px 1px 0px;
            }
    </style>

</asp:Content>


<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="Content">




    <%-- Mantenimiento 1- Roles --%>
    <div style='padding: 10px; text-align: left; left: 10%'>
        <table>
            <tr>
                <th class="auto-style5">Usuarios<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                </th>
                <th style="width: 400px"></th>
            </tr>
            <tr>
                <td class="auto-style5">
                    <div class="CSSTableGenerator">
                        <asp:GridView ID="GridView1" runat="server" Width="300px">
                        </asp:GridView>
                    </div>
                </td>
                <td style="width: 400px">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="CSSTableGenerator">
                                <table style="width: 400px;">
                                    <tr>
                                        <td></td>
                                        <td>Asignación de Roles</td>
                                    </tr>
                                    <tr>
                                        <td>Usuario:<br>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cboUsuario" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td>Rol a asignarse:</td>
                                        <td>
                                            <asp:DropDownList ID="cboRol" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" /></td>
                                    </tr>
                                </table>
                            </div>
                            <br>


                            <asp:Label ID="Rols" runat="server" Text="."></asp:Label>

                        </ContentTemplate>
                    </asp:UpdatePanel>


                </td>



            </tr>

        </table>
    </div>
     <div style='padding: 10px; text-align: left; left: 10%'>
        <table>
            <tr>
                <th class="auto-style5">Roles
                </th>
                <th style="width: 400px"></th>
            </tr>
            <tr>
                <td class="auto-style7">
                    <div class="CSSTableGenerator">
                        <asp:GridView ID="GridView4" runat="server" Width="300px">
                        </asp:GridView>
                    </div>
                </td>
                <td class="auto-style6" style="width: 400px">

                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div class="CSSTableGenerator">
                                <table style="width: 400px;">
                                    <tr>
                                        <td></td>
                                        <td>Creación de Roles</td>
                                    </tr>
                                    <tr>
                                        <td>Agregar Rol<br>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ARol" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Rol a asignarse:</td>
                                        <td>
                                            <asp:DropDownList ID="cdRol2" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Agregar" /></td>
                                        <td>
                                            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Borrar" /></td>
                                    </tr>
                                </table>
                            </div>
                            <br>



                            <asp:Label ID="Rol2" runat="server" Text="."></asp:Label>

                        </ContentTemplate>
                    </asp:UpdatePanel>


                </td>



            </tr>

        </table>
    </div>
    <%-- Mantenimiento 2 - Menus --%>
    <div style='padding: 10px; text-align: left;'>
        <table>
            <tr>
                <th class="auto-style4">Menus</th>
                <th></th>
            </tr>
            <tr>
                <td class="auto-style4">
                    <div class="CSSTableGenerator">
                        <asp:GridView ID="GridView2" runat="server" Width="300px">
                        </asp:GridView>
                    </div>
                </td>
                <td>
                    <div class="CSSTableGenerator">
                        <table style="width: 400px;">
                            <tr>
                                <td></td>
                                <td>Agregar Menu</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Agregar Menú:</td>
                                <td>
                                    <asp:TextBox ID="NomM" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Agregar" OnClick="Button2_Click" Height="21px" /></td>
                            </tr>
                            <tr>
                                <td>Borrar Menú:</td>
                                <td>
                                    <asp:DropDownList ID="cbMenu" runat="server">
                                    </asp:DropDownList></td>
                                <td>
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Borrar" /></td>
                            </tr>
                        </table>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Label ID="Menus" runat="server" Text="."></asp:Label>
                    <br>
                </td>
            </tr>
        </table>
    </div>

    <%-- Mantenimiento 3 - Sub Menus --%>
    <div style='padding: 10px; text-align: left;'>
        <table>
            <tr>
                <th class="auto-style4">Sub Menus</th>
                <th></th>
            </tr>
            <tr>
                <td class="auto-style4">
                    <div class="CSSTableGenerator">
                        <asp:GridView ID="GridView3" runat="server" Width="300px">
                        </asp:GridView>
                    </div>
                </td>
                <td>
                    <div class="CSSTableGenerator">
                        &nbsp;<table style="width: 400px;">
                            <tr>
                                <td>&nbsp;</td>
                                <td>Agregar Sub Menú</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Escoger Menú"></asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="cbMenu2" runat="server" Height="20px" Width="150px"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="NomSub" runat="server" Width="144px"></asp:TextBox></td>
                                <td>
                                    <asp:Button ID="Button4" runat="server" Text="Agregar Submenu" OnClick="Button4_Click" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="cbSubMenu" runat="server" Height="16px" Width="140px">
                                    </asp:DropDownList></td>
                                <td>
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Borrar SubMenu" Width="153px" /></td>
                            </tr>
                        </table>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>


                            <table>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>



                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br>
                    <asp:Label ID="SubMenu" runat="server" Text="."></asp:Label>
                    <br>
                </td>
            </tr>
        </table>
    </div>








</asp:Content>
