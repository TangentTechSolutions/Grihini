USE [Grihini]
GO
/****** Object:  StoredProcedure [dbo].[usp_mst_Location]    Script Date: 01/16/2016 12:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- =============================================                  
-- Author:  Chandan Mandal  
-- Create date: 05th Nov 2015                
-- Description: Adds New Country into dbo.tbl_MST_location                  
                  
-- =============================================                  
ALTER PROCEDURE [dbo].[usp_mst_Location]                   
 -- Add the parameters for the stored procedure here                  
                   
  @Location_id int=Null                  
 ,@Location_name varchar(50)=Null                  
 ,@State_id varchar(50)=Null                  
 ,@District_id int=Null                  
 ,@Regionid int=Null                  
 ,@Country_id int=Null                  
 ,@Created_by int=Null                  
 ,@Created_date datetime=Null                   
 ,@Modified_by int=Null                  
 ,@Modified_date datetime=Null                    
 ,@Isactive int=Null                  
 ,@OperationId int=Null                  
 ,@status int=null  output                  
 ,@ErrNo int=null output                  
 ,@ErrMsg varchar(500)=null output
                   
AS                  
BEGIN                   
                  
BEGIN TRY                  
                  
 BEGIN TRAN T                  
 ----------------------------Insert statements for procedure here ---------------------------------------------------------                  
  IF @OperationId=1                  
  BEGIN                  
                  
   INSERT INTO dbo.tbl_MST_location                  
       (                  
         [Location_name]                  
        ,[District_id]                   
        ,[State_id]                                           
        ,[Created_by]                  
        ,[Created_date]                  
        ,[Isactive]                  
        )                  
   VALUES (                  
      @Location_name                
     ,@District_id                  
     ,@State_id                                       
     ,@Created_by                
     ,GETDATE()                  
     ,1                  
     )                  
       END                  
--------------------------------Edit Location------------------------------------------------------------------------------                         
    ELSE IF @OperationId=2                  
    BEGIN                  
                      
    UPDATE dbo.tbl_MST_location                      
    SET [Location_name]=@Location_name                      
       ,[State_id] =@State_id                            
       ,[Created_by]=@Created_by                
       ,[Created_date]=GETDATE()     
       ,[Modified_by] =@Modified_by        
       ,[Modified_date]=@Modified_date            
       ,[isactive]=1                  
    WHERE location_id=@location_id                  
                      
      END                  
---------------------------------Delete Location-------------------------------------------------------------------------------                        
   ELSE IF @OperationId=3                  
                         
   BEGIN                  
   UPDATE dbo.tbl_MST_location                  
   SET Isactive=0                  
          WHERE Location_id=@Location_id                 
   END                  
                     
                     
--------------------------------------- for show location in gridview --------------------------------------------------------------------------                      
   ELSE IF @OperationId=4                         
   BEGIN                  
   SELECT  Location_id,Location_name,tbl_Mst_State.State_Name,  
   emp.Emp_Name as Created_by,  
   convert(varchar(12),tbl_MST_location.Created_date,113) as Created_date  
   from tbl_MST_location  
   join tbl_Mst_State on tbl_Mst_State.State_Id=tbl_MST_location.State_id  
   left join tbl_Employee_Reg emp on emp.Emp_ID=tbl_MST_location.Created_by  
   where tbl_MST_location.Isactive=1                   
   order by  Location_name Asc         
        
   END                             
          
------------------------------------------------------------------------------------------------------             
 ELSE IF @OperationId=5                        
   BEGIN                  
     select Location_Id,Location_Name                     
     from dbo.tbl_Mst_Location             
     where Isactive=1                 
    order by Location_Name asc     
                  
   END   
 ------------------------------------------------------------------------------------------------------             
 ELSE IF @OperationId=6                       
   BEGIN                  
     select Location_Id,Location_Name                     
     from dbo.tbl_Mst_Location             
     where Isactive=1  and State_id=@State_id                 
    order by Location_Name asc                 
   END      
   
    -----Fetching Location in State------------------                    
                     
 Else IF @OperationId=7                           
BEGIN                      
                    
Select * from (select 0 as location_id, 'Select' as  location_name         
union all          
Select location_id, location_name from dbo.tbl_mst_location                  
where state_id=@state_id and isactive=1             
union all          
          
select 1000 as location_id,'Other' as location_name)as tbl          
order by case (location_name) when 'Select'  then null when 'Other'          
 then 'zzzz' else location_name end                     
                 
                 
END
--------------------// Binding Country in Country DropDownList in Delivery Address Page//------------
IF @OperationId=8                
  BEGIN
  select 0 as country_id,'Select Country' as country_name
  union all 
 select country_id,country_name from dbo.tbl_mst_country
 where isactive=1

  end 
  
--------------------// Binding State in State DropDownList Against Country in Delivery Address Page//------------
IF @OperationId=9                
  BEGIN
  
  select 0 as Stateid,'Select State' as StateName
  union all 
  select s.Stateid as Stateid,s.StateName as StateName from dbo.MstState s
  join dbo.tbl_mst_country c on s.CountryId=c.country_id
  where s.isactive=1 and c.country_id=@Country_id
 
 end 
  
--------------------// Binding Location in Location DropDownList Against State in Delivery Address Page//------------
IF @OperationId=10               
  BEGIN
    select 0 as location_id, 'Select Location' as location_name
  union all
  select l.location_id as location_id,l.location_name as location_name 
  from dbo.tbl_mst_location l
  left join dbo.MstState s on l.State_Id=s.Stateid
  where l.Isactive=1 and l.State_Id=@state_id
 end 
-------------------------------------------------------------------------------------------------------------------                     
                     
   IF @@Error=0                  
   BEGIN                  
     SET @status=0                  
     COMMIT TRAN T                  
   END                  
                     
   ELSE                  
   BEGIN                  
      SET @status=1                  
      ROLLBACK TRAN T                  
   END                  
 END TRY                    
                    
  BEGIN CATCH                  
    SET @status=1                  
    SET @ErrNo=ERROR_NUMBER()                  
    SET @ErrMsg=ERROR_MESSAGE()                  
    ROLLBACK TRAN T                  
  END CATCH                  
                      
                      
 END  