USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_CheckBrigadeExist]    Script Date: 4/1/2024 10:15:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CheckBrigadeExist]    
     @brigadeName nvarchar(50)
	  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 DECLARE @countvalue int 

	set @countvalue= (SELECT count(brigadeName) from Brigade
	where brigadeName=@brigadeName)

	return @countvalue
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_CheckifBrigadeExist]    Script Date: 4/1/2024 10:15:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_CheckifBrigadeExist]
	-- Add the parameters for the stored procedure here
     
     @brigadeName nvarchar(50),	 
	 @countvalue nvarchar(8) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT count(brigadeName) from Brigade
	where brigadeName=@brigadeName

	return @countvalue
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteBrigade]    Script Date: 4/1/2024 10:16:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteBrigade]
  @bdeId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(brigadeName) from Brigade
	where id=@bdeId)

	if(@countvalue=1)  
          delete from dbo.Brigade
		  where ID=@bdeId

	return @countvalue
	end	 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteCoy]    Script Date: 4/1/2024 10:16:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteCoy]
   @unitId int,
   @bdeid int,
   @CoyId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @countvalue int
	set @countvalue=  (SELECT count([ID])
      FROM [dbo].[Coy]   
	  where  unitID in (select id from Unit where BdeID in (select id from brigade where id=@bdeid))
		  and id=@CoyId
		  and unitID =@unitId)
	  
	  	

	  if(@countvalue>0)  
         delete from Coy  
		  where  unitID in (select id from Unit where BdeID in (select id from brigade where id=@bdeid))
		  and id=@CoyId
		  and unitID =@unitId
  return @countvalue
		 

END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteEntryName]    Script Date: 4/1/2024 10:16:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteEntryName]
  @entryId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(entryName) from EntryType
	where id=@entryId)

	if(@countvalue)>0  
          delete from dbo.EntryType
		  where ID=@entryId

		return @countvalue 
	    
END 

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteOrderType]    Script Date: 4/1/2024 10:17:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteOrderType]
  @orderId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(ordersname) from [dbo].[OrdersType]
	where id=@orderId)

	if(@countvalue)>0  
          delete from dbo.[OrdersType]
		  where ID=@orderId

	return @countvalue	 
	    
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeletePt2Orders]    Script Date: 4/1/2024 10:17:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_DeletePt2Orders]
(
      @id int,
	  @rankid int,
	  @unitid int,
	  @coyid int,
	  @entryid int,
	  @orderno nvarchar(6),
      @DateofOrder date,
	  @Occurrence nvarchar(max),
	  @wef date,
	  @end date,
	  @enteredby nvarchar(20)
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(RegNo) from P2OEntry
	where RegNo=@id and
	RankId=@rankid
	AND UnitID=@unitid
	AND CoyID=@coyid
	AND EntryID=@entryid
	AND OrderNumber =@orderno
	AND DateofOrder=@DateofOrder
	AND Occurrence=@Occurrence
	and wefDate=@wef
	and EndDate=@end
	and EnteredBy=@enteredby
	)

	  if(@countvalue)>0  
	      	     delete from P2OEntry
				where UnitID=@unitid and
				RankId=@rankid and
				 CoyID=@coyid and
				 EntryID=@entryid and
				 OrderNumber =@orderno and
				 DateofOrder=@DateofOrder and
				 Occurrence=@Occurrence and
				 wefDate=@wef and
				 EndDate=@end and
				 EnteredBy=@enteredby and
				  RegNo=@id and
				  wefDate=@wef
				
			 return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteRank]    Script Date: 4/1/2024 10:17:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteRank]
	@RankId int 
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(RankName) from dbo.[Rank]
	where id=@RankId)

	  if(@countvalue>0)  
         delete from dbo.[Rank]
		 where ID=@RankId	
		 
     return @countvalue

