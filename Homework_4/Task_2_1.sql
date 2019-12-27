CREATE function discs_for_some_year (@year int)
returns table
AS
return (SELECT disc_title, release_date, brief_review FROM Music_Collection.dbo.Music_disc
WHERE DATEPART(YEAR, release_date) = @year)