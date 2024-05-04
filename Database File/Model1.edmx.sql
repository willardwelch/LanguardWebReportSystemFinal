
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/24/2024 12:39:10
-- Generated from EDMX file: C:\Test\ReportSystem\ReportSystem\Database File\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ReportingSystem];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__CoyID__48CFD27E]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__CoyID__48CFD27E];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__CoyID__7FEAFD3E]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__CoyID__7FEAFD3E];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__EntryI__00DF2177]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__EntryI__00DF2177];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__EntryI__49C3F6B7]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__EntryI__49C3F6B7];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__Orders__01D345B0]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__Orders__01D345B0];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__Orders__4AB81AF0]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__Orders__4AB81AF0];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__RankId__02C769E9]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__RankId__02C769E9];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__RankId__46E78A0C]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__RankId__46E78A0C];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__RegNo__03BB8E22]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__RegNo__03BB8E22];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__RegNo__45F365D3]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__RegNo__45F365D3];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__UnitID__04AFB25B]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__UnitID__04AFB25B];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[FK__P2OEntry__UnitID__47DBAE45]', 'F') IS NOT NULL
    ALTER TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry] DROP CONSTRAINT [FK__P2OEntry__UnitID__47DBAE45];
GO
IF OBJECT_ID(N'[dbo].[FK__Unit__BdeID__05A3D694]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Unit] DROP CONSTRAINT [FK__Unit__BdeID__05A3D694];
GO
IF OBJECT_ID(N'[dbo].[FK__Unit__BdeID__398D8EEE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Unit] DROP CONSTRAINT [FK__Unit__BdeID__398D8EEE];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Brigade]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Brigade];
GO
IF OBJECT_ID(N'[dbo].[Coy]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Coy];
GO
IF OBJECT_ID(N'[dbo].[EntryType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EntryType];
GO
IF OBJECT_ID(N'[dbo].[OrdersType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdersType];
GO
IF OBJECT_ID(N'[dbo].[Password]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Password];
GO
IF OBJECT_ID(N'[dbo].[Rank]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rank];
GO
IF OBJECT_ID(N'[dbo].[SoldierInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SoldierInfo];
GO
IF OBJECT_ID(N'[dbo].[Unit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Unit];
GO
IF OBJECT_ID(N'[Lg1ReportingSystemModelStoreContainer].[P2OEntry]', 'U') IS NOT NULL
    DROP TABLE [Lg1ReportingSystemModelStoreContainer].[P2OEntry];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Brigades'
CREATE TABLE [dbo].[Brigade] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [BrigadeName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Coys'
CREATE TABLE [dbo].[Coy] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CoyName] nvarchar(50)  NOT NULL,
    [UnitID] int  NOT NULL
);
GO

-- Creating table 'EntryTypes'
CREATE TABLE [dbo].[EntryType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EntryName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'OrdersTypes'
CREATE TABLE [dbo].[OrdersType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OrdersName] nvarchar(30)  NOT NULL
);
GO

-- Creating table 'Passwords'
CREATE TABLE [dbo].[Password] (
    [UserName] nvarchar(50)  NOT NULL,
    [UserPassword] nvarchar(50)  NOT NULL,
    [Rights] nvarchar(50)  NOT NULL,
    [BrigadeLevel] int  NULL,
    [UntLevel] int  NULL,
    [CoyLevel] int  NULL
);
GO

-- Creating table 'Ranks'
CREATE TABLE [dbo].[Rank] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RankName] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'SoldierInfoes'
CREATE TABLE [dbo].[SoldierInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(20)  NOT NULL,
    [LName] nvarchar(20)  NOT NULL,
    [MaritalStatus] nvarchar(15)  NOT NULL,
    [DOB] datetime  NOT NULL,
    [DOE] datetime  NOT NULL,
    [ROD] datetime  NOT NULL,
    [Address] nvarchar(300)  NOT NULL,
    [Parish] nvarchar(20)  NOT NULL,
    [TerminationDate] datetime  NULL,
    [Gender] nvarchar(10)  NULL
);
GO

-- Creating table 'Units'
CREATE TABLE [dbo].[Unit] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UnitName] nvarchar(50)  NOT NULL,
    [BdeID] int  NOT NULL
);
GO

-- Creating table 'P2OEntry'
CREATE TABLE [dbo].[P2OEntry] (
    [RegNo] int  NOT NULL,
    [RankId] int  NOT NULL,
    [UnitID] int  NOT NULL,
    [CoyID] int  NOT NULL,
    [EntryID] int  NOT NULL,
    [OrdersID] int  NOT NULL,
    [OrderNumber] nvarchar(6)  NOT NULL,
    [DateofOrder] datetime  NOT NULL,
    [Occurrence] nvarchar(max)  NOT NULL,
    [wefDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [EnteredBy] nvarchar(20)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Brigades'
ALTER TABLE [dbo].[Brigade]
ADD CONSTRAINT [PK_Brigade]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Coys'
ALTER TABLE [dbo].[Coy]
ADD CONSTRAINT [PK_Coy]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'EntryTypes'
ALTER TABLE [dbo].[EntryType]
ADD CONSTRAINT [PK_EntryType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrdersTypes'
ALTER TABLE [dbo].[OrdersType]
ADD CONSTRAINT [PK_OrdersType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserName], [UserPassword] in table 'Passwords'
ALTER TABLE [dbo].[Password]
ADD CONSTRAINT [PK_Passwords]
    PRIMARY KEY CLUSTERED ([UserName], [UserPassword] ASC);
GO

-- Creating primary key on [Id] in table 'Ranks'
ALTER TABLE [dbo].[Rank]
ADD CONSTRAINT [PK_Rank]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SoldierInfoes'
ALTER TABLE [dbo].[SoldierInfo]
ADD CONSTRAINT [PK_SoldierInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Units'
ALTER TABLE [dbo].[Unit]
ADD CONSTRAINT [PK_Unit]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [RegNo], [RankId], [UnitID], [CoyID], [EntryID], [OrdersID], [OrderNumber], [DateofOrder], [Occurrence], [wefDate], [EndDate] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [PK_P2OEntry]
    PRIMARY KEY CLUSTERED ([RegNo], [RankId], [UnitID], [CoyID], [EntryID], [OrdersID], [OrderNumber], [DateofOrder], [Occurrence], [wefDate], [EndDate] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BdeID] in table 'Units'
ALTER TABLE [dbo].[Unit]
ADD CONSTRAINT [FK__Unit__BdeID__05A3D694]
    FOREIGN KEY ([BdeID])
    REFERENCES [dbo].[Brigade]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Unit__BdeID__05A3D694'
CREATE INDEX [IX_FK__Unit__BdeID__05A3D694]
ON [dbo].[Unit]
    ([BdeID]);
GO

-- Creating foreign key on [BdeID] in table 'Units'
ALTER TABLE [dbo].[Unit]
ADD CONSTRAINT [FK__Unit__BdeID__398D8EEE]
    FOREIGN KEY ([BdeID])
    REFERENCES [dbo].[Brigade]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Unit__BdeID__398D8EEE'
CREATE INDEX [IX_FK__Unit__BdeID__398D8EEE]
ON [dbo].[Unit]
    ([BdeID]);
GO

-- Creating foreign key on [UnitID] in table 'Coys'
ALTER TABLE [dbo].[Coy]
ADD CONSTRAINT [FK__Coy__UnitID__3C69FB99]
    FOREIGN KEY ([UnitID])
    REFERENCES [dbo].[Unit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Coy__UnitID__3C69FB99'
CREATE INDEX [IX_FK__Coy__UnitID__3C69FB99]
ON [dbo].[Coy]
    ([UnitID]);
GO

-- Creating foreign key on [UnitID] in table 'Coys'
ALTER TABLE [dbo].[Coy]
ADD CONSTRAINT [FK__Coy__UnitID__7EF6D905]
    FOREIGN KEY ([UnitID])
    REFERENCES [dbo].[Unit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Coy__UnitID__7EF6D905'
CREATE INDEX [IX_FK__Coy__UnitID__7EF6D905]
ON [dbo].[Coy]
    ([UnitID]);
GO

-- Creating foreign key on [CoyID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__CoyID__48CFD27E]
    FOREIGN KEY ([CoyID])
    REFERENCES [dbo].[Coy]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__CoyID__48CFD27E'
CREATE INDEX [IX_FK__P2OEntry__CoyID__48CFD27E]
ON [dbo].[P2OEntry]
    ([CoyID]);
GO

-- Creating foreign key on [CoyID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__CoyID__7FEAFD3E]
    FOREIGN KEY ([CoyID])
    REFERENCES [dbo].[Coy]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__CoyID__7FEAFD3E'
CREATE INDEX [IX_FK__P2OEntry__CoyID__7FEAFD3E]
ON [dbo].[P2OEntry]
    ([CoyID]);
GO

-- Creating foreign key on [EntryID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__EntryI__00DF2177]
    FOREIGN KEY ([EntryID])
    REFERENCES [dbo].[EntryType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__EntryI__00DF2177'
CREATE INDEX [IX_FK__P2OEntry__EntryI__00DF2177]
ON [dbo].[P2OEntry]
    ([EntryID]);
GO

-- Creating foreign key on [EntryID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__EntryI__49C3F6B7]
    FOREIGN KEY ([EntryID])
    REFERENCES [dbo].[EntryType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__EntryI__49C3F6B7'
CREATE INDEX [IX_FK__P2OEntry__EntryI__49C3F6B7]
ON [dbo].[P2OEntry]
    ([EntryID]);
GO

-- Creating foreign key on [OrdersID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__Orders__01D345B0]
    FOREIGN KEY ([OrdersID])
    REFERENCES [dbo].[OrdersType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__Orders__01D345B0'
CREATE INDEX [IX_FK__P2OEntry__Orders__01D345B0]
ON [dbo].[P2OEntry]
    ([OrdersID]);
GO

-- Creating foreign key on [OrdersID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__Orders__4AB81AF0]
    FOREIGN KEY ([OrdersID])
    REFERENCES [dbo].[OrdersType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__Orders__4AB81AF0'
CREATE INDEX [IX_FK__P2OEntry__Orders__4AB81AF0]
ON [dbo].[P2OEntry]
    ([OrdersID]);
GO

-- Creating foreign key on [RankId] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__RankId__02C769E9]
    FOREIGN KEY ([RankId])
    REFERENCES [dbo].[Rank]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__RankId__02C769E9'
CREATE INDEX [IX_FK__P2OEntry__RankId__02C769E9]
ON [dbo].[P2OEntry]
    ([RankId]);
GO

-- Creating foreign key on [RankId] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__RankId__46E78A0C]
    FOREIGN KEY ([RankId])
    REFERENCES [dbo].[Rank]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__RankId__46E78A0C'
CREATE INDEX [IX_FK__P2OEntry__RankId__46E78A0C]
ON [dbo].[P2OEntry]
    ([RankId]);
GO

-- Creating foreign key on [RegNo] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__RegNo__03BB8E22]
    FOREIGN KEY ([RegNo])
    REFERENCES [dbo].[SoldierInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RegNo] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__RegNo__45F365D3]
    FOREIGN KEY ([RegNo])
    REFERENCES [dbo].[SoldierInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UnitID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__UnitID__04AFB25B]
    FOREIGN KEY ([UnitID])
    REFERENCES [dbo].[Unit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__UnitID__04AFB25B'
CREATE INDEX [IX_FK__P2OEntry__UnitID__04AFB25B]
ON [dbo].[P2OEntry]
    ([UnitID]);
GO

-- Creating foreign key on [UnitID] in table 'P2OEntry'
ALTER TABLE [dbo].[P2OEntry]
ADD CONSTRAINT [FK__P2OEntry__UnitID__47DBAE45]
    FOREIGN KEY ([UnitID])
    REFERENCES [dbo].[Unit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__P2OEntry__UnitID__47DBAE45'
CREATE INDEX [IX_FK__P2OEntry__UnitID__47DBAE45]
ON [dbo].[P2OEntry]
    ([UnitID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------