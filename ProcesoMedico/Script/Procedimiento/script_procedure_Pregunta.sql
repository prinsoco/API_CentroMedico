IF OBJECT_ID('sp_Pregunta_Insert') IS NOT NULL DROP PROC sp_Pregunta_Insert;
GO
CREATE PROC sp_Pregunta_Insert
  @TextoPregunta NVARCHAR(500),
  @Categoria NVARCHAR(50) = NULL,
  @TipoRespuesta NVARCHAR(20),
  @Orden INT = 1,
  @Activa BIT = 1
AS
BEGIN
  INSERT INTO Pregunta (TextoPregunta, Categoria, TipoRespuesta, Orden, Activa)
  VALUES (@TextoPregunta, @Categoria, @TipoRespuesta, @Orden, @Activa);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Pregunta_Update') IS NOT NULL DROP PROC sp_Pregunta_Update;
GO
CREATE PROC sp_Pregunta_Update
  @PreguntaId INT,
  @TextoPregunta NVARCHAR(500),
  @Categoria NVARCHAR(50) = NULL,
  @TipoRespuesta NVARCHAR(20),
  @Orden INT = 1,
  @Activa BIT = 1
AS
BEGIN
  UPDATE Pregunta
  SET TextoPregunta=@TextoPregunta, Categoria=@Categoria, TipoRespuesta=@TipoRespuesta, Orden=@Orden, Activa=@Activa
  WHERE PreguntaId=@PreguntaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Pregunta_Delete') IS NOT NULL DROP PROC sp_Pregunta_Delete;
GO
CREATE PROC sp_Pregunta_Delete
  @PreguntaId INT
AS
BEGIN
  DELETE FROM Pregunta WHERE PreguntaId=@PreguntaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Pregunta_GetById') IS NOT NULL DROP PROC sp_Pregunta_GetById;
GO
CREATE PROC sp_Pregunta_GetById
  @PreguntaId INT
AS
BEGIN
  SELECT * FROM Pregunta WHERE PreguntaId=@PreguntaId;
END
GO

IF OBJECT_ID('sp_Pregunta_GetAll') IS NOT NULL DROP PROC sp_Pregunta_GetAll;
GO
CREATE PROC sp_Pregunta_GetAll
  @Categoria NVARCHAR(50) = NULL,
  @Activa BIT = NULL
AS
BEGIN
  SELECT *
  FROM Pregunta
  WHERE (@Categoria IS NULL OR Categoria=@Categoria)
    AND (@Activa IS NULL OR Activa=@Activa)
  ORDER BY Orden ASC;
END
GO
