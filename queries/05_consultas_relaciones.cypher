MATCH p=(a)-[:AMIGO_DE]->()
WHERE a.nombre = "Ana"
RETURN p;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)-[:INSCRITO_EN]->(materia:Materia)
RETURN amigo.nombre AS Amigo, materia.nombre AS Materia;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)-[:INSCRITO_EN]->(materia:Materia)-[i:IMPARTE]-(mi:Profesor)
RETURN amigo.nombre AS Amigo, materia.nombre AS Materia, mi.nombre as Profesor;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(a:Estudiante)-[:AMIGO_DE]->(a2:Estudiante)
RETURN a.nombre AS Amigo, a2.nombre AS Amigo_de_Amigo;

MATCH p=()-[i:INSCRITO_EN] -> () WHERE i.calificacion >= 90 RETURN p;