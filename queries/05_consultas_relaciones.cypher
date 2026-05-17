MATCH p=(a)-[:Amigo]->()
WHERE a.nombre = "Ana"
RETURN p;

MATCH (ana:Estudiante {nombre: "Ana"})-[:Amigo]->(amigo:Estudiante)-[:Inscribe]->(materia:Materia)
RETURN amigo.nombre AS Amigo, materia.nombre AS Materia;

MATCH (ana:Estudiante {nombre: "Ana"})-[:Amigo]->(amigo:Estudiante)-[:Inscribe]->(materia:Materia)-[i:imparte]-(mi:profesor)
RETURN amigo.nombre AS Amigo, materia.nombre AS Materia, mi.nombre as Profesor;

MATCH (ana:Estudiante {nombre: "Ana"})-[:Amigo]->(a:Estudiante)-[:Amigo]->(a2:Estudiante)
RETURN a.nombre AS Amigo, a2.nombre AS Amigo_de_Amigo;

MATCH p=()-[i:Inscribe]->() WHERE i.calificacion >= 90 RETURN p;