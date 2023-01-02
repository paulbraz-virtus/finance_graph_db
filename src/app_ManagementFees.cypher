// PRE-REQUISITES:
//  * FinanceOrganization.cypher

MERGE (:Domain {domainId:'0', name:'Finance'})<-[:SUBDOMAIN_OF]-(:Domain {domainId:'0.1', name:'Revenue'})

MATCH (revenue:Domain {domainId:'0.1'})
MERGE (revenue)<-[:PROCESS_OF]-(mf:BusinessProcess {businessProcessId:0, name:'Management Fees'})
MERGE (mfapp:App {appId:0, name:'Management Fees App'})-[:APP_OF]->(mf)

// Ownership
MATCH (lina_patel:Person {name:'Lina Patel'})
MATCH (mf:App {appId:0})
MATCH (bpmf:BusinessProcess {businessProcessId:0})
MATCH (rev:Domain {domainId:'0.1'})
MERGE (lina_patel)-[:BUSINESS_OWNER]->(mf)
MERGE (lina_patel)-[:BUSINESS_OWNER]->(bpmf)
MERGE (lina_patel)-[:BUSINESS_OWNER]->(bpmf)
MERGE (lina_patel)-[:BUSINESS_OWNER]->(rev)

// files used by the management fees app
MATCH (mfapp:App {appId:0})
MERGE (mtdana:File {fileId:0, name:'MTDANA', longName:'MTDANA values mmdd import.xls'})-[:DATA_SOURCE_FOR]->(mfapp)
MERGE (etf:File {fileId:1, name:'ETFPostgSht', longName:'ETF posting sheet mm.yyyy import.xlsx'})-[:DATA_SOURCE_FOR]->(mfapp)
MERGE (jeff:File {fileId:2, name:'JeffersonANA', longName:'JEFFERSON ANA mmyy VVIT_AVGDLY_MTH import.xlsx'})-[:DATA_SOURCE_FOR]->(mfapp)
MERGE (ps:File {fileId:3, name:'CorpPostgSht', longName:'Posting Sheet Corporate mm.dd.yy import.xlsx'})-[:DATA_SOURCE_FOR]->(mfapp)
MERGE (ucit:File {fileId:4, name:'UCITS_ANA', longName:'UCITT_IMPORT template as mmyy.xlsx'})-[:DATA_SOURCE_FOR]->(mfapp)

// fields in the MTD ANA file
MATCH (mtdana:File {fileId:0})
MERGE (mtdana)-[:CONTAINS]->(ana1:Field {fieldId:0, name:'ANA', tab:'Extract', description:'Class level ANA'})
MERGE (mtdana)-[:CONTAINS]->(lookup:Field {fieldId:1, name:'Lookup', tab:'Extract', description:'Used as lookup key for class level ANA'})
MERGE (mtdana)-[:CONTAINS]->(PortId:Field {fieldId:2, name:'PortId', tab:'FundlevelANA', description: 'Used as lookup key for fund level ANA'})
MERGE (mtdana)-[:CONTAINS]->(TotalANA:Field {fieldId:3, name:'TotalANA', tab:'FundlevelANA', description:'Fund level ANA'})
MERGE (mtdana)-[:CONTAINS]->(TotalManagedANA:Field {fieldId:4, name:'Total ManagedANA', tab:'FundlevelANA', description:'Fund ANA for closed-end funds'})
MERGE (mtdana)-[:CONTAINS]->(FundID:Field {fieldId:5, name:'Fund ID', tab:'Sleeve Reporting', description:'The fund and sleeve associated with the ANA'})
MERGE (mtdana)-[:CONTAINS]->(Advisor:Field {fieldId:6, name:'Advisor', tab:'Sleeve Reporting', description:'The sub-advisor a percentage of the fund ANA should be allocated to'})
MERGE (mtdana)-[:CONTAINS]->(ana2:Field {fieldId:7, name:'ANA', tab:'Sleeve Reporting', description:'ANA used for multi-manager accounts'})

// fields in the UCITS file
MATCH (ucit:File {fileId:4})
MERGE (ucit)-[:CONTAINS {tab:'Posting Sheet'}]->(ufundcd:Field {fieldId:8, name:'FundCode', description: 'Used as lookup key'})
MERGE (ucit)-[:CONTAINS {tab:'Posting Sheet'}]->(uana:Field {fieldId:9, name:'ANA', description: 'Used for both fund-level and class-level ANA UCITS'})

// reference data
MATCH (f:Field) WHERE fieldId>=10 AND fieldId<=21 RETURN f
MATCH (mfapp:App {appId:0})
MERGE (refdata:File {fileId:5, longName:'MgtFeeRefData.csv', name:'MgtFeeRefData'})-[:DATA_SOURCE_FOR]->(mfapp)
MERGE (refdata)-[:CONTAINS]->(WorktagCustomerReferenceId:Field {fieldId:10, name:'WorktagCustomerReferenceId'})
MERGE (refdata)-[:CONTAINS]->(FundName:Field {fieldId:11, name:'FundName'})
MERGE (refdata)-[:CONTAINS]->(AdminFeeSource:Field {fieldId:12, name:'AdminFeeSource'})
MERGE (refdata)-[:CONTAINS]->(TAFeeSource:Field {fieldId:13, name:'TAFeeSource'})
MERGE (refdata)-[:CONTAINS]->(IntExtSubadvisor:Field {fieldId:14, name:'IntExtSubadvisor'})
MERGE (refdata)-[:CONTAINS]->(InternalCompany:Field {fieldId:15, name:'InternalCompany'})
MERGE (refdata)-[:CONTAINS]->(Advisor:Field {fieldId:16, name:'Advisor'})
MERGE (refdata)-[:CONTAINS]->(FundCd:Field {fieldId:17, name:'FundCd'})
MERGE (refdata)-[:CONTAINS]->(ClassCd:Field {fieldId:18, name:'ClassCd'})
MERGE (refdata)-[:CONTAINS]->(BNYRefFundCd:Field {fieldId:19, name:'BNYRefFundCd'})
MERGE (refdata)-[:CONTAINS]->(BNYClassCd:Field {fieldId:20, name:'BNYClassCd'})
MERGE (refdata)-[:CONTAINS]->(BNYRefClass:Field {fieldId:21, name:'BNYRefClass'})

// derived ANA fields
MATCH (mfapp:App {appId:0})
MERGE (mfapp)-[:DERIVES]->(BNYANAFundLvl:Field {fieldId:22, name:'BNYANAFundLvl'})
MERGE (mfapp)-[:DERIVES]->(BNYANAClassLvl:Field {fieldId:23, name:'BNYANAClassLvl'})

// arguments for derived ANA fields
MATCH (BNYANAFundLvl:Field {fieldId:22})
MATCH (PortId:Field {fieldId:2})
MATCH (TotalANA:Field {fieldId:3})
MATCH (TotalManagedANA:Field {fieldId:4})
MATCH (ufundcd:Field {fieldId:8})
MATCH (uana:Field {fieldId:9})

MERGE(PortId)-[:USED_BY]->(BNYANAFundLvl)
MERGE(TotalANA)-[:USED_BY]->(BNYANAFundLvl)
MERGE(TotalManagedANA)-[:USED_BY]->(BNYANAFundLvl)
MERGE(ufundcd)-[:USED_BY]->(BNYANAFundLvl)
MERGE(uana)-[:USED_BY]->(BNYANAFundLvl)

//MATCH (ana1:Field {fieldId:0})
//MATCH (lookup:Field {fieldId:1})
