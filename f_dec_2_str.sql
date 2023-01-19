CREATE FUNCTION [dbo].[f_dec_2_str](
	@inNumber numeric(15, 8)
) RETURNS varchar(100) AS
BEGIN
	DECLARE @outString	varchar(100)
	set @outString = convert(varchar, @inNumber)
	if (charindex('.', @outString) > 0)
	  BEGIN
		while right(@outString, 1) = '0'
		  BEGIN
		    if right(@outString, 2) = '.0' break
			set @outString = left(@outString, len(@outString) - 1)
		  END
	  END

	return @outString
END