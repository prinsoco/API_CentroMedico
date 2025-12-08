IF OBJECT_ID('sp_Rol_Insert') IS NOT NULL DROP PROC sp_Rol_Insert;
GO
CREATE PROC sp_Rol_Insert
  @Descripcion NVARCHAR(100),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Rol (Descripcion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Rol_Update') IS NOT NULL DROP PROC sp_Rol_Update;
GO
CREATE PROC sp_Rol_Update
  @RolId INT,
  @Descripcion NVARCHAR(100),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Rol
  SET Descripcion=@Descripcion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE RolId=@RolId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Rol_Delete') IS NOT NULL DROP PROC sp_Rol_Delete;
GO
CREATE PROC sp_Rol_Delete
  @RolId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Rol
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE RolId=@RolId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Rol_GetById') IS NOT NULL DROP PROC sp_Rol_GetById;
GO
CREATE PROC sp_Rol_GetById
  @RolId INT
AS
BEGIN
  SELECT * FROM Rol WHERE RolId=@RolId;
END
GO

IF OBJECT_ID('sp_Rol_GetAll') IS NOT NULL DROP PROC sp_Rol_GetAll;
GO
CREATE PROC sp_Rol_GetAll
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT * FROM Rol
  WHERE (@Estado IS NULL OR Estado=@Estado)
  ORDER BY RolId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Rol WHERE (@Estado IS NULL OR Estado=@Estado);
END
GO
