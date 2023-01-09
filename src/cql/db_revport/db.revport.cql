MERGE (:Database {name:'Revport'})

// External References
MERGE (db_Revport)-[:USES]->(:Database {name:'rw_sales'})
