# ====  SQL INTENSIVE ==== #
# =====  LESSON #4  ====== #


# ======================== PART 1 ===========================#
#===============  CREATION and SET UP of DATABASE ===============#
#=============================================================#

-- The first step is to CREATE and SET UP the 'hashtagidiomas' database.

-- >
create database hashtagidiomas;
use hashtagidiomas;



# ======================== PARTE 2 ===========================#
#===================  CREATING TABLES ====================#
#=============================================================#

-- In our project, we will have to create 3 tables: courses, students and sales.

/*
TABELA 1: cursos
•	id_curso
•	nome_curso
•	valor_curso
*/

-- >
create table cursos(
	id_curso INT not null,
    nome_curso varchar(50) not null,
    valor_curso decimal(10, 2) not null
);

select * from cursos;






/*
TABELA 2: alunos
•	id_aluno
•	nome_aluno
•	email
*/

-- >
create table alunos(
	id_aluno INT not null,
    nome_aluno varchar(50) not null,
    email varchar(50)
);

select * from alunos;




/*
TABELA 3: vendas
•	id_venda
•	data_venda
•	id_curso
•	id_aluno
*/

-- >

create table vendas(
	id_venda INT not null,
    data_venda DATE not null,
    id_curso INT not null,
    id_aluno INT not null
);

select * from vendas;





# ======================== PART 3 ===========================#
#==============  ADDING INFORMATIONS TO THE TABLES ===============#
#=============================================================#

/*
TABELA 1: cursos

Add the values below to the course table

id_curso | nome_curso | valor_curso |
_____________________________________
1        | Inglês     | 1200        |
2        | Espanhol   | 1000        |
3        | Francês    | 900         |
*/

insert into cursos(id_curso, nome_curso, valor_curso)
values
	(1, 'Inglês', 1200),
    (2, 'Espanhol', 1000),
    (3, 'Francês', 900);
    
select * from cursos;
	

-- >

/*
TABELA 2: alunos

Add the following values to the student table

id_aluno | nome_aluno | email                  |
________________________________________________
1        | Eliane     | eliane@gmail.com       |
2        | João       | j.123@hotmail.com      |
3        | Pedro      | pedrinho@gmail.com    |
*/

insert into alunos(id_aluno, nome_aluno, email)
values
	(1, 'Eliane', 'eliane@gmail.com'),
    (2, 'João', 'j.123@hotmail.com'), 
    (3, 'Pedro', 'pedrinho@gmail.com');

select * from alunos;


-- >

/*
TABELA 3: vendas

Add the following values to the sales table

id_venda | data_venda      | id_curso  | id_aluno |
__________________________________________________
1        | '2022-01-10'    | 1         | 1        |
2        | '2022-01-10'    | 2         | 1        |
3        | '2022-01-10'    | 3         | 1        |
4        | '2022-01-13'    | 1         | 2        |
5        | '2022-01-21'    | 2         | 3        |
*/

INSERT INTO vendas
VALUES
	(1, '2022-01-10', 1, 1),
    (2, '2022-01-10', 2, 1),
    (3, '2022-01-10', 3, 1),
    (4, '2022-01-13', 1, 2),
    (5, '2022-01-21', 2, 3);

SELECT * FROM vendas;


# ======================== PARTE 4 =========================== #
# ==============  UPDATING VALUES IN THE TABLE =============== #
# ============================================================ #

-- The price of the French course will be adjusted from R$900 to R$750. Update the amount in the course table.

-- >

update cursos
set valor_curso = 750
where id_curso = 3;

select * from cursos;


# ======================== PART 5 =========================== #
# =================  EXCLUDING TABLE VALUES ================= #
# =========================================================== #

-- Select the sales table. The purchase of customer 'Peter' (id_sales = 5) has been refunded and therefore it should be excluded from the sales control.

-- >

select * from vendas;

delete from vendas
where id_venda = 5;



# ======================== PART 5 =========================== #
# =============  DELETING TABLES AND DATABASES ============== #
#=============================================================#

-- Delete the sales table and then the hashtagidiomas database.

/*
drop table vendas;
drop database hashtagidiomas;
*/

-- >
