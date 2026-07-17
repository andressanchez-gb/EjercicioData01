--Lógica: Si se intenta activar (sn_activo = true) una cobertura de asistencia (tb_cobertura), 
--pero la póliza asociada (tb_polizas) ya está caducada respecto a la fecha actual, el trigger no permite 
--la activación.
CREATE OR REPLACE FUNCTION f_validar_vencimiento()
RETURNS TRIGGER AS $$
DECLARE
    v_fecha_fin DATE;
BEGIN
    IF NEW.sn_activo = true THEN
        SELECT fecha_fin_vig INTO v_fecha_fin
        FROM tb_polizas
        WHERE id_poliza = NEW.id_poliza;
        IF v_fecha_fin < CURRENT_DATE THEN
            RAISE EXCEPTION 'No se puede activar la cobertura porque la póliza se encuentra vencida desde el %.', v_fecha_fin;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER trg_bloquear_asistencia_vencida
BEFORE INSERT OR UPDATE ON tb_cobertura
FOR EACH ROW
EXECUTE FUNCTION f_validar_vencimiento();

--create or alter procedure sp_generar_reporte_asistencia_gianni

CREATE OR REPLACE PROCEDURE sp_generar_reporte_asistencia_gianni(
    p_fecha_generado DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
	drop table if exists temp_asistencias_vh;

	create table temp_asistencias_vh as
		select 
		tp.id_poliza, --Póliza
		ti.cod_item,
		tp.nombre_aseg as "Nombre Asegurado",
		tp.apellido_aseg as "Apellido Asegurado", --asegurado
		tp.cedula as "Cédula",
		tp.fecha_inicio_vig as "Inicio Vigencia",
		tp.fecha_fin_vig as "Fin Vigencia",
		tp.sucursal as "Sucursal",
		tp.cod_ramo,
		tr.ramo as "Ramo",
		tag.agrupador_principal as "Agrupador Maestro",
		tag.agrupador_secundario as "Agrupador",
		tp.cod_producto,
		tp.producto as "Producto", 
		ti.marca as "Marca",
		ti.modelo as "Modelo",
		ti.chasis as "Chasis",
		ti.placa as "Placa",
		ti.color as "Color",
		ti.tipo_vh as "Tipo de Vehículo",
		ti.clase_vh as "Clase de Vehículo",
		ti.uso as "Uso",
		ti.anio as "Año",
		ti.direccion as "Dirección"

		from tb_polizas tp
		left join dim_ramo tr on tp.cod_ramo = tr.cod_ramo
		left join dim_agrupador tag on tp.cod_agrupador = tag.cod_agrupador_secundario
		left join tb_items ti on tp.id_poliza = ti.id_poliza 
		left join tb_cobertura tcob on ti.id_poliza = tcob.id_poliza and ti.cod_item = tcob.cod_item

		where tcob.sn_activo = true and tp.fecha_fin_vig >= p_fecha_generado;

END;
$$;
