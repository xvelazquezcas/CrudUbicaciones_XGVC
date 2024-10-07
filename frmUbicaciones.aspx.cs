using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Capas
using BLL;
using DAL;

namespace CrudUbicaciones_XGVC
{
    public partial class frmUbicaciones : System.Web.UI.Page
    {
        ubicaciones_BLL oUbicacionesBLL;
        ubicacionesDAL oUbicacionesDAL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {

                ListarUbicacines();

            }
        }

        public void ListarUbicacines()
        {
            oUbicacionesDAL = new ubicacionesDAL();
            gvUbicaciones.DataSource = oUbicacionesDAL.Listar();
            gvUbicaciones.DataBind();
        }

        //Metodo encargado de recolectar los datos  de 
        public ubicaciones_BLL datosUbicaciones()
        {
            int ID = 0;
            int.TryParse(txtID.Value, out ID);
            oUbicacionesBLL = new ubicaciones_BLL();

            ///Recolectar datos  de la capa de presentacion
            oUbicacionesBLL.ID = ID;
            oUbicacionesBLL.Ubicacion = txtUbicacion.Text;
            oUbicacionesBLL.Latitud = txtLat.Text;
            oUbicacionesBLL.Longitud = txtlong.Text;

            return oUbicacionesBLL;


        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicacionesDAL();
            oUbicacionesDAL.Agregar(datosUbicaciones());
            ListarUbicacines(); //PARA MOSTRARLO EN EL GV
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicacionesDAL();
            //select = 
            int idUbicacion = ObtenerIdUbicacion();
            oUbicacionesDAL.Eliminar(idUbicacion);
            ListarUbicacines();

        }
        private int ObtenerIdUbicacion()
        {
            int id = 0;
            GridViewRow filaSeleccionada = gvUbicaciones.SelectedRow;
            if (filaSeleccionada != null)
            {
                id = Convert.ToInt32(filaSeleccionada.Cells[0].Text);
            }
            return id;
        }

        protected void gvUbicaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaSeleccionada = gvUbicaciones.SelectedRow;

            txtID.Value = filaSeleccionada.Cells[0].Text;
            txtID.Value = filaSeleccionada.Cells[1].Text;
            txtID.Value = filaSeleccionada.Cells[2].Text;
            txtID.Value = filaSeleccionada.Cells[3].Text;

            btnModificar.Enabled = true;
        }

        protected void ModificarRegistro(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicacionesDAL();
            oUbicacionesDAL.Modificar(datosUbicaciones());
            ListarUbicacines();
             
        }
    }
}