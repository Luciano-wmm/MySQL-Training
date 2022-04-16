#--- CLASS #1 - SQL INTENSIVE --- #
#--- FIRST STEPS IN SQL --- #

-- SOLVING A REAL CASE

# 1. ABOUT THE BD RESULTS TABLE

-- You work in a consulting company, and you are part of the team that was hired to do a MARKET ANALYSIS to collect information about the main companies in the market, from a variety of sectors.

-- The RESULTS table has information about different companies, such as
	# company name
    # sector
    # number of employees
    # revenue and profit
    # and more 

-- You have just been assigned to work with the COMPANY database and use SQL to solve some challenges related to the above project.
	
-- It's your first day as an analyst on the project and you need to see the company's information. But all that you are given is a MySQL database. Select ALL COLUMNS from the RESULTS table in the COMPANY database.

select * from empresas.resultados;

-- 2. Your manager felt that he had too much information, for the demand he made at that moment. So he asked you to change this database query to show only the company name column.
-- Solve this challenge.

select nome from empresas.resultados;

-- The HR department needs to do an analysis of the companies, and has asked you to select ONLY the id_company, name, sector and num_employees columns. How to solve this?

SELECT 
    id_empresa, 
    nome, 
    setor, 
    num_funcionarios
FROM
    resultados;

-- The Finance department needs to do an analysis of the companies, and has asked you to select ONLY the columns company_id, name, sector and revenues. Note: Give a new name to each column in the resulting query.

Select
	id_empresa AS 'ID Empresa',
    nome AS 'Nome Empresa',
    setor AS 'Setor Atuação',
    receitas AS 'Receita'
From
	resultados;
    

-- Your company is doing a market study and needs to know which companies are active in each of these two sectors: Technology and Energy. Can you find out which of the two sectors has more players?

select * from resultados
where setor = 'tecnologia';		-- 43 results

select * from resultados
where setor = 'energia';  		-- 57 results