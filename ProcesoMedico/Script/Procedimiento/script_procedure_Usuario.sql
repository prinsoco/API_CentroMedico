IF OBJECT_ID('sp_Usuario_Insert') IS NOT NULL DROP PROC sp_Usuario_Insert;
GO
CREATE PROC sp_Usuario_Insert
  @PerfilId INT,
  @Nombres NVARCHAR(100),
  @Apellidos NVARCHAR(100),
  @Identificacion VARCHAR(13),
  @Edad INT,
  @UsuarioNombre NVARCHAR(100), -- property name
  @Email NVARCHAR(100) = NULL,
  @Telefono NVARCHAR(20) = NULL,
  @Celular NVARCHAR(20) = NULL,
  @Direccion NVARCHAR(150) = NULL,
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Usuario (PerfilId, Nombres, Apellidos, Identificacion, Edad, Usuario, Email, Telefono, Celular, Direccion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@PerfilId, @Nombres, @Apellidos, @Identificacion, @Edad, @UsuarioNombre, @Email, @Telefono, @Celular, @Direccion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Usuario_Update') IS NOT NULL DROP PROC sp_Usuario_Update;
GO
CREATE PROC sp_Usuario_Update
  @UsuarioId INT,
  @PerfilId INT,
  @Nombres NVARCHAR(100),
  @Apellidos NVARCHAR(100),
  @Identificacion VARCHAR(13),
  @Edad INT,
  @UsuarioNombre NVARCHAR(100),
  @Email NVARCHAR(100) = NULL,
  @Telefono NVARCHAR(20) = NULL,
  @Celular NVARCHAR(20) = NULL,
  @Direccion NVARCHAR(150) = NULL,
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Usuario
  SET PerfilId=@PerfilId, Nombres=@Nombres, Apellidos=@Apellidos, Identificacion=@Identificacion, Edad=@Edad,
      Usuario=@UsuarioNombre, Email=@Email, Telefono=@Telefono, Celular=@Celular, Direccion=@Direccion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE UsuarioId=@UsuarioId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Usuario_Delete') IS NOT NULL DROP PROC sp_Usuario_Delete;
GO
CREATE PROC sp_Usuario_Delete
  @UsuarioId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Usuario
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE UsuarioId=@UsuarioId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Usuario_GetById') IS NOT NULL DROP PROC sp_Usuario_GetById;
GO
CREATE PROC sp_Usuario_GetById
  @UsuarioId INT
AS
BEGIN
  SELECT UsuarioId, PerfilId, Nombres, Apellidos, Identificacion, Edad,
         Usuario AS UsuarioNombre, Email, Telefono, Celular, Direccion,
         Estado, FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
  FROM Usuario WHERE UsuarioId=@UsuarioId;
END
GO

IF OBJECT_ID('sp_Usuario_GetAll') IS NOT NULL DROP PROC sp_Usuario_GetAll;
GO
CREATE PROC sp_Usuario_GetAll
  @PerfilId INT = NULL,
  @Identificacion VARCHAR(13) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT UsuarioId, PerfilId, Nombres, Apellidos, Identificacion, Edad,
         Usuario AS UsuarioNombre, Email, Telefono, Celular, Direccion,
         Estado, FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
  FROM Usuario
  WHERE (@PerfilId IS NULL OR PerfilId=@PerfilId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY UsuarioId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Usuario
  WHERE (@PerfilId IS NULL OR PerfilId=@PerfilId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
