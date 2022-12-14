from neo4j import GraphDatabase

if __name__ == "__main__":
    uri = "bolt://127.0.0.1:7687"
    user = "neo4j"
    pw = None
    
    # TODO Authentication is disabled
    #pw = "Mon_1028"
    #pw = "neo4j"
    
    qry = """MATCH (n:Person) RETURN n.name AS name"""
    qry = """MATCH (n:Person) RETURN n.name, n.born"""
    
    with GraphDatabase.driver(uri, auth=(user, pw)) as driver: 
        driver.verify_connectivity()
        print(driver.get_server_info().address)
        
        with driver.session() as session:
            result = session.run(qry)
            df = result.to_df()
        
    print(df)
            
            
    #bm = neo4j.GraphDatabase.bookmark_manager(initial_bookmarks=None, bookmarks_supplier=None, bookmarks_consumer=None)
    #bm.