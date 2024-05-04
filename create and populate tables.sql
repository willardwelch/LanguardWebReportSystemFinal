Create database [ReportingSystem]

USE [ReportingSystem]
GO

Create Table [dbo].Brigade(
		   [ID] [int] IDENTITY(1,1) NOT NULL,
   [BrigadeName] [nvarchar](50) NOT NULL,
    primary key ([ID])
)
Create Table [dbo].[Unit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
	[BdeID] [int] NOT NULL,
              primary key ([ID]),
	foreign key ([BdeID]) references Brigade([ID])
) 


Create Table [dbo].[Coy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CoyName] [nvarchar](50) NOT NULL,
	[UnitID] [int] NOT NULL,
               primary key ([ID]),
	foreign key ([UnitID]) references Unit([ID])
) 

Create Table [dbo].[Rank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](20) NOT NULL,
             primary key([Id])
)
Create Table  [dbo].EntryType(
     [Id] [int] IDENTITY(1,1) NOT NULL,
    [EntryName] [nvarchar](50) NOT NULL,
     primary key ([ID])
)

Create Table  [dbo].OrdersType(
     [Id] [int] IDENTITY(1,1) NOT NULL,
    [OrdersName] [nvarchar](30) NOT NULL,
     primary key ([ID])
)

Create Table [dbo].[SoldierInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](20) NOT NULL,
	[LName] [nvarchar](20) NOT NULL,
	[MaritalStatus] [nvarchar](15) NOT NULL,
	[DOB] [date] NOT NULL,
	[DOE] [date] NOT NULL,
	[ROD] [date] NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Parish] [nvarchar](20) NOT NULL,
	[TerminationDate] [date] NULL,
               [Gender] nvarchar(10) NOT NULL,
	primary key ([ID])
)




