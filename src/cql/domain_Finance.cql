// PREREQUISITES:
//  NONE

// The various data domains and sub-domains owned by Finance
MERGE (operations_domain:Domain {domainId:'OPS', name:'Operations'})
    MERGE (OPS_POS:Domain {domainId:'OPS_POS', name:'Positions'})-[:PARENT]->(operations_domain)
    MERGE (OPS_TRX:Domain {domainId:'OPS_TRX', name:'Transactions'})-[:PARENT]->(operations_domain)
MERGE (finance_domain:Domain {domainId:'FIN', name:'Finance'})
    MERGE (:Domain {domainId:'FINREV', name:'Revenue'})-[:PARENT]->(finance_domain)
    MERGE (:Domain {domainId:'FINCFLW', name:'Cash Flows'})-[:PARENT]->(finance_domain)
    MERGE (:Domain {domainId:'FINCUST', name:'Customers'})-[:PARENT]->(finance_domain)
    MERGE (:Domain {domainId:'FINCPMT', name:'Commission Payments'})-[:PARENT]->(finance_domain)
    MERGE (FINEXP:Domain {domainId:'FINEXP', name:'Expenses'})-[:PARENT]->(finance_domain)
        //MERGE (:Domain {domainId:'FINTEXP', name:'Travel Expenses'})-[:PARENT]->(FINEXP)
        //MERGE (:Domain {domainId:'FINMEXP', name:'Marketing Expenses'})-[:PARENT]->(FINEXP)
    MERGE (:Domain {domainId:'FINFXRT', name:'FX Rates'})-[:PARENT]->(finance_domain)
    MERGE (FINAUM:Domain {domainId:'FINAUM', name:'AUM'})-[:PARENT]->(finance_domain)
        MERGE(FINAUM)-[:USES]->(OPS_POS)
        MERGE(FINAUM)-[:USES]->(OPS_TRX)
