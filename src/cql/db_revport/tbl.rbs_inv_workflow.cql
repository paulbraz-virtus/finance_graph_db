MATCH (db_Revport:Database {name: 'Revport'})
MERGE (revport_dbo_rbs_inv_workflow:Table {tableId:'revport_dbo_rbs_inv_workflow', fqn:'Revport.dbo.RBS_INV_WORKFLOW', tableName:'RBS_INV_WORKFLOW'})
MERGE (db_Revport)-[:CONTAINS]->(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_workflowid', fqn:'revport_dbo_rbs_inv_workflow.WORKFLOWID', fieldName:'WORKFLOWID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bsschannelid', fqn:'revport_dbo_rbs_inv_workflow.BSSCHANNELID', fieldName:'BSSCHANNELID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bsssubchannelid', fqn:'revport_dbo_rbs_inv_workflow.BSSSUBCHANNELID', fieldName:'BSSSUBCHANNELID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bssfirmid', fqn:'revport_dbo_rbs_inv_workflow.BSSFIRMID', fieldName:'BSSFIRMID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bssdivisionid', fqn:'revport_dbo_rbs_inv_workflow.BSSDIVISIONID', fieldName:'BSSDIVISIONID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bssregionid', fqn:'revport_dbo_rbs_inv_workflow.BSSREGIONID', fieldName:'BSSREGIONID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bssbranchid', fqn:'revport_dbo_rbs_inv_workflow.BSSBRANCHID', fieldName:'BSSBRANCHID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_bssdepartmentid', fqn:'revport_dbo_rbs_inv_workflow.BSSDEPARTMENTID', fieldName:'BSSDEPARTMENTID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_workflowstatus', fqn:'revport_dbo_rbs_inv_workflow.WORKFLOWSTATUS', fieldName:'WORKFLOWSTATUS'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_sortorder', fqn:'revport_dbo_rbs_inv_workflow.SORTORDER', fieldName:'SORTORDER'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_inactive', fqn:'revport_dbo_rbs_inv_workflow.INACTIVE', fieldName:'INACTIVE'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_allowrevision', fqn:'revport_dbo_rbs_inv_workflow.ALLOWREVISION', fieldName:'ALLOWREVISION'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_glsent', fqn:'revport_dbo_rbs_inv_workflow.GLSENT', fieldName:'GLSENT'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_allowedstart', fqn:'revport_dbo_rbs_inv_workflow.ALLOWEDSTART', fieldName:'ALLOWEDSTART'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_changeddate', fqn:'revport_dbo_rbs_inv_workflow.CHANGEDDATE', fieldName:'CHANGEDDATE'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_changedby', fqn:'revport_dbo_rbs_inv_workflow.CHANGEDBY', fieldName:'CHANGEDBY'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_cancelflag', fqn:'revport_dbo_rbs_inv_workflow.CANCELFLAG', fieldName:'CANCELFLAG'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_userlock', fqn:'revport_dbo_rbs_inv_workflow.USERLOCK', fieldName:'USERLOCK'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_processcontrol_groupid', fqn:'revport_dbo_rbs_inv_workflow.PROCESSCONTROL_GROUPID', fieldName:'PROCESSCONTROL_GROUPID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_viewcontrol_groupid', fqn:'revport_dbo_rbs_inv_workflow.VIEWCONTROL_GROUPID', fieldName:'VIEWCONTROL_GROUPID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_reqreason', fqn:'revport_dbo_rbs_inv_workflow.REQREASON', fieldName:'REQREASON'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_type_bsslookuptypeid', fqn:'revport_dbo_rbs_inv_workflow.TYPE_BSSLOOKUPTYPEID', fieldName:'TYPE_BSSLOOKUPTYPEID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_workflowrestart', fqn:'revport_dbo_rbs_inv_workflow.WORKFLOWRESTART', fieldName:'WORKFLOWRESTART'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_postadjustment', fqn:'revport_dbo_rbs_inv_workflow.POSTADJUSTMENT', fieldName:'POSTADJUSTMENT'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_maker_checker', fqn:'revport_dbo_rbs_inv_workflow.MAKER_CHECKER', fieldName:'MAKER_CHECKER'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_finalizeinvoice', fqn:'revport_dbo_rbs_inv_workflow.FINALIZEINVOICE', fieldName:'FINALIZEINVOICE'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_resend', fqn:'revport_dbo_rbs_inv_workflow.RESEND', fieldName:'RESEND'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_color_bsslookuptypeid', fqn:'revport_dbo_rbs_inv_workflow.COLOR_BSSLOOKUPTYPEID', fieldName:'COLOR_BSSLOOKUPTYPEID'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)
	MERGE (:Field {fieldId:'revport_dbo_rbs_inv_workflow_comparisonstatus', fqn:'revport_dbo_rbs_inv_workflow.COMPARISONSTATUS', fieldName:'COMPARISONSTATUS'})<-[:CONTAINS]-(revport_dbo_rbs_inv_workflow)