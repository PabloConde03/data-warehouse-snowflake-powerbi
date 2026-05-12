USE DATABASE PRACTICA_FINAL_DAW;
USE SCHEMA RAW;

-- 1. Modificar NATION para añadir la columna de zonas horarias
ALTER TABLE RAW_NATION ADD COLUMN N_TIMEZONE VARCHAR;

UPDATE RAW_NATION
SET N_TIMEZONE = CASE N_NAME
    WHEN 'ALGERIA' THEN 'Africa/Algiers'
    WHEN 'ARGENTINA' THEN 'America/Argentina/Buenos_Aires'
    WHEN 'BRAZIL' THEN 'America/Sao_Paulo'
    WHEN 'CANADA' THEN 'America/Toronto'
    WHEN 'EGYPT' THEN 'Africa/Cairo'
    WHEN 'ETHIOPIA' THEN 'Africa/Addis_Ababa'
    WHEN 'FRANCE' THEN 'Europe/Paris'
    WHEN 'GERMANY' THEN 'Europe/Berlin'
    WHEN 'INDIA' THEN 'Asia/Kolkata'
    WHEN 'INDONESIA' THEN 'Asia/Jakarta'
    WHEN 'IRAN' THEN 'Asia/Tehran'
    WHEN 'IRAQ' THEN 'Asia/Baghdad'
    WHEN 'JAPAN' THEN 'Asia/Tokyo'
    WHEN 'JORDAN' THEN 'Asia/Amman'
    WHEN 'KENYA' THEN 'Africa/Nairobi'
    WHEN 'MOROCCO' THEN 'Africa/Casablanca'
    WHEN 'MOZAMBIQUE' THEN 'Africa/Maputo'
    WHEN 'PERU' THEN 'America/Lima'
    WHEN 'CHINA' THEN 'Asia/Shanghai'
    WHEN 'ROMANIA' THEN 'Europe/Bucharest'
    WHEN 'SAUDI ARABIA' THEN 'Asia/Riyadh'
    WHEN 'VIETNAM' THEN 'Asia/Ho_Chi_Minh'
    WHEN 'RUSSIA' THEN 'Europe/Moscow'
    WHEN 'UNITED KINGDOM' THEN 'Europe/London'
    WHEN 'UNITED STATES' THEN 'America/New_York'
    ELSE 'UTC'
END;

-- 2. Modificar ORDERS para añadir hora aleatoria y clave de tienda
ALTER TABLE RAW_ORDERS ADD COLUMN O_ORDERDATETIME TIMESTAMP;
ALTER TABLE RAW_ORDERS ADD COLUMN O_STOREKEY NUMBER;

UPDATE RAW_ORDERS
SET 
    O_ORDERDATETIME = DATEADD(SECOND, UNIFORM(0, 24*60*60 - 1, RANDOM()), TO_TIMESTAMP(O_ORDERDATE)),
    O_STOREKEY = UNIFORM(1, 10, RANDOM());

-- * Arreglar problema en esquema raw

-- 1. Eliminamos la columna que contiene el texto de error
ALTER TABLE RAW_PROMOCION DROP COLUMN FECHA_FIN;

-- 2. Creamos la columna de nuevo, forzando a que sea de tipo FECHA
ALTER TABLE RAW_PROMOCION ADD COLUMN FECHA_FIN DATE;

-- 3. Calculamos la fecha de fin sumando entre 3 y 15 días a la fecha de inicio
UPDATE RAW_PROMOCION
SET FECHA_FIN = DATEADD(day, UNIFORM(3, 15, RANDOM()), TRY_CAST(FECHA_INICIO AS DATE));