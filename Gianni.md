- Reporte de asistencias:
Se genera un reporte con información del vehículo para enviar a proveedores de asistencias. Este reporte se genera con el enlace de tabla maestra de pólizas, tabla de vehículos por póliza, tabla de información de vehículos, tabla de asegurados. Los encabezados del reporte son:
Id_póliza, INT tb_polizas
ítem, INT tb_items - tb_polizas
fecha_inicio_vig, FECHA tb_polizas
fecha_fin_vig, FECHA tb_polizas
cod_sucursal, INT tb_polizas
Sucursal, VARCHAR(50) tb_sucursal - tb_polizas
cod_ramo, INT tb_polizas
Ramo, VARCHAR(50) tb_ramo - tb_polizas
cod_marca, tb_datos_vh - tb_items - tb_polizas
marca, VARCHAR(250) tb_marca_vh - tb_datos_vh
cod_modelo, tb_datos_vh - tb_items - tb_polizas
modelo, VARCHAR(250) tb_modelo - tb_datos_vh
chasis, VARCHAR(250) tb_datos_vh - tb_items - tb_polizas
placa, VARCHAR(50) tb_datos_vh - tb_items - tb_polizas
cod_color, tb_datos_vh - tb_items - tb_polizas
color, VARCHAR(250) tb_color_vh - tb_datos_vh
cod_tipo_vh, tb_datos_vh - tb_items - tb_polizas
tipo_vh, VARCHAR(250) tb_tipo_vh - tb_datos_vh
cod_clase_vh, tb_datos_vh - tb_items - tb_polizas
clase_vh, VARCHAR(250) tb_clase_vh - tb_datos_vh
cod_uso, tb_datos_vh - tb_items - tb_polizas
uso, VARCHAR(250) tb_uso_vh - tb_datos_vh
año, INT tb_datos_vh - tb_items - tb_polizas
cod_aseg, INT tb_polizas
nombre_aseg, VARCHAR(250) tb_asegurado - tb_polizas
apellido_aseg, VARCHAR(250) tb_asegurado - tb_polizas
cedula VARCHAR(20) tb_asegurado - tb_polizas

cod_cober  INT tb_cobertura
cobertura VARCHAR(250) tb_cobertura - tb_items - tb_polizas
sn_activo BOOLEAN tb_cobertura - tb_items - tb_polizas

Sólo aparecen los vehículos vigentes al día y que en la tabla de coberturas por vehículo esté activa la cobertura de 'asistencia vehicular'. 

Y Se genera un reporte tipo listado con información del ramo de incendio de hogar, edificios y pymes con direcciones vigentes y que en la tabla de coberturas haya sido emitido con cobertura de asistencia:

Id_póliza, INT tb_polizas
ítem, INT tb_items - tb_polizas
fecha_inicio_vig, FECHA tb_polizas
fecha_fin_vig, FECHA tb_polizas
cod_sucursal, INT tb_polizas
Sucursal, VARCHAR(50) tb_sucursal - tb_polizas
cod_ramo, INT tb_polizas
Ramo, VARCHAR(50) tb_ramo - tb_polizas
cod_agrupador, INT tb_polizas
agrupador, VARCHAR(250) tb_agrupador - tb_polizas
dirección, VARCHAR(250) tb_direcciones - tb_items
cod_aseg, INT tb_polizas
nombre_aseg, VARCHAR(250) tb_asegurado - tb_polizas
apellido_aseg, VARCHAR(250) tb_asegurado - tb_polizas
cedula VARCHAR(20) tb_asegurado - tb_polizas

cod_cober  INT tb_cobertura
cobertura VARCHAR(250) tb_cobertura - tb_items - tb_polizas
sn_activo BOOLEAN tb_cobertura - tb_items - tb_polizas

 Portafolio de vehículos:
Reporte de portafolio para analizar el resultado del ramo de vehículo en el periodo tomando en cuenta vehículos vigentes, expuestos, número de siniestros,valor de siniestro, que darán indicadores como Siniestralidad.
Con el portafolio se busca que sea dinámico y se pueda llegar a obtener información de varios filtros del ramo de vehículo y analizar el riesgo del periodo (r12) de clientes,productos, tipos de vehículo, antigüedad, contratante, canal, plataforma de emisión,entre otros.

Id_póliza, INT tb_polizas
ítem, INT tb_items - tb_polizas
fecha_inicio_vig, FECHA tb_polizas
fecha_fin_vig, FECHA tb_polizas
cod_sucursal, INT tb_polizas
Sucursal, VARCHAR(50) tb_sucursal - tb_polizas
cod_ramo, INT tb_polizas
Ramo, VARCHAR(50) tb_ramo - tb_polizas
cod_marca, tb_datos_vh - tb_items - tb_polizas
marca, VARCHAR(250) tb_marca_vh - tb_datos_vh
cod_modelo, tb_datos_vh - tb_items - tb_polizas
modelo, VARCHAR(250) tb_modelo - tb_datos_vh
chasis, VARCHAR(250) tb_datos_vh - tb_items - tb_polizas
placa, VARCHAR(50) tb_datos_vh - tb_items - tb_polizas
cod_color, tb_datos_vh - tb_items - tb_polizas
color, VARCHAR(250) tb_color_vh - tb_datos_vh
cod_tipo_vh, tb_datos_vh - tb_items - tb_polizas
tipo_vh, VARCHAR(250) tb_tipo_vh - tb_datos_vh
cod_clase_vh, tb_datos_vh - tb_items - tb_polizas
clase_vh, VARCHAR(250) tb_clase_vh - tb_datos_vh
cod_uso, tb_datos_vh - tb_items - tb_polizas
uso, VARCHAR(250) tb_uso_vh - tb_datos_vh
año, INT tb_datos_vh - tb_items - tb_polizas
cod_aseg, INT tb_polizas
nombre_aseg, VARCHAR(250) tb_asegurado - tb_polizas
apellido_aseg, VARCHAR(250) tb_asegurado - tb_polizas
cedula VARCHAR(20) tb_asegurado - tb_polizas

cod_cober  INT tb_cobertura
cobertura VARCHAR(250) tb_cobertura - tb_items - tb_polizas
sn_activo BOOLEAN tb_cobertura - tb_items - tb_polizas

cod_producto, INT tb_polizas
producto, VARCHAR(250) tb_producto - tb_items - tb_polizas
cod_agrupador, INT tb_polizas
agrupador, VARCHAR(250) tb_agrupador - tb_polizas

prima_neta, NUMERIC(20,2)

Campos Calculados / Fórmulas:

Prima Devengada: prima ganada desde el inicio de vigencia de la póliza hasta la fecha de fin del periodo de análisis.
Incurrido: Suma de siniestros pagados y siniestros en reserva (tb_siniestros_pagados y tb_siniestros_reserva cruza con id_poliza e cod_item)
Vigentes: 1 si el vehículo está vigente a la fecha de fin del periodo analizado, 0 si el vehículo ya caducó su vigencia. Se valida que sea sólo un '1' por vehículo esté, porque sino el dato se duplicariía, en caso de que emita endosos de aclaración por ejemplo.
Expuesto: 1 si el vehículo tuvo vigencia dentro del periodo analizado, 0 si el vehículo no tuvo vigencia en el periodo analizado. Se valida que sea sólo un '1' por vehículo esté, porque sino el dato se duplicariía, en caso de que emita endosos de aclaración por ejemplo.
Siniestralidad: Incurrido / Prima Neta devengada
