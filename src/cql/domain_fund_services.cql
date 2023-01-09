MERGE (FS:Domain {domainId:'FS', name:'Fund Services'})
    MERGE (FSFA:Domain {domainId:'FSFA', name:'Fund Administration'})-[:PARENT]->(FS)
