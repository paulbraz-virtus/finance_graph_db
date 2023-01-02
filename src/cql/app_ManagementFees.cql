MATCH (bt_ana:BusinessTerm {businessTermId:'FBT0001'})      // busterm_finance.cql
MATCH (bt_fur:BusinessTerm {businessTermId:'FBT0002'})
MATCH (bt_mtdana:BusinessTerm {businessTermId:'FBT0003'})
MATCH (bt_ta:BusinessTerm {businessTermId:'FBT0004'})
MATCH (bt_ucits:BusinessTerm {businessTermId:'FBT0005'})

MATCH (app_mgt_fee:App {name:'Management Fees App'})

// files used by the management fees app
MERGE (mtdana:File {fileId:0, name:'MTDANA', longName:'MTDANA values mmdd import.xls'})
    MERGE (bt_ana)-[:DEFINES]->(mtdana)
    MERGE (mtdana)-[:INPUT]->(app_mgt_fee)
MERGE (etf:File {fileId:1, name:'ETFPostgSht', longName:'ETF posting sheet mm.yyyy import.xlsx'})
    MERGE (etf)-[:INPUT]->(app_mgt_fee)
MERGE (jeff:File {fileId:2, name:'JeffersonANA', longName:'JEFFERSON ANA mmyy VVIT_AVGDLY_MTH import.xlsx'})
    MERGE (jeff)-[:INPUT]->(app_mgt_fee)
    MERGE (bt_ana)-[:DEFINES]->(jeff)
MERGE (ps:File {fileId:3, name:'CorpPostgSht', longName:'Posting Sheet Corporate mm.dd.yy import.xlsx'})
    MERGE (ps)-[:INPUT]->(app_mgt_fee)
MERGE (ucit:File {fileId:4, name:'UCITS_ANA', longName:'UCITT_IMPORT template as mmyy.xlsx'})
    MERGE (ucit)-[:INPUT]->(app_mgt_fee)
    MERGE (bt_ana)-[:DEFINES]->(ucit)
    MERGE (bt_ucits)-[:DEFINES]->(ucit)
MERGE (refdata:File {fileId:5, longName:'MgtFeeRefData.csv', name:'MgtFeeRefData'})
    MERGE (refdata)-[:INPUT]->(app_mgt_fee)

// fields in the MTD ANA file
MERGE (mtdana)-[:CONTAINS]->(fld_ana1:Field {fieldId:0, name:'ANA', tab:'Extract', description:'Class level ANA'})
    MERGE (bt_ana)-[:DEFINES]->(fld_ana1)
MERGE (mtdana)-[:CONTAINS]->(lookup:Field {fieldId:1, name:'Lookup', tab:'Extract', description:'Used as lookup key for class level ANA'})
MERGE (mtdana)-[:CONTAINS]->(fld_PortId:Field {fieldId:2, name:'PortId', tab:'FundlevelANA', description: 'Used as lookup key for fund level ANA'})
MERGE (mtdana)-[:CONTAINS]->(fld_TotalANA:Field {fieldId:3, name:'TotalANA', tab:'FundlevelANA', description:'Fund level ANA'})
    MERGE (bt_ana)-[:DEFINES]->(fld_TotalANA)
MERGE (mtdana)-[:CONTAINS]->(fld_TotalManagedANA:Field {fieldId:4, name:'Total ManagedANA', tab:'FundlevelANA', description:'Fund ANA for closed-end funds'})
    MERGE (bt_ana)-[:DEFINES]->(fld_TotalManagedANA)
MERGE (mtdana)-[:CONTAINS]->(FundID:Field {fieldId:5, name:'Fund ID', tab:'Sleeve Reporting', description:'The fund and sleeve associated with the ANA'})
MERGE (mtdana)-[:CONTAINS]->(Advisor:Field {fieldId:6, name:'Advisor', tab:'Sleeve Reporting', description:'The sub-advisor a percentage of the fund ANA should be allocated to'})
MERGE (mtdana)-[:CONTAINS]->(ana2:Field {fieldId:7, name:'ANA', tab:'Sleeve Reporting', description:'ANA used for multi-manager accounts'})
    MERGE (bt_ana)-[:DEFINES]->(ana2)

