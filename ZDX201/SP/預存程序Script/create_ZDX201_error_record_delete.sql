USE [ZDX201]
GO
/****** Object:  StoredProcedure [dbo].[error_record_delete]    Script Date: 2023/7/18 下午 05:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
名稱:error_record
作者:Leo
功能:刪除生產紀錄
定時執行:每日1230
保存資料量:180天
*/
CREATE PROCEDURE [dbo].[error_record_delete] 
--WITH
--    ENCRYPTION
AS
BEGIN
	 IF (SELECT COUNT(*)
    FROM error_record
    where DATEDIFF(dd, [troubleshoot_time], GETDATE())>=180 ) > 0 
	BEGIN
        DELETE from error_record where  DATEDIFF(dd, [troubleshoot_time], GETDATE())>=180

    END ;
END
