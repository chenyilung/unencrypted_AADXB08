USE [ZDX201]
GO
/****** Object:  StoredProcedure [dbo].[production_record_delete]    Script Date: 2023/7/18 下午 05:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
名稱:production_record
作者:Leo
功能:刪除生產紀錄
定時執行:每日1230
保存資料量:180天
*/
CREATE PROCEDURE [dbo].[production_record_delete] 
--WITH
--    ENCRYPTION
AS
BEGIN
	 IF (SELECT COUNT(*)
    FROM production_record
    where DATEDIFF(dd, update_time, GETDATE())>=180 ) > 0 
	BEGIN
        DELETE from production_record where  DATEDIFF(dd, update_time, GETDATE())>=180

    END ;
END
