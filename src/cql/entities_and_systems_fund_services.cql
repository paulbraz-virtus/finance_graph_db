
// BNY Business Processes
MERGE (:BusinessProcess {name:'Back End Compliance testing'})
MERGE (val_rptg:BusinessProcess {name:'MF, ETF, UCIT, Valuation and Reporting'})
MERGE (mpt:BusinessProcess {name:'Monthly Price testing'})
MERGE (nfv:BusinessProcess {name:'Nightly Fair Valuation'})
MERGE (exp:BusinessProcess {name:'Exposure across products'})
MERGE (lvlg:BusinessProcess {name:'Leveling'})
MERGE (:BusinessProcess {name:'Sub Advisor Reporting'})
MERGE (:BusinessProcess {name:'Client Billing, and statements'})

// Data consumers
// third parties
MERGE (:Entity:ThirdParty {name:'Morningstar', description:'Survey company'})
MERGE (:Entity:ThirdParty {name:'Lipper', description:'Survey company'})

// subject areas
//Fund SOIs and Financials
//Fund Board Materials
//Virtus Financials

// Applications
MERGE (hub:App {name:'FA HUB'})
    MERGE (val_rptg)-[:USES]->(hub)
    MERGE (mpt)-[:USES]->(hub)
    MERGE (nfv)-[:USES]->(hub)
    MERGE (exp)-[:USES]->(hub)
    MERGE (lvlg)-[:USES]->(hub)

// Systems
MERGE (:System {name:'Base 2', description:'Security Level Attribution System'})

//Public Holdings
// * MF Holdings on web
// * RFP
// * Seix Client Reporting