end
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteUnit]    Script Date: 4/1/2024 10:17:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_DeleteUnit]
  @unitID int,
  @bdeId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(UnitName) from unit
	where id=@unitID and BdeID=@bdeId)

	if(@countvalue>1)  
          delete from dbo.Unit
		 where id=@unitID and BdeID=@bdeId

	return @countvalue
		 
	    
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_EditCoy]    Script Date: 4/1/2024 10:18:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditCoy]
   @unitId int,
   @bdeid int,
   @CoyId int,
   @Coyname varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @countvalue int
	set @countvalue=  (SELECT count([ID])
      FROM [dbo].[Coy]   
	  where  unitID in (select id from Unit where BdeID in (select id from brigade where id=@bdeid))
		  and id=@CoyId
		  and unitID =@unitId)
	  
	  	

	  if(@countvalue)<=1  
         update Coy set 
		  CoyName = @Coyname
		  where  unitID in (select id from Unit where BdeID in (select id from brigade where id=@bdeid))
		  and id=@CoyId
		  and unitID =@unitId

		 

END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_EditPt2Orders]    Script Date: 4/1/2024 10:18:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditPt2Orders]
(
      @id int,
	  @rankid int,
	  @unitid int,
	  @coyid int,
	  @entryid int,
	  @orderno nvarchar(6),
      @DateofOrder date,
	  @Occurrence nvarchar(max),
	  @wef date,
	  @end date,
	  @enteredby nvarchar(20)
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(RegNo) from P2OEntry
	where RegNo=@id and
	RankId=@rankid
	AND UnitID=@unitid
	AND CoyID=@coyid
	AND EntryID=@entryid
	AND OrderNumber =@orderno
	AND DateofOrder=@DateofOrder
	AND Occurrence=@Occurrence
	and wefDate=@wef
	and EndDate=@end
	and EnteredBy=@enteredby
	)

	  if(@countvalue)<=1  
	      	     update P2OEntry
				set UnitID=@unitid,
				RankId=@rankid,
				 CoyID=@coyid,
				 EntryID=@entryid,
				 OrderNumber =@orderno,
				 DateofOrder=@DateofOrder,
				 Occurrence=@Occurrence,
				 wefDate=@wef,
				 EndDate=@end,
				 EnteredBy=@enteredby
				 where RegNo=@id 
				 and wefDate=@wef
				
			 return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_EditUser]    Script Date: 4/1/2024 10:18:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditUser]
(
      @UserName nvarchar(50),
	  @UserPassword nvarchar(50),
	  @Rights nvarchar(50),
      @BrigadeLevel int,
	  @UnitLevel int,
	  @CoyLevel int
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(UserName) from Password
	where UserName=@UserName
	)

	  if(@countvalue)< =1  
	      	    update Password
				set UserPassword=@UserPassword,
				Rights=@Rights,
				BrigadeLevel=@BrigadeLevel,
				UntLevel=@UnitLevel,
				CoyLevel=@CoyLevel
			     where UserName=@UserName

	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_getCoyName]    Script Date: 4/1/2024 10:18:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getCoyName]
 @coyNAME nvarchar(50),
 @unitname nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @countvalue int 

	set @countvalue=(SELECT  Coy.ID from [dbo].Coy,Unit where CoyName=@coyNAME
	AND UNIT.UnitName=@unitname)

	SELECT  Coy.ID from [dbo].Coy,Unit where CoyName=@coyNAME
	AND UNIT.UnitName=@unitname
	return @countvalue
END 






GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_getEntyID]    Script Date: 4/1/2024 10:19:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getEntyID]
 @entryName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @countvalue int 

	set @countvalue=(SELECT  id from [dbo].EntryType where EntryName=@entryName)
	SELECT  id from [dbo].EntryType where EntryName=@entryName
	return @countvalue
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_getorderID]    Script Date: 4/1/2024 10:19:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getorderID]
 @orderName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @countvalue int 

	set @countvalue=(SELECT  id from [dbo].OrdersType where OrdersName=@orderName)

	SELECT  id from [dbo].OrdersType where ordersName=@orderName
	return @countvalue
END 


--SELECT  id from [dbo].OrdersType where orderName= 'Appointment'
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_getRankName]    Script Date: 4/1/2024 10:19:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getRankName]
 @rankName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	DECLARE @countvalue int 

	set @countvalue=(select  distinct id from [dbo].[Rank] where RankName=@rankName)

	select  distinct id from [dbo].[Rank] where RankName=@rankName
	return @countvalue
	
