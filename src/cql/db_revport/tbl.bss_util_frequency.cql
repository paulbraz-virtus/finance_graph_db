MATCH (db_Revport:Database {name: 'Revport'})
MERGE (revport_dbo_bss_util_frequency:Table {tableId:'revport_dbo_bss_util_frequency', fqn:'Revport.dbo.BSS_UTIL_FREQUENCY', tableName:'BSS_UTIL_FREQUENCY'})
MERGE (db_Revport)-[:CONTAINS]->(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_bssfrequencyid', fqn:'revport_dbo_bss_util_frequency.BSSFREQUENCYID', fieldName:'BSSFREQUENCYID'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_bsslookuptypeid', fqn:'revport_dbo_bss_util_frequency.BSSLOOKUPTYPEID', fieldName:'BSSLOOKUPTYPEID'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_frequencyname', fqn:'revport_dbo_bss_util_frequency.FREQUENCYNAME', fieldName:'FREQUENCYNAME'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_frequencydesc', fqn:'revport_dbo_bss_util_frequency.FREQUENCYDESC', fieldName:'FREQUENCYDESC'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_monthstart', fqn:'revport_dbo_bss_util_frequency.MONTHSTART', fieldName:'MONTHSTART'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_numberofdays', fqn:'revport_dbo_bss_util_frequency.NUMBEROFDAYS', fieldName:'NUMBEROFDAYS'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_numberofweeks', fqn:'revport_dbo_bss_util_frequency.NUMBEROFWEEKS', fieldName:'NUMBEROFWEEKS'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_numberofmonths', fqn:'revport_dbo_bss_util_frequency.NUMBEROFMONTHS', fieldName:'NUMBEROFMONTHS'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_changeddate', fqn:'revport_dbo_bss_util_frequency.CHANGEDDATE', fieldName:'CHANGEDDATE'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_changedby', fqn:'revport_dbo_bss_util_frequency.CHANGEDBY', fieldName:'CHANGEDBY'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_createddate', fqn:'revport_dbo_bss_util_frequency.CREATEDDATE', fieldName:'CREATEDDATE'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_createdby', fqn:'revport_dbo_bss_util_frequency.CREATEDBY', fieldName:'CREATEDBY'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_defaultselection', fqn:'revport_dbo_bss_util_frequency.DEFAULTSELECTION', fieldName:'DEFAULTSELECTION'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_lastdayofweek', fqn:'revport_dbo_bss_util_frequency.LASTDAYOFWEEK', fieldName:'LASTDAYOFWEEK'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)
	MERGE (:Field {fieldId:'revport_dbo_bss_util_frequency_crossmonth', fqn:'revport_dbo_bss_util_frequency.CROSSMONTH', fieldName:'CROSSMONTH'})<-[:CONTAINS]-(revport_dbo_bss_util_frequency)