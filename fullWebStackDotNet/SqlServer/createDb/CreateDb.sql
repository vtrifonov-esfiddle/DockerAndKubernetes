CREATE DATABASE CounterData;
GO
USE CounterData;
GO

CREATE TABLE UpgradeScripts(
    [ID] int IDENTITY(1,1) NOT NULL, 
    [Name] nvarchar(200) NOT NULL,
    CONSTRAINT [PK_UpgradeScripts] PRIMARY KEY CLUSTERED
( [ID] ASC ) 
) ON [PRIMARY]
GO

CREATE FUNCTION dbo.UpgradeScriptExists(@UpgradeScriptName NVARCHAR(200))
RETURNS BIT
AS
BEGIN
    DECLARE @RESULT BIT;
    SELECT @RESULT = 1 FROM dbo.UpgradeScripts WHERE [NAME] = @UpgradeScriptName;
    RETURN IIF(@RESULT IS NOT NULL, 1, 0)
END
GO

CREATE PROCEDURE dbo.MarkUpgradeScriptAsExecuted
    @UpgradeScriptName NVARCHAR(200)
AS
    INSERT INTO UpgradeScripts ([Name]) VALUES (@UpgradeScriptName);
GO

:r UpgradeScript1.sql

GO