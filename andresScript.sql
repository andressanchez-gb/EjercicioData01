-- 1. Crear la tabla de bitácora transversal
CREATE TABLE tb_auditoria_general (
    id_auditoria SERIAL PRIMARY KEY,
    nombre_tabla VARCHAR(100),
    operacion VARCHAR(20),
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_db VARCHAR(100),
    detalle TEXT
);

-- 2. Crear la función del Trigger (sirve para cualquier tabla)
CREATE OR REPLACE FUNCTION fn_auditar_cambios()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO tb_auditoria_general (nombre_tabla, operacion, usuario_db, detalle)
        VALUES (TG_TABLE_NAME, TG_OP, current_user, 'Registro eliminado: ' || OLD.*::TEXT);
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO tb_auditoria_general (nombre_tabla, operacion, usuario_db, detalle)
        VALUES (TG_TABLE_NAME, TG_OP, current_user, 'Registro actualizado. Nuevo dato: ' || NEW.*::TEXT);
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO tb_auditoria_general (nombre_tabla, operacion, usuario_db, detalle)
        VALUES (TG_TABLE_NAME, TG_OP, current_user, 'Nuevo registro: ' || NEW.*::TEXT);
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- 3. Aplicar el Trigger a la tabla maestra de Pólizas (El corazón del negocio)
CREATE TRIGGER trg_auditar_polizas
AFTER INSERT OR UPDATE OR DELETE ON tb_polizas
FOR EACH ROW EXECUTE FUNCTION fn_auditar_cambios();

-- Opcional: Puedes ejecutar esta misma línea cambiando "tb_polizas" por "stro_header" (Santiago) o "kpi_crm" (David) para auditar sus tablas.


-- SP Transversal: Resumen Gerencial de todas las áreas
CREATE OR REPLACE PROCEDURE sp_resumen_ejecutivo_gerencial(
    p_anio INT,
    p_mes INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total_prima_comercial NUMERIC(15,2);
    v_total_vehiculos INT;
    v_total_prima_masivos NUMERIC(15,2);
    v_total_siniestros_pagados NUMERIC(15,2);
BEGIN
    RAISE NOTICE '=======================================================';
    RAISE NOTICE '  RESUMEN EJECUTIVO CONSOLIDADO DE LA EMPRESA';
    RAISE NOTICE '  Periodo consultado: Mes % del Año %', p_mes, p_anio;
    RAISE NOTICE '=======================================================';

    -- 1. MÉTRICA DE DAVID (Área Comercial)
    SELECT COALESCE(SUM(prima), 0) INTO v_total_prima_comercial
    FROM produccion_2026 
    WHERE anio = p_anio AND numero_mes = p_mes;
    
    RAISE NOTICE '>> DAVID (Comercial): Prima Producción Total = $ %', v_total_prima_comercial;

    -- 2. MÉTRICA DE GIANNI (Portafolio de Vehículos)
    SELECT COUNT(i.cod_item) INTO v_total_vehiculos
    FROM tb_items i
    JOIN tb_polizas p ON i.id_poliza = p.id_poliza
    WHERE EXTRACT(YEAR FROM p.fecha_inicio_vig) = p_anio 
      AND EXTRACT(MONTH FROM p.fecha_inicio_vig) = p_mes;
      
    RAISE NOTICE '>> GIANNI (Portafolio): Vehículos Emitidos en el periodo = %', v_total_vehiculos;

    -- 3. MÉTRICA DE ROBERT (Banca Seguros / Masivos)
    SELECT COALESCE(SUM(prima_neta), 0) INTO v_total_prima_masivos
    FROM sabana_polizas_emasivos
    WHERE EXTRACT(YEAR FROM fecha_emision) = p_anio 
      AND EXTRACT(MONTH FROM fecha_emision) = p_mes;
      
    RAISE NOTICE '>> ROBERT (Banca Seguros): Prima Neta Recaudada = $ %', v_total_prima_masivos;

    -- 4. MÉTRICA DE SANTIAGO (Siniestros Pagados)
    SELECT COALESCE(SUM(p.imp_pago), 0) INTO v_total_siniestros_pagados
    FROM stro_op_pagos p
    JOIN stro_op_header h ON p.id_stro_op = h.id_stro_op
    WHERE EXTRACT(YEAR FROM h.fec_pago) = p_anio 
      AND EXTRACT(MONTH FROM h.fec_pago) = p_mes;
      
    RAISE NOTICE '>> SANTIAGO (Siniestros): Total Indemnizado / Pagado = $ %', v_total_siniestros_pagados;
    
    RAISE NOTICE '=======================================================';
    RAISE NOTICE 'Rentabilidad Bruta Inicial (Comercial + Masivos - Siniestros): $ %', 
                 (v_total_prima_comercial + v_total_prima_masivos) - v_total_siniestros_pagados;
    RAISE NOTICE '=======================================================';
END;
$$;