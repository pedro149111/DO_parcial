USE kaggle
GO

IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type='U')
BEGIN
	--crear tabla
	CREATE TABLE dbo.starbucks(
		beverage_category VARCHAR(50),
		beverage VARCHAR(100),
		beverage_prep VARCHAR (50),
		calories DECIMAL(6,3),
		total_fat_g VARCHAR(10),
		trans_fat_g DECIMAL(6,3),
		saturate_fat_g DECIMAL (6,3),
		sodium_mg DECIMAL(6,3),
		total_carbohydrate_g DECIMAL(6,3),
		cholesterol_mg DECIMAL(6,3),
		dietary_fibre_g DECIMAL(6,3),
		sugar_g DECIMAL(6,3),
		protein_g DECIMAL(6,3),
		vitamin_a_pct VARCHAR(10),
		vitamin_c_pct VARCHAR (10),
		calcium_pct VARCHAR (10),
		iron_pct VARCHAR (10),
		caffeine_mg VARCHAR (10)
	)
END
ELSE
BEGIN
	--SI LA TABLA YA EXISTE 
	TRUNCATE TABLE dbo.starbucks;
END
GO

--importar data desde archivo
BULK INSERT dbo.starbucks
FROM 'C:\Users\pedro\OneDrive\Escritorio\certus\ops\proyecto_parcial\dataset\starbucks.csv'
WITH
(
	FIRSTROW = 2,			--empieza en la segunda fila
	FIELDTERMINATOR = ',', -- INDICAMOS SEPARADOR
	ROWTERMINATOR = '0x0a' -- HACE REFERENCIA A UN SALTO DE LINEA
);
GO

