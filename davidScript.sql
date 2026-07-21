CREATE OR REPLACE FUNCTION fn_actualizar_estado_crm()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.hit_ratio > 85 AND NEW.estado = 'Abierto' THEN
        NEW.estado := 'Cerrado Ganado';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trg_actualizar_estado_crm
BEFORE INSERT OR UPDATE
ON kpi_crm
FOR EACH ROW
EXECUTE FUNCTION fn_actualizar_estado_crm();