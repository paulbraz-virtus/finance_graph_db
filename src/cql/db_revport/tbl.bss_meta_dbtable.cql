MATCH (db_Revport:Database {name: 'Revport'})
MERGE (revport_dbo_bss_meta_dbtable:Table {tableId:'revport_dbo_bss_meta_dbtable', fqn:'Revport.dbo.BSS_META_DBTABLE', tableName:'BSS_META_DBTABLE'})
MERGE (db_Revport)-[:CONTAINS]->(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_bssdbtableid', fqn:'revport_dbo_bss_meta_dbtable.BSSDBTABLEID', fieldName:'BSSDBTABLEID'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_tablename', fqn:'revport_dbo_bss_meta_dbtable.TABLENAME', fieldName:'TABLENAME'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_tabledisplayname', fqn:'revport_dbo_bss_meta_dbtable.TABLEDISPLAYNAME', fieldName:'TABLEDISPLAYNAME'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_accesstype', fqn:'revport_dbo_bss_meta_dbtable.ACCESSTYPE', fieldName:'ACCESSTYPE'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_audittable', fqn:'revport_dbo_bss_meta_dbtable.AUDITTABLE', fieldName:'AUDITTABLE'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_accesslowestlevel', fqn:'revport_dbo_bss_meta_dbtable.ACCESSLOWESTLEVEL', fieldName:'ACCESSLOWESTLEVEL'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_databaseid', fqn:'revport_dbo_bss_meta_dbtable.DATABASEID', fieldName:'DATABASEID'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_effective_bsslookupypeid', fqn:'revport_dbo_bss_meta_dbtable.EFFECTIVE_BSSLOOKUPYPEID', fieldName:'EFFECTIVE_BSSLOOKUPYPEID'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_expandable', fqn:'revport_dbo_bss_meta_dbtable.EXPANDABLE', fieldName:'EXPANDABLE'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_viewable', fqn:'revport_dbo_bss_meta_dbtable.VIEWABLE', fieldName:'VIEWABLE'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)
	MERGE (:Field {fieldId:'revport_dbo_bss_meta_dbtable_editable', fqn:'revport_dbo_bss_meta_dbtable.EDITABLE', fieldName:'EDITABLE'})<-[:CONTAINS]-(revport_dbo_bss_meta_dbtable)