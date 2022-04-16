# --- LECTURE #2: SQL ESSENTIAL COMMANDS --- #

# 1. INTRODUCTION
-- The hashtagmovie is a database whose main purpose is to store the performance information of movies rented from the company's streaming service over the period. 

-- This database is composed of 5 tables:
	# rentals: stores data related to movie rentals
    # actors: stores data about the actors in the different movies
    # acts: table containing the participation of each actor in the respective movie
    # customers: table with the company's customers' data
    # movies: data about the movies available for rental

-- These data will be fundamental for future analysis for making short and long term decisions, such as:
-- i) Decision to invest in certain movies based on their popularity (rating)
-- ii) Total number of locations will define the COMPANY'S REVENUE
-- iii) Average rating of films will define CUSTOMER SATISFACTION
-- iv) Number of active customers will define CUSTOMER ENGAGEMENT

-- The project will then have some objectives, such as:	
		-- Discover customer preferences according to region and gender
		-- Discover Popularity of movies by genre and year of release
        -- Discover Movies with above-average ratings
        -- and others
        
-- In order for us to be able to perform all these analyses in SQL (lecture 3), we will need to learn the ESSENTIAL COMMANDS, which will be shown in today's lecture (and we will continue in lecture 3).


# ======= PART 1: =======#
# ======= SELECT COMMANDS =======#


-- SELECT, SELECT LIMIT, SELECT DISTINCT 

-- 1. You have been assigned as the responsible hashtagmovie analyst. 
-- Your first challenge is to do a recognition of the database tables. This will be important for the next steps of the project.
-- Also, identify how many rows there are for each table. This will be important to ensure that no information is missing.

select * from alugueis; -- 578 alugueis
select * from atores; -- 145 atores
select * from atuacoes; -- 213 atuações
select * from clientes; -- 123 clientes
select * from filmes; -- 71 filmes

-- Since SQL tables can have millions of rows, to do a table recognition it is not always necessary to view all rows, it is enough to check the first N rows. 

-- Therefore, a good practice for selecting data in SQL is to limit the number of rows that are displayed in the table. 
-- a) Use the LIMIT command to view only the first 10 rows of the FILMS table.

select * from filmes
limit 10;

-- b) Use the LIMIT command to view only the first 50 rows of the CUSTOMERS table.

select * from clientes
limit 50;


-- The person who created the tables said that movies are divided into a total of 7 GENRES: 1) Comedy; 2) Drama; 3) Fiction and Fantasy; 4) Mystery and Suspense; 5) Art; 6) Animation; 7) Action and Adventure.

-- At this point, you will have the IMPORTANT job of checking if all these genres are indeed present in the FILMS table. If they are not, you should report them to the person in charge.

select distinct genero from	filmes;


-- The company knows that it needs to expand its market into as many states as possible. As a data analyst, you must identify which states the company currently has customers in. How many are these states in total? Thinking that our country has 27 UF (26 states + DF), there is still room to expand to how many states?

select distinct estado from clientes; -- states that already have customers

# ======= PART 2: ======= #
# ======= SORT COMMANDS ======= #

-- ORDER BY ASC, ORDER BY DESC

-- Perform an analysis on the year of birth of each of the actors. Sort the actors table to show the actors from highest to lowest year of birth.

select * from atores
order by ano_nascimento desc;

-- The data control department will need to segregate the customers by alphabetical order. Sort the customer table starting with the customer_name column to make your colleagues' work easier.

select * from clientes
order by nome_cliente;

-- In the customers table, try to find out which was the customer with the earliest account creation date, i.e. the first customer registered in the base.

select * from clientes
order by data_criacao_conta
limit  1;

-- 4. The company would like to know which are the TOP 5 movies with the longest running time. Would you be able to do this analysis?

select * from filmes
order by duracao desc
limit 5;

# ======= PART 3: ======= #
# ======= FILTER COMMANDS ======= #

-- WHERE (basic, AND/OR, IN, BETWEEN)

-- 1. the company wants to include movies of the COMEDY genre in its catalog. To do this, it must acquire the broadcast rights from the studio responsible.

-- However, the company must be careful not to negotiate a film that already exists in its catalog.

-- Your job, therefore, is to list all the movies in the COMEDY genre and provide this information to your manager.

select * from filmes
where genero = 'comédia';

-- 2. The strategy team surveyed the most well-known film critics and found that 2003 was one of the most successful years for movies. Some of these critics have been hired to help improve the movie catalog, and they want to suggest more movies that were released in 2003.

-- In order to do this, the hired critics will need the list of movies that the company already has, so that they can evaluate if these movies are really good options to have in the catalog, and also take the opportunity to suggest other titles.

-- Your job is to query the database for this project request. 

select * from filmes
where ano_lancamento = 2003;

-- One of the analysts on the team noticed that some films in the Drama genre, longer than 120 minutes, were not getting good ratings from customers. So he came up with the idea of looking more carefully at all the films that fit these criteria to see if they are indeed underperforming.

-- Your job is to list all of these films so that this analysis can be done.

select * from filmes 
where genero = 'drama' 
and duracao > 120;

-- 4. The company is realizing that the countries of Canada, Australia and Northern Ireland are producing good movies in recent years. Noticing this movement, the company decided to list all actors from these nationalities in order to research related movies and evaluate the possibility of including more options in the catalog, from these 3 countries.

-- It is yout job to list all actors born in Canada, Australia and Northern Ireland to facilitate this analysis.

select * from atores
where nacionalidade in ('Canadá', 'Austrália', 'Irlanda do Norte');

-- The company has decided to create an alternative catalog option for its movies: now customers will be able to choose, for example, to rent movies in the 90 to 100 minutes duration range. Your job will be to initiate this organization, and start by showing the movies that have a duration in this range.

select * from filmes
where duracao between 90 and 100
order by duracao;

# ======= PART 4: ======= #
# ======= MATHEMATICAL FUNCTIONS ======= #

-- Aggregation functions: COUNT, COUNT DISTINCT, SUM, MIN, MAX, AVG

-- 1. The RENTALS table has a record of all the rentals made on the company's streaming service.

-- a) Find out the total amount of movie rentals made for the entire period (use the rental_id column for this calculation).

select 
	count(id_aluguel)
from alugueis;

-- b) Find out the total amount of movie rentals made for the entire period (use the rating column for this calculation).

select 
	count(nota)
from alugueis;

-- c) Did you see any difference in the result? What happened?

/* note column has null values */

-- The catalog team needs to know how many genres of movies are currently in the company. Would you be able to do this analysis?

select
	count(distinct genero)
from filmes;

-- 3. How many minutes of playback time does the company have in total?

select sum(duracao) as 'Total Minutos'
from filmes;

-- 4. What is the length in minutes of the longest movie available in the catalog? And what is the length of the shortest movie?

select
	min(duracao) as 'menor',
    max(duracao) as 'maior'
from filmes;

-- What is the average satisfaction of the company's customers regarding the movies rented?

select 
	avg(nota)
from alugueis;
