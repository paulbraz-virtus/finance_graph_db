MATCH (domain_finance:Domain {name:'Finance'})      // domain_finamce.cql
MATCH (domain_revenue:Domain {name:'Revenue'})      // domain_finamce.cql
MATCH (domain_expenses:Domain {name:'Expenses'})    // domain_finamce.cql
MATCH (lina:Person {name:'Lina Patel'})             // org_finance.cql
MATCH (paul:Person {name:'Paul Brazdzionis'})       // org_it_apps.cql

// Virtus
MERGE (:Virtus)

// business processes
MERGE(busproc_mgt_fee:BusinessProcess {businessProcessId:0, name:'Management Fees'})
    MERGE (busproc_mgt_fee)-[:BUSINESS_OWNER]->(lina)
    MERGE (domain_revenue)-[:OWNS]->(busproc_mgt_fee)
MERGE(busproc_aum:BusinessProcess {businessProcessId:1, name:'AUM'})
    MERGE (domain_finance)-[:OWNS]->(busproc_aum)

// affiliates
MERGE (:Affiliate {name:'Seix'})
MERGE (:Affiliate {name:'Kayne'})
MERGE (:Affiliate {name:'Silvant'})
MERGE (:Affiliate {name:'Ceredex'})
MERGE (:Affiliate {name:'SGA'})
MERGE (:Affiliate {name:'Duff and Phelps'})
MERGE (:Affiliate {name:'Stone Harbor'})

// third parties
MERGE (ibm:Vendor {name:'IBM'})-[:OWNS]->(tm1:System {name:'TM1'})
    MERGE(paul)<-[:TECHNICAL_PRODUCT_OWNER]-(tm1)
    MERGE(domain_finance)-[:OWNS]->(tm1)
MERGE (br:Vendor {name:'Broadridge'})-[:OWNS]->(revport:System {name:'Revport'})
    SET revport.description='Calculates management fees for institutional accounts.'
    MERGE(lina)<-[:PRODUCT_OWNER]-(revport)
    MERGE(paul)<-[:TECHNICAL_PRODUCT_OWNER]-(revport)
    MERGE(domain_revenue)-[:OWNS]->(revport)
    MERGE (busproc_mgt_fee)-[:USES]->(revport)
MERGE (sap:Vendor {name:'SAP'})
    MERGE (sap)-[:OWNS]->(concur:System {name:'Concur', description:'Travel Expenses'})
    MERGE(paul)<-[:TECHNICAL_PRODUCT_OWNER]-(sap)
    MERGE(domain_expenses)-[:OWNS]->(sap)
MERGE (vsp:Vendor {name:'SalesPage'})
    MERGE (vsp)-[:OWNS]->(sp:System {name:'SalesPage', description:'CRM for Retail Business'})
MERGE (ship:Vendor {name:'SHIP'})
    MERGE (ship)-[:OWNS]->(:System {name:'VBAM', description:'VBAM'})
MERGE (:Vendor {name:'SS&C'})-[:OWNS]->(:System {name:'GWP', description:'Global Wealth Platform'})
MERGE (bny:Vendor {name:'BNY'})
    MERGE (bny)-[:OWNS]->(egl:System {name:'Eagle'})

// applications
MERGE (rpa:App {appId:'app_finrpa', name:'Revport Admin App'})
    MERGE (rpa)-[:PRODUCT_OWNER]->(lina)
    MERGE (rpa)-[:TECHNICAL_PRODUCT_OWNER]->(paul)
    MERGE (domain_revenue)-[:OWNS]->(rpa)
MERGE (app_mgt_fee:App {appId:'app_finmf', name:'Management Fees App'})
    SET app_mgt_fee.description='Calculates management fees for retail accounts.'
    MERGE (app_mgt_fee)-[:PRODUCT_OWNER]->(lina)
    MERGE (app_mgt_fee)-[:TECHNICAL_PRODUCT_OWNER]->(paul)
    MERGE (busproc_mgt_fee)-[:USES]->(app_mgt_fee)
    MERGE (domain_revenue)-[:OWNS]->(app_mgt_fee)
MERGE (comapp:App {appId:'app_fincomm', name:'Commissions App', repo:'TBD', status:'re-write'})
    SET comapp.description='Amortizes commission ammounts over 18 months and then sends transactions to Workday'
    MERGE (domain_finance)-[:OWNS]->(comapp)
    MERGE (comapp)-[:TECHNICAL_PRODUCT_OWNER]->(paul)
MERGE (st_tax_app:App {appId:'app_finstx', name:'State Tax App', description:'Calculates state tax'})
    MERGE (domain_finance)-[:OWNS]->(st_tax_app)
    MERGE (st_tax_app)-[:TECHNICAL_PRODUCT_OWNER]-(paul)