// RUN THIS FIRST
// This script establishes the people, cost-centers and domains in the Finance Organization
MERGE (finance_domain:Domain {domainId:'0', name:'Finance'})
MERGE (:Domain {domainId:'0.1', name:'Revenue'})-[:SUBDOMAIN_OF]->(finance_domain)

// cost centers
MERGE (cc1110:CostCenter {costCenterId:1110, name:'Financial Operations'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1100:CostCenter {costCenterId:1100, name:'Finance - management'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1115:CostCenter {costCenterId:1115, name:'Treasury'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1120:CostCenter {costCenterId:1120, name:'Financial planning and analysis'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1125:CostCenter {costCenterId:1125, name:'Procurement'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1130:CostCenter {costCenterId:1130, name:'Technical accounting and regulatory reporting'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1140:CostCenter {costCenterId:1140, name:'Tax compliance'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1150:CostCenter {costCenterId:1150, name:'Investor relations'})-[:COST_CENTER_OF]->(finance_domain)
MERGE (cc1160:CostCenter {costCenterId:1160, name:'Internal audit'})-[:COST_CENTER_OF]->(finance_domain)

// people
MERGE(michael_angerthal:Person {name:'Michael Angerthal', title:'Executive Vice President, CFO'})
MERGE(danielle_vasilakos:Person {name:'Danielle Vasilakos', title:'Director Internal Audit'})-[:COST_CENTER]->(cc1160)
MERGE(henry_hardaway:Person {name:'Henry Hardaway', title:'Managing Dir, Strategic Bus Dev'})
MERGE(david_hanley:Person {name:'David Hanley', title:'SVP - Corporate Finance'})
MERGE(mark_moots:Person {name:'Mark Moots', title:'VP, Financial Operations'})-[:COST_CENTER]->(cc1110)

MERGE(nicole_stephenson:Person {name:'Nicole Stephenson', title:'AVP, Treasury & Expenses'})
MERGE(lina_patel:Person {name:'Lina Patel', title:'AVP, Financial Operations'})
MERGE(robyn_battles:Person {name:'Robyn Battles', title:'Senior Accounting Analyst'})

MERGE(david_pellerin:Person {name:'David Pellerin', title:'SVP, Corporate Strategy & Risk Management'})
MERGE(tina_long:Person {name:'Tina Long', title:'AVP, Project Management'})

MERGE(carl_sun:Person {name:'Carl Sun', title:'Vice President, Technical Accounting & Regulatory Reporting'})-[:COST_CENTER]->(cc1130)
MERGE(scott_hogan:Person {name:'Scott Hogan', title:'VP Financial Planning and Analysis'})-[:COST_CENTER]->(cc1120)
MERGE(christopher_palumbo:Person {name:'Christopher Palumbo', title:'VP Corporate Finance'})

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


