IF OBJECT_ID('sp_Medico_Insert') IS NOT NULL DROP PROC sp_Medico_Insert;
GO
CREATE PROC sp_Medico_Insert
@PerfilId		int,
@EspecialidadId int,
@Nombres			nvarchar(200),
@Apellidos		nvarchar(200),
@Identificacion	varchar	(13),
@Edad			int,
@Usuario			nvarchar(200),
@Email			nvarchar(200),
@Telefono		nvarchar(40),
@Celular			nvarchar(40),
@Direccion		nvarchar(300),
@Estado			bit = 1,
@UsuarioCreacion	varchar(25)
AS
BEGIN
  INSERT INTO [dbo].[Medico]
           ([PerfilId]
		   ,EspecialidadId
           ,[Nombres]
           ,[Apellidos]
           ,[Identificacion]
           ,[Edad]
           ,[Usuario]
           ,[Email]
           ,[Telefono]
           ,[Celular]
           ,[Direccion]
           ,[Estado]
           ,[FechaCreacion]
           ,[UsuarioCreacion])
  VALUES (
  @PerfilId	
  ,@EspecialidadId
  ,@Nombres		
  ,@Apellidos		
  ,@Identificacion	
  ,@Edad			
  ,@Usuario		
  ,@Email			
  ,@Telefono		
  ,@Celular		
  ,@Direccion		
  ,@Estado	
  ,GETDATE()
  ,@UsuarioCreacion);

  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Medico_Update') IS NOT NULL DROP PROC sp_Medico_Update;
GO
CREATE PROC sp_Medico_Update
  @MedicoId INT,
  @EspecialidadId INT,
  @PerfilId INT,
  @Nombres NVARCHAR(200),
  @Apellidos NVARCHAR(200),
  @Identificacion NVARCHAR(13),
  @Edad INT,
  @Usuario VARCHAR(200),
  @Email VARCHAR(200),
  @Telefono VARCHAR(40),
  @Celular VARCHAR(40),
  @Direccion VARCHAR(300),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Medico
  SET PerfilId		= @PerfilId
  ,EspecialidadId = @EspecialidadId
,Nombres			= @Nombres
,Apellidos		= @Apellidos
,Identificacion	= @Identificacion
,Edad			= @Edad
,Usuario			= @Usuario
,Email			= @Email
,Telefono		= @Telefono
,Celular			= @Celular
,Direccion		= @Direccion
,Estado			= @Estado
      ,FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE MedicoId=@MedicoId;
  SELECT @@ROWCOUNT;


END
GO

IF OBJECT_ID('sp_Medico_Delete') IS NOT NULL DROP PROC sp_Medico_Delete;
GO
CREATE PROC sp_Medico_Delete
  @MedicoId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Medico
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE MedicoId=@MedicoId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Medico_GetById') IS NOT NULL DROP PROC sp_Medico_GetById;
GO
CREATE PROC sp_Medico_GetById
  @MedicoId INT
AS
BEGIN
  SELECT * FROM Medico WHERE MedicoId=@MedicoId;
END
GO

IF OBJECT_ID('sp_Medico_GetAll') IS NOT NULL DROP PROC sp_Medico_GetAll;
GO
CREATE PROC sp_Medico_GetAll
  @EspecialidadId INT = NULL,
  @Identificacion NVARCHAR(15) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT * FROM Medico
  WHERE (@EspecialidadId IS NULL OR EspecialidadId=@EspecialidadId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY MedicoId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Medico
  WHERE (@EspecialidadId IS NULL OR EspecialidadId=@EspecialidadId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
