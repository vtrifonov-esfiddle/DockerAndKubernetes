CREATE DATABASE CounterData;
GO
USE CounterData;
GO

CREATE TABLE Counts(
        [ID] int IDENTITY(1,1) NOT NULL, 
        [Count] int NOT NULL,
        CONSTRAINT [PK_Counts] PRIMARY KEY CLUSTERED
    ( [ID] ASC ) 
    ) ON [PRIMARY];

INSERT INTO Counts VALUES (1);

GO