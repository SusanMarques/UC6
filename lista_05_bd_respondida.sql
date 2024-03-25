-- lista 05, resolução para o banco senac 

-- usar o banco
USE senac_bd;

/* Questão 1
 Liste todos os funcionários do Senac.
*/
select * from funcionario;

/* Questão 2
Encontre o total de alunos matriculados em cada curso
*/
SELECT matricula.id_do_curso, COUNT(matricula.matricula) AS QuantidadedeAlunos
FROM 
matricula
GROUP BY 
matricula.id_do_curso

/* Questão 3
 Mostre o nome e o salário dos professores ordenados do maior para o menor salário.
 */

SELECT funcionario.nome, funcionario.salario
FROM funcionario
JOIN professor ON funcionario.cpf = professor.cpf
ORDER BY funcionario.salario desc;

/* Questão 4
 Conte quantos cursos são oferecidos no Senac por categoria.
*/
SELECT curso.categoria, COUNT(curso.categoria) AS QuantidadedeCursos
FROM 
Curso
GROUP BY 
curso.categoria

/* Questão 5
 Exiba os cursos que têm duração superior a 2 meses.
*/


/*Questão 6
 Liste os alunos que estão matriculados em mais de um curso.

/*