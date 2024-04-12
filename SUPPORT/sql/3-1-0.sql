
--liquibase formatted sql
--changeset Enovacom:EAI-3.1.0-10
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Suppression triggers compteurs
DROP TRIGGER IF EXISTS update_message ON MESSAGE;

--changeset Enovacom:EAI-3.1.0-11
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Suppression procedure compteurs
DROP PROCEDURE IF EXISTS processStatsUpdate;

--changeset Enovacom:EAI-3.1.0-12
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Suppression triggers compteurs
DROP TRIGGER IF EXISTS insert_message ON MESSAGE;

--changeset Enovacom:EAI-3.1.0-13
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM DATABASECHANGELOG WHERE id = 'EAI-2-53-1-1'
--comment: Suppression triggers compteurs
DROP TRIGGER IF EXISTS delete_message ON MESSAGE;
