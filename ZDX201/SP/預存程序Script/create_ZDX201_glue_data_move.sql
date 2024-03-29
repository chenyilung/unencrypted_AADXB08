USE [ZDX201]
GO
/****** Object:  StoredProcedure [dbo].[glue_data_move]    Script Date: 2023/7/5 下午 02:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--名稱:glue_data_move
--作者:Leo
--功能:移動glue_data
--定時執行:每日
-- =============================================
Create PROCEDURE [dbo].[glue_data_move] 
--WITH
--    ENCRYPTION
AS
BEGIN
	DECLARE @is_empty BIT =1

WHILE @is_empty =1
BEGIN
    DECLARE @id uniqueidentifier = (
        SELECT TOP(1) [id] FROM [glue_data]
        WHERE DATEDIFF(dd, update_time, GETDATE())>=10)    
    IF @id IS NULL
        SET @is_empty = 0
    ELSE
         UPDATE [glue_data] SET
            [time_spout] = [update_time]
        WHERE [id] = @id
END

END