END 

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_getUnitName]    Script Date: 4/1/2024 10:19:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getUnitName]
 @unitName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @countvalue int 

	set @countvalue=(SELECT  id from [dbo].Unit where UnitName=@unitName)
	SELECT  id from [dbo].Unit where UnitName=@unitName
	return @countvalue
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertBrigade]    Script Date: 4/1/2024 10:20:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertBrigade]
(
      @brigadeName nvarchar(50)
	  

)
AS
BEGIN
    SET NOCOUNT ON
  declare @countvalue int 

	set @countvalue= (SELECT count(brigadeName) from Brigade
	where brigadeName=@brigadeName)

	  if(@countvalue)<1  
          INSERT INTO dbo.Brigade(BrigadeName)values(@brigadeName)
    
	 return @countvalue
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCoy]    Script Date: 4/1/2024 10:20:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertCoy]
(
      @CoyName nvarchar(50),
      @Unitid int,
	  @bdeId int
     
     
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(CoyName) from Coy,Brigade,Unit
	where Coy.UnitID=@Unitid and Brigade.[ID]=@bdeId
	and Coy.UnitID =Unit.ID and CoyName=@CoyName
	)

	  if(@countvalue)<1  
          INSERT INTO dbo.Coy(CoyName,UnitID) values(@CoyName,@Unitid)
    
    
	 return @countvalue
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertEntryName]    Script Date: 4/1/2024 10:20:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_InsertEntryName]
(
      @EntryName nvarchar(50)
)
AS
BEGIN
    SET NOCOUNT ON
    INSERT INTO dbo.EntryType(EntryName)values(@EntryName)
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertOrderType]    Script Date: 4/1/2024 10:21:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_InsertOrderType]
(
      @orderName nvarchar(30)
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(ordersName) from OrdersType
	where ordersName=@orderName)

	  if(@countvalue)<1  
          INSERT INTO dbo.OrdersType(ordersName)values(@orderName)
    
	 return @countvalue
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertPt2Orders]    Script Date: 4/1/2024 10:21:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertPt2Orders]
(
      @id int,
	  @rankid int,
	  @unitid int,
	  @coyid int,
	  @entryid int,
	  @orderid int,
	  @orderno nvarchar(6),
      @DateofOrder date,
	  @Occurrence nvarchar(max),
	  @wef date,
	  @end date,
	  @enteredby nvarchar(20)
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(RegNo) from P2OEntry
	where RegNo=@id and
	RankId=@rankid
	AND UnitID=@unitid
	AND CoyID=@coyid
	AND EntryID=@entryid
	AND OrdersID = @orderid
	AND OrderNumber =@orderno
	AND DateofOrder=@DateofOrder
	AND Occurrence=@Occurrence
	and wefDate=@wef
	and EndDate=@end
	and EnteredBy=@enteredby
	)

	--if(@countvalue<1) 
	      	    INSERT INTO dbo.P2OEntry(RegNo,RankId,UnitID,CoyID,EntryID,OrdersID,OrderNumber,DateofOrder,Occurrence,wefDate,EndDate,EnteredBy)
			      values(@id,@rankid,@unitid,@coyid,@entryid,@orderid,@orderno,@DateofOrder,@Occurrence,@wef,@end,@enteredby)
       
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertRank]    Script Date: 4/1/2024 10:21:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_InsertRank]
(
      @RankName nvarchar(20)
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(RankName) from rank
	where RankName=@RankName )

	  if(@countvalue)<1  
          INSERT INTO dbo.Rank(RankName)values(@RankName)
    
	 return @countvalue
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertSecurityDetail]    Script Date: 4/1/2024 10:21:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_InsertSecurityDetail]
(
      @FirstrName nvarchar(20),
	  @LastName nvarchar(20),
	  @Gender nvarchar(10),
      @MaritalStatus nvarchar(15),
	  @DOB date,
	  @DOE date,
	  @ROD date,
	  @address nvarchar(300),
	  @Parish nvarchar(20)
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(fname) from SoldierInfo
	where FName=@FirstrName and LName=@LastName
	AND MaritalStatus=@MaritalStatus
	AND Gender=@Gender
	AND DOB=@DOB
	AND DOE = @DOE
	AND ROD =@ROD
	AND [Address]=@address
	AND Parish=@Parish
	)

	  if(@countvalue)<1  
	      	    INSERT INTO dbo.SoldierInfo(FName,LName,MaritalStatus,Gender,DOB,DOE,ROD,[Address],Parish)
			      values(@FirstrName,@LastName,@MaritalStatus,@Gender,@DOB,@DOE,@ROD,@address,@Parish)
       
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertUnit]    Script Date: 4/1/2024 10:21:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_InsertUnit]
(
      @UnitName nvarchar(50),
	  @bdeId int
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(UnitName) from Unit
	where UnitName=@UnitName and [BdeID]=@bdeId)

	  if(@countvalue)<1  
          INSERT INTO dbo.Unit(UnitName,[BdeID])values(@UnitName,@bdeId)

    return @countvalue
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertUser]    Script Date: 4/1/2024 10:22:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_InsertUser]
(
      @UserName nvarchar(50),
	  @UserPassword nvarchar(50),
	  @Rights nvarchar(50),
      @BrigadeLevel int,
	  @UnitLevel int,
	  @CoyLevel int
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(UserName) from Password
	where UserName=@UserName and UserPassword=@UserPassword
	)

	  if(@countvalue)<1  
	      	    INSERT INTO dbo.Password(UserName,UserPassword,Rights,BrigadeLevel,UntLevel,CoyLevel)
			      values(@UserName,@UserPassword,@Rights,@BrigadeLevel,@UnitLevel,@CoyLevel)
       
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_SearchEmployeeInfoID]    Script Date: 4/1/2024 10:22:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_SearchEmployeeInfoID]
(
     
	  @Id int
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(fname) from SoldierInfo
	where  id=@Id)

	 
	      	    select id as [ID],[FName]as [First Name],LName as [Last Name],MaritalStatus as [Marital Staus],Gender,cast(DOB as date) as [Date of Birth]
				from [dbo].[SoldierInfo]
			      where id=@Id
       
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_SearchSecurityDetail]    Script Date: 4/1/2024 10:22:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_SearchSecurityDetail]
(
     
	  @LastName nvarchar(20)
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(fname) from SoldierInfo
	where  LName like @LastName+'%')

	 
	      	    select id,[FName]as [First Name],LName as [Last Name],MaritalStatus as [Marital Staus],Gender,cast(DOB as date) as [Date of Birth],cast(DOE as date) as [Date of Enlistment],cast(ROD as date) as [Run Out Date],[Address],Parish
				from [dbo].[SoldierInfo]
			      where LName like  @LastName+'%'
       
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectBrigade]    Script Date: 4/1/2024 10:22:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectBrigade]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [ID],[BrigadeName]as [Brigade] from [dbo].[Brigade]
END 
GO


USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectBrigadebyBde]    Script Date: 4/1/2024 10:23:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectBrigadebyBde]
    @BdeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [ID],[BrigadeName] as [Brigade] from [dbo].[Brigade]
	where id =@BdeId
END 

	
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectCoy]    Script Date: 4/1/2024 10:23:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectCoy]
   @BdeID int,
   @unitId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [dbo].[Coy].[ID],[dbo].[Coy].CoyName  from [dbo].[Coy], [dbo].[Unit],[dbo].[Brigade]
	where [dbo].[Brigade].[ID]=[dbo].[Unit].[BdeID]
	and [dbo].[Brigade].[ID]=@BdeID and [dbo].[Unit].ID=[dbo].[Coy].ID
	and [dbo].[Unit].ID = @unitId
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectCoybyID]    Script Date: 4/1/2024 10:23:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectCoybyID]
   @unitId int,
   @bdeid int,
   @coyID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [dbo].[Coy].[ID],[dbo].[Coy].CoyName as[Company]
FROM [dbo].[Coy], [dbo].[Unit],[dbo].[Brigade]
	where [dbo].[Brigade].[ID]=[dbo].[Unit].[BdeID]
	AND UNIT.ID = COY.UnitID
	AND UNIT.BdeID=@bdeid
	AND UNIT.ID=@unitId
	and 
	[dbo].[Coy].ID=@coyID

