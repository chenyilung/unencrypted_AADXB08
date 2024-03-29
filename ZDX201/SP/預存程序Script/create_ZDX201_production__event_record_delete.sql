USE [ZDX201]
GO
/****** Object:  StoredProcedure [dbo].[procudtion_event_record_delete]    Script Date: 2023/7/5 下午 01:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
名稱:production_event_record_delete
作者:Leo
功能:刪除事件紀錄
定時執行:每日
*/
Create PROCEDURE [dbo].[procudtion_event_record_delete] 
	--WITH
--    ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	IF (SELECT COUNT(*)
    FROM product_event_record
    where DATEDIFF(dd, create_time, GETDATE())>=30 ) > 0 
	BEGIN
        DELETE from product_event_record where DATEDIFF(dd, create_time, GETDATE())>=30
	END;
END;
