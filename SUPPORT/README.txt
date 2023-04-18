1. install liquibase for linux : 4.2.1 

2. dans le repertoire d'installation de liquibase (appellé liquibase): 

-> copier : 
a. master-changelog-postgres.xml
b. liquibase.properties (à complèter avec les infos de connexion se trouvant dans EaiDS.properties
c. le driver de posgres (.jar qui doit se trouver dans eai\ext\lib)
d. le dossier sql contenant le fichier passe-triggers.sql


3. ouvrir invite commande et lancer la commande 'liquibase update'
4. Si dans les logs : tu as bien  Liquibase command 'update' was executed successfully.
Alors : lancer la commande liquibase clear-checksums

5. Démarre eai
6. quand tout est ok désinstaller liquibase en cliquant lanant le uninstall.exe

