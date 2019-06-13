﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace FrbaCrucero
{
    public partial class CabinasDisponibles : Form
    {
        String viaje_id;
        String crucero_id;
        String fecha_salida;
        String fecha_llegada;
        String rolSeleccionado;
        public CabinasDisponibles(String viaje_id, String fecha_salida, String fecha_llegada, String crucero_id,String rolSeleccionado)
        {
            InitializeComponent();
            this.StartPosition = FormStartPosition.CenterScreen;
            this.rolSeleccionado = rolSeleccionado;
            textBox1.Text = cabinas_Libres(viaje_id, crucero_id).ToString();
            this.agregarCabinasLibres(viaje_id, crucero_id);
            this.viaje_id = viaje_id;
            this.crucero_id = crucero_id;
            this.fecha_salida = fecha_salida;
            this.fecha_llegada = fecha_llegada;
        }
        private int cabinas_Libres(String viaje_id, String crucero_id)
        {
            int cabinasLibres = 0;
            string query1 = "select count(*) from ZAFFA_TEAM.Pasaje where VIAJE_ID = " + viaje_id;
            SqlDataReader reader1 = ClaseConexion.ResolverConsulta(query1);
            reader1.Read();
            cabinasLibres = reader1.GetInt32(0);
            reader1.Close();
            query1 = "select count(*) from ZAFFA_TEAM.Reserva where VIAJE_ID = " + viaje_id;
            reader1 = ClaseConexion.ResolverConsulta(query1);
            reader1.Read();
            cabinasLibres += reader1.GetInt32(0);
            reader1.Close();
            query1 = "select CANTIDAD_CABINAS from ZAFFA_TEAM.Crucero where CRUCERO_ID = '" + crucero_id + "'";
            reader1 = ClaseConexion.ResolverConsulta(query1);
            reader1.Read();
            cabinasLibres = reader1.GetInt32(0) - cabinasLibres;
            reader1.Close();
            return cabinasLibres;
        }

        private void agregarCabinasLibres(String viaje_id, String crucero_id)
        {
            string query = "select CABINA_NRO,CABINA_PISO,b.CABINA_TIPO_DESCRIPCION from ZAFFA_TEAM.Cabina a JOIN ZAFFA_TEAM.Tipo_Cabina b on a.CABINA_TIPO_ID = b.CABINA_TIPO_ID where CRUCERO_ID = '"+ crucero_id +"' EXCEPT select a.CABINA_NRO,a.CABINA_PISO,d.CABINA_TIPO_DESCRIPCION from ZAFFA_TEAM.Pasaje a join ZAFFA_TEAM.Cabina c on a.CRUCERO_ID = c.CRUCERO_ID and a.CABINA_NRO = c.CABINA_NRO and a.CABINA_PISO = c.CABINA_PISO join ZAFFA_TEAM.Tipo_Cabina d on c.CABINA_TIPO_ID = d.CABINA_TIPO_ID where a.CRUCERO_ID = '"+ crucero_id +"' and a.VIAJE_ID= "+ viaje_id;
            SqlDataReader reader = ClaseConexion.ResolverConsulta(query);
            while (reader.Read())
            {
                dataGridView1.Rows.Add(reader.GetDecimal(0).ToString(), reader.GetDecimal(1).ToString(), reader.GetString(2));
            }
            reader.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SacarPasaje pas = new SacarPasaje(rolSeleccionado);
            pas.Visible = true;
            this.Dispose(false);
            this.Close();
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                dataGridView1.CurrentRow.Selected = true;
                String cabina_nro = dataGridView1.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
                String cabina_piso = dataGridView1.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
                String tipo_cabina = dataGridView1.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();

                RegistroViajeCliente reg = new RegistroViajeCliente(viaje_id, fecha_salida, fecha_llegada,
                                                            crucero_id, cabina_nro, cabina_piso, tipo_cabina,rolSeleccionado);
                reg.Visible = true;
                this.Dispose(false);
                this.Close();
            }
        }
    }
}
