﻿namespace FrbaCrucero
{
    partial class Login
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.loginYSeguridad = new System.Windows.Forms.GroupBox();
            this.selectorRol = new System.Windows.Forms.ComboBox();
            this.continuar = new System.Windows.Forms.Button();
            this.seleccionarRol = new System.Windows.Forms.Label();
            this.rolBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gD1C2019DataSet1 = new FrbaCrucero.GD1C2019DataSet1();
            this.rolTableAdapter = new FrbaCrucero.GD1C2019DataSet1TableAdapters.RolTableAdapter();
            this.loginYSeguridad.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.rolBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2019DataSet1)).BeginInit();
            this.SuspendLayout();
            // 
            // loginYSeguridad
            // 
            this.loginYSeguridad.Controls.Add(this.selectorRol);
            this.loginYSeguridad.Controls.Add(this.continuar);
            this.loginYSeguridad.Controls.Add(this.seleccionarRol);
            this.loginYSeguridad.Location = new System.Drawing.Point(12, 12);
            this.loginYSeguridad.Name = "loginYSeguridad";
            this.loginYSeguridad.Size = new System.Drawing.Size(357, 225);
            this.loginYSeguridad.TabIndex = 1;
            this.loginYSeguridad.TabStop = false;
            this.loginYSeguridad.Text = "Login y Seguridad";
            this.loginYSeguridad.Enter += new System.EventHandler(this.loginYSeguridad_Enter);
            // 
            // selectorRol
            // 
            this.selectorRol.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.selectorRol.FormattingEnabled = true;
            this.selectorRol.Location = new System.Drawing.Point(92, 98);
            this.selectorRol.Name = "selectorRol";
            this.selectorRol.Size = new System.Drawing.Size(167, 21);
            this.selectorRol.TabIndex = 4;
            this.selectorRol.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // continuar
            // 
            this.continuar.Location = new System.Drawing.Point(254, 182);
            this.continuar.Name = "continuar";
            this.continuar.Size = new System.Drawing.Size(75, 23);
            this.continuar.TabIndex = 2;
            this.continuar.Text = "Continuar";
            this.continuar.UseVisualStyleBackColor = true;
            this.continuar.Click += new System.EventHandler(this.continuar_Click);
            // 
            // seleccionarRol
            // 
            this.seleccionarRol.AutoSize = true;
            this.seleccionarRol.Location = new System.Drawing.Point(41, 68);
            this.seleccionarRol.Name = "seleccionarRol";
            this.seleccionarRol.Size = new System.Drawing.Size(280, 13);
            this.seleccionarRol.TabIndex = 1;
            this.seleccionarRol.Text = "Haga click sobre el nombre del rol que desea seleccionar:";
            this.seleccionarRol.Click += new System.EventHandler(this.seleccionarRol_Click);
            // 
            // rolBindingSource
            // 
            this.rolBindingSource.DataMember = "Rol";
            this.rolBindingSource.DataSource = this.gD1C2019DataSet1;
            // 
            // gD1C2019DataSet1
            // 
            this.gD1C2019DataSet1.DataSetName = "GD1C2019DataSet1";
            this.gD1C2019DataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // rolTableAdapter
            // 
            this.rolTableAdapter.ClearBeforeFill = true;
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(381, 243);
            this.Controls.Add(this.loginYSeguridad);
            this.Name = "Login";
            this.Text = "UTN FRBA";
            this.loginYSeguridad.ResumeLayout(false);
            this.loginYSeguridad.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.rolBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2019DataSet1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox loginYSeguridad;
        private System.Windows.Forms.Label seleccionarRol;
        private System.Windows.Forms.Button continuar;
        private System.Windows.Forms.ComboBox selectorRol;
        private GD1C2019DataSet1 gD1C2019DataSet1;
        private System.Windows.Forms.BindingSource rolBindingSource;
        private GD1C2019DataSet1TableAdapters.RolTableAdapter rolTableAdapter;

    }
}



