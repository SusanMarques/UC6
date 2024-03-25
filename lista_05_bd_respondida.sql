-- lista 05, resolu��o para o banco senac 

-- usar o banco
USE senac_bd;

/* Quest�o 1
 Liste todos os funcion�rios do Senac.
*/
select * from funcionario;

/* Quest�o 2
Encontre o total de alunos matriculados em cada curso
*/
SELECT matricula.id_do_curso, COUNT(matricula.matricula) AS QuantidadedeAlunos
FROM 
matricula
GROUP BY 
matricula.id_do_curso

/* Quest�o 3
 Mostre o nome e o sal�rio dos professores ordenados do maior para o menor sal�rio.
 */

SELECT funcionario.nome, funcionario.salario
FROM funcionario
JOIN professor ON funcionario.cpf = professor.cpf
ORDER BY funcionario.salario desc;

/* Quest�o 4
 Conte quantos cursos s�o oferecidos no Senac por categoria.
*/
SELECT curso.categoria, COUNT(curso.categoria) AS QuantidadedeCursos
FROM 
Curso
GROUP BY 
curso.categoria

/* Quest�o 5
 Exiba os cursos que t�m dura��o superior a 2 meses.
*/


/*Quest�o 6
 Liste os alunos que est�o matriculados em mais de um curso.

/*