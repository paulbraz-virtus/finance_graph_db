MERGE ({% database.name %}:DATABASE {name:'{% database.name %}'})
    {% for field in database.fields %}MERGE ({% database.name %})-[:Contains]->(:Field name:{'{% field.name %}'})
    {% endfor %}