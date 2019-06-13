USE [GD1C2019]
GO
/****** User [gdCruceros2019]  ******/
--CREATE USER [gdCruceros2019] FOR LOGIN [gdCruceros2019] WITH DEFAULT_SCHEMA=[dbo]
--GO
/****** Schema [ZAFFA_TEAM] ******/
--CREATE SCHEMA [ZAFFA_TEAM]
--GO

-------------------------------------------------------------------
------------------- CREACION DE TABLAS ----------------------------
-------------------------------------------------------------------
/****** Table [ZAFFA_TEAM].[Administrativo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Administrativo](
	[USERNAME] [nvarchar](50) NOT NULL,
	[PASSWORD] [nvarchar](32) NULL,
	[INTENTOS_FALLIDOS] [smallint] NULL,
	[NOMBRE_ROL] [nvarchar](50) NULL,
	[ESTADO_ADMIN] [char](1) NULL,
 CONSTRAINT [PK_Administrativo] PRIMARY KEY CLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Auditoria_estado_cruceros] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Auditoria_estado_cruceros](
	[CRUCERO_ID] [nvarchar](50) NOT NULL,
	[FECHA_ACTUAL] [datetime2](3) NOT NULL,
	[ESTADO_ACTUAL] [nvarchar](25) NOT NULL,
	[FECHA_ANTERIOR] [datetime2](3) NOT NULL,
	[ESTADO_ANTERIOR] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Auditoria_estado_cruceros] PRIMARY KEY CLUSTERED 
(
	[FECHA_ACTUAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Cabina] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Cabina](
	[CRUCERO_ID] [nvarchar](50) NOT NULL,
	[CABINA_NRO] [decimal](18, 0) NOT NULL,
	[CABINA_PISO] [decimal](18, 0) NOT NULL,
	[CABINA_TIPO_ID] [int] NULL,
 CONSTRAINT [PK_Cabina] PRIMARY KEY CLUSTERED 
(
	[CRUCERO_ID] ASC,
	[CABINA_NRO] ASC,
	[CABINA_PISO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Cliente] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Cliente](
	[CLI_ID] [int] IDENTITY(1,1) NOT NULL,
	[CLI_NOMBRE] [nvarchar](255) NULL,
	[CLI_APELLIDO] [nvarchar](255) NULL,
	[CLI_DNI] [decimal](18, 0) NULL,
	[CLI_DIRECCION] [nvarchar](255) NULL,
	[CLI_TELEFONO] [int] NULL,
	[CLI_MAIL] [nvarchar](255) NULL,
	[CLI_FECHA_NAC] [datetime2](3) NULL,
	[NOMBRE_ROL] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[CLI_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX Indice_Cliente ON ZAFFA_TEAM.Cliente(CLI_DNI ASC, CLI_NOMBRE ASC);
GO
/****** Table [ZAFFA_TEAM].[Crucero] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Crucero](
	[CRUCERO_ID] [nvarchar](50) NOT NULL,
	[CRUCERO_MODELO] [nvarchar](50) NULL,
	[CRUCERO_MARCA_ID] [int] NULL,
	[ESTADO_CRUCERO] [nvarchar](25) NOT NULL,
	[CANTIDAD_CABINAS] [int] NULL,
	[FECHA_ESTADO] [datetime2](3) NULL,
 CONSTRAINT [PK_Crucero] PRIMARY KEY CLUSTERED 
(
	[CRUCERO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Funcionalidad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Funcionalidad](
	[FUNCIONALIDAD] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION_FUNC] [nvarchar](255) NULL,
 CONSTRAINT [PK_Funcion] PRIMARY KEY CLUSTERED 
(
	[FUNCIONALIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Funcionalidad x Rol] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Funcionalidad x Rol](
	[NOMBRE_ROL] [nvarchar](50) NOT NULL,
	[FUNCIONALIDAD] [int] NOT NULL,
 CONSTRAINT [PK_Funcionalidad x Rol] PRIMARY KEY CLUSTERED 
(
	[NOMBRE_ROL] ASC,
	[FUNCIONALIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Marca] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Marca](
	[CRUCERO_MARCA_ID] [int] IDENTITY(1,1) NOT NULL,
	[CRUCERO_FABRICANTE] [nvarchar](255) NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[CRUCERO_MARCA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Pasaje] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Pasaje](
	[PASAJE_CODIGO] [decimal](18, 0) NOT NULL,
	[PASAJE_PRECIO] [decimal](18, 2) NULL,
	[PASAJE_FECHA_COMPRA] [datetime2](3) NULL,
	[CLI_ID] [int] NULL,
	[VIAJE_ID] [int] NULL,
	[CRUCERO_ID] [nvarchar](50) NULL,
	[CABINA_NRO] [decimal](18, 0) NULL,
	[CABINA_PISO] [decimal](18, 0) NULL,
	[MEDIO_DE_PAGO] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pasaje_1] PRIMARY KEY CLUSTERED 
(
	[PASAJE_CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Puerto]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Puerto](
	[PUERTO_ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_PUERTO] [nvarchar](255) NULL,
	[ESTADO_PUERTO] [char](1) NULL,
 CONSTRAINT [PK_Puerto] PRIMARY KEY CLUSTERED 
(
	[PUERTO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Recorrido_Unico] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Recorrido_Unico](
	[RECORRIDO_CODIGO] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Recorrido_Unico] PRIMARY KEY CLUSTERED 
(
	[RECORRIDO_CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Reserva] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Reserva](
	[RESERVA_CODIGO] [decimal](18, 0) NOT NULL,
	[RESERVA_FECHA] [datetime2](3) NULL,
	[CLI_ID] [int] NULL,
	[VIAJE_ID] [int] NULL,
	[CRUCERO_ID] [nvarchar](50) NULL,
	[CABINA_NRO] [decimal](18, 0) NULL,
	[CABINA_PISO] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[RESERVA_CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Rol] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Rol](
	[NOMBRE_ROL] [nvarchar](50) NOT NULL,
	[ESTADO_ROL] [char](1) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[NOMBRE_ROL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Tipo_Cabina] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Tipo_Cabina](
	[CABINA_TIPO_ID] [int] IDENTITY(1,1) NOT NULL,
	[CABINA_TIPO_DESCRIPCION] [nvarchar](255) NULL,
	[CABINA_TIPO_RECARGO] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tipo_Cabina] PRIMARY KEY CLUSTERED 
(
	[CABINA_TIPO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Tramo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Tramo](
	[RECORRIDO_CODIGO] [decimal](18, 0) NOT NULL,
	[ORDEN_TRAMOS] [int] NOT NULL,
	[PUERTO_DESDE_ID] [int] NULL,
	[PUERTO_HASTA_ID] [int] NULL,
	[RECORRIDO_PRECIO_BASE] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tramo] PRIMARY KEY CLUSTERED 
(
	[RECORRIDO_CODIGO] ASC,
	[ORDEN_TRAMOS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ZAFFA_TEAM].[Viaje] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZAFFA_TEAM].[Viaje](
	[VIAJE_ID] [int] IDENTITY(1,1) NOT NULL,
	[RECORRIDO_CODIGO] [decimal](18, 0) NULL,
	[FECHA_SALIDA] [datetime2](3) NULL,
	[FECHA_LLEGADA] [datetime2](3) NULL,
	[FECHA_LLEGADA_ESTIMADA] [datetime2](3) NULL,
	[CRUCERO_ID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[VIAJE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX Indice_Viaje ON ZAFFA_TEAM.Viaje(RECORRIDO_CODIGO ASC, FECHA_SALIDA ASC, FECHA_LLEGADA ASC, CRUCERO_ID ASC);
GO
ALTER TABLE [ZAFFA_TEAM].[Administrativo]  WITH CHECK ADD  CONSTRAINT [FK_Administrativo_Rol] FOREIGN KEY([NOMBRE_ROL])
REFERENCES [ZAFFA_TEAM].[Rol] ([NOMBRE_ROL])
GO
ALTER TABLE [ZAFFA_TEAM].[Administrativo] CHECK CONSTRAINT [FK_Administrativo_Rol]
GO
ALTER TABLE [ZAFFA_TEAM].[Cabina]  WITH CHECK ADD  CONSTRAINT [FK_Cabina_Tipo_Cabina] FOREIGN KEY([CABINA_TIPO_ID])
REFERENCES [ZAFFA_TEAM].[Tipo_Cabina] ([CABINA_TIPO_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Cabina] CHECK CONSTRAINT [FK_Cabina_Tipo_Cabina]
GO
ALTER TABLE [ZAFFA_TEAM].[Crucero]  WITH CHECK ADD  CONSTRAINT [FK_Crucero_Marca] FOREIGN KEY([CRUCERO_MARCA_ID])
REFERENCES [ZAFFA_TEAM].[Marca] ([CRUCERO_MARCA_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Crucero] CHECK CONSTRAINT [FK_Crucero_Marca]
GO
ALTER TABLE [ZAFFA_TEAM].[Funcionalidad x Rol]  WITH CHECK ADD  CONSTRAINT [FK_Funcionalidad x Rol_Funcion] FOREIGN KEY([FUNCIONALIDAD])
REFERENCES [ZAFFA_TEAM].[Funcionalidad] ([FUNCIONALIDAD])
GO
ALTER TABLE [ZAFFA_TEAM].[Funcionalidad x Rol] CHECK CONSTRAINT [FK_Funcionalidad x Rol_Funcion]
GO
ALTER TABLE [ZAFFA_TEAM].[Funcionalidad x Rol]  WITH CHECK ADD  CONSTRAINT [FK_Funcionalidad x Rol_Rol] FOREIGN KEY([NOMBRE_ROL])
REFERENCES [ZAFFA_TEAM].[Rol] ([NOMBRE_ROL])
GO
ALTER TABLE [ZAFFA_TEAM].[Funcionalidad x Rol] CHECK CONSTRAINT [FK_Funcionalidad x Rol_Rol]
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje]  WITH CHECK ADD  CONSTRAINT [FK_Pasaje_Cabina] FOREIGN KEY([CRUCERO_ID], [CABINA_NRO], [CABINA_PISO])
REFERENCES [ZAFFA_TEAM].[Cabina] ([CRUCERO_ID], [CABINA_NRO], [CABINA_PISO])
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje] CHECK CONSTRAINT [FK_Pasaje_Cabina]
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje]  WITH CHECK ADD  CONSTRAINT [FK_Pasaje_Cliente] FOREIGN KEY([CLI_ID])
REFERENCES [ZAFFA_TEAM].[Cliente] ([CLI_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje] CHECK CONSTRAINT [FK_Pasaje_Cliente]
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje]  WITH CHECK ADD  CONSTRAINT [FK_Pasaje_Crucero] FOREIGN KEY([CRUCERO_ID])
REFERENCES [ZAFFA_TEAM].[Crucero] ([CRUCERO_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje] CHECK CONSTRAINT [FK_Pasaje_Crucero]
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje]  WITH CHECK ADD  CONSTRAINT [FK_Pasaje_Viaje] FOREIGN KEY([VIAJE_ID])
REFERENCES [ZAFFA_TEAM].[Viaje] ([VIAJE_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Pasaje] CHECK CONSTRAINT [FK_Pasaje_Viaje]
GO
ALTER TABLE [ZAFFA_TEAM].[Recorrido_Unico]  WITH CHECK ADD  CONSTRAINT [FK_Recorrido_Unico_Recorrido_Unico] FOREIGN KEY([RECORRIDO_CODIGO])
REFERENCES [ZAFFA_TEAM].[Recorrido_Unico] ([RECORRIDO_CODIGO])
GO
ALTER TABLE [ZAFFA_TEAM].[Recorrido_Unico] CHECK CONSTRAINT [FK_Recorrido_Unico_Recorrido_Unico]
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cabina] FOREIGN KEY([CRUCERO_ID], [CABINA_NRO], [CABINA_PISO])
REFERENCES [ZAFFA_TEAM].[Cabina] ([CRUCERO_ID], [CABINA_NRO], [CABINA_PISO])
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cabina]
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([CLI_ID])
REFERENCES [ZAFFA_TEAM].[Cliente] ([CLI_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Crucero] FOREIGN KEY([CRUCERO_ID])
REFERENCES [ZAFFA_TEAM].[Crucero] ([CRUCERO_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva] CHECK CONSTRAINT [FK_Reserva_Crucero]
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Viaje] FOREIGN KEY([VIAJE_ID])
REFERENCES [ZAFFA_TEAM].[Viaje] ([VIAJE_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Reserva] CHECK CONSTRAINT [FK_Reserva_Viaje]
GO
ALTER TABLE [ZAFFA_TEAM].[Tramo]  WITH CHECK ADD  CONSTRAINT [FK_Tramo_Puerto_Desde_ID] FOREIGN KEY([PUERTO_DESDE_ID])
REFERENCES [ZAFFA_TEAM].[Puerto] ([PUERTO_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Tramo] CHECK CONSTRAINT [FK_Tramo_Puerto_Desde_ID]
GO
ALTER TABLE [ZAFFA_TEAM].[Tramo]  WITH CHECK ADD  CONSTRAINT [FK_Tramo_Puerto_Hasta_ID] FOREIGN KEY([PUERTO_HASTA_ID])
REFERENCES [ZAFFA_TEAM].[Puerto] ([PUERTO_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Tramo] CHECK CONSTRAINT [FK_Tramo_Puerto_Hasta_ID]
GO
ALTER TABLE [ZAFFA_TEAM].[Tramo]  WITH CHECK ADD  CONSTRAINT [FK_Tramo_Recorrido_Unico] FOREIGN KEY([RECORRIDO_CODIGO])
REFERENCES [ZAFFA_TEAM].[Recorrido_Unico] ([RECORRIDO_CODIGO])
GO
ALTER TABLE [ZAFFA_TEAM].[Tramo] CHECK CONSTRAINT [FK_Tramo_Recorrido_Unico]
GO
ALTER TABLE [ZAFFA_TEAM].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Crucero] FOREIGN KEY([CRUCERO_ID])
REFERENCES [ZAFFA_TEAM].[Crucero] ([CRUCERO_ID])
GO
ALTER TABLE [ZAFFA_TEAM].[Viaje] CHECK CONSTRAINT [FK_Viaje_Crucero]
GO
ALTER TABLE [ZAFFA_TEAM].[Crucero]  WITH CHECK ADD CHECK  (([ESTADO_CRUCERO]='BAJA DEFINITIVA' OR [ESTADO_CRUCERO]='REINICIO DE SERVICIO' OR [ESTADO_CRUCERO]='FUERA DE SERVICIO' OR [ESTADO_CRUCERO]='ALTA'))
GO


-------------------------------------------------------------------
------------ CREACION DE OBJETOS DE BASE DE DATOS -----------------
-------------------------------------------------------------------

----------- .: CLIENTE :. ----------------
INSERT INTO ZAFFA_TEAM.Rol (NOMBRE_ROL, ESTADO_ROL)
VALUES ('Cliente', 'A')

INSERT INTO ZAFFA_TEAM.Rol (NOMBRE_ROL, ESTADO_ROL)
VALUES ('Administrador General', 'A')

INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('AbmRol');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('AbmCrucero');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('AbmPuerto');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('AbmRecorrido');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('CompraReservaPasaje');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('GeneracionViaje');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('ListadoEstadistico');
INSERT INTO ZAFFA_TEAM.Funcionalidad (DESCRIPCION_FUNC) VALUES ('PagoReserva');

----------- .: FUNCIONALIDAD X ROL :. ----------------
INSERT ZAFFA_TEAM.[Funcionalidad x Rol] (NOMBRE_ROL,FUNCIONALIDAD)
SELECT 'Administrador General',Funcionalidad
FROM ZAFFA_TEAM.Funcionalidad

INSERT INTO ZAFFA_TEAM.[Funcionalidad x Rol] (NOMBRE_ROL,FUNCIONALIDAD) 
VALUES ('Cliente',(select Funcionalidad 
from ZAFFA_TEAM.Funcionalidad 
where DESCRIPCION_FUNC = 'CompraReservaPasaje'));

INSERT INTO ZAFFA_TEAM.[Funcionalidad x Rol] (NOMBRE_ROL,FUNCIONALIDAD) 
VALUES ('Cliente',(select Funcionalidad 
from ZAFFA_TEAM.Funcionalidad 
where DESCRIPCION_FUNC = 'PagoReserva')); 

----------- .: CLIENTE :. ----------------
INSERT ZAFFA_TEAM.Cliente (CLI_NOMBRE, CLI_APELLIDO, CLI_DNI, CLI_FECHA_NAC, CLI_DIRECCION, CLI_MAIL, CLI_TELEFONO, NOMBRE_ROL)
SELECT DISTINCT CLI_NOMBRE, CLI_APELLIDO, CLI_DNI, CLI_FECHA_NAC, CLI_DIRECCION, CLI_MAIL, CLI_TELEFONO, 'Cliente'
FROM gd_esquema.Maestra

----------- .: PUERTO :. ----------------
INSERT ZAFFA_TEAM.Puerto (NOMBRE_PUERTO, ESTADO_PUERTO)
SELECT DISTINCT PUERTO_DESDE, 'A'
FROM gd_esquema.Maestra 

----------- .: MARCA :. ----------------
INSERT ZAFFA_TEAM.Marca (CRUCERO_FABRICANTE)
SELECT DISTINCT CRU_FABRICANTE
FROM gd_esquema.Maestra

----------- .: TIPO CABINA :. ----------------
INSERT ZAFFA_TEAM.Tipo_Cabina (CABINA_TIPO_DESCRIPCION, CABINA_TIPO_RECARGO)
SELECT DISTINCT CABINA_TIPO, CABINA_TIPO_PORC_RECARGO
FROM gd_esquema.Maestra

----------- .: CABINA :. ----------------
INSERT ZAFFA_TEAM.Cabina(CRUCERO_ID,CABINA_NRO,CABINA_PISO,CABINA_TIPO_ID)
SELECT DISTINCT CRUCERO_IDENTIFICADOR,
				CABINA_NRO,
				CABINA_PISO,
				(SELECT DISTINCT CABINA_TIPO_ID 
					FROM ZAFFA_TEAM.Tipo_Cabina
					WHERE CABINA_TIPO_DESCRIPCION = CABINA_TIPO)
FROM gd_esquema.Maestra

----------- .: CRUCERO :. ----------------
INSERT ZAFFA_TEAM.Crucero (CRUCERO_ID, CRUCERO_MODELO, CRUCERO_MARCA_ID, ESTADO_CRUCERO, CANTIDAD_CABINAS, FECHA_ESTADO)
SELECT DISTINCT CRUCERO_IDENTIFICADOR, 
				CRUCERO_MODELO,
				(SELECT DISTINCT CRUCERO_MARCA_ID
			       FROM ZAFFA_TEAM.Marca mar
		           WHERE mar.CRUCERO_FABRICANTE = mae.CRU_FABRICANTE ),
				'ALTA',
				(SELECT COUNT(*)
					FROM ZAFFA_TEAM.Cabina cab
					WHERE cab.CRUCERO_ID = mae.CRUCERO_IDENTIFICADOR),
				GETDATE()
FROM gd_esquema.Maestra mae

----------- .: RECORRIDO :. ----------------
INSERT ZAFFA_TEAM.Recorrido_Unico (RECORRIDO_CODIGO)
SELECT DISTINCT RECORRIDO_CODIGO
FROM gd_esquema.Maestra

----------- .: TRAMO :. ----------------
INSERT ZAFFA_TEAM.Tramo (RECORRIDO_CODIGO, ORDEN_TRAMOS, PUERTO_DESDE_ID, PUERTO_HASTA_ID, RECORRIDO_PRECIO_BASE) 
SELECT DISTINCT RECORRIDO_CODIGO, 
				(CASE 
					WHEN ((SELECT DISTINCT mae1.PUERTO_DESDE 
							FROM gd_esquema.Maestra mae1
							WHERE mae.RECORRIDO_CODIGO = mae1.RECORRIDO_CODIGO AND mae1.PUERTO_DESDE = mae.PUERTO_HASTA) is not null )
						OR
						((SELECT COUNT (*)
						FROM gd_esquema.Maestra mae2
						WHERE mae.RECORRIDO_CODIGO = mae2.RECORRIDO_CODIGO AND mae.PUERTO_DESDE <> mae2.PUERTO_DESDE) = 0)
					THEN 1
					ELSE 2 
				END), 
				(SELECT PUERTO_ID 
					FROM ZAFFA_TEAM.Puerto
					WHERE mae.PUERTO_DESDE = NOMBRE_PUERTO),
				(SELECT PUERTO_ID 
					FROM ZAFFA_TEAM.Puerto
					WHERE mae.PUERTO_HASTA = NOMBRE_PUERTO),
				RECORRIDO_PRECIO_BASE
FROM gd_esquema.Maestra mae

----------- .: VIAJE :. ----------------
INSERT ZAFFA_TEAM.Viaje (RECORRIDO_CODIGO, FECHA_SALIDA, FECHA_LLEGADA, FECHA_LLEGADA_ESTIMADA, CRUCERO_ID)
SELECT DISTINCT RECORRIDO_CODIGO, FECHA_SALIDA, FECHA_LLEGADA, FECHA_LLEGADA_ESTIMADA, CRUCERO_IDENTIFICADOR
FROM gd_esquema.Maestra


----------- .: PASAJE :. ----------------
INSERT INTO ZAFFA_TEAM.Pasaje (PASAJE_CODIGO, PASAJE_PRECIO, PASAJE_FECHA_COMPRA, CLI_ID, VIAJE_ID, CRUCERO_ID, CABINA_NRO, CABINA_PISO, MEDIO_DE_PAGO)
SELECT  mae.PASAJE_CODIGO, 
		mae.PASAJE_PRECIO, 
		mae.PASAJE_FECHA_COMPRA,
		(SELECT cli.CLI_ID 
					FROM ZAFFA_TEAM.Cliente cli
					WHERE mae.CLI_DNI = cli.CLI_DNI and
						mae.CLI_NOMBRE = cli.CLI_NOMBRE),
		(SELECT via.VIAJE_ID 
					FROM ZAFFA_TEAM.Viaje via
					WHERE mae.RECORRIDO_CODIGO = via.RECORRIDO_CODIGO and 
						mae.FECHA_SALIDA = via.FECHA_SALIDA and 
						mae.FECHA_LLEGADA = via.FECHA_LLEGADA and
						mae.CRUCERO_IDENTIFICADOR = via.CRUCERO_ID),
		mae.CRUCERO_IDENTIFICADOR, 
		mae.CABINA_NRO, 
		mae.CABINA_PISO, 
		''
FROM gd_esquema.Maestra mae
WHERE mae.PASAJE_CODIGO is not null

----------- .: RESERVA :. ----------------
INSERT INTO ZAFFA_TEAM.Reserva (RESERVA_CODIGO, RESERVA_FECHA, CLI_ID, VIAJE_ID, CRUCERO_ID, CABINA_NRO, CABINA_PISO)
SELECT	mae.RESERVA_CODIGO, 
		mae.RESERVA_FECHA, 
		(SELECT cli.CLI_ID 
					FROM ZAFFA_TEAM.Cliente cli
					WHERE mae.CLI_DNI = cli.CLI_DNI and
						mae.CLI_NOMBRE = cli.CLI_NOMBRE),
		(SELECT via.VIAJE_ID 
					FROM ZAFFA_TEAM.Viaje via
					WHERE mae.RECORRIDO_CODIGO = via.RECORRIDO_CODIGO and 
						mae.FECHA_SALIDA = via.FECHA_SALIDA and 
						mae.FECHA_LLEGADA = via.FECHA_LLEGADA and
						mae.CRUCERO_IDENTIFICADOR = via.CRUCERO_ID),
		mae.CRUCERO_IDENTIFICADOR, 
		mae.CABINA_NRO, 
		mae.CABINA_PISO
FROM gd_esquema.Maestra mae
WHERE mae.RESERVA_CODIGO is not null
GO

CREATE FUNCTION ZAFFA_TEAM.Hashear_Password (@password char(32))
RETURNS CHAR(32)
BEGIN
  RETURN CONVERT(CHAR(32), HASHBYTES('SHA2_256', @password), 2)  
END
GO

CREATE PROCEDURE ZAFFA_TEAM.sp_login(@usuario varchar(64), @password char(64))
AS
	BEGIN
		DECLARE @pass_encriptada char(64),@USER nvarchar(50);
		SET @pass_encriptada = ZAFFA_TEAM.Hashear_Password(@password);
		SET @USER = (SELECT USERNAME FROM ZAFFA_TEAM.Administrativo
						WHERE USERNAME = @usuario)
		IF((SELECT PASSWORD FROM ZAFFA_TEAM.Administrativo
				WHERE USERNAME = @USER) = @pass_encriptada)
		BEGIN
			UPDATE ZAFFA_TEAM.Administrativo
			SET INTENTOS_FALLIDOS = 0
			WHERE USERNAME = @USER
		END
		ELSE IF((SELECT PASSWORD FROM ZAFFA_TEAM.Administrativo WHERE USERNAME = @USER) != @pass_encriptada 
			AND (SELECT INTENTOS_FALLIDOS FROM ZAFFA_TEAM.Administrativo WHERE USERNAME = @USER) < 2)
		BEGIN
			UPDATE ZAFFA_TEAM.Administrativo
			SET INTENTOS_FALLIDOS = INTENTOS_FALLIDOS + 1
			WHERE USERNAME = @USER
		END
		ELSE  
		BEGIN
			UPDATE ZAFFA_TEAM.Administrativo
			SET ESTADO_ADMIN = 'I', INTENTOS_FALLIDOS = 3
			WHERE USERNAME = @USER
		END
	END	
GO


----------- .: TRIGGER ENCRIPTACION PASS USUARIO :. ----------------
CREATE TRIGGER ZAFFA_TEAM.Encriptar_Password
ON ZAFFA_TEAM.Administrativo
INSTEAD OF INSERT
AS 
BEGIN    
	DECLARE @password varchar(64)
	DECLARE @username varchar(64)

	SELECT @username = USERNAME, @password = PASSWORD FROM inserted

	INSERT INTO ZAFFA_TEAM.Administrativo(USERNAME, PASSWORD,INTENTOS_FALLIDOS,NOMBRE_ROL,ESTADO_ADMIN) 
		VALUES ( @username, ZAFFA_TEAM.Hashear_Password(@password),0,'Administrador General','A') 
END 
GO

----------- .: TRIGGER ESTADO CRUCERO :. --------------
CREATE TRIGGER ZAFFA_TEAM.Auditoria_de_estado_cruceros
ON ZAFFA_TEAM.Crucero
AFTER UPDATE AS  
BEGIN
	if((SELECT ESTADO_CRUCERO FROM inserted) <> (SELECT ESTADO_CRUCERO FROM deleted))
		INSERT INTO ZAFFA_TEAM.Auditoria_estado_cruceros (CRUCERO_ID, FECHA_ACTUAL, ESTADO_ACTUAL, FECHA_ANTERIOR, ESTADO_ANTERIOR)
		(SELECT i.CRUCERO_ID, GETDATE(), i.ESTADO_CRUCERO, d.FECHA_ESTADO, d.ESTADO_CRUCERO
			FROM inserted i, deleted d)
END
GO

----------- .: TRIGGER TABLA RESERVA :. ----------------
CREATE TRIGGER ZAFFA_TEAM.Borrar_Reservas_Mayores_A_Tres_Dias
ON ZAFFA_TEAM.Reserva
AFTER DELETE AS  
BEGIN
	DELETE FROM ZAFFA_TEAM.Reserva
	WHERE DATEDIFF(DAY, RESERVA_FECHA, GETDATE()) > 3;  
END
GO

----------- .: ADMINISTRATIVO :. ----------------
INSERT INTO ZAFFA_TEAM.Administrativo (USERNAME, PASSWORD, INTENTOS_FALLIDOS, NOMBRE_ROL, ESTADO_ADMIN) 
VALUES ('admin', 'w23e', 0, 'Administrador General','A')

INSERT INTO ZAFFA_TEAM.Administrativo (USERNAME, PASSWORD, INTENTOS_FALLIDOS, NOMBRE_ROL,ESTADO_ADMIN) 
VALUES ('zaffa_team', 'w23e', 0, 'Administrador General','A')
GO

----------- .: PROCEDURES :. ----------------
CREATE PROCEDURE ZAFFA_TEAM.sp_guardarCrucero (@crucero_id nvarchar(50),@crucero_modelo nvarchar(50), @crucero_marca_id int, @estado_crucero nvarchar(25), @cantidad_cabinas int)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.Crucero(CRUCERO_ID,CRUCERO_MODELO,CRUCERO_MARCA_ID,ESTADO_CRUCERO,CANTIDAD_CABINAS) 
		VALUES (@crucero_id,@crucero_modelo,@crucero_marca_id,@estado_crucero,@cantidad_cabinas)
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje varchar(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

CREATE PROCEDURE ZAFFA_TEAM.sp_guardarPuerto (@puerto_ID INT,@nombre_puerto nvarchar(255), @estado_puerto char(1))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.Puerto(PUERTO_ID,NOMBRE_PUERTO,ESTADO_PUERTO) 
		VALUES (@puerto_ID,@nombre_puerto,@estado_puerto) 


	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje varchar(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

CREATE PROCEDURE ZAFFA_TEAM.sp_generarPasaje (@precio decimal(18,2),@cliente_id int,
@viaje_id int, @crucero_id nvarchar(50), @cabina_nro decimal(18,0),
@cabina_piso decimal(18,0), @medio_pago nvarchar(50))
AS
DECLARE @pasaje_codigo DECIMAL(18,0) = (SELECT MAX(PASAJE_CODIGO) from ZAFFA_TEAM.Pasaje) + 1;
DECLARE @pasaje_fecha DATETIME2(3) = GETDATE();
BEGIN
INSERT INTO ZAFFA_TEAM.Pasaje (PASAJE_CODIGO,PASAJE_PRECIO,PASAJE_FECHA_COMPRA,
CLI_ID,VIAJE_ID,CRUCERO_ID,CABINA_NRO,CABINA_PISO,MEDIO_DE_PAGO)
VALUES (@pasaje_codigo,@precio,@pasaje_fecha,
@cliente_id,@viaje_id, @crucero_id,@cabina_nro,@cabina_piso,@medio_pago)
END
GO

----

CREATE PROCEDURE ZAFFA_TEAM.sp_borrarReservas
AS
BEGIN
DELETE FROM ZAFFA_TEAM.Reserva
WHERE DATEDIFF(DAY, RESERVA_FECHA, GETDATE()) > 3;
END
GO

----

CREATE PROCEDURE ZAFFA_TEAM.sp_guardarRecorrido(@id_recorrido decimal(18,0),@orden_tramo int,@puerto_desde nvarchar(255),@puerto_hasta nvarchar(255),@precio_recorrido decimal(18,0))
AS

DECLARE @puerto_desde_id int
DECLARE @puerto_hasta_id int

SET @puerto_desde_id = (select PUERTO_ID from ZAFFA_TEAM.puerto where NOMBRE_PUERTO = @puerto_desde)
SET @puerto_hasta_id = (select PUERTO_ID from ZAFFA_TEAM.puerto where NOMBRE_PUERTO = @puerto_hasta)

	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.Tramo(RECORRIDO_CODIGO,ORDEN_TRAMOS,PUERTO_DESDE_ID,PUERTO_HASTA_ID,RECORRIDO_PRECIO_BASE) 
		VALUES (@id_recorrido,@orden_tramo,@puerto_desde_id,@puerto_hasta_id,@precio_recorrido) 

		INSERT INTO ZAFFA_TEAM.Recorrido_Unico(RECORRIDO_CODIGO)
		VALUES (@id_recorrido)

	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_guardarCabina(@crucero_id nvarchar(50),@cabina_nro decimal(18,0), @cabina_piso INT, @cabina_tipo_id NVARCHAR(25))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.Cabina(CRUCERO_ID,CABINA_NRO,CABINA_PISO,CABINA_TIPO_ID) 
		VALUES (@crucero_id,@cabina_nro,@cabina_piso,@cabina_tipo_id)
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_guardarRol(@nombre_rol nvarchar(50),@estado_rol char)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.Rol(NOMBRE_ROL,ESTADO_ROL) 
		VALUES (@nombre_rol,@estado_rol)
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_updatClienteRol(@nombre_rol nvarchar(50),@nombre_original nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Cliente
		SET NOMBRE_ROL = @nombre_rol
		WHERE NOMBRE_ROL = 'Cliente'
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_updateAdministradorRol(@nombre_rol nvarchar(50),@nombre_original nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Administrativo
		SET NOMBRE_ROL = @nombre_rol
		WHERE NOMBRE_ROL = @nombre_original
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_deleteRol(@nombre_rol nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		DELETE FROM ZAFFA_TEAM.Rol
		WHERE NOMBRE_ROL = @nombre_rol
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_guardarFuncionalidadxRol(@nombre_rol nvarchar(50),@funcionalidad int)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.[Funcionalidad x Rol](NOMBRE_ROL,FUNCIONALIDAD) 
		VALUES (@nombre_rol,@funcionalidad)
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_updateCantCabinas(@cant_cabinas int,@crucero_id nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Crucero
		SET CANTIDAD_CABINAS = @cant_cabinas
		WHERE CRUCERO_ID = @crucero_id
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_udteFuncionalidad(@nombre_rol nvarchar(50),@estado_rol char)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Rol
		SET ESTADO_ROL = @estado_rol
		WHERE NOMBRE_ROL = @nombre_rol
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_updateNombreRol(@nombre_rol nvarchar(50),@nombre_viejo nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Rol
		SET NOMBRE_ROL = @nombre_rol
		WHERE NOMBRE_ROL = @nombre_viejo
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_updateNombreFuncionalidadxRol(@nombre_rol nvarchar(50),@nombre_viejo nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.[Funcionalidad x Rol]
		SET NOMBRE_ROL = @nombre_rol
		WHERE NOMBRE_ROL = @nombre_viejo
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_deleteFuncionalidadxRol(@nombre_rol nvarchar(50), @funcionalidad int)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		DELETE FROM ZAFFA_TEAM.[Funcionalidad x Rol]
		WHERE NOMBRE_ROL = @nombre_rol AND FUNCIONALIDAD = @funcionalidad
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_habilitarFuncionalidad(@nombre_rol nvarchar(50),@estado_rol char)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Rol
		SET ESTADO_ROL = @estado_rol
		WHERE NOMBRE_ROL = @nombre_rol
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_updateFabCrucero(@crucero_id nvarchar(50),@crucero_marca_id int,@marca_vieja int)
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		UPDATE ZAFFA_TEAM.Crucero
		SET CRUCERO_MARCA_ID = @crucero_marca_id
		WHERE CRUCERO_ID = @crucero_id AND CRUCERO_MARCA_ID = @marca_vieja
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_guardarViaj(@recorrido_codigo decimal(18,0), @fecha_salida datetime2(3), @fecha_llegada datetime2(3), @fecha_llegada_estimada datetime2(3), @crucero_id nvarchar(50))
AS
	BEGIN TRANSACTION tr	

	BEGIN TRY

		INSERT INTO ZAFFA_TEAM.Viaje(RECORRIDO_CODIGO,FECHA_SALIDA,FECHA_LLEGADA,FECHA_LLEGADA_ESTIMADA,CRUCERO_ID) 
		VALUES (@recorrido_codigo,@fecha_salida,@fecha_llegada,@fecha_llegada_estimada,@crucero_id)
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tr
		DECLARE @mensaje VARCHAR(255) = ERROR_MESSAGE()
		RAISERROR(@mensaje,11,0)

		RETURN
	END CATCH

	COMMIT TRANSACTION tr
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_guardarCliente(@CLI_NOMBRE nvarchar(255),
@CLI_APELLIDO nvarchar(255), @CLI_DNI decimal(18,0),
@CLI_DIRECCION nvarchar(255), @CLI_TELEFONO INT,
@CLI_MAIL nvarchar(255))
AS
BEGIN
INSERT INTO ZAFFA_TEAM.Cliente(CLI_NOMBRE,CLI_APELLIDO,CLI_DNI,CLI_DIRECCION,CLI_TELEFONO,CLI_MAIL,NOMBRE_ROL)
VALUES (@CLI_NOMBRE,@CLI_APELLIDO,@CLI_DNI,@CLI_DIRECCION,@CLI_TELEFONO,
@CLI_MAIL,'Cliente')
END
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_actualizarCliente(@CLI_ID int, @CLI_NOMBRE nvarchar(255),
						@CLI_APELLIDO nvarchar(255), @CLI_DNI decimal(18,0),
							@CLI_DIRECCION nvarchar(255), @CLI_TELEFONO INT,
								@CLI_MAIL nvarchar(255))
	AS
	BEGIN
		UPDATE ZAFFA_TEAM.Cliente
		SET CLI_NOMBRE = @CLI_NOMBRE,
			CLI_APELLIDO = @CLI_APELLIDO,
			CLI_DNI = @CLI_DNI,
			CLI_DIRECCION= @CLI_DIRECCION,
			CLI_TELEFONO = @CLI_TELEFONO,
			CLI_MAIL = @CLI_MAIL
		WHERE CLI_ID = @CLI_ID
	END
GO

----

GO
CREATE PROCEDURE ZAFFA_TEAM.sp_crearReserva(@CLI_ID int, @VIAJE_ID int,
								@CRUCERO_ID nvarchar(50), @CABINA_NRO decimal(18,0),
									@CABINA_PISO decimal(18,0))
	AS
	BEGIN
		INSERT INTO ZAFFA_TEAM.Reserva(RESERVA_CODIGO,RESERVA_FECHA,CLI_ID,VIAJE_ID,CRUCERO_ID,
		CABINA_NRO,CABINA_PISO)
		VALUES (coalesce((select max(reserva_codigo) from ZAFFA_TEAM.Reserva),0)+1,GETDATE(),@CLI_ID,@VIAJE_ID,@CRUCERO_ID,@CABINA_NRO,@CABINA_PISO)
	END
GO

----

