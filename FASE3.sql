/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'aplicacions web.
    Mòdul: 0484 Bases de dades. 
    AUTORS: Ainara Juarez Moreno i Marcos Gongora Carriedo
    DATA: 12/02/2025
****************************************************** */

-- Pregunta 1
select nom, icao from companyia;

-- Pregunta 2
select num_serie, fabricant, any_fabricacio as any, companyia from avio;

-- Pregunta 3
select CONCAT('L''aeroport ', nom, ' està a ', ciutat, ' i va ser contruït l''any ', any_construccio) as aeroport from aeroport where pais like 'Spain';

-- Pregunta 4 
select nom, pais, CHAR_LENGTH(nom) as longitud from aeroport where LENGTH(nom) - LENGTH(REPLACE(nom, 'e', ''))=3 and CHAR_LENGTH(nom) between 7 and 9 order by CHAR_LENGTH(nom) DESC;

-- Pregunta 5
select num_serie, any_fabricacio, fabricant, companyia from avio where any_fabricacio=2008 and (fabricant='Concorde' or companyia='Alitalia') order by num_serie DESC;

-- Pregunta 6 NO ACABADA
select CONCAT(cognom, ', ', nom) as nom_complet from passatger where (LENGTH(nom) - LENGTH(REPLACE(nom, 'k', ''))=2 or LENGTH(cognom) - LENGTH(REPLACE(nom, 'k', ''))=2) and (INSTR(adreca, 'BARCELONA') and substring(adreca, -1)='A');

-- Pregunta 7
select 'No ho sé';

-- Pregunta 8
select 'No ho sé';

-- Pregunta 9
select 'No ho sé';