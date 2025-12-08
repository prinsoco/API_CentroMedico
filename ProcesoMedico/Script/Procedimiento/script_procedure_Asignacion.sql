IF OBJECT_ID('sp_Asignacion_Insert') IS NOT NULL DROP PROC sp_Asignacion_Insert;
GO
CREATE PROC sp_Asignacion_Insert
  @RolId INT,
  @UsuarioId INT,
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO Asignacion (RolId, UsuarioId, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@RolId, @UsuarioId, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Asignacion_Update') IS NOT NULL DROP PROC sp_Asignacion_Update;
GO
CREATE PROC sp_Asignacion_Update
  @AsignarId INT,
  @RolId INT,
  @UsuarioId INT,
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Asignacion
    SET RolId=@RolId, UsuarioId=@UsuarioId, Estado=@Estado,
        FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE AsignarId=@AsignarId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Asignacion_Delete') IS NOT NULL DROP PROC sp_Asignacion_Delete;
GO
CREATE PROC sp_Asignacion_Delete
  @AsignarId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Asignacion
    SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE AsignarId=@AsignarId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Asignacion_GetById') IS NOT NULL DROP PROC sp_Asignacion_GetById;
GO
CREATE PROC sp_Asignacion_GetById
  @AsignarId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Asignacion WHERE AsignarId=@AsignarId;
END
GO

IF OBJECT_ID('sp_Asignacion_GetAll') IS NOT NULL DROP PROC sp_Asignacion_GetAll;
GO
CREATE PROC sp_Asignacion_GetAll
  @RolId INT = NULL,
  @UsuarioId INT = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;

  SELECT *
  FROM Asignacion
  WHERE (@UsuarioId IS NULL OR UsuarioId=@UsuarioId)
    AND (@RolId IS NULL OR RolId=@RolId)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY AsignarId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Asignacion
  WHERE (@UsuarioId IS NULL OR UsuarioId=@UsuarioId)
    AND (@RolId IS NULL OR RolId=@RolId)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
