DECLARE @UpgradeScript1 NVARCHAR(200) = 'Upgrade Script 1';
DECLARE @TRUE BIT = 1;

IF dbo.UpgradeScriptExists(@UpgradeScript1) <> @TRUE
BEGIN
    CREATE TABLE Counts(
        [ID] int IDENTITY(1,1) NOT NULL, 
        [Count] int NOT NULL,
        CONSTRAINT [PK_Counts] PRIMARY KEY CLUSTERED
    ( [ID] ASC ) 
    ) ON [PRIMARY];

    INSERT INTO Counts VALUES (1);
    EXEC dbo.MarkUpgradeScriptAsExecuted @UpgradeScriptName = @UpgradeScript1;
END

GO