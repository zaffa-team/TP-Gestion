INSERT INTO ZAFFA_TEAM.Rol (NOMBRE_ROL, ESTADO_ROL)
VALUES ('Cliente', 'A')

INSERT INTO ZAFFA_TEAM.Rol (NOMBRE_ROL, ESTADO_ROL)
VALUES ('Administrativo', 'A')

select *
FROM ZAFFA_TEAM.Rol

INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('AbmRol');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('AbmCrucero');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('AbmPuerto');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('AbmRecorrido');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('CompraReservaPasaje');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('GeneracionViaje');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('ListadoEstadistico');
INSERT INTO ZAFFA_TEAM.Funcionalidad (FUNCIONALIDAD_DESCRIPCION) VALUES ('PagoReserva');

--INSERT INTO ZAFFA_TEAM.[Funcionalidad x Rol] 

--INSERT INTO ZAFFA_TEAM.Administrativo (USERNAME, PASSWORD, INTENTOS_FALLIDOS, NOMBRE_ROL, ESTADO_ADMIN) 

INSERT ZAFFA_TEAM.Cliente (CLI_NOMBRE, CLI_APELLIDO, CLI_DNI, CLI_FECHA_NAC, CLI_DIRECCION, CLI_MAIL, CLI_TELEFONO, NOMBRE_ROL)
SELECT DISTINCT CLI_NOMBRE, CLI_APELLIDO, CLI_DNI, CLI_FECHA_NAC, CLI_DIRECCION, CLI_MAIL, CLI_TELEFONO, 'Cliente'
FROM gd_esquema.Maestra;

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
INSERT ZAFFA_TEAM.Crucero (CRUCERO_ID, CRUCERO_MODELO, CRUCERO_MARCA_ID, ESTADO_CRUCERO, CANTIDAD_CABINAS, FECHA_ALTA, FECHA_FUERA_DE_SERVICIO, FECHA_REINICIO_DE_SERVICIO, FECHA_BAJA_DEFINITIVA)
SELECT DISTINCT CRUCERO_IDENTIFICADOR, 
				CRUCERO_MODELO,
				(SELECT DISTINCT CRUCERO_MARCA_ID
			       FROM ZAFFA_TEAM.Marca mar
		           WHERE mar.CRUCERO_FABRICANTE = mae.CRU_FABRICANTE ),
				'A',
				(SELECT count(*)
					FROM ZAFFA_TEAM.Cabina cab
					WHERE cab.CRUCERO_ID = mae.CRUCERO_IDENTIFICADOR),
				 getDate(),
 				 NULL,
				 NULL,
				 NULL
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
							WHERE mae.RECORRIDO_CODIGO = mae1.RECORRIDO_CODIGO AND mae1.PUERTO_DESDE = mae.PUERTO_HASTA) IS NOT NULL )
						OR
						((SELECT COUNT (*)
						FROM gd_esquema.Maestra mae2
						WHERE MAE.RECORRIDO_CODIGO = MAE2.RECORRIDO_CODIGO AND MAE.PUERTO_DESDE <> MAE2.PUERTO_DESDE) = 0)
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

-------------------------------------------------------------------
-------------------- TESTING --------------------------------------
-------------------------------------------------------------------

SELECT * 
FROM ZAFFA_TEAM.Crucero

SELECT * 
FROM ZAFFA_TEAM.Marca

SELECT * 
FROM ZAFFA_TEAM.Tipo_Cabina

SELECT * 
FROM ZAFFA_TEAM.Cabina

SELECT DISTINCT CRUCERO_IDENTIFICADOR,CABINA_NRO,CABINA_PISO
FROM gd_esquema.Maestra
WHERE CRUCERO_IDENTIFICADOR = 'ZMYPZJ-55099'
ORDER BY CRUCERO_IDENTIFICADOR

SELECT *
FROM ZAFFA_TEAM.Recorrido_Unico

SELECT * 
FROM ZAFFA_TEAM.Tramo

SELECT *
FROM ZAFFA_TEAM.Viaje

DELETE FROM ZAFFA_TEAM.Administrativo
DELETE FROM ZAFFA_TEAM.Cabina
DELETE FROM ZAFFA_TEAM.Cliente
DELETE FROM ZAFFA_TEAM.Crucero
DELETE FROM ZAFFA_TEAM.Funcionalidad
DELETE FROM ZAFFA_TEAM.[Funcionalidad x Rol]
DELETE FROM ZAFFA_TEAM.Marca
DELETE FROM ZAFFA_TEAM.Puerto
DELETE FROM ZAFFA_TEAM.Recorrido_Unico
DELETE FROM ZAFFA_TEAM.Rol
DELETE FROM ZAFFA_TEAM.Tipo_Cabina
DELETE FROM ZAFFA_TEAM.Tramo
DELETE FROM ZAFFA_TEAM.Viaje
