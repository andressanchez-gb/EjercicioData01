-- TRIGGER: trg_auditoria_pagos_masivos
CREATE OR REPLACE FUNCTION fn_auditoria_pagos_masivos()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.estado = 'Rechazado'
	OR NEW.valor = 0 THEN
	NEW.estado := 'Revisión Bancaria';
	END IF;
	
	RETURN NEW;
	
END;
$$
;

CREATE TRIGGER trg_auditoria_pagos_masivos
BEFORE INSERT
ON oficio_pagos_recurrentes
FOR EACH ROW
EXECUTE FUNCTION fn_auditoria_pagos_masivos()
;

-- PRUEBA DEL TRIGGER
INSERT INTO oficio_pagos_recurrentes (
    rfc_titular,
	segmento,
	tarjeta,
	nombres_afiliado,
	fecha_venta,
	oficio,
	carga,
	mes,
	valor,
	estado,
	asistencias,
	plan
	)
	VALUES (
	'RFC777777',
	'VIP',
	'4000-7777-7777-7777',
	'Prueba Trigger',
	CURRENT_DATE,
	'OF777',
	'CARGA777',
	'JULIO',
	0,
	'Aprobado',
	'Asistencia',
	'Plan Oro'
);

-- PROCEDIMIENTO: sp_conciliacion_masiva_robert
CREATE OR REPLACE PROCEDURE sp_conciliacion_masiva_robert()
LANGUAGE plpgsql
AS $$
DECLARE
v_registro RECORD;
BEGIN

FOR v_registro IN
SELECT producto,
SUM(prima_neta) AS total_prima_neta
FROM sabana_polizas_emasivos
GROUP BY producto
LOOP

RAISE NOTICE
'Producto: % | Total Prima Neta: %',
v_registro.producto,
v_registro.total_prima_neta;

END LOOP;

END;
$$
;