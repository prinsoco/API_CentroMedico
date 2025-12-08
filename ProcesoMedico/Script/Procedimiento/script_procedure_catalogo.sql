IF OBJECT_ID('sp_Catalogo_Insert') IS NOT NULL DROP PROC sp_Catalogo_Insert;
GO
CREATE PROC sp_Catalogo_Insert
  @Tipo NVARCHAR(15),
  @Codigo NVARCHAR(5),
  @Descripcion NVARCHAR(100),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO Catalogo (Tipo, Codigo, Descripcion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Tipo, @Codigo, @Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Catalogo_Update') IS NOT NULL DROP PROC sp_Catalogo_Update;
GO
CREATE PROC sp_Catalogo_Update
  @CatalogoId INT,
  @Tipo NVARCHAR(15),
  @Codigo NVARCHAR(5),
  @Descripcion NVARCHAR(100),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Catalogo
    SET Tipo=@Tipo, Codigo=@Codigo, Descripcion=@Descripcion, Estado=@Estado,
        FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE CatalogoId=@CatalogoId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Catalogo_Delete') IS NOT NULL DROP PROC sp_Catalogo_Delete;
GO
CREATE PROC sp_Catalogo_Delete
  @CatalogoId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Catalogo
    SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE CatalogoId=@CatalogoId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Catalogo_GetById') IS NOT NULL DROP PROC sp_Catalogo_GetById;
GO
CREATE PROC sp_Catalogo_GetById
  @CatalogoId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Catalogo WHERE CatalogoId=@CatalogoId;
END
GO

IF OBJECT_ID('sp_Catalogo_GetAll') IS NOT NULL DROP PROC sp_Catalogo_GetAll;
GO
CREATE PROC sp_Catalogo_GetAll
  @Tipo NVARCHAR(15) = NULL,
  @Codigo NVARCHAR(5) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;

  SELECT *
  FROM Catalogo
  WHERE (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY CatalogoId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Catalogo
  WHERE (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