END 

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectEntryName]    Script Date: 4/1/2024 10:23:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectEntryName]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [ID],[EntryName] as [Entry]from [dbo].[EntryType]
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectOrdersType]    Script Date: 4/1/2024 10:24:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectOrdersType]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [ID],[ordersName] from [dbo].[OrdersType]
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectP20EntrybyID]    Script Date: 4/1/2024 10:24:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectP20EntrybyID]
    @RegNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		select dbo.[Rank].RankName as [Rank] ,[FName]as [First Name], 
		lname as [Last Name],Unit.UnitName as [Unit],Coy.CoyName as [Company],EntryName as [Entry]
		,OrderNumber,Occurrence, DateofOrder,wefDate,EndDate,EnteredBy
		from [SoldierInfo],[P2OEntry],Brigade,Unit,coy,OrdersType,EntryType, dbo.[Rank]
		where [P2OEntry].RegNo=@RegNo 
		and brigade.ID=Unit.BdeID
		and Coy.ID=P2OEntry.CoyID
		and P2OEntry.EntryID=EntryType.id
		and OrdersType.Id=P2OEntry.OrdersID
		and P2OEntry.RankId=dbo.[Rank].Id
		and dbo.[SoldierInfo].Id=@RegNo 
		and Unit.ID=P2OEntry.UnitID
		order by DateofOrder asc
end
GO


USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectRank]    Script Date: 4/1/2024 10:24:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectRank]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [ID],RankName from [dbo].Rank
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectUnit]    Script Date: 4/1/2024 10:24:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectUnit]
   @BdeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [dbo].[Unit].[ID],[dbo].[Unit].[UnitName]as[Unit] from [dbo].[Unit],[dbo].[Brigade]
	where [dbo].[Brigade].[ID]=[dbo].[Unit].[BdeID]
	and [dbo].[Brigade].[ID]=@BdeID
	order by [dbo].[Unit].[UnitName]
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectUnitbyID]    Script Date: 4/1/2024 10:25:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectUnitbyID]
   @BdeID int,
   @UnitID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [dbo].[Unit].[ID],[dbo].[Unit].[UnitName]as[Unit] from [dbo].[Unit],[dbo].[Brigade]
	where [dbo].[Brigade].[ID]=[dbo].[Unit].[BdeID]
	and [dbo].[Brigade].[ID]=@BdeID
	and [dbo].[Unit].ID=@UnitID
	order by [dbo].[Unit].[UnitName]
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_SelectUser]    Script Date: 4/1/2024 10:25:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SelectUser]

AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(UserName) from Password
		)
		
	  if(@countvalue)> 0  
	      	    select [UserName] as [Users], [UserPassword], [Rights],[BrigadeLevel], [UntLevel],[CoyLevel] from Password
SELECT count(UserName) from Password
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectUserLogin]    Script Date: 4/1/2024 10:25:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_selectUserLogin]
   @UserName nvarchar(50),
   @Password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @countvalue int 

	set @countvalue=(select count(UserName) from dbo.[Password]
	  where UserName=@UserName and UserPassword=@Password)
	  
	 select count(UserName) from Password 
	  where UserName=@UserName and UserPassword=@Password

	return @countvalue 


END

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_selectUserLoginDetail]    Script Date: 4/1/2024 10:25:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_selectUserLoginDetail]
   @UserName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @countvalue int 

	set @countvalue=(select count(UserName) from Password 
	  where UserName=@UserName)
	  
	  select UserName, Rights,BrigadeLevel,UntLevel,CoyLevel from Password 
	  where UserName=@UserName 

	return @countvalue 


END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateBrigade]    Script Date: 4/1/2024 10:25:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateBrigade]
  @brigadeName nvarchar(50),
  @bdeId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(brigadeName) from Brigade
	where brigadeName=@brigadeName)

	if(@countvalue)<=1  
          update dbo.Brigade
		  set BrigadeName=@brigadeName 
		  where ID=@bdeId

	return @countvalue
		 
	    
END 

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCoy]    Script Date: 4/1/2024 10:26:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateCoy]
(
      @CoyName nvarchar(50),
      @Unitid int,
	  @Coyid int,
	  @bdeId int
     
     
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(CoyName) from Coy,Brigade,Unit
	where Coy.UnitID=@Unitid and Brigade.[ID]=@bdeId
	and Coy.UnitID =Unit.ID
	)

	  if(@countvalue)<=1  
          update dbo.Coy
		  set Coy.CoyName=@CoyName
		  where Coy.ID = @Coyid
		  and Unitid=@Unitid
		 
	return @countvalue 
