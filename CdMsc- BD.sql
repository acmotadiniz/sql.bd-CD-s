-- criando bd CdMscLista
CREATE DATABASE CdMscLista;
-- abrindo bd CdMscLista
use CdMscLista;
-- criando tabela CdMscLista
CREATE TABLE CdS
(
Cod_Cd int,
Nome_cd varchar (20) NOT NULL,
DataCompra datetime NULL,
ValorPago float NULL,
LocalCompra varchar(40) NULL,
Album varchar(3) NULL,
PRIMARY KEY (Cod_Cd));
	INSERT into CdS(Cod_cd, Nome_cd, DataCompra, ValorPago, LocalCompra, Album) 
	VALUES (1,'Violeta', 05/08/21, 30.00, 'Shopee','Não');

	INSERT into CdS(Cod_cd, Nome_cd, DataCompra, ValorPago, LocalCompra, Album) 
	VALUES (2,'KebradaBoyz ', 15/10/199, 20.00, 'Shopee','Sim');

	INSERT into CdS(Cod_cd, Nome_cd, DataCompra, ValorPago, LocalCompra, Album) 
	VALUES (3,'S/T', 03/02/21, 80.00, 'Aliexpress','Sim');

	INSERT into CdS(Cod_cd, Nome_cd, DataCompra, ValorPago, LocalCompra, Album) 
	VALUES (4,'Wiped Out', 10/01/23, 90.00, 'Americanas','Sim');

	INSERT into CdS(Cod_cd, Nome_cd, DataCompra, ValorPago, LocalCompra, Album) 
	VALUES (5,'clube de Esquina', 15/12/23, 200.00, 'Amazon','Sim');

	select * from  CdS

 -- criando tabela Musicas
CREATE TABLE Musicas
(
Cod_Cd int,
Numero_Musica int NULL,
Nome_Musica varchar (20) NULL,
Artista varchar (20) NULL,
Tempo time NULL,
 );  

	--inserindo Musicas na tabela CdS (musicas do album Violeta)--
 	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (1, 'Yoko', 'Terno Rei', '3:45', 1);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (2, 'Dia Linda', 'Terno Rei', '1:50', 1);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (3, 'Solidão de Volta', 'Terno Rei', '2:45', 1);


	--inserindo Musicas na tabela CdS (musicas do album KebradaBoyz)--
	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (1, 'BerserkCaipira', 'Link do Zap', '1:50', 2);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (3, 'Ultima Diamba', 'Link do Zap', '2:00', 2);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (8, 'Anti Herói', 'Link do Zap', '2:46', 2);


	--inserindo Musicas na tabela CdS (musicas do album S/T)--
	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (1, 'Orange Juliuis', 'S/T', '1:16', 3);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (2, 'Call Out', 'S/T', '2:00', 3);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (3, 'Beach Community', 'S/T', '1:40', 3);


	--inserindo Musicas na tabela CdS (musicas do album Wiped Out)--
	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (1, 'A Moment of Silence', 'The Neighbrourhood', '0:30', 4);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (3, 'Prey', 'The Neighbrourhood', '4:42', 4);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (4, 'CryBaby', 'The Neighbrourhood', '3:45', 4);


	--inserindo Musicas na tabela CdS (musicas do album Clube de Esquina )--
	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (1, 'Tudo Oque Você Podia Ser', 'Milton Nascimento', '2:57', 5);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (2, 'Cais', 'Milton Nascimento', '2:45', 5);

	INSERT into Musicas(Numero_Musica, Nome_Musica, Artista, Tempo, Cod_Cd) 
	VALUES (3, 'O Term Azul', 'Milton Nascimento', '4:05', 5);


SELECT * FROM Musicas;
-- Subquery: Mostre o cd que custou mais caro -- 
	select Cod_cd, Nome_cd, DataCompra, ValorPago, LocalCompra, Album
	from CdS
	where ValorPago=(select max(ValorPago) from Cds)
	

-- GroupBy --
-- 1.Mostre o tempo total de músicas por cd --
SELECT Cds.Nome_Cd, SUM(DATEPART(SECOND, Musicas.Tempo)) AS TempoTotalSegundos
FROM Cds 
JOIN Musicas  ON Cds.Cod = Musicas.Cod_Cd
GROUP BY Cds.Nome_Cd;

-- 2. Mostre a quantidade de Cds --
SELECT COUNT(*) AS QuantidadeCds
FROM Cds;

-- 3.  Mostre a quantidade de músicas por cds --
SELECT C.Nome_Cd, COUNT(M.Numero_musica) AS QuantidadeMusicas
FROM Cds C
LEFT JOIN Musicas M ON C.Cod = M.Cod_Cd
GROUP BY C.Nome_Cd;


