IF OBJECT_ID('sp_Perfil_Insert') IS NOT NULL DROP PROC sp_Perfil_Insert;
GO
CREATE PROC sp_Perfil_Insert
  @Descripcion NVARCHAR(100),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Perfil (Descripcion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Perfil_Update') IS NOT NULL DROP PROC sp_Perfil_Update;
GO
CREATE PROC sp_Perfil_Update
  @PerfilId INT,
  @Descripcion NVARCHAR(100),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Perfil
  SET Descripcion=@Descripcion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE PerfilId=@PerfilId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Perfil_Delete') IS NOT NULL DROP PROC sp_Perfil_Delete;
GO
CREATE PROC sp_Perfil_Delete
  @PerfilId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Perfil
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE PerfilId=@PerfilId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Perfil_GetById') IS NOT NULL DROP PROC sp_Perfil_GetById;
GO
CREATE PROC sp_Perfil_GetById
  @PerfilId INT
AS
BEGIN
  SELECT * FROM Perfil WHERE PerfilId=@PerfilId;
END
GO

IF OBJECT_ID('sp_Perfil_GetAll') IS NOT NULL DROP PROC sp_Perfil_GetAll;
GO
CREATE PROC sp_Perfil_GetAll
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT * FROM Perfil
  WHERE (@Estado IS NULL OR Estado=@Estado)
  ORDER BY PerfilId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Perfil WHERE (@Estado IS NULL OR Estado=@Estado);
END
GO
