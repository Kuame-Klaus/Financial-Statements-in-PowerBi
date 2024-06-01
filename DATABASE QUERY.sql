--CREATE VIEW vwGLTrans 
--Creating a standard GL view for Admin to save so that every has access to the same information. 
--AS 

SELECT
--TRANSACTION TABLE
GL.FactGLTranID,
GL.JournalID,
GL.GLTranDescription,
GL.GLTranAmount,
GL.GLTranDate,

--GL DIMENTION TABLE

DGL.AlternateKey AS GLAccNum,
DGL.GLAcctName,
DGL.[Statement],
DGL.Category,
DGL.Subcategory,

--STORE TABLE
S.AlternateKey AS StoreNum,
S.StoreName,
S.ManagerID,
S.PreviousManagerID,
S.ContactTel,
S.AddressLine1,
S.AddressLine2,
S.ZipCode,

--REGION TABLE
R.AlternateKey AS RegionNum,
R.RegionName,
R.SalesRegionName,

--Last Refresh Date
CONVERT(datetime2, GETDATE() at time zone 'UTC' at time zone 'UTC') AS 'LastRefreshDate'

FROM FactGLTran AS GL 
INNER JOIN dimGLAcct AS DGL ON GL.GLAcctID = DGL.GLAcctID 
INNER JOIN dimStore AS S ON GL.StoreID = S.StoreID
INNER JOIN dimRegion AS R ON S.RegionID = R.RegionID



--GO 

--Checking all time zoes in SQL
SELECT*

FROM sys.time_zone_info