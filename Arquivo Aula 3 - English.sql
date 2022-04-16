# --- LECTURE 3: DATA ANALYSIS WITH SQL --- #

-- Clustering
-- Advanced filtering
-- Joins
-- Subqueries
-- Creating Views

-- Remembering the database tables...

SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

# ======= PART 1: =======#
# ======= CREATING CLUSTERS ======= #

-- CASE 1. You should start by doing an analysis to find out the average rental price of movies.

select round(avg(preco_aluguel), 2) from filmes;

-- Now that you know the average price to rent movies on hashtagmovie, you should go further in your analysis and find out what the average price is for each movie genre.

/*
genero                   | preco_medio
______________________________________
Comédia                  | X
Drama                    | Y
Ficção e Fantasia        | Z
Mistério e Suspense      | A
Arte                     | B
Animação                 | C
Ação e Aventura          | D
*/

select
	genero,
    round(avg(preco_aluguel),2) as preço_medio
from 
	filmes
group by
	genero;

-- Would you be able to show the genres in order, according to the average?

select
	genero,
    round(avg(preco_aluguel),2) as preço_medio
from 
	filmes
group by
	genero 
order by
	preço_medio desc;
    


-- Change the previous query to show also in our analysis the amount of movies for each genre, as per the example below.

/*
genero                   | preco_medio      | qtd_filmes
_______________________________________________________
Comédia                  | X                | .
Drama                    | Y                | ..
Ficção e Fantasia        | Z                | ...
Mistério e Suspense      | A                | ....
Arte                     | B                | .....
Animação                 | C                | ......
Ação e Aventura          | D                | .......
*/

select
	genero,
    round(avg(preco_aluguel),2) as preço_medio,
    count(*) as qtd_filmes
from 
	filmes
group by
	genero 
order by
	preço_medio desc;


-- CASE 2. For each movie, find out the average rating, the number of ratings received, and the number of times each movie was rented. Sort this query from the average_rating, in descending order.

/*
id_filme  | avaliacao_media   | num_avaliacoes  | num_alugueis
_______________________________________________________
1         | X                 | .               | .
2         | Y                 | ..              | ..
3         | Z                 | ...             | ...
4         | A                 | ....            | ....
5         | B                 | .....           | .....
...
*/

select 
	id_filme,
    avg(nota) as avaliaçao_media,
    count(nota) as num_avaliaçoes,
    count(*) as num_alugeis
from
	alugueis
group by
	id_filme
order by
	avaliaçao_media desc;



# ======= PART 2: ======= #
# ======= ADVANCED FILTERS IN CLUSTERS ======= #

-- CASE 3. You must change the query FROM CASE 1 and consider the 2 scenarios below:

-- Scenario 1: Do the same analysis, but considering only the movies with YEAR_LAUNCHING equal to 2011.

select
	genero,
    round(avg(preco_aluguel),2) as preço_medio,
    count(*) as qtd_filmes
from 
	filmes
where
	ano_lancamento = 2011
group by
	genero 
order by
	preço_medio desc;

-- Scenario 2: Do the same analysis, but only considering films from genres with more than 10 films.

select
	genero,
    round(avg(preco_aluguel),2) as preço_medio,
    count(*) as qtd_filmes
from 
	filmes
group by
	genero 
having 
	qtd_filmes >= 10
order by
	preço_medio desc;


# ======= PART 3: ======= #
# ======= RELATING TABLES WITH JOIN ======= #


-- Select the Acts table. Notice that there are only movie ids and actors ids. Would you be able to complete this table with the movie titles and actors' names?

select 
	atuacoes.*,
    filmes.titulo,
    atores.nome_ator
from atuacoes
left join filmes
on atuacoes.id_filme = filmes.id_filme
left join atores
on atuacoes.id_ator = atores.id_ator;

-- CASE 5. Average customer ratings

select 
	clientes.nome_cliente,
    round(avg(alugueis.nota),2) as avaliacao_media
from alugueis
left join clientes
on alugueis.id_cliente = clientes.id_cliente
group by clientes.nome_cliente
order by avaliacao_media desc;



# ======= PART 4: ======= #
# ======= SUBQUERIES: USING SELECT WITHIN ANOTHER SELECT ======= #

-- CASE 6. You will need to do a performance analysis of the movies. For this, a common analysis is to identify which movies have an above average score. Can you do this?

select avg(nota) from alugueis; 		-- 7.94 = avg rating

select 
	filmes.titulo,
    avg(alugueis.nota) as avaliacao_media
from alugueis
left join filmes
on alugueis.id_filme = filmes.id_filme
group by filmes.titulo
having avaliacao_media >= (select avg(nota) from alugueis);


-- CASE 7. MovieNow's management wants to report on the key performance indicators (KPIs) for the company's performance in 2018. They are interested in measuring financial successes as well as user engagement. The important KPIs are therefore revenue from movie rentals, the number of movie rentals, and the number of active customers (find out also how many customers are not active).




# ======= PART 5: ======= #
# ======= CREATE VIEW ======= #


-- CREATE/DROP VIEW: Saving the result of a query in our database


-- CASE 8. Create a view to hold the result of the SELECT below.

create view resultados as
SELECT
	titulo,
    COUNT(*) AS num_alugueis,
    AVG(nota) AS media_nota,
    SUM(preco_aluguel) AS receita_total
FROM alugueis
LEFT JOIN filmes
ON alugueis.id_filme = filmes.id_filme
GROUP BY titulo
ORDER BY num_alugueis DESC;

select * from resultados;
