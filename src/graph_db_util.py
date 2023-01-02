from neo4j import GraphDatabase, Session
from pathlib import Path

# Neo4J settings
uri = "bolt://127.0.0.1:7687"
user = "neo4j"
pw = "Mon_1028"

def read_into_dataframe(session, qry):
    result = session.run(qry)
    df = result.to_df(expand=True)
    return df


def read_cypher_query(qry):
    with GraphDatabase.driver(uri, auth=(user, pw)) as driver: 
        with driver.session() as session:
            df = read_into_dataframe(session, qry)
    return df


def execute_cypher_query(qry):
    with GraphDatabase.driver(uri, auth=(user, pw)) as driver: 
        with driver.session() as session:
            result = session.run(qry)


# delete the database
def delete_graph_db():
    qry = "MATCH (n) DETACH DELETE n"
    execute_cypher_query(qry)


# restore the database
def restore_graph_db(files):
    for f in files:
        file_path = f
        with open(file_path, mode='r') as s:
            print(f"restoring: {file_path.name}")
            cql = s.read()
            execute_cypher_query(cql)