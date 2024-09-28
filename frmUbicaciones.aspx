﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUbicaciones.aspx.cs" Inherits="CrudUbicaciones_XGVC.frmUbicaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyDqTDKfWQPS67DYvZbZxbIQDtAPtS4kBiM'></script>
    <script src="js/locationpicker.jquery.js"></script>
    <title>Control de ubicaciones</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Ubicacion</label>
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:TextBox ID="txtUbicacion" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div id="ModalMapPreview" style="width: 100%; height: 300px;"></div>
                    </div>
                    <!-- Latitud y longitud-->
                    <div class="form-group">
                        <label for="ExampleInputPassword1">Lat.:</label>
                        <asp:TextBox ID="txtLat" Text="27.365938954017043" CssClass="form-control" runat="server"></asp:TextBox>
                        <label for="ExampleInputPassword1">Long.:</label>
                        <asp:TextBox ID="txtlong" Text="-109.93136356074504" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <!-- Controles de altaas, bajas y cambios -->
                    <div claas="form-group">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false" />
                         <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" Enabled="false" />
                         <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" UseSubmitBehavior="false"  Enabled="false" />
                         <asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false" />

                    </div>
                    
                </div>
                <div class="col-md-8">
                    <br />
                    <h1>Ubicaciones</h1>

               </div>

            </div>
        </div>
    </form>
    <script>
        $('#ModalMapPreview').locationpicker({
            radius: 0,
            locacion: {
                latitude: $('#<%=txtLat.ClientID%>').val(),
                longitude: $('#<%=txtlong.ClientID%>').val()
            },
            inputBinding: {
                latitudeInput: $('#<%=txtLat.ClientID%>'),
                longitudeInput: $('#<%=txtlong.ClientID%>'),
                locationNameInput: $('#<%=txtUbicacion.ClientID%>')
            },
            enableAutocomplete: true
        });
    </script>
</body>
</html>