Create Table [dbo].[P2OEntry](
	[RegNo] [int] NOT NULL,
	[RankId] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[CoyID] [int] NOT NULL,
	[EntryID] [int] NOT NULL,
	[OrdersID] [int] NOT NULL,
	[OrderNumber] [nvarchar](6) NOT NULL,
	[DateofOrder] [date] NOT NULL,
	[Occurrence] [nvarchar](max) NOT NULL,
	[wefDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[EnteredBy] [nvarchar](20) NULL,
	foreign key ([RegNo]) references soldierinfo(Id),
	foreign key([RankId]) references Rank(ID),
	foreign key([UnitID]) references Unit(ID),
	foreign Key ([CoyID]) references Coy(ID),
	foreign key([EntryID]) references EntryType(ID),
	foreign key ([OrdersID]) references ordersType([ID])
) 



Create Table [dbo].[Password](
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
        [Rights] [nvarchar](50) NOT NULL,
         [BrigadeLevel] [int] NOT NULL,
          [UntLevel] [int] NOT NULL,
          [CoyLevel] [int] NOT NULL,
          primary key ([UserName]),
          primary key ([UserPassword])
) 

INSERT INTO [dbo].[Brigade] ([BrigadeName])   VALUES ('Jamaica Brigade')
INSERT INTO [dbo].[Brigade] ([BrigadeName]) VALUES ('St Caterine Brigade') 
INSERT INTO [dbo].[Brigade] ([BrigadeName]) VALUES ('Portland Brigade')  
INSERT INTO [dbo].[Brigade] ([BrigadeName]) VALUES ('St Thomas Brigade')
 INSERT INTO [dbo].[Brigade] ([BrigadeName]) VALUES ('St Mary Brigade')

INSERT INTO [dbo].[Unit] ([UnitName],[BdeID])     VALUES  ('1 Engr Regt (JDF)',	3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('10th Bn JNSC',	4)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('11th Bn JNSC', 	4)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('1 JR',	1)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('1st Dist JDF CG',	2)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('2JR',	1)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('2nd Dist JDF CG',	2)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('3JR (NR)',	5)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('4JR',	1)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('6 JR (NR)',	5)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('9th BN (NR)',	5)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('Cbt Sp Bn',	1)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('CITC',	4)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('CMA HQ',	4)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('CMP',	3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('CPME Bn', 	4)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('DIR OF TRG AND DOCT',	4)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('HQ Admin Det',	3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('HQ JDF',	3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('HQ JDF Int Unit',	2)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('HSC',	3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('Jca Regt HQ',	1)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('JDF AW',	2)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('JNR Bde Hq',	5)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('MACC HQ',	2)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('Sp and Svcs Bn',3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('Sp Bde Hq',	3)
INSERT INTO [dbo].[Unit]([UnitName],[BdeID])     VALUES ('Sp Bn (NR)',	5)

INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES ('2 Fd Sqn', 	1)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('3 Const Sqn', 	1)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('4 Sp Sqn', 	1)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('5 Maint Sqn',	1)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('RHQ', 	1)
 INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('BRAVO COMPANY', 	4)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CHARLIE COMPANY', 	4)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('DELTA COMPANY', 	4)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('E Coy', 	4)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('F Coy', 	4)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HEADQUATER COMPANY', 	4)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Dive Cmd 	5',	5)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Flotilla Cmd',	5)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HQ', 	5)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Marine Workshop', 	5)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Outstation Cmd', 	5)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Shore Base Sp',	5)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])   VALUES('Admin and Logistics Coy - 2JR', 6)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Alpha Coy-2JR',	6)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bravo Coy-2JR', 	6)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Charlie Coy-2JR', 	6)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Delta Coy-2JR', 	6)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Support Coy - 2JR',	6)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Alpha Coy', 	8)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bravo Coy', 	8)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Charlie Coy', 	8)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Delta Coy', 	8)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Echo Coy', 	8)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HQ Coy',	8)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Alpha Coy', 	9)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bravo Coy', 	9)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Charlie Coy', 	9)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Delta Coy', 	9)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HQ Coy',	9)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Alpha Coy', 	11)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])    VALUES('Bn Hq', 	11)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bravo Coy', 	11)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Charlie Coy', 	11)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Delta Coy', 	11)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Hq and Sp Coy',	11)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Alpha Coy', 	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bn Hq',	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bravo Coy', 	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])   VALUES('CARIBBEAN SEARCH CENTRE', 	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Charlie Coy', 	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('C-TOG',	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('FPETW', 	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HQ AND SP COY', 	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('JRB',	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('PMVS',	13)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bn HQ', 	16)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Mil Wrk Dog Coy',	16)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('No1 MP Coy', 	16)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('No2 MP Coy',	16)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Admin and Logs Coy', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Admin Coy', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bn hq', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CCA', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CIPME', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CITC',	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CMA',	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CMAS', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CMMTC', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CMSOM', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CMTTI', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('CSTC', 	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])  VALUES('PERMANENT STAFF (3JR (NR))',	18)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HQ Admin Det',	19)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Bn HQ',	22)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Dental', 	22)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Medical', 	22)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Pharmacy', 	22)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Wellness Centre',	22)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('1FD WKSP',	24)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('HQ Coy', 	24)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('JDF AW (NR)', 	24)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('No. 1 FLT', 	24)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('No. 2 FLT',	24)
INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Sp Flt',	24)
 INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('BN HQ',	7)
 INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Dive Command',	7)
 INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Flotilla Command',	7)
 INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('Outstation Command',	7)
 INSERT INTO [dbo].[Coy]([CoyName],[UnitID])     VALUES('ShoreBase Support',	7)

