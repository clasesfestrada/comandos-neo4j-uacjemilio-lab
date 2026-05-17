CREATE (:Estudiante {
  id: "E006",
  nombre: "Emilio",
  carrera: "Ciencia de Datos",
  semestre: toInteger(3)
});

MATCH (e:Estudiante {id: "E006"})

MATCH (m:Materia {id: "M001"})

MERGE (e)-[r:Inscribe]->(m)
SET r.calificacion = toFloat(9);

MATCH (n:Estudiante{id:"E006"}) RETURN n;

MATCH (n:Materia{id:"M001"}) RETURN n;

MATCH p=(a)-[:Amigo]->(l)
WHERE a.nombre = "Ana" AND l.nombre = "Luis"
RETURN p;

MATCH (e:Estudiante{nombre:"Emilio"})
SET e.semestre = 2
return e;

MATCH (e:Estudiante {id: "E006"})-[i:Inscribe]->(m:Materia {id: "M001"})
SET i.calificacion = 10.0
RETURN i;

MATCH (e:Estudiante {id: "E006"})-[i:Inscribe]->(m:Materia {id: "M001"})
RETURN i;

MATCH (e:Estudiante{id:"E006"}) DELETE e;