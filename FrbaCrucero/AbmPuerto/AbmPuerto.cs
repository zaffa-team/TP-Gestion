﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaCrucero
{
    public partial class AbmPuerto : Form
    {
        public AbmPuerto()
        {
            InitializeComponent();
            this.StartPosition = FormStartPosition.CenterScreen;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CrearPuerto crearPuerto = new CrearPuerto();
            crearPuerto.Visible = true;
            this.Dispose(false);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            PuertoListado puertoListado = new PuertoListado();
            puertoListado.Visible = true;
            this.Dispose(false);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            BajaPuerto bajaPuerto = new BajaPuerto();
            bajaPuerto.Visible = true;
            this.Dispose(false);
        }
    }
}
