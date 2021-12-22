-- MSSQL
CREATE PROCEDURE Users.SP_DeleteAccountAndData
	@username nvarchar(50),
	@password nvarchar(50)

AS
	SET NOCOUNT ON;

	DELETE 
	FROM Users
	WHERE Username = @username AND Password = @password;
GO
