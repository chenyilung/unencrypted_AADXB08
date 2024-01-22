USE [ZDX201]
GO
/****** Object:  StoredProcedure [dbo].[production_move]    Script Date: 2023/7/5 下午 02:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--名稱:production_move
--作者:Leo
--功能:移動production
--定時執行:每日
-- =============================================
Create PROCEDURE [dbo].[production_move] 
--WITH
--    ENCRYPTION
AS
BEGIN
	DECLARE @is_empty BIT =1

WHILE @is_empty =1
BEGIN
    DECLARE @id nvarchar(50)= (
        SELECT TOP(1) [barcode] FROM [production]
        WHERE DATEDIFF(dd, update_time, GETDATE())>=10)    
    IF @id IS NULL
        SET @is_empty = 0
    ELSE
         UPDATE [production] SET
            [time_spout] = [update_time]
        WHERE [barcode] = @id
END

END