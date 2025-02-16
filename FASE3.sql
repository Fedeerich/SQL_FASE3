/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'aplicacions web.
    Mòdul: 0484 Bases de dades. 
    AUTORS: Ainara Juarez Moreno i Marcos Gongora Carriedo
    DATA: 12/02/2025
****************************************************** */

-- Pregunta 1
select nom, icao 
from companyia
where pais LIKE '%Spain%' order by icao;

-- Pregunta 2
select num_serie, fabricant, any_fabricacio as any, companyia 
from avio
where fabricant NOT LIKE '%Boeing%' and any_fabricacio >= 2020
order by any_fabricacio, fabricant, num_serie;

-- Pregunta 3 
select CONCAT('L''aeroport ', nom, ' està a ', ciutat, ' i va ser contruït l''any ', any_construccio) as aeroport 
from aeroport
where pais like '%Spain%';

-- Pregunta 4 
select nom, pais, CHAR_LENGTH(nom) as longitud 
from aeroport
where (nom LIKE '%e%e%e%'  and nom NOT LIKE '%e%e%e%e%') and CHAR_LENGTH(nom) between 7 and 9 
order by CHAR_LENGTH(nom) DESC, pais ASC;

-- Pregunta 5
select num_serie
from avio
where any_fabricacio=2008 and (fabricant='Concorde' or companyia='Alitalia')
order by num_serie DESC;

-- Pregunta 6
select CONCAT(cognom, ', ', nom) as nom_complet 
from passatger 
where ((nom LIKE '%k%k%' and nom NOT LIKE '%k%k%k%') or (cognom LIKE '%k%k%' and cognom NOT LIKE '%k%k%k%')) and adreca LIKE '%barcelona%'
order by cognom ASC;

-- Pregunta 7
select distinct fabricant 
from avio
where any_fabricacio = 2000
order by fabricant ASC;

-- Pregunta 8
select cognom, nom, CONCAT(DAY(data_naix), '/', MONTH(data_naix), '/', YEAR(data_naix), ' (', DAYNAME(data_naix), ')') as naixament
from passatger 
where ((YEAR(data_naix) = 2003 and MONTH(data_naix) = 10) and nom NOT LIKE '%a%')
order by data_naix DESC, cognom ASC;

-- Pregunta 9
select nom, cognom, telefon, data_naix
from passatger
where TIMESTAMPDIFF(YEAR , data_naix ,CURDATE()) between 54 and 55 
and MOD(CAST(SUBSTRING(telefon, -1) AS UNSIGNED), 2) = 1 
and adreca is null
order by data_naix ASC, nom ASC;