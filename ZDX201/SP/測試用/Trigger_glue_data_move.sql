
  SELECT gd.[id], gd.[time_spout], gd.[update_time] FROM [glue_data] AS gd

 -- UPDATE [glue_data] SET
	--[time_spout] = [update_time]
	--WHERE [update_time] > '2023-04-15'


--DECLARE @id uniqueidentifier 

	--WHILE (@id) is not null
	--	BEGIN
	--		set @id =(SELECT TOP(1) [id] FROM [glue_data] WHERE [update_time] > '2023-04-15')
	--		UPDATE [glue_data] SET
	--				[time_spout] = [update_time]
	--			WHERE [id] = @id
				 
	--	END

DECLARE @is_empty BIT =1

WHILE @is_empty =1
BEGIN
    DECLARE @id uniqueidentifier = (
        SELECT TOP(1) [id] FROM [glue_data]
        WHERE [update_time] > '2023-04-12'
    )
    IF @id IS NULL
        SET @is_empty = 0
    ELSE
         UPDATE [glue_data] SET
            [time_spout] = [update_time]
        WHERE [id] = @id
END