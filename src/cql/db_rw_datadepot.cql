// DATABASE rw_data_depot
MERGE (db_data_depot:Database {name:'rw_data_depot'})
    MERGE (:Table {name:'t_rw_calendar'})<-[:CONTAINS]-(db_data_depot)
    MERGE (:Table {name:'t_acct_indicators_history'})<-[:CONTAINS]-(db_data_depot)
    MERGE (:Table {name:'t_ofcr_cd'})<-[:CONTAINS]-(db_data_depot)
    MERGE (:Table {name:'t_family_cd'})<-[:CONTAINS]-(db_data_depot)
    MERGE (:Table {name:'t_acct_history'})<-[:CONTAINS]-(db_data_depot)