// fields in the UCITS file
MERGE (ucit)-[:CONTAINS {tab:'Posting Sheet'}]->(fld_ucit_fundcd:Field {fieldId:8, name:'FundCode', description: 'Used as lookup key'})
MERGE (ucit)-[:CONTAINS {tab:'Posting Sheet'}]->(fld_ucit_ana:Field {fieldId:9, name:'ANA', description: 'Used for both fund-level and class-level ANA UCITS'})
    MERGE (bt_ana)-[:DEFINES]->(fld_ucit_ana)
    MERGE (bt_ucits)-[:DEFINES]->(fld_ucit_ana)

// reference data
MERGE (refdata)-[:CONTAINS]->(WorktagCustomerReferenceId:Field {fieldId:10, name:'WorktagCustomerReferenceId'})
MERGE (refdata)-[:CONTAINS]->(FundName:Field {fieldId:11, name:'FundName'})
MERGE (refdata)-[:CONTAINS]->(AdminFeeSource:Field {fieldId:12, name:'AdminFeeSource'})
MERGE (refdata)-[:CONTAINS]->(TAFeeSource:Field {fieldId:13, name:'TAFeeSource'})
    MERGE (bt_ta)-[:DEFINES]->(TAFeeSource)
MERGE (refdata)-[:CONTAINS]->(IntExtSubadvisor:Field {fieldId:14, name:'IntExtSubadvisor'})
MERGE (refdata)-[:CONTAINS]->(InternalCompany:Field {fieldId:15, name:'InternalCompany'})
MERGE (refdata)-[:CONTAINS]->(Advisor2:Field {fieldId:16, name:'Advisor'})
MERGE (refdata)-[:CONTAINS]->(FundCd:Field {fieldId:17, name:'FundCd'})
MERGE (refdata)-[:CONTAINS]->(ClassCd:Field {fieldId:18, name:'ClassCd'})
MERGE (refdata)-[:CONTAINS]->(BNYRefFundCd:Field {fieldId:19, name:'BNYRefFundCd'})
MERGE (refdata)-[:CONTAINS]->(BNYClassCd:Field {fieldId:20, name:'BNYClassCd'})
MERGE (refdata)-[:CONTAINS]->(BNYRefClass:Field {fieldId:21, name:'BNYRefClass'})

// derived ANA fields
// Fund Level ANA
MERGE (fld_BNYANAFundLvl:Field {fieldId:22, name:'BNYANAFundLvl'})
MERGE (func_ana_fund_lvl:Formula {functionId:'0', name:'BNYANAFundLvl'})
    SET func_ana_fund_lvl.description = "ANA aggregated at the fund level and composed by merging data for standard funds, closed-end funds and UCITS"
    MERGE (app_mgt_fee)-[:EXECUTES]->(func_ana_fund_lvl)
    MERGE (bt_ana)-[:DEFINES]->(func_ana_fund_lvl)
    MERGE (bt_ana)-[:DEFINES]->(fld_BNYANAFundLvl)
    MERGE (func_ana_fund_lvl)-[:OUTPUTS]->(fld_BNYANAFundLvl)

    // arguments for func_ana_fund_lvl
    MERGE(fld_PortId)-[:INPUT]->(func_ana_fund_lvl)
    MERGE(fld_TotalANA)-[:INPUT]->(func_ana_fund_lvl)
    MERGE(fld_TotalManagedANA)-[:INPUT]->(func_ana_fund_lvl)
    MERGE(fld_ucit_fundcd)-[:INPUT]->(func_ana_fund_lvl)
    MERGE(fld_ucit_ana)-[:INPUT]->(func_ana_fund_lvl)

// Class Level ANA
MERGE (func_ana_cls_lvl:Formula {functionId:'1', name:'BNYANAClassLvl'})
MERGE (app_mgt_fee)-[:EXECUTES]->(func_ana_cls_lvl)
MERGE (fld_BNYANAClassLvl:Field {fieldId:23, name:'BNYANAClassLvl'})
MERGE (func_ana_cls_lvl)-[:OUTPUTS]->(fld_BNYANAClassLvl)
    SET func_ana_cls_lvl.description = "ANA aggregated at the class level and composed by merging data for standard funds, closed-end funds and UCITS"
    MERGE (bt_ana)-[:DEFINES]->(func_ana_cls_lvl)
    MERGE (bt_ana)-[:DEFINES]->(fld_BNYANAClassLvl)