END	
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateEntryName]    Script Date: 4/1/2024 10:26:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateEntryName]
  @entryName nvarchar(50),
  @entryId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(entryName) from EntryType
	where EntryName=@entryName)

	if(@countvalue)<=1  
          update dbo.EntryType
		  set EntryName=@entryName 
		  where ID=@entryId

		return @countvalue 
	    
END 

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrderType]    Script Date: 4/1/2024 10:26:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateOrderType]
  @orderName nvarchar(30),
  @orderId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count(ordersname) from [dbo].[OrdersType]
	where OrdersName=@orderName)

	if(@countvalue)<=1  
          update dbo.[OrdersType]
		  set OrdersName =@orderName 
		  where ID=@orderId

	return @countvalue	 
	    
END 
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateRank]    Script Date: 4/1/2024 10:26:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateRank]
  @RankName nvarchar(30),
  @RankId int
AS
BEGIN
     DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count([RankName]) from Rank
	where Id=@RankId)

	if(@countvalue)<=1  
          update dbo.Rank
		  set RankName =@RankName 
		  where ID=@RankId
		 
	 return  @countvalue   
END 

GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateSecurityDetail]    Script Date: 4/1/2024 10:26:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateSecurityDetail]
(     @IDNum int,
      @FirstrName nvarchar(20),
	  @LastName nvarchar(20),
	  @Gender nvarchar(10),
      @MaritalStatus nvarchar(15),
	  @DOB date,
	  @DOE date,
	  @ROD date,
	  @address nvarchar(300),
	  @Parish nvarchar(20)
     
     
)
AS
BEGIN
   
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(fname) from SoldierInfo
	where id=@IDNum  
	)

	  if(@countvalue)<=1  
	      	    update dbo.SoldierInfo
				set FName=@FirstrName,LName=@LastName
				,MaritalStatus=@MaritalStatus,Gender=@Gender,
				DOB=@DOB,DOE=@DOE,ROD=@ROD,[Address]=@address,Parish=@Parish
				where Id=@IDNum
       
	     return @countvalue
	
	 
END
GO

USE [ReportingSystem]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateUnit]    Script Date: 4/1/2024 10:27:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateUnit]
(     
      @UnitId int,
      @UnitName nvarchar(50),
	  @bdeId int
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @countvalue int 

	set @countvalue= (SELECT count(UnitName) from Unit
	where UnitName=@UnitName and [BdeID]=@bdeId)

	  if(@countvalue)<=1  
         update dbo.Unit
		 set UnitName=@UnitName 
		 where ID=@UnitId
		 and bdeID=@bdeId	
		 
     return @countvalue
END
	 
GO




USE [ReportingSystem]
GO
/****** Object:  StoredProcedure [dbo].[sp_selectbrigadeID]    Script Date: 4/4/2024 11:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_selectbrigadeID]
   @unitId int,
   @coyID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @countvalue int 

	set @countvalue=(select brigade.ID from brigade,Unit,coy
	where brigade.ID=Unit.BdeID
	and Coy.UnitID=Unit.ID
	and coy.id=@coyID
	and unit.ID=@unitId)

	select brigade.ID from brigade,Unit,coy
	where brigade.ID=Unit.BdeID
	and Coy.UnitID=Unit.ID
	and coy.id=@coyID
	and unit.ID=@unitId

	return @countvalue

END 













USE [ReportingSystem]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]   Script Date: 4/10/2024 11:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_DeleteUser]
  @Username nvarchar(50),
  @password nvarchar(50)
AS
BEGIN
    DECLARE @countvalue int 
	
	SET NOCOUNT ON;

	set @countvalue= (SELECT count([USERNAME]) from Password
	 where dbo.[Password].[USERNAME]=@Username
		 and [UserPassword]=@password)

	if(@countvalue>0)        
	       delete from dbo.Password
		 where dbo.[Password].[USERNAME]=@Username
		 and [UserPassword]=@password

		 return @countvalue


		 
	    
END 
















