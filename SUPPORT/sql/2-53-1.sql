-- liquibase formatted sql


--changeset Enovacom:EAI-2-53-1-2 endDelimiter:^/$
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Ajout trigger insert message
CREATE FUNCTION insert_message() RETURNS trigger  LANGUAGE plpgsql AS '
    BEGIN
        CALL processStatsUpdate(79, NEW.SUPPRIME, NEW.ETATTRAIT, NEW.PK_POSITION, NEW.FK_TYPEDOC, NEW.FK_APPLISRC, NEW.FK_APPLIDST);
    END';

CREATE OR REPLACE TRIGGER insert_message AFTER INSERT ON MESSAGE FOR EACH ROW EXECUTE FUNCTION insert_message();


--changeset Enovacom:EAI-2-53-1-3 endDelimiter:^/$
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Ajout trigger update message
CREATE FUNCTION update_message() RETURNS trigger  LANGUAGE plpgsql AS '
    DECLARE codeTransition int DEFAULT 43;
    BEGIN
        codeTransition = codeTransition + OLD.SUPPRIME * 6;
        CASE OLD.ETATTRAIT
                WHEN ''OK'' THEN codeTransition = codeTransition + 12;
                WHEN ''ERREUR'' THEN codeTransition = codeTransition + 24;
        ELSE BEGIN
        END;
        END CASE;
        CALL processStatsUpdate(codeTransition, NEW.SUPPRIME, NEW.ETATTRAIT, NEW.PK_POSITION, NEW.FK_TYPEDOC, NEW.FK_APPLISRC, NEW.FK_APPLIDST);
END';

CREATE OR REPLACE TRIGGER update_message AFTER UPDATE ON MESSAGE FOR EACH ROW EXECUTE FUNCTION update_message();


--changeset Enovacom:EAI-2-53-1-4 endDelimiter:^/$
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Ajout trigger delete message
CREATE FUNCTION delete_message() RETURNS trigger  LANGUAGE plpgsql AS '
    BEGIN
        CALL processStatsUpdate(85, OLD.SUPPRIME, OLD.ETATTRAIT, OLD.PK_POSITION, OLD.FK_TYPEDOC, OLD.FK_APPLISRC, OLD.FK_APPLIDST);
    END';

CREATE OR REPLACE TRIGGER delete_message AFTER DELETE ON MESSAGE FOR EACH ROW EXECUTE FUNCTION update_message();


--changeset Enovacom:EAI-2-53-1-5 endDelimiter:^/$
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: drop trigger insert message
DROP TRIGGER IF EXISTS insert_message ON MESSAGE;

--changeset Enovacom:EAI-2-53-1-6 endDelimiter:^/$
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: drop trigger update message
DROP TRIGGER IF EXISTS update_message ON MESSAGE;

--changeset Enovacom:EAI-2-53-1-7 endDelimiter:^/$
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: drop trigger delete message
DROP TRIGGER IF EXISTS delete_message ON MESSAGE;
