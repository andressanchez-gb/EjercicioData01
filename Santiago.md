Información de tablas del siniestro, reserva del siniestro y pago del siniestro

Tabla: stro_header (info principal del siniestro)
Columnas:
          id_stro  INT
          cod_suc  INT
          cod_ramo  INT
          aaaa_ejercicio  INT
          nro_stro  VARCHAR
          id_pv  INT
          fec_hora_reclamo  DATE
          fec_aviso  DATE
          fec_registro  DATE
          cod_causa  INT
          cod_usuario  VARCHAR
          
Tabla: stro_op_header (info principal del pago de siniestro)
Columnas:
          id_stro_op  INT
          cod_suc  INT
          cod_ramo  INT
          nro_aut_tec  INT
          fec_emi  DATE
          fec_pago  DATE
          fec_estim_pago DATE
          fec_ingreso_contable DATE
          fec_anul DATE
          imp_total_pagar FLOAT
          txt_desc  VARCHAR
          cod_agente INT
          nro_recibo_devengado INT
          nro_recibo_pago  INT
          nro_op  INT
          cod_movimiento  INT
          txt_cheque_a_nom  VARCHAR
          nro_comprobante  INT
          txt_razon_social  VARCHAR
          cod_usuario  VARCHAR
          txt_reclamante  VARCHAR

Tabla: stro_op_pagos (info del pago)
Columnas:
          id_stro_op  INT
          id_stro  INT
          cod_item  INT
          cod_ind_cob  INT
          cod_tercero  INT
          cod_tipo_pago  INT
          imp_pago  FLOAT
          cod_clase_pago  INT
          cod_ramo  INT

Tabla: pv_header (info principal de la poliza)
Columnas:
          id_pv  INT
          cod_suc  INT
          cod_ramo  INT
          nro_pol  INT
          aaaa_endoso  INT
          nro_endoso  INT
          cod_aseg  INT
          fec_emi  DATE
          fec_vig_desde  DATE
          fec_vig_hasta  DATE
          cod_tipo_agente  INT
          cod_agente  INT
          cod_grupo_endo  INT
          cod_tipo_endo  INT
          cod_grupo  INT

Tabla: estim_header (info principal del siniestro en reserva)
Columnas:
          id_stro  INT
          cod_item  INT
          cod_ind_cob  INT
          txt_bien_strado  VARCHAR
          cod_municipio  INT
          cod_dpto  INT
          cod_pais  INT
          id_pv  INT
          cod_ramo  INT

Tabla: estim_importe (info del siniestro en reserva)
Columnas:
          id_stro  INT
          cod_item  INT
          cod_ind_cob  INT
          cod_estim  INT
          nro_correla_estim  INT
          fec_estim  DATE
          cod_tipo_estim  INT
          imp_estimado  FLOAT
          cod_usuario  VARCHAR

Tabla: tpais (catalogo)
Columnas:
          cod_pais INT
          txt_desc  VARCHAR

Tabla: tdpto (catalogo)
Columnas:
          cod_pais INT
          cod_dpto INT
          txt_desc  VARCHAR

Tabla: tmunicipio (catalogo)
Columnas:
          cod_pais INT
          cod_dpto INT
          cod_municipio INT
          txt_desc  VARCHAR

Tabla: tcanal_emi (catalogo)
Columnas:
          cod_canal_emi INT
          txt_desc  VARCHAR

Tabla: tcausa_stro (catalogo)
Columnas:
          cod_ramo INT
          cod_causa INT
          txt_desc  VARCHAR
