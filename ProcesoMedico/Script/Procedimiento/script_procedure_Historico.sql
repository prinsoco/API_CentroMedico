IF OBJECT_ID('sp_Historico_Insert') IS NOT NULL DROP PROC sp_Historico_Insert;
GO
CREATE PROC sp_Historico_Insert
  @Pantalla VARCHAR(200),
  @Usuario VARCHAR(50),
  @Maquina VARCHAR(100),
  @DatosEntrada VARCHAR(MAX),
  @Descripcion VARCHAR(400),
  @Estado BIT = 1
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO Historico (Pantalla, Usuario, Maquina, DatosEntrada, Descripcion, Estado, FechaCreacion)
  VALUES (@Pantalla, @Usuario, @Maquina, @DatosEntrada, @Descripcion, ISNULL(@Estado,1), GETDATE());
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Historico_GetById') IS NOT NULL DROP PROC sp_Historico_GetById;
GO
CREATE PROC sp_Historico_GetById
  @LogId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Historico WHERE LogId=@LogId;
END
GO

IF OBJECT_ID('sp_Historico_GetAll') IS NOT NULL DROP PROC sp_Historico_GetAll;
GO
CREATE PROC sp_Historico_GetAll
  @Usuario VARCHAR(50) = NULL,
  @Pantalla VARCHAR(200) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;

  SELECT *
  FROM Historico
  WHERE (@Usuario IS NULL OR Usuario=@Usuario)
  AND (@Pantalla IS NULL OR Pantalla=@Pantalla)
  AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY LogId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Historico
  WHERE (@Usuario IS NULL OR Usuario=@Usuario)
  AND (@Pantalla IS NULL OR Pantalla=@Pantalla)
  AND (@Estado IS NULL OR Estado=@Estado);
END
GO
