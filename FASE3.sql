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
where pais LIKE '%Spain%'
order by icao;

-- Pregunta 2
select num_serie, fabricant, any_fabricacio as any, companyia 
from avio a
where a.fabricant NOT LIKE '%Boeing%' 
and a.any_fabricacio >= 2020
order by a.any_fabricacio, a.fabricant, a.num_serie;

-- Pregunta 3
select CONCAT('L''aeroport ', nom, ' està a ', ciutat, ' i va ser contruït l''any ', any_construccio) as aeroport 
from aeroport a
where a.pais like '%Spain%';

-- Pregunta 4 
select nom, pais, CHAR_LENGTH(nom) as longitud 
from aeroport a
where (a.nom LIKE '%e%e%e%' 
  and a.nom NOT LIKE '%e%e%e%e%') and CHAR_LENGTH(a.nom) between 7 and 9 
order by CHAR_LENGTH(a.nom) DESC, a.pais ASC;

-- Pregunta 5
select num_serie, any_fabricacio, fabricant, companyia 
from avio a
where a.any_fabricacio=2008 
  and (a.fabricant='Concorde' or a.companyia='Alitalia') 
order by a.num_serie DESC;

-- Pregunta 6
select CONCAT(cognom, ', ', nom) as nom_complet 
from passatger p 
where ((p.nom LIKE '%k%k%' and p.nom NOT LIKE '%k%k%k%') or (p.cognom LIKE '%k%k%' and p.cognom NOT LIKE '%k%k%k%')) and adreca LIKE '%barcelona%'
order by p.cognom ASC;

-- Pregunta 7
select distinct fabricant 
from avio a
where a.any_fabricacio = 2000
order by a.fabricant ASC;

-- Pregunta 8
select cognom, nom, CONCAT(DAY(data_naix), '/', MONTH(data_naix), '/', YEAR(data_naix), ' (', DAYNAME(data_naix), ')') as naixament
from passatger p
where ((YEAR(p.data_naix) = 2003 and MONTH(p.data_naix) = 10) and p.nom NOT LIKE '%a%')
order by p.data_naix DESC, p.cognom ASC;

-- Pregunta 9
select nom, cognom, telefon, data_naix
from passatger p
where TIMESTAMPDIFF(YEAR , p.data_naix ,CURDATE()) between 54 and 55
and MOD(CAST(SUBSTRING(p.telefon, -1) AS UNSIGNED), 2) = 1 
and p.adreca is null
order by data_naix ASC, nom ASC;