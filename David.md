Tabla producción_2026
cod_tipo_produccion (INT)
tipo_producción (VARCHAR)
año (INT)
numero_mes (INT)
mes (VARCHAR)
fecha (DATE)
sucursal (VARCHAR)
cod_ramo (INT)
ramo (VARCHAR)
cod_tipo_agente (INT)
tipo_agente (VARCHAR)
cod_agente (INT)
agente (VARCHAR)
poliza (INT)
endoso (INT)
cod_contratante (INT)
contratante (VARCHAR)
cod_asegurado (INT)
asegurado (VARCHAR)
cedula_asegurado (VARCHAR)
fecha_emision (DATE)
vigencia_desde (DATE)
vigencia_hast (DATE)
canal_emision (VARCHAR)
agrupador (VARCHAR)
agrupador_principal (VARCHAR)
prima (DECIMAL) (2)
punto_vta (VARCHAR)
tipo_endoso (VARCHAR)
motivo_endoso (VARCHAR)
pertenece_grupo (VARCHAR)
pago_inicial (VARCHAR)
ejecutivo_comercial (VARCHAR)

Tabla presupuesto_2026
cod_tipo_produccion (INT)
tipo_producción (VARCHAR)
año (INT)
numero_mes (INT)
mes (VARCHAR)
fecha (DATE)
cod_ramo (INT)
ramo (VARCHAR)
cod_tipo_agente (INT)
tipo_agente (VARCHAR)
cod_agente (INT)
agente (VARCHAR)
canal_emision (VARCHAR)
agrupador (VARCHAR)
agrupador_principal (VARCHAR)
presupuesto (DECIMAL 2)
punto_vta (VARCHAR)
pertenece_grupo (VARCHAR)
ejecutivo_comercial (VARCHAR)

Tabla kpi_crm
año (INT)
numero_mes (INT)
mes (VARCHAR)
fecha (DATE)
cod_ramo (INT)
ramo (VARCHAR)
cod_tipo_agente (INT)
tipo_agente (VARCHAR)
cod_agente (INT)
agente (VARCHAR)
canal_emision (VARCHAR)
prima_targuet (DECIMAL 2)
punto_vta (VARCHAR)
ejecutivo_comercial (VARCHAR)
cliente (VARCHAR)
quotation (VARCHAR)
hit_ratio (VARCHAR)
etapa_actual (VARCHAR)
estado (VARCHAR)

Tabla asesores_productores_seguros_SCVS
agente (VARCHAR)
codigo_super_cias (INT)
ramo (VARCHAR)
prima (DECIMAL
fecha (DATE)

Tabla renovaciones_2026
año (INT)
numero_mes (INT)
mes (VARCHAR)
fecha (DATE)
sucursal (VARCHAR)
cod_ramo (INT)
ramo (VARCHAR)
cod_tipo_agente (INT)
tipo_agente (VARCHAR)
cod_agente (INT)
agente (VARCHAR)
poliza (INT)
endoso (INT)
cod_contratante (INT)
contratante (VARCHAR)
cod_asegurado (INT)
asegurado (VARCHAR)
cedula_asegurado (VARCHAR)
vigencia_desde (DATE)
vigencia_hast (DATE)
canal_emision (VARCHAR)
agrupador (VARCHAR)
agrupador_principal (VARCHAR)
prima_a_renovar (DECIMAL) (2)
punto_vta (VARCHAR)
ejecutivo_comercial (VARCHAR)
estado_renovacion (VARCHAR)

Tabla dim_agente
cod_agente_principal
agente_principal
cod_agente_secundario
agente_secundario
codigo_super_cias
identificacion

Tabla dim_ramo
cod_ramo (INT)
ramo (VARCHAR)

Tabla dim_punto_venta
cod_punto_venta (INT)
punto_venta (VARCHAR)

Tabla dim_ejecutivo
cod_ejecutivo (INT)
ejecutivo (VARCHAR)

Tabla dim_agrupador
cod_agrupador_secundario (INT)
agrupador_secundario (VARCHAR)
cod_agrupador_principal (INT)
agrupador_principal (VARCHAR)

Tabla dim_canal_emision
cod_canal (INT)
canal_emision (VARCHAR)

Tabla dim_calendario
