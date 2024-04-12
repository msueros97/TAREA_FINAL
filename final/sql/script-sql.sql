USE Warehouse
GO
if not exists (select * from sys.tables where object_id=OBJECT_ID(N'dbo.WarehouseAndRetailSales')and type ='U')
	CREATE TABLE WarehouseAndRetailSales (
    Year INT,
    Month INT,
    Supplier VARCHAR(255),
    ItemCode VARCHAR(255),
    ItemDescription TEXT,
    ItemType VARCHAR(255),
    RetailSales VARCHAR(255),
    RetailTransfers VARCHAR(255),
    WarehouseSales VARCHAR(255)
)
GO
--SI LA TABLA YA EXISTE starbucks, LA VOY A LIMPIAR
TRUNCATE TABLE dbo.WarehouseAndRetailSales;						
GO

--IMPORTAR LA DATA DE MI ARCHIVO CSV starbucks
BULK INSERT dbo.WarehouseAndRetailSales
FROM 'D:\Mauricio\Data-Analitycs\Tarea-parcial\dataset\Warehouse_and_Retail_Sales.csv '--- UBICACION DEL ARCHIVO
WITH
(
	FIRSTROW = 2, --empieza a insertar data desde la fila 2 porque la primera fila es la cabecera del archivo
	FIELDTERMINATOR = ',', --delimitador de las columnas del archivo
	ROWTERMINATOR = '0x0a' --delimitador de las filas, salto de linea
)
GO