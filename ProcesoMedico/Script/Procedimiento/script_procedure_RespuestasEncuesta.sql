IF OBJECT_ID('sp_RespuestasEncuesta_Insert') IS NOT NULL DROP PROC sp_RespuestasEncuesta_Insert;
GO
CREATE PROC sp_RespuestasEncuesta_Insert
  @EncuestaId INT,
  @PreguntaId INT,
  @RespuestaTexto NVARCHAR(MAX) = NULL,
  @ValorNumerico INT = NULL
AS
BEGIN
  INSERT INTO RespuestasEncuesta (EncuestaId, PreguntaId, RespuestaTexto, ValorNumerico, FechaRegistro)
  VALUES (@EncuestaId, @PreguntaId, @RespuestaTexto, @ValorNumerico, GETDATE());
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_RespuestasEncuesta_Update') IS NOT NULL DROP PROC sp_RespuestasEncuesta_Update;
GO
CREATE PROC sp_RespuestasEncuesta_Update
  @RespuestaId INT,
  @RespuestaTexto NVARCHAR(MAX) = NULL,
  @ValorNumerico INT = NULL
AS
BEGIN
  UPDATE RespuestasEncuesta
  SET RespuestaTexto=@RespuestaTexto, ValorNumerico=@ValorNumerico
  WHERE RespuestaId=@RespuestaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_RespuestasEncuesta_Delete') IS NOT NULL DROP PROC sp_RespuestasEncuesta_Delete;
GO
CREATE PROC sp_RespuestasEncuesta_Delete
  @RespuestaId INT
AS
BEGIN
  DELETE FROM RespuestasEncuesta WHERE RespuestaId=@RespuestaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_RespuestasEncuesta_GetById') IS NOT NULL DROP PROC sp_RespuestasEncuesta_GetById;
GO
CREATE PROC sp_RespuestasEncuesta_GetById
  @RespuestaId INT
AS
BEGIN
  SELECT * FROM RespuestasEncuesta WHERE RespuestaId=@RespuestaId;
END
GO

IF OBJECT_ID('sp_RespuestasEncuesta_GetAll') IS NOT NULL DROP PROC sp_RespuestasEncuesta_GetAll;
GO
CREATE PROC sp_RespuestasEncuesta_GetAll
  @EncuestaId INT = NULL,
  @PreguntaId INT = NULL
AS
BEGIN
  SELECT *
  FROM RespuestasEncuesta
  WHERE (@EncuestaId IS NULL OR EncuestaId=@EncuestaId)
    AND (@PreguntaId IS NULL OR PreguntaId=@PreguntaId)
  ORDER BY FechaRegistro DESC;
END
GO
