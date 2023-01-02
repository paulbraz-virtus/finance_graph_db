// This script establishes the people, cost-centers and domains in the Finance Organization
// PRE-REQUISITES
//    - domain_Finance.cql
MATCH (finance_domain:Domain {name:'Finance'})
MATCH (revenue_domain:Domain {name:'Revenue'})

// cost centers
MERGE (cc1110:CostCenter {costCenterId:1110, name:'Financial Operations'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1100:CostCenter {costCenterId:1100, name:'Finance - management'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1115:CostCenter {costCenterId:1115, name:'Treasury'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1120:CostCenter {costCenterId:1120, name:'Financial planning and analysis'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1125:CostCenter {costCenterId:1125, name:'Procurement'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1130:CostCenter {costCenterId:1130, name:'Technical accounting and regulatory reporting'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1140:CostCenter {costCenterId:1140, name:'Tax compliance'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1150:CostCenter {costCenterId:1150, name:'Investor relations'})<-[:CHARGES_TO]-(finance_domain)
MERGE (cc1160:CostCenter {costCenterId:1160, name:'Internal audit'})<-[:CHARGES_TO]-(finance_domain)

// people
MERGE(michael_angerthal:Person {name:'Michael Angerthal', title:'Executive Vice President, CFO'})
MERGE(danielle_vasilakos:Person {name:'Danielle Vasilakos', title:'Director Internal Audit'})-[:CHARGES_TO]->(cc1160)
MERGE(henry_hardaway:Person {name:'Henry Hardaway', title:'Managing Dir, Strategic Bus Dev'})
MERGE(david_hanley:Person {name:'David Hanley', title:'SVP - Corporate Finance'})

MERGE(mark_moots:Person {name:'Mark Moots', title:'VP, Financial Operations'})-[:CHARGES_TO]->(cc1110)
MERGE(nicole_stephenson:Person {name:'Nicole Stephenson', title:'AVP, Treasury & Expenses'})
MERGE(lina_patel:Person {name:'Lina Patel', title:'AVP, Financial Operations'})
MERGE(robyn_battles:Person {name:'Robyn Battles', title:'Senior Accounting Analyst'})

MERGE(david_pellerin:Person {name:'David Pellerin', title:'SVP, Corporate Strategy & Risk Management'})
MERGE(tina_long:Person {name:'Tina Long', title:'AVP, Project Management'})

MERGE(carl_sun:Person {name:'Carl Sun', title:'Vice President, Technical Accounting & Regulatory Reporting'})-[:CHARGES_TO]->(cc1130)
MERGE(scott_hogan:Person {name:'Scott Hogan', title:'VP Financial Planning and Analysis'})-[:CHARGES_TO]->(cc1120)
MERGE(christopher_palumbo:Person {name:'Christopher Palumbo', title:'VP Corporate Finance'})

// organizations
MERGE(corporate_finance:Organization {name:'Corporate Finance'})
MERGE(corporate_finance)-[:IN]->(finance_domain)
MERGE(david_hanley)-[:WORKS_IN]->(corporate_finance)

MERGE(financial_operations:Organization {name:'Financial Operations'})
MERGE(financial_operations)-[:CHILD]->(corporate_finance)
MERGE(mark_moots)-[:WORKS_IN]->(financial_operations)
MERGE(nicole_stephenson)-[:WORKS_IN]->(financial_operations)
MERGE(lina_patel)-[:WORKS_IN]->(financial_operations)
MERGE(robyn_battles)-[:WORKS_IN]->(financial_operations)

// domains owners
MERGE (lina_patel)-[:OWNS]->(revenue_domain)
MERGE (david_hanley)-[:OWNS]->(finance_domain)

// reporting relationships
MERGE(henry_hardaway)-[:REPORTS_TO]->(michael_angerthal)
MERGE(danielle_vasilakos)-[:REPORTS_TO]->(michael_angerthal)
MERGE(david_hanley)-[:REPORTS_TO]->(michael_angerthal)
MERGE(mark_moots)-[:REPORTS_TO]->(david_hanley)
MERGE(carl_sun)-[:REPORTS_TO]->(david_hanley)
MERGE(scott_hogan)-[:REPORTS_TO]->(david_hanley)
MERGE(christopher_palumbo)-[:REPORTS_TO]->(david_hanley)

MERGE(nicole_stephenson)-[:REPORTS_TO]->(mark_moots)
MERGE(lina_patel)-[:REPORTS_TO]->(mark_moots)
MERGE(robyn_battles)-[:REPORTS_TO]->(lina_patel)

MERGE(tina_long)-[:REPORTS_TO]->(david_pellerin)
MERGE(tina_long)-[:WORKS_WITH]->(lina_patel)