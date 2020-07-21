1)-- Pregunta 1. Numero de evaluaciones por curso
select pruebaid,alumno_idcurso from test group by pruebaid,alumno_idcurso

2) -- Pregunta 2. Cursos sin evaluaciones
select distinct idcurso from curso
    where idcurso not in (select alumno_idcurso from test where curso.idcurso = alumno_idcurso);

3) -- Pregunta 3. Evaluaciones con deficiencia
   3.a -- Evaluaciones sin preguntas
select * from prueba
    where idprueba not in (select prueba_idprueba from pregunta
                        where prueba_idprueba = idprueba);

    3.b -- Preguntas con 2 o menos alternativas
select count(pregunta_idprueba)  from alternativa 
    group by pregunta_idprueba
    having count(pregunta_idprueba) < 3;
    
    3.c -- Todas las alternativas son correctas o incorrectas
select distinct pregunta_idprueba from alternativa
    where (valorlogico = 'F' or valorlogico = 'T')
   
4) -- Pregunta 4. Cuantos alumnos hay por cada curso
select curso_idcurso, count(idalumno) from alumno
    group by curso_idcurso;
   
    
    


