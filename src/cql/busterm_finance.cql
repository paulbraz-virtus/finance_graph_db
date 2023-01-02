// Thinking to keep all business terms in a centralized file per organization for now
// PREREQUISITES:
//  - org_Finance.cql
MATCH (domain:Domain {name:'Finance'})

// Terms found in management fees
MERGE (ana:BusinessTerm {businessTermId:'FBT0001', abbrieviation:'ANA', term:'Average net assets'})<-[:OWNS]-(domain)
    SET ana.definition = 'Average net assets of a given fund for a given period of time'
MERGE (fur:BusinessTerm {businessTermId:'FBT0002', abbrieviation:'FUR', term:'Funds Under Reimbursement'})<-[:OWNS]-(domain)
    SET fur.definition = 'Fund pays fees and gets reimbursed by Virtus'
MERGE (mtdana:BusinessTerm {businessTermId:'FBT0003', abbrieviation:'MTDANA', term:'Month to date average net assets'})<-[:OWNS]-(domain)
    SET mtdana.definition = 'Average net assets - month to date'
    MERGE (mtdana)-[:RELATED]->(ana)
MERGE (ta:BusinessTerm {businessTermId:'FBT0004', abbrieviation:'TA', term:'Transfer Agent'})<-[:OWNS]-(domain)
    SET ta.definition = ''
MERGE (ucits:BusinessTerm {businessTermId:'FBT0005', abbrieviation:'UCITS', term:'Undertakings for the Collective Investment in Transferable Securities'})<-[:OWNS]-(domain)
    SET ucits.definition = ''
MERGE (aum:BusinessTerm {businessTermId:'FBT0006', abbrieviation:'AUM', term:'Assets Under Management'})<-[:OWNS]-(domain)
    SET aum.definition = ''
