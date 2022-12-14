from neo4j import GraphDatabase

class HelloWorldExample:

    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def print_greeting(self, message):
        with self.driver.session() as session:
            greeting = session.execute_write(self._create_and_return_greeting, message)
            print(greeting)

    @staticmethod
    def _create_and_return_greeting(tx, message):
        result = tx.run("MERGE (a:Greeting) "
                        "SET a.message = $message "
                        "RETURN a.message + ', from node ' + id(a)", message=message)
        return result.single()[0]
    
    def execute_query(self, qry:str):
        with self.driver.session() as session:
            nodes = session.run(qry)
        
        return nodes


if __name__ == "__main__":
    uri = "bolt://127.0.0.1:7687"
    user = "neo4j"
    pw = None
    
    # TODO Authentication is disabled
    #pw = "Mon_1028"
    #pw = "neo4j"

    with GraphDatabase.driver(uri, auth=(user, pw)) as driver: 
        driver.verify_connectivity() 
    
    n4j_db = HelloWorldExample(uri, user, pw)
    n4j_db.print_greeting("hello, world")
    
    qry = 'MATCH (n) RETURN (n)'
    nodes = n4j_db.execute_query(qry)
    for n in nodes:
        print(n)
    
    n4j_db.close()