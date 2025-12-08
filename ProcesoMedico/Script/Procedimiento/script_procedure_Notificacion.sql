IF OBJECT_ID('sp_Notificacion_Insert') IS NOT NULL DROP PROC sp_Notificacion_Insert;
GO
CREATE PROC sp_Notificacion_Insert
  @Codigo NVARCHAR(10),
  @Tipo NVARCHAR(15),
  @Canal NVARCHAR(20),
  @Plantilla NVARCHAR(MAX),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Notificacion (Codigo, Tipo, Canal, Plantilla, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Codigo, @Tipo, @Canal, @Plantilla, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Notificacion_Update') IS NOT NULL DROP PROC sp_Notificacion_Update;
GO
CREATE PROC sp_Notificacion_Update
  @NotificacionId INT,
  @Codigo NVARCHAR(10),
  @Tipo NVARCHAR(15),
  @Canal NVARCHAR(20),
  @Plantilla NVARCHAR(MAX),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Notificacion
  SET Codigo=@Codigo, Tipo=@Tipo, Canal=@Canal, Plantilla=@Plantilla, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE NotificacionId=@NotificacionId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Notificacion_Delete') IS NOT NULL DROP PROC sp_Notificacion_Delete;
GO
CREATE PROC sp_Notificacion_Delete
  @NotificacionId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Notificacion
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE NotificacionId=@NotificacionId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Notificacion_GetById') IS NOT NULL DROP PROC sp_Notificacion_GetById;
GO
CREATE PROC sp_Notificacion_GetById
  @NotificacionId INT
AS
BEGIN
  SELECT * FROM Notificacion WHERE NotificacionId=@NotificacionId;
END
GO

IF OBJECT_ID('sp_Notificacion_GetAll') IS NOT NULL DROP PROC sp_Notificacion_GetAll;
GO
CREATE PROC sp_Notificacion_GetAll
  @Codigo NVARCHAR(10) = NULL,
  @Tipo NVARCHAR(15) = NULL,
  @Canal NVARCHAR(20) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT * FROM Notificacion
  WHERE (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Canal IS NULL OR Canal=@Canal)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY NotificacionId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Notificacion
  WHERE (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Canal IS NULL OR Canal=@Canal)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
