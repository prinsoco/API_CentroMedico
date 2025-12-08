IF OBJECT_ID('sp_Especialidad_Insert') IS NOT NULL DROP PROC sp_Especialidad_Insert;
GO
CREATE PROC sp_Especialidad_Insert
  @Descripcion NVARCHAR(100),
  @Observacion NVARCHAR(500) = NULL,
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Especialidad (Descripcion, Observacion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Descripcion, @Observacion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Especialidad_Update') IS NOT NULL DROP PROC sp_Especialidad_Update;
GO
CREATE PROC sp_Especialidad_Update
  @EspecialidadId INT,
  @Descripcion NVARCHAR(100),
  @Observacion NVARCHAR(500) = NULL,
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Especialidad
  SET Descripcion=@Descripcion, Observacion=@Observacion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE EspecialidadId=@EspecialidadId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Especialidad_Delete') IS NOT NULL DROP PROC sp_Especialidad_Delete;
GO
CREATE PROC sp_Especialidad_Delete
  @EspecialidadId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Especialidad
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE EspecialidadId=@EspecialidadId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Especialidad_GetById') IS NOT NULL DROP PROC sp_Especialidad_GetById;
GO
CREATE PROC sp_Especialidad_GetById
  @EspecialidadId INT
AS
BEGIN
  SELECT * FROM Especialidad WHERE EspecialidadId=@EspecialidadId;
END
GO

IF OBJECT_ID('sp_Especialidad_GetAll') IS NOT NULL DROP PROC sp_Especialidad_GetAll;
GO
CREATE PROC sp_Especialidad_GetAll
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT * FROM Especialidad
  WHERE (@Estado IS NULL OR Estado=@Estado)
  ORDER BY EspecialidadId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Especialidad WHERE (@Estado IS NULL OR Estado=@Estado);
END
GO
