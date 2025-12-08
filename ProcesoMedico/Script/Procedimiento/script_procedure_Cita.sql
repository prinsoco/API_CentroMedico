IF OBJECT_ID('sp_Cita_Insert') IS NOT NULL DROP PROC sp_Cita_Insert;
GO
CREATE PROC sp_Cita_Insert
@PacienteId		int,
@MedicoId		int,
@FechaCita		datetime,
@Motivo			nvarchar(400),
@Estado			nvarchar(10),
@UsuarioCreacion	varchar(25)

AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO Cita (PacienteId, MedicoId, FechaCita, Motivo, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@PacienteId, @MedicoId, @FechaCita, @Motivo, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_Cita_Update') IS NOT NULL DROP PROC sp_Cita_Update;
GO
CREATE PROC sp_Cita_Update
	@CitaId INT,
	@PacienteId		int,
	@MedicoId		int,
	@FechaCita		datetime,
	@Motivo			nvarchar(400),
	@Estado			nvarchar(10),
	@UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Cita
    SET PacienteId=@PacienteId, MedicoId=@MedicoId, FechaCita=@FechaCita, Motivo=@Motivo, Estado=@Estado,
        FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE CitaId=@CitaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Cita_Delete') IS NOT NULL DROP PROC sp_Cita_Delete;
GO
CREATE PROC sp_Cita_Delete
  @CitaId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Cita
    SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE CitaId=@CitaId;
  SELECT @@ROWCOUNT;
END
GO

IF OBJECT_ID('sp_Cita_GetById') IS NOT NULL DROP PROC sp_Cita_GetById;
GO
CREATE PROC sp_Cita_GetById
  @CitaId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Cita WHERE CitaId=@CitaId;
END
GO

IF OBJECT_ID('sp_Cita_GetAll') IS NOT NULL DROP PROC sp_Cita_GetAll;
GO
CREATE PROC sp_Cita_GetAll
	@PacienteId		int = null,
	@MedicoId		int = null,
	@FechaInicio	datetime,
	@FechaFin		datetime,
	@Estado			nvarchar(10) = null,
	@PageNumber INT = 1,
	@PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;

  SELECT *
  FROM Cita
  WHERE (@PacienteId IS NULL OR PacienteId=@PacienteId)
    AND (@MedicoId IS NULL OR MedicoId=@MedicoId)
    AND FechaCita between @FechaInicio and @FechaFin
  ORDER BY CitaId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Cita
  WHERE ((@PacienteId IS NULL OR PacienteId=@PacienteId)
    AND (@MedicoId IS NULL OR MedicoId=@MedicoId)
    AND (FechaCita between @FechaInicio and @FechaFin));
END
GO