INSERT INTO [dbo].[Rank]([RankName])     VALUES('Lt Gen') 
INSERT INTO [dbo].[Rank]([RankName])    VALUES('Maj Gen') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Brig')  
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Col') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Lt Col')  
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Maj') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('T/Maj') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Capt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('T/Capt')
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Lt')  
INSERT INTO [dbo].[Rank]([RankName])     VALUES('2Lt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('WO1')	 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('A/WO1') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('WO2') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('A/WO2') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('SSgt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('A/SSgt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Sgt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('A/Sgt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Cpl') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('A/Cpl') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('L/Cpl') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('LCpl') 
INSERT INTO [dbo].[Rank]([RankName])    VALUES('A/LCpl') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('L/LCpl')
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Pte') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('JNSC Pte') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('OFFR Cdt') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('PO OFFR') 
INSERT INTO [dbo].[Rank]([RankName])     VALUES('Rec')

INSERT INTO [dbo].[OrdersType]  ([OrdersName]) VALUES('Security Orders')
INSERT INTO [dbo].[OrdersType]([OrdersName]) VALUES('Part Two Orders')
INSERT INTO [dbo].[OrdersType]([OrdersName]) VALUES('Part Two Orders C')
INSERT INTO [dbo].[OrdersType]([OrdersName]) VALUES('Part Three Orders')

INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('ABFST')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('ABSENCE - Rejoining from')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('ABSENCE - Termination of')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('ABSENCE WITHOUT LEAVE')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('ATTACHMENT UNDER COMMAND')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('AWARD - SUMMARY OF')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('ADDRESS')
INSERT INTO [dbo].[EntryType] ([EntryName]) VALUES ('ADJUSTMENT OF SENIORITY')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('ADOPTION')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('ALLOTTED REGIMENTAL NUMBER')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('APPOINTMENT')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('ASSOCIATE SPECIALIST PAY')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('AWARD OF SYMBOLS')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('BFST')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('BIRTHS (FOR _C_ P2O)')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('BRIGADE COMMAND PAY')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('Brigade Sergeant Major Pay')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('BURIAL')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('C DISPOSAL')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('CALL OUT')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('CANINE ALLOWANCE')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('CESSATION OF ATTACHMENT')
INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('CHANGE OF ADDRESS')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('CHANGE OF SECURITY BRANCH')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('CHANGE OF NEXT OF KIN AND ADDRESS')
 INSERT INTO [dbo].[EntryType]   ([EntryName]) VALUES ('CHANGE OF NOK')
INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('CHARACTER ASSESSMENT')
 INSERT INTO [dbo].[EntryType] ([EntryName]) VALUES ('CITIZENSHIP')
INSERT INTO [dbo].[EntryType] ([EntryName]) VALUES ('CLASIFICATION FOR PAY-NT TRADESMEN')
INSERT INTO [dbo].[EntryType] ([EntryName]) VALUES ('CLASSIFICATION SHOOT')
INSERT INTO [dbo].[EntryType] ([EntryName]) VALUES ('COMMAND EXAMINATION')
 INSERT INTO [dbo].[EntryType]  ([EntryName]) VALUES ('COMPLETION OF BASIC RECRUIT TRAINING')





INSERT INTO [dbo].[SoldierInfo] ([FName] ,[LName] ,[MaritalStatus] ,[DOB] ,[DOE]  ,[ROD] ,[Address]  ,[Parish]  ,[TerminationDate],[Gender])  VALUES   ('Raymond','Brown','Married','15 June 2000','10 October 2021','10 October 2027','15 Luke Lane Kingston 5','Kingston','','Male')
    
INSERT INTO [dbo].[SoldierInfo] ([FName] ,[LName] ,[MaritalStatus] ,[DOB] ,[DOE]  ,[ROD] ,[Address]  ,[Parish]  ,[TerminationDate],[Gender])  VALUES    ('Gwenneth','Brown','Married','15 June 2000','10 October 2021','10 October 2027','15 Luke Lane   Kingston 5','Kingston','','Female')
    
INSERT INTO [dbo].[SoldierInfo] ([FName] ,[LName] ,[MaritalStatus] ,[DOB] ,[DOE]  ,[ROD] ,[Address]  ,[Parish]  ,[TerminationDate],[Gender])  VALUES       ('Michelle','Green','Single','12 February 1984','10 June 2003','10 September 2021','18 Mary Way,Bambrook','St Mary','','Female')
     INSERT INTO [dbo].[SoldierInfo] ([FName] ,[LName] ,[MaritalStatus] ,[DOB] ,[DOE]  ,[ROD] ,[Address]  ,[Parish]  ,[TerminationDate],[Gender])     VALUES  ('Ava','Bernard','Single','12 March 1995','10 October 2010','10 October 2028','129 Runboat Close, Marlie','St James','','Female')
         
INSERT INTO [dbo].[SoldierInfo] ([FName] ,[LName] ,[MaritalStatus] ,[DOB] ,[DOE]  ,[ROD] ,[Address]  ,[Parish]  ,[TerminationDate],[Gender])  values     ('Shelly','Pryce','Married','8 June 1983','15 May 2003','15 May 2023','143 Luke Lane,Kingston 5','Kingston','15 May 2023','Female')


INSERT INTO [dbo].[P2OEntry]  ([RegNo]  ,[RankId]  ,[UnitID]  ,[CoyID] ,[EntryID] ,[OrdersID]
           ,[OrderNumber]  ,[DateofOrder] ,[Occurrence]  ,[wefDate]  ,[EndDate] ,[EnteredBy])     VALUES
           (3,20,6,21,14,2,'59/23','5 December 2023','Passed his BFST on 10 June 2023','10 June 2023','1 January 2024','P.Green')

 INSERT INTO [dbo].[P2OEntry]  ([RegNo]  ,[RankId]  ,[UnitID]  ,[CoyID] ,[EntryID] ,[OrdersID]
           ,[OrderNumber]  ,[DateofOrder] ,[Occurrence]  ,[wefDate]  ,[EndDate] ,[EnteredBy])  
		   VALUES  (2,26,9,32,19,2,'70/22','6 August 2022','Given 4 days C disposal wef 4 June 2022','4 June 2023','7 June 2022','J.Brown')

 INSERT INTO [dbo].[P2OEntry]  ([RegNo]  ,[RankId]  ,[UnitID]  ,[CoyID] ,[EntryID] ,[OrdersID],[OrderNumber]  ,[DateofOrder] ,[Occurrence]  ,[wefDate]  ,[EndDate] ,[EnteredBy])     VALUES           (4,28,18,60,5,2,'47/23','8 September 2022','Attached under Command to 1st Dist JDF CG wef 24 August 2023 until further notice','24 August 2023','9 September 2950','Charles Grant')

   INSERT INTO [dbo].[P2OEntry]  ([RegNo]  ,[RankId]  ,[UnitID]  ,[CoyID] ,[EntryID] ,[OrdersID][OrderNumber],[DateofOrder] ,[Occurrence]  ,[wefDate]  ,[EndDate] ,[EnteredBy])     VALUES
           (2,29,5,15,11,2,'93/22','12 December 2022','Appointed to the rank of L/WO2 wef 1 November 20222','1 November 2022','1 November 2024','Simone Bailey')



INSERT INTO [DBO].[Password (UserName,UserPassword,Rights,BrigadeLevel,UntLevel,CoyLevel)
values('Willard','12345','Administrator',0,0,0)


INSERT INTO [DBO].[Password] (UserName,UserPassword,Rights,BrigadeLevel,UntLevel,CoyLevel)
values('John','12345','Brigade',1,0,0)


INSERT INTO [DBO].[Password] (UserName,UserPassword,Rights,BrigadeLevel,UntLevel,CoyLevel)
values('Johnathan','12345','Unit',1,9,0)


INSERT INTO [DBO].[Password] (UserName,UserPassword,Rights,BrigadeLevel,UntLevel,CoyLevel)
values('Peter','12345','Company',1,4,4)
