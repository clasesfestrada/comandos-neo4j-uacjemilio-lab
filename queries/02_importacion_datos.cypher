LOAD CSV WITH HEADERS FROM
'https://github.com/clasesfestrada/comandos-neo4j-uacjemilio-lab/raw/7e86c139fe09e4913c23f2528d3d7a79f4c9f9ec/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});

LOAD CSV WITH HEADERS FROM
"https://github.com/clasesfestrada/comandos-neo4j-uacjemilio-lab/raw/7e86c139fe09e4913c23f2528d3d7a79f4c9f9ec/data/materias.csv"
AS row

CREATE (:Materia {
  id: row.id,
  nombre: row.nombre,
  area: row.area
});


LOAD CSV WITH HEADERS FROM
"https://github.com/clasesfestrada/comandos-neo4j-uacjemilio-lab/raw/7e86c139fe09e4913c23f2528d3d7a79f4c9f9ec/data/profesores.csv"
AS row

CREATE (:Profesor{
  id: row.id,
  nombre: row.nombre,
  departamento: row.departamento
});


LOAD CSV WITH HEADERS FROM 
"https://github.com/clasesfestrada/comandos-neo4j-uacjemilio-lab/raw/7e86c139fe09e4913c23f2528d3d7a79f4c9f9ec/data/inscripciones.csv"
AS row

MATCH (e:Estudiante {id: row.estudiante_id})

MATCH (m:Materia {id: row.materia_id})

MERGE (e)-[r:INSCRITO_EN]->(m)
SET r.calificacion = toFloat(row.calificacion);


LOAD CSV WITH HEADERS FROM 
"https://github.com/clasesfestrada/comandos-neo4j-uacjemilio-lab/raw/7e86c139fe09e4913c23f2528d3d7a79f4c9f9ec/data/amistades.csv"
AS row

MATCH (eo:Estudiante {id: row.estudiante_origen})

MATCH (ed:Estudiante {id: row.estudiante_destino})

MERGE (eo)-[r:AMIGO_DE]->(ed)


LOAD CSV WITH HEADERS FROM 
"https://github.com/clasesfestrada/comandos-neo4j-uacjemilio-lab/raw/7e86c139fe09e4913c23f2528d3d7a79f4c9f9ec/data/imparticiones.csv"
AS row

MATCH (p:profesor {id: row.profesor_id})

MATCH (m:Materia{id: row.materia_id})

MERGE (p)-[r:IMPARTE]->(m)