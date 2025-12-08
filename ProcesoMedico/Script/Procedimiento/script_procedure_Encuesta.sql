IF OBJECT_ID('sp_Encuesta_Insert') IS NOT NULL DROP PROC sp_Encuesta_Insert;
GO
CREATE PROC sp_Encuesta_Insert
  @PacienteId INT = NULL,
  @MedicoId INT = NULL,
  @CitaId INT = NULL,
  @FechaEnvio DATETIME = NULL,
  @Estado NVARCHAR(20) = 'Pendiente',
  @CodigoAcceso NVARCHAR(50),
  @CanalEnvio NVARCHAR(20) = NULL,
  @ObservacionGeneral NVARCHAR(MAX) = NULL,
  @CalificacionGlobal DECIMAL(3,2) = NULL,
  @CreadoPor NVARCHAR(50) = NULL,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Encuesta (PacienteId, MedicoId, CitaId, FechaEnvio, Estado, CodigoAcceso, CanalEnvio, ObservacionGeneral, CalificacionGlobal, CreadoPor, FechaCreacion, UsuarioCreacion)
  VALUES (@PacienteId, @MedicoId, @CitaId, ISNULL(@FechaEnvio, GETDATE()), @Estado, @CodigoAcceso, @CanalEnvio, @ObservacionGeneral, @CalificacionGlobal, @CreadoPor, GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Encuesta_Update') IS NOT NULL DROP PROC sp_Encuesta_Update;
GO
CREATE PROC sp_Encuesta_Update
  @EncuestaId INT,
  @FechaRespuesta DATETIME = NULL,
  @Estado NVARCHAR(20),
  @ObservacionGeneral NVARCHAR(MAX) = NULL,
  @CalificacionGlobal DECIMAL(3,2) = NULL,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Encuesta
  SET FechaRespuesta=@FechaRespuesta,
      Estado=@Estado,
      ObservacionGeneral=@ObservacionGeneral,
      CalificacionGlobal=@CalificacionGlobal,
      FechaModificacion=GETDATE(),
      UsuarioModificacion=@UsuarioModificacion
  WHERE EncuestaId=@EncuestaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Encuesta_Delete') IS NOT NULL DROP PROC sp_Encuesta_Delete;
GO
CREATE PROC sp_Encuesta_Delete
  @EncuestaId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Encuesta
  SET Estado='Cancelada', FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE EncuestaId=@EncuestaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Encuesta_GetById') IS NOT NULL DROP PROC sp_Encuesta_GetById;
GO
CREATE PROC sp_Encuesta_GetById
  @EncuestaId INT
AS
BEGIN
  SELECT * FROM Encuesta WHERE EncuestaId=@EncuestaId;
END
GO

IF OBJECT_ID('sp_Encuesta_GetAll') IS NOT NULL DROP PROC sp_Encuesta_GetAll;
GO
CREATE PROC sp_Encuesta_GetAll
  @PacienteId INT = NULL,
  @MedicoId INT = NULL,
  @CitaId INT = NULL,
  @Estado NVARCHAR(20) = NULL,
  @CanalEnvio NVARCHAR(20) = NULL
AS
BEGIN
  SELECT *
  FROM Encuesta
  WHERE (@PacienteId IS NULL OR PacienteId=@PacienteId)
    AND (@MedicoId IS NULL OR MedicoId=@MedicoId)
    AND (@CitaId IS NULL OR CitaId=@CitaId)
    AND (@Estado IS NULL OR Estado=@Estado)
    AND (@CanalEnvio IS NULL OR CanalEnvio=@CanalEnvio)
  ORDER BY FechaCreacion DESC;
END
GO
