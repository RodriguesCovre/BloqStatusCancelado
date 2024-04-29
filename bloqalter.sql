CREATE OR REPLACE TRIGGER AD_BLOQ_ALTER 
BEFORE UPDATE ON AD_DESPFUN
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
/*
 AUTOR: PATRICK
 DATA: 29/04/24
 -------------------------------------------------------
 REQUERENTE E O NUMERO DO CHAMADO: RAFAELA CHAMADO: 22012
 -------------------------------------------------------
 SE STATUS FOR 'C' BLOQUEAR A ALTERAÇÃO DE STATUS
  */
 -- V_MSG VARCHAR2(255);
BEGIN
        IF UPDATING ('STATUS') THEN
            IF :OLD.STATUS = 'C' THEN
            	IF :NEW.STATUS != :OLD.STATUS THEN
            		Raise_Application_Error (-20343, 'Uma vez cancelado sempre candelado!');
            		--V_MSG := 'Não é possível fazer a alteração do status.';
            	END IF;
       		END IF;
       	END IF;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
END; 
