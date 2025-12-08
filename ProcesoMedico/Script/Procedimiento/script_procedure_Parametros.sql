IF OBJECT_ID('sp_Parametros_Insert') IS NOT NULL DROP PROC sp_Parametros_Insert;
GO
CREATE PROC sp_Parametros_Insert
  @Tipo NVARCHAR(15),
  @Codigo NVARCHAR(5),
  @Valor NVARCHAR(100),
  @Descripcion NVARCHAR(100),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Parametros (Tipo, Codigo, Valor, Descripcion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Tipo, @Codigo, @Valor, @Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Parametros_Update') IS NOT NULL DROP PROC sp_Parametros_Update;
GO
CREATE PROC sp_Parametros_Update
  @ParamId INT,
  @Tipo NVARCHAR(15),
  @Codigo NVARCHAR(5),
  @Valor NVARCHAR(100),
  @Descripcion NVARCHAR(100),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Parametros
  SET Tipo=@Tipo, Codigo=@Codigo, Valor=@Valor, Descripcion=@Descripcion,
      Estado=@Estado, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE ParamId=@ParamId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Parametros_Delete') IS NOT NULL DROP PROC sp_Parametros_Delete;
GO
CREATE PROC sp_Parametros_Delete
  @ParamId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Parametros
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE ParamId=@ParamId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Parametros_GetById') IS NOT NULL DROP PROC sp_Parametros_GetById;
GO
CREATE PROC sp_Parametros_GetById
  @ParamId INT
AS
BEGIN
  SELECT * FROM Parametros WHERE ParamId=@ParamId;
END
GO

IF OBJECT_ID('sp_Parametros_GetAll') IS NOT NULL DROP PROC sp_Parametros_GetAll;
GO
CREATE PROC sp_Parametros_GetAll
  @Tipo NVARCHAR(15) = NULL,
  @Codigo NVARCHAR(5) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT *
  FROM Parametros
  WHERE (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY ParamId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Parametros
  WHERE (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
