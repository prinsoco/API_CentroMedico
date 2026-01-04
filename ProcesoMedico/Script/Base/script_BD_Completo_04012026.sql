USE [ProcesoMedico]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 4/1/2026 1:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[SplitString]
(
    @Texto VARCHAR(MAX),
    @Separador CHAR(1)
)
RETURNS @Resultado TABLE (Valor VARCHAR(50))
AS
BEGIN
    DECLARE @Pos INT;
    SET @Texto = @Texto + @Separador;

    WHILE CHARINDEX(@Separador, @Texto) > 0
    BEGIN
        SET @Pos = CHARINDEX(@Separador, @Texto);

        INSERT INTO @Resultado (Valor)
        VALUES (LTRIM(RTRIM(LEFT(@Texto, @Pos - 1))));

        SET @Texto = SUBSTRING(@Texto, @Pos + 1, LEN(@Texto));
    END

    RETURN;
END;
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 4/1/2026 1:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[AsignarId] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[CatalogoId] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](15) NOT NULL,
	[Codigo] [nvarchar](5) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[CatalogoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[CitaId] [int] IDENTITY(1,1) NOT NULL,
	[PacienteId] [int] NOT NULL,
	[MedicoId] [int] NOT NULL,
	[FechaCita] [datetime] NOT NULL,
	[Motivo] [nvarchar](200) NULL,
	[Estado] [nvarchar](5) NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[EstadoCita] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CitaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita_V2]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita_V2](
	[CitaId] [int] IDENTITY(1,1) NOT NULL,
	[PacienteId] [int] NOT NULL,
	[MedicoId] [int] NOT NULL,
	[FechaCita] [datetime] NOT NULL,
	[Motivo] [nvarchar](200) NULL,
	[Estado] [nvarchar](5) NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[EstadoCita] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CitaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuesta]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuesta](
	[EncuestaId] [int] IDENTITY(1,1) NOT NULL,
	[PacienteId] [int] NULL,
	[MedicoId] [int] NULL,
	[CitaId] [int] NULL,
	[FechaEnvio] [datetime] NULL,
	[FechaRespuesta] [datetime] NULL,
	[Estado] [nvarchar](20) NULL,
	[CodigoAcceso] [nvarchar](50) NULL,
	[CanalEnvio] [nvarchar](20) NULL,
	[ObservacionGeneral] [nvarchar](max) NULL,
	[CalificacionGlobal] [decimal](3, 2) NULL,
	[CreadoPor] [nvarchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[EncuestaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[EspecialidadId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Observacion] [nvarchar](500) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[EspecialidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriado]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feriado](
	[FeriadoId] [int] IDENTITY(1,1) NOT NULL,
	[Anio] [bigint] NOT NULL,
	[Mes] [bigint] NOT NULL,
	[Dia] [bigint] NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeriadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fidelizacion]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fidelizacion](
	[FidelizacionId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[FidelizacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historico]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[Pantalla] [nvarchar](100) NOT NULL,
	[Usuario] [nvarchar](25) NOT NULL,
	[Maquina] [nvarchar](50) NOT NULL,
	[DatosEntrada] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[HorarioId] [int] IDENTITY(1,1) NOT NULL,
	[HoraInicio] [varchar](25) NOT NULL,
	[HoraFin] [varchar](25) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[HorarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorarioMedico]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioMedico](
	[HoraMedicoId] [int] IDENTITY(1,1) NOT NULL,
	[MedicoId] [bigint] NOT NULL,
	[HorarioId] [bigint] NOT NULL,
	[DiaInicio] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[MesInicio] [bigint] NULL,
	[AnioInicio] [bigint] NULL,
	[SecuenciaDia] [varchar](15) NULL,
	[DiaFin] [bigint] NULL,
	[MesFin] [bigint] NULL,
	[AnioFin] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[HoraMedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[MedicoId] [int] IDENTITY(1,1) NOT NULL,
	[EspecialidadId] [int] NOT NULL,
	[PerfilId] [int] NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Identificacion] [varchar](13) NOT NULL,
	[Edad] [int] NOT NULL,
	[Usuario] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[Celular] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](150) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[Clave] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacion](
	[NotificacionId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](10) NOT NULL,
	[Tipo] [nvarchar](15) NOT NULL,
	[Canal] [nvarchar](20) NOT NULL,
	[Plantilla] [nvarchar](max) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[PacienteId] [int] IDENTITY(1,1) NOT NULL,
	[PerfilId] [int] NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Identificacion] [varchar](13) NOT NULL,
	[Edad] [int] NOT NULL,
	[Usuario] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[Celular] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](150) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[Clave] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PacienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[ParamId] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Valor] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ParamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[PerfilId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[Codigo] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[PreguntaId] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [nvarchar](500) NOT NULL,
	[Categoria] [nvarchar](50) NULL,
	[TipoRespuesta] [nvarchar](20) NOT NULL,
	[Orden] [int] NULL,
	[Activa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PreguntaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestasEncuesta]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestasEncuesta](
	[RespuestaId] [int] IDENTITY(1,1) NOT NULL,
	[EncuestaId] [int] NOT NULL,
	[PreguntaId] [int] NOT NULL,
	[RespuestaTexto] [nvarchar](max) NULL,
	[ValorNumerico] [int] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RespuestaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[Codigo] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PerfilId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FechaUltLogin] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[PerfilId] [int] NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Identificacion] [varchar](13) NOT NULL,
	[Edad] [int] NOT NULL,
	[Usuario] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Celular] [nvarchar](20) NULL,
	[Direccion] [nvarchar](150) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](25) NULL,
	[Clave] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catalogo] ON 
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, N'EST_CITA', N'ASIG', N'Asignada', 1, CAST(N'2025-11-11T14:12:35.750' AS DateTime), N'admin', CAST(N'2025-11-11T14:41:32.203' AS DateTime), N'Admin')
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, N'DIASEMANA', N'LUN', N'Lunes', 1, CAST(N'2025-12-21T13:31:59.423' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, N'DIASEMANA', N'MAR', N'Martes', 1, CAST(N'2025-12-21T13:32:16.683' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, N'DIASEMANA', N'MIER', N'Miercoles', 1, CAST(N'2025-12-21T13:32:40.137' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, N'DIASEMANA', N'JUEV', N'Jueves', 1, CAST(N'2025-12-21T13:32:52.983' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (6, N'DIASEMANA', N'VIER', N'Viernes', 1, CAST(N'2025-12-21T13:33:05.343' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (7, N'DIASEMANA', N'SABA', N'Sábado', 1, CAST(N'2025-12-21T13:33:25.050' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (8, N'DIASEMANA', N'DOM', N'Domingo', 1, CAST(N'2025-12-21T13:33:40.477' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (9, N'EST_CITA', N'CANC', N'Cancelada', 1, CAST(N'2025-12-27T12:05:16.177' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (10, N'EST_CITA', N'ATEN', N'Atendida', 1, CAST(N'2025-12-27T12:05:33.870' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (11, N'EST_CITA', N'NASIS', N'No Asistió', 1, CAST(N'2025-12-27T12:54:47.007' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (12, N'EST_CITA', N'PROC', N'En Proceso', 1, CAST(N'2026-01-03T16:34:59.607' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Catalogo] OFF
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1, 1, 1, CAST(N'2025-12-01T08:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (2, 2, 1, CAST(N'2025-12-01T09:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (3, 3, 1, CAST(N'2025-12-01T10:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (4, 4, 1, CAST(N'2025-12-01T10:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (5, 5, 1, CAST(N'2025-12-01T11:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (6, 6, 1, CAST(N'2025-12-01T11:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (7, 7, 1, CAST(N'2025-12-01T12:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (8, 8, 1, CAST(N'2025-12-01T13:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (9, 9, 1, CAST(N'2025-12-02T08:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (10, 10, 1, CAST(N'2025-12-02T09:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (11, 11, 1, CAST(N'2025-12-02T10:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (12, 12, 1, CAST(N'2025-12-02T10:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (13, 13, 1, CAST(N'2025-12-02T11:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (14, 14, 1, CAST(N'2025-12-02T11:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (15, 15, 1, CAST(N'2025-12-02T12:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (16, 16, 1, CAST(N'2025-12-02T13:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (17, 17, 1, CAST(N'2025-12-03T08:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (18, 18, 1, CAST(N'2025-12-03T09:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (19, 19, 1, CAST(N'2025-12-04T10:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (20, 20, 1, CAST(N'2025-12-04T10:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (21, 21, 1, CAST(N'2025-12-05T11:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (22, 22, 1, CAST(N'2025-12-05T11:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (23, 23, 1, CAST(N'2025-12-06T12:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (24, 24, 1, CAST(N'2025-12-06T13:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (25, 25, 1, CAST(N'2025-12-08T15:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (26, 26, 1, CAST(N'2025-12-08T16:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (27, 27, 1, CAST(N'2025-12-09T17:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (28, 28, 1, CAST(N'2025-12-09T18:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (29, 29, 1, CAST(N'2025-12-10T19:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (30, 30, 1, CAST(N'2025-12-10T17:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (31, 31, 1, CAST(N'2025-12-11T20:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (32, 32, 1, CAST(N'2025-12-11T22:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (33, 33, 1, CAST(N'2025-12-12T19:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (34, 34, 1, CAST(N'2025-12-12T20:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (35, 35, 1, CAST(N'2025-12-13T21:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (36, 36, 1, CAST(N'2025-12-13T22:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (37, 37, 1, CAST(N'2025-12-15T11:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (38, 38, 1, CAST(N'2025-12-15T11:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (39, 39, 1, CAST(N'2025-12-15T12:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (40, 40, 1, CAST(N'2025-12-15T13:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (41, 41, 1, CAST(N'2025-12-16T22:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (42, 42, 1, CAST(N'2025-12-16T23:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (43, 43, 1, CAST(N'2025-12-17T16:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (44, 44, 1, CAST(N'2025-12-17T16:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (45, 45, 1, CAST(N'2025-12-18T09:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (46, 46, 1, CAST(N'2025-12-18T09:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (47, 47, 1, CAST(N'2025-12-19T14:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (48, 48, 1, CAST(N'2025-12-19T15:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (49, 49, 1, CAST(N'2025-12-20T08:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (50, 50, 1, CAST(N'2025-12-20T09:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (51, 51, 1, CAST(N'2025-12-21T20:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (52, 52, 1, CAST(N'2025-12-21T20:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (53, 53, 1, CAST(N'2025-12-22T11:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (54, 54, 1, CAST(N'2025-12-22T11:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (55, 55, 1, CAST(N'2025-12-23T17:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (56, 56, 1, CAST(N'2025-12-23T18:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (57, 57, 1, CAST(N'2025-12-24T12:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (58, 58, 1, CAST(N'2025-12-24T13:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (59, 59, 1, CAST(N'2025-12-26T17:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (60, 60, 1, CAST(N'2025-12-26T18:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (61, 1, 1, CAST(N'2025-12-27T21:00:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:19.620' AS DateTime), N'admin', NULL, NULL, N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (62, 2, 1, CAST(N'2025-12-27T21:30:00.000' AS DateTime), N'Medicina', N'1', CAST(N'2025-12-27T16:54:49.393' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (66, 5, 2, CAST(N'2025-12-31T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-29T15:57:27.067' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (67, 5, 2, CAST(N'2025-12-31T20:00:00.000' AS DateTime), NULL, N'0', CAST(N'2025-12-29T16:14:46.680' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (68, 4, 2, CAST(N'2025-12-31T19:30:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-30T00:19:28.503' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (69, 29, 1, CAST(N'2025-12-31T16:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-30T00:26:05.640' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (70, 1, 2, CAST(N'2026-01-03T16:30:00.000' AS DateTime), NULL, N'1', CAST(N'2026-01-03T16:06:10.040' AS DateTime), N'admin', NULL, NULL, N'ATEN')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (71, 1, 1, CAST(N'2026-01-03T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2026-01-03T18:19:36.960' AS DateTime), N'admin', CAST(N'2026-01-03T19:01:36.290' AS DateTime), N'admin', N'NASIS')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (72, 1, 1, CAST(N'2026-01-03T20:00:00.000' AS DateTime), NULL, N'1', CAST(N'2026-01-03T19:21:04.467' AS DateTime), N'admin', CAST(N'2026-01-03T19:26:58.100' AS DateTime), N'admin', N'CANC')
GO
INSERT [dbo].[Cita] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (73, 1, 1, CAST(N'2026-01-03T22:30:00.000' AS DateTime), NULL, N'1', CAST(N'2026-01-03T19:26:58.167' AS DateTime), N'admin', NULL, NULL, N'NASIS')
GO
SET IDENTITY_INSERT [dbo].[Cita] OFF
GO
SET IDENTITY_INSERT [dbo].[Cita_V2] ON 
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1081, 60, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1082, 60, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1083, 60, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1084, 60, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1085, 59, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1086, 59, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1087, 59, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1088, 59, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1089, 58, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1090, 58, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1091, 58, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1092, 58, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1093, 57, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1094, 57, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1095, 57, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1096, 57, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1097, 56, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1098, 56, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1099, 56, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1100, 56, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1101, 55, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1102, 55, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1103, 55, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1104, 55, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1105, 54, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1106, 54, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1107, 54, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1108, 54, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1109, 53, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1110, 53, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1111, 53, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1112, 53, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1113, 52, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1114, 52, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1115, 52, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1116, 52, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1117, 51, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1118, 51, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1119, 51, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1120, 51, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1121, 50, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1122, 50, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1123, 50, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1124, 50, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1125, 49, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1126, 49, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1127, 49, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1128, 49, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1129, 48, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1130, 48, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1131, 48, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1132, 48, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1133, 47, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1134, 47, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1135, 47, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1136, 47, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1137, 46, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1138, 46, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1139, 46, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1140, 46, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1141, 45, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1142, 45, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1143, 45, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1144, 45, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1145, 44, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1146, 44, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1147, 44, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1148, 44, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1149, 43, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1150, 43, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1151, 43, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1152, 43, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1153, 42, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1154, 42, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1155, 42, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1156, 42, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1157, 41, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1158, 41, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1159, 41, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1160, 41, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1161, 40, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1162, 40, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1163, 40, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1164, 40, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1165, 39, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1166, 39, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1167, 39, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1168, 39, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1169, 38, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1170, 38, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1171, 38, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1172, 38, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1173, 37, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1174, 37, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1175, 37, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1176, 37, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1177, 36, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1178, 36, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1179, 36, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1180, 36, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1181, 35, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1182, 35, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1183, 35, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1184, 35, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1185, 34, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1186, 34, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1187, 34, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1188, 34, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1189, 33, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1190, 33, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1191, 33, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1192, 33, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1193, 32, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1194, 32, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1195, 32, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1196, 32, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1197, 31, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1198, 31, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1199, 31, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1200, 31, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1201, 30, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1202, 30, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1203, 30, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1204, 30, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1205, 29, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1206, 29, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1207, 29, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1208, 29, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1209, 28, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1210, 28, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1211, 28, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1212, 28, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1213, 27, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1214, 27, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1215, 27, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1216, 27, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1217, 26, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1218, 26, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1219, 26, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1220, 26, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1221, 25, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1222, 25, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1223, 25, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1224, 25, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1225, 24, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1226, 24, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1227, 24, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1228, 24, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1229, 23, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1230, 23, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1231, 23, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1232, 23, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1233, 22, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1234, 22, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1235, 22, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1236, 22, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1237, 21, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1238, 21, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1239, 21, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1240, 21, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1241, 20, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1242, 20, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1243, 20, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1244, 20, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1245, 19, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1246, 19, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1247, 19, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1248, 19, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1249, 18, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1250, 18, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1251, 18, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1252, 18, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1253, 17, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1254, 17, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1255, 17, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1256, 17, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1257, 16, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1258, 16, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1259, 16, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1260, 16, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1261, 15, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1262, 15, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1263, 15, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1264, 15, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1265, 14, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1266, 14, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1267, 14, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1268, 14, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1269, 13, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1270, 13, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1271, 13, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1272, 13, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1273, 12, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1274, 12, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1275, 12, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1276, 12, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1277, 11, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1278, 11, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1279, 11, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1280, 11, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1281, 10, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1282, 10, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1283, 10, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1284, 10, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1285, 9, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1286, 9, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1287, 9, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1288, 9, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1289, 8, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1290, 8, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1291, 8, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1292, 8, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1293, 7, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1294, 7, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1295, 7, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1296, 7, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1297, 6, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1298, 6, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1299, 6, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1300, 6, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1301, 5, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1302, 5, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1303, 5, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1304, 5, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1305, 4, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1306, 4, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1307, 4, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1308, 4, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1309, 3, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1310, 3, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1311, 3, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1312, 3, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1313, 2, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1314, 2, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1315, 2, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1316, 2, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1317, 1, 2, CAST(N'2025-12-01T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1318, 1, 2, CAST(N'2025-12-08T19:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1319, 1, 2, CAST(N'2025-12-15T09:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
INSERT [dbo].[Cita_V2] ([CitaId], [PacienteId], [MedicoId], [FechaCita], [Motivo], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [EstadoCita]) VALUES (1320, 1, 2, CAST(N'2025-12-23T14:00:00.000' AS DateTime), NULL, N'1', CAST(N'2025-12-27T21:23:24.310' AS DateTime), N'admin', NULL, NULL, N'ASIG')
GO
SET IDENTITY_INSERT [dbo].[Cita_V2] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, N'Cardiología', N'Especialidad que trata enfermedades del corazón y del sistema circulatorio.', 1, CAST(N'2025-12-07T02:12:45.900' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, N'Dermatología', N'Se ocupa de las enfermedades de la piel, cabello y uñas.', 1, CAST(N'2025-12-07T02:24:58.813' AS DateTime), N'admin', CAST(N'2025-12-07T02:37:39.787' AS DateTime), N'admin')
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, N'Anestesiología', N'Se encarga del manejo del dolor y la anestesia durante procedimientos quirúrgicos.', 1, CAST(N'2025-12-07T02:38:03.207' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, N'Endocrinología', N'Trata trastornos hormonales y metabólicos, como la diabetes.', 1, CAST(N'2025-12-07T02:38:17.277' AS DateTime), N'admin', CAST(N'2025-12-07T02:40:30.620' AS DateTime), N'admin')
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, N'Neurología', N'Especialidad que trata enfermedades del sistema nervioso, incluyendo el cerebro y la médula espinal.', 1, CAST(N'2025-12-07T02:38:44.430' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (6, N'Oftalmología', N'Se ocupa de la salud ocular y el tratamiento de enfermedades de los ojos.', 1, CAST(N'2025-12-07T02:38:59.170' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (7, N'Pediatría', N'Atención médica para bebés, niños y adolescentes.', 1, CAST(N'2025-12-07T02:39:09.967' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (8, N'Psiquiatría', N'Trata trastornos mentales y emocionales.', 1, CAST(N'2025-12-07T02:39:23.480' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (9, N'Urología', N'Se enfoca en el sistema urinario y problemas relacionados con el aparato reproductor masculino.', 1, CAST(N'2025-12-07T02:39:34.023' AS DateTime), N'admin', CAST(N'2025-12-07T02:39:37.083' AS DateTime), N'admin')
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (10, N'Ginecología y Obstetricia', N'Se enfoca en la salud reproductiva femenina y el embarazo.', 1, CAST(N'2025-12-07T02:39:51.730' AS DateTime), N'admin', CAST(N'2025-12-07T02:40:05.920' AS DateTime), N'admin')
GO
INSERT [dbo].[Especialidad] ([EspecialidadId], [Descripcion], [Observacion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (11, N'Médico General', N'Medicina general', 1, CAST(N'2025-12-09T13:42:16.077' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Feriado] ON 
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, 2025, 1, 1, N'Año nuevo', 1, CAST(N'2025-12-21T13:22:51.590' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, 2025, 3, 3, N'Carnaval', 1, CAST(N'2025-12-21T13:23:19.953' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, 2025, 3, 4, N'Carnaval', 1, CAST(N'2025-12-21T13:23:33.197' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, 2025, 11, 2, N'Dia de Difuntos', 1, CAST(N'2025-12-21T13:24:08.467' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, 2025, 11, 3, N'Independencia de Cuenca', 1, CAST(N'2025-12-21T13:24:43.707' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (6, 2025, 12, 25, N'Navidad', 1, CAST(N'2025-12-21T13:25:13.330' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (7, 2026, 1, 1, N'Año Nuevo', 1, CAST(N'2025-12-21T13:25:58.487' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (8, 2026, 1, 2, N'Feriado puente por Año Nuevo', 1, CAST(N'2025-12-21T13:26:17.723' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (9, 2026, 2, 14, N'Carnaval', 1, CAST(N'2025-12-30T00:55:28.147' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (10, 2026, 2, 15, N'Carnaval', 1, CAST(N'2025-12-30T00:55:55.320' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (11, 2026, 2, 16, N'Carnaval', 1, CAST(N'2025-12-30T00:56:16.617' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (12, 2026, 2, 17, N'Carnaval', 1, CAST(N'2025-12-30T00:56:30.073' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (13, 2026, 4, 3, N'Viernes Santo', 1, CAST(N'2025-12-30T00:57:26.700' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (14, 2026, 4, 4, N'Viernes Santo', 1, CAST(N'2025-12-30T00:57:49.097' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (15, 2026, 4, 5, N'Viernes Santo', 1, CAST(N'2025-12-30T00:58:04.977' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (16, 2026, 5, 1, N'Día del Trabajo', 1, CAST(N'2025-12-30T00:59:26.997' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (17, 2026, 5, 25, N'Batalla de Pichincha', 1, CAST(N'2025-12-30T01:00:13.717' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (18, 2026, 8, 10, N'Primer Grito Idependencia', 1, CAST(N'2025-12-30T01:01:23.657' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (20, 2026, 10, 9, N'Independencia Guayaquil', 1, CAST(N'2025-12-30T01:02:33.373' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (22, 2026, 5, 2, N'Puente del Trabajo', 1, CAST(N'2025-12-30T01:04:09.660' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (23, 2026, 5, 3, N'Puente del Trabajo', 1, CAST(N'2025-12-30T01:04:27.120' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (24, 2026, 5, 23, N'Puente Batalla', 1, CAST(N'2025-12-30T01:04:57.973' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (25, 2026, 5, 24, N'Puente Batalla del Pichincha', 1, CAST(N'2025-12-30T01:05:19.227' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (26, 2026, 8, 8, N'Traslado Primer Grito', 1, CAST(N'2025-12-30T01:06:16.897' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (28, 2026, 8, 9, N'Traslado Primer Grito ', 1, CAST(N'2025-12-30T01:06:48.587' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (29, 2026, 10, 10, N'Feriado', 1, CAST(N'2025-12-30T01:07:22.317' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (30, 2026, 10, 11, N'Feriado', 1, CAST(N'2025-12-30T01:07:38.993' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (31, 2026, 10, 31, N'Puente Feriado Difuntos', 1, CAST(N'2025-12-30T01:09:38.820' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (32, 2026, 11, 1, N'Puente Feriado Difuntos', 1, CAST(N'2025-12-30T01:09:57.070' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (33, 2026, 11, 2, N'Puente Feriado Difuntos', 1, CAST(N'2025-12-30T01:10:11.960' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (34, 2026, 11, 3, N'Puente Feriado Difuntos', 1, CAST(N'2025-12-30T01:10:40.937' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (35, 2026, 12, 25, N'Navidad', 1, CAST(N'2025-12-30T01:12:10.450' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (36, 2026, 12, 26, N'Navidad', 1, CAST(N'2025-12-30T01:12:25.050' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Feriado] ([FeriadoId], [Anio], [Mes], [Dia], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (37, 2026, 12, 27, N'Navidad', 1, CAST(N'2025-12-30T01:12:46.790' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Feriado] OFF
GO
SET IDENTITY_INSERT [dbo].[Horario] ON 
GO
INSERT [dbo].[Horario] ([HorarioId], [HoraInicio], [HoraFin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, N'08:30', N'13:00', 1, CAST(N'2025-12-21T13:45:10.933' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Horario] ([HorarioId], [HoraInicio], [HoraFin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, N'15:00', N'19:00', 1, CAST(N'2025-12-21T13:45:24.157' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Horario] ([HorarioId], [HoraInicio], [HoraFin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, N'09:00', N'12:30', 1, CAST(N'2025-12-21T13:45:49.070' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Horario] ([HorarioId], [HoraInicio], [HoraFin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, N'14:00', N'18:30', 1, CAST(N'2025-12-21T13:46:08.560' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Horario] ([HorarioId], [HoraInicio], [HoraFin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, N'19:00', N'23:30', 1, CAST(N'2025-12-21T13:47:16.013' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Horario] OFF
GO
SET IDENTITY_INSERT [dbo].[HorarioMedico] ON 
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (1, 1, 1, 15, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 15, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (2, 1, 4, 15, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 15, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (3, 1, 5, 16, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 16, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (4, 1, 2, 17, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 17, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (5, 1, 3, 18, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 18, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (6, 1, 4, 19, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 19, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (7, 1, 1, 20, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 20, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (8, 1, 5, 21, 1, CAST(N'2025-12-21T14:02:40.720' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'0', 21, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (9, 2, 3, 22, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 22, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (10, 2, 4, 22, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 22, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (11, 2, 4, 23, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 23, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (12, 2, 1, 24, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 24, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (13, 2, 3, 25, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 25, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (14, 2, 4, 26, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 26, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (15, 2, 5, 27, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 27, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (17, 3, 1, 29, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 29, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (18, 3, 2, 29, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 29, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (19, 3, 2, 30, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 30, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (20, 3, 2, 31, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 31, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (21, 3, 1, 1, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 1, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (22, 3, 3, 2, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'5', 2, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (23, 3, 1, 3, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 3, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (25, 1, 1, 1, 1, CAST(N'2025-12-27T13:15:47.927' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 1, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (26, 1, 1, 2, 1, CAST(N'2025-12-27T13:16:10.967' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 2, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (27, 1, 1, 3, 1, CAST(N'2025-12-27T13:16:44.973' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 3, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (28, 1, 1, 4, 1, CAST(N'2025-12-27T13:17:10.543' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 4, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (29, 1, 1, 5, 1, CAST(N'2025-12-27T13:17:36.160' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 5, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (30, 1, 1, 6, 1, CAST(N'2025-12-27T13:17:54.107' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 6, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (31, 2, 3, 1, 1, CAST(N'2025-12-27T13:15:47.927' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 1, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (32, 2, 3, 2, 1, CAST(N'2025-12-27T13:16:10.967' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 2, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (33, 2, 3, 3, 1, CAST(N'2025-12-27T13:16:44.973' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 3, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (34, 2, 3, 4, 1, CAST(N'2025-12-27T13:17:10.543' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 4, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (35, 2, 3, 5, 1, CAST(N'2025-12-27T13:17:36.160' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 5, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (36, 2, 3, 6, 1, CAST(N'2025-12-27T13:17:54.107' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 6, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (37, 3, 4, 1, 1, CAST(N'2025-12-27T13:15:47.927' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 1, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (38, 3, 4, 2, 1, CAST(N'2025-12-27T13:16:10.967' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 2, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (39, 3, 4, 3, 1, CAST(N'2025-12-27T13:16:44.973' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 3, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (40, 3, 4, 4, 1, CAST(N'2025-12-27T13:17:10.543' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 4, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (41, 3, 4, 5, 1, CAST(N'2025-12-27T13:17:36.160' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 5, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (42, 3, 4, 6, 1, CAST(N'2025-12-27T13:17:54.107' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 6, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (43, 1, 2, 8, 1, CAST(N'2025-12-27T13:15:47.927' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 8, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (44, 1, 2, 9, 1, CAST(N'2025-12-27T13:16:10.967' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 9, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (45, 1, 2, 10, 1, CAST(N'2025-12-27T13:16:44.973' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 10, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (46, 1, 5, 11, 1, CAST(N'2025-12-27T13:17:10.543' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 11, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (47, 1, 5, 12, 1, CAST(N'2025-12-27T13:17:36.160' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 12, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (48, 1, 5, 13, 1, CAST(N'2025-12-27T13:17:54.107' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 13, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (49, 2, 5, 8, 1, CAST(N'2025-12-27T13:15:47.927' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 8, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (50, 2, 5, 9, 1, CAST(N'2025-12-27T13:16:10.967' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 9, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (51, 2, 2, 10, 1, CAST(N'2025-12-27T13:16:44.973' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 10, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (52, 2, 2, 11, 1, CAST(N'2025-12-27T13:17:10.543' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 11, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (53, 2, 3, 12, 1, CAST(N'2025-12-27T13:17:36.160' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 12, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (54, 2, 3, 13, 1, CAST(N'2025-12-27T13:17:54.107' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 13, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (55, 3, 5, 8, 1, CAST(N'2025-12-27T13:15:47.927' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 8, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (56, 3, 5, 9, 1, CAST(N'2025-12-27T13:16:10.967' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 9, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (57, 3, 2, 10, 1, CAST(N'2025-12-27T13:16:44.973' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 10, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (58, 3, 2, 11, 1, CAST(N'2025-12-27T13:17:10.543' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 11, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (59, 3, 3, 12, 1, CAST(N'2025-12-27T13:17:36.160' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 12, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (60, 3, 3, 13, 1, CAST(N'2025-12-27T13:17:54.107' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 13, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (61, 2, 3, 15, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 15, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (62, 2, 4, 15, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 15, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (63, 2, 3, 16, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 16, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (64, 2, 3, 17, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 17, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (65, 2, 2, 18, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 18, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (66, 2, 2, 19, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 19, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (67, 2, 4, 20, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 20, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (68, 2, 4, 21, 1, CAST(N'2025-12-21T14:02:40.720' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'0', 21, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (69, 3, 3, 15, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 15, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (70, 3, 4, 15, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 15, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (71, 3, 3, 16, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 16, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (72, 3, 3, 17, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 17, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (73, 3, 2, 18, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 18, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (74, 3, 2, 19, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 19, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (75, 3, 4, 20, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 20, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (76, 3, 4, 21, 1, CAST(N'2025-12-21T14:02:40.720' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'0', 21, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (77, 1, 3, 22, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 22, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (78, 1, 4, 22, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 22, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (79, 1, 4, 23, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 23, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (80, 1, 1, 24, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 24, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (81, 1, 3, 25, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 25, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (82, 1, 4, 26, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 26, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (83, 1, 5, 27, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 27, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (84, 3, 3, 22, 1, CAST(N'2025-12-21T13:57:20.193' AS DateTime), N'admin', NULL, NULL, 12, 2025, N'1', 22, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (85, 3, 4, 22, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 22, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (86, 3, 4, 23, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 23, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (87, 3, 1, 24, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 24, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (88, 3, 3, 25, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'4', 25, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (89, 3, 4, 26, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'5', 26, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (90, 3, 5, 27, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'6', 27, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (91, 1, 2, 29, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 29, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (92, 1, 2, 30, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 30, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (93, 1, 4, 31, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 31, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (94, 1, 1, 1, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 1, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (95, 1, 3, 2, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'5', 2, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (96, 1, 5, 3, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 3, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (97, 2, 2, 29, 1, CAST(N'2025-12-21T13:57:53.390' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'1', 29, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (98, 2, 2, 30, 1, CAST(N'2025-12-21T13:58:23.913' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'2', 30, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (99, 2, 5, 31, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 31, 12, 2025)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (100, 2, 1, 1, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 1, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (101, 2, 3, 2, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'5', 2, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (102, 2, 4, 3, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 3, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (103, 4, 1, 5, 1, CAST(N'2025-12-30T01:42:07.000' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'1', 5, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (104, 4, 2, 6, 1, CAST(N'2025-12-30T01:42:57.550' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'2', 6, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (105, 4, 5, 8, 1, CAST(N'2025-12-30T01:42:57.550' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 8, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (106, 4, 3, 10, 1, CAST(N'2025-12-30T01:59:31.270' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 10, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (107, 5, 2, 5, 1, CAST(N'2025-12-30T01:42:07.000' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'1', 5, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (108, 5, 4, 6, 1, CAST(N'2025-12-30T01:42:57.550' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'2', 6, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (109, 5, 5, 8, 1, CAST(N'2025-12-30T01:42:57.550' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 8, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (110, 5, 1, 10, 1, CAST(N'2025-12-30T01:59:31.270' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 10, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (111, 6, 5, 5, 1, CAST(N'2025-12-30T01:42:07.000' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'1', 5, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (112, 6, 1, 6, 1, CAST(N'2025-12-30T01:42:57.550' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'2', 6, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (113, 6, 4, 8, 1, CAST(N'2025-12-30T01:42:57.550' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 8, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (114, 6, 2, 10, 1, CAST(N'2025-12-30T01:59:31.270' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 10, 1, 2026)
GO
SET IDENTITY_INSERT [dbo].[HorarioMedico] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (1, 11, 2, N'Steven', N'Cardenas', N'0909090909', 36, N'scardenas', N'scardenas@gmail.com', N'2867565', N'0987878787', N'Acuarela del rio', 1, CAST(N'2025-12-09T23:36:57.180' AS DateTime), N'admin', CAST(N'2025-12-11T00:43:25.723' AS DateTime), N'admin', N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (2, 7, 2, N'Andrea', N'Sanchez', N'0978676767', 36, N'asanchez', N'ing.scardenasortiz@gmail.com', N'2756565', N'0990998980', N'Alborada 3ra etapa', 1, CAST(N'2025-12-11T02:39:05.407' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (3, 1, 2, N'Erick', N'Cardenas', N'0978654535', 32, N'eocsanchez', N'ing.scardenasortiz@gmail.com', N'2653453', N'0908997767', N'Acuarela del rio', 1, CAST(N'2025-12-21T13:53:45.300' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (4, 2, 2, N'Carlos', N'Mendoza', N'0909090909', 45, N'cmendoza2', N'cmendoza2@hospital.com', N'022345001', N'0998002001', N'Av. Salud 101', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (5, 3, 2, N'Ana', N'Vera', N'0902345109', 38, N'avera2', N'avera2@hospital.com', N'022345002', N'0998002002', N'Av. Salud 102', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (6, 4, 2, N'Luis', N'Paredes', N'0877870909', 50, N'lparedes2', N'lparedes2@hospital.com', N'022345003', N'0998002003', N'Av. Salud 103', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (7, 5, 2, N'María', N'Cevallos', N'0909090909', 41, N'mcevallos2', N'mcevallos2@hospital.com', N'022345004', N'0998002004', N'Av. Salud 104', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (8, 6, 2, N'Jorge', N'Luna', N'0909090873', 47, N'jluna2', N'jluna2@hospital.com', N'022345005', N'0998002005', N'Av. Salud 105', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (9, 8, 2, N'Patricia', N'Rosero', N'0911927469', 36, N'prosero2', N'prosero2@hospital.com', N'022345006', N'0998002006', N'Av. Salud 106', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (10, 9, 2, N'Diego', N'Salazar', N'0909077863', 44, N'dsalazar2', N'dsalazar2@hospital.com', N'022345007', N'0998002007', N'Av. Salud 107', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (11, 10, 2, N'Gabriela', N'Ortiz', N'0902342709', 39, N'gortiz2', N'gortiz2@hospital.com', N'022345008', N'0998002008', N'Av. Salud 108', 1, CAST(N'2025-12-30T01:38:39.047' AS DateTime), N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (1, 1, N'Carlos', N'Pérez Gómez', N'0102345671', 20, N'cperez1', N'carlos.perez1@test.com', N'022345671', N'0987654311', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (2, 1, N'Ana', N'Morales Ruiz', N'0102345672', 24, N'amorales2', N'ana.morales2@test.com', N'022345672', N'0987654312', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (3, 1, N'Luis', N'Andrade Torres', N'0102345673', 31, N'landrade3', N'luis.andrade3@test.com', N'022345673', N'0987654313', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (4, 1, N'María', N'López Vera', N'0102345674', 32, N'mlopez4', N'maria.lopez4@test.com', N'022345674', N'0987654314', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (5, 1, N'Jorge', N'Castillo León', N'0102345675', 37, N'jcastillo5', N'jorge.castillo5@test.com', N'022345675', N'0987654315', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (6, 1, N'Daniela', N'Ríos Paredes', N'0102345676', 21, N'drios6', N'daniela.rios6@test.com', N'022345676', N'0987654316', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (7, 1, N'Pedro', N'Zambrano Cedeño', N'0102345677', 19, N'pzambrano7', N'pedro.zambrano7@test.com', N'022345677', N'0987654317', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (8, 1, N'Sofía', N'Herrera Luna', N'0102345678', 40, N'sherrera8', N'sofia.herrera8@test.com', N'022345678', N'0987654318', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (9, 1, N'Andrés', N'Vinueza Molina', N'0102345679', 43, N'avinueza9', N'andres.vinueza9@test.com', N'022345679', N'0987654319', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (10, 1, N'Paula', N'Chávez Ortiz', N'0102345680', 44, N'pchavez10', N'paula.chavez10@test.com', N'022345680', N'0987654320', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (11, 1, N'Miguel', N'Narváez Rosero', N'0102345681', 38, N'mnarvaez11', N'miguel.narvaez11@test.com', N'022345681', N'0987654321', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (12, 1, N'Karla', N'Mena Ponce', N'0102345682', 36, N'kmena12', N'karla.mena12@test.com', N'022345682', N'0987654322', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (13, 1, N'Esteban', N'Hidalgo Cabrera', N'0102345683', 33, N'ehidalgo13', N'esteban.hidalgo13@test.com', N'022345683', N'0987654323', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (14, 1, N'Valeria', N'Cárdenas Freire', N'0102345684', 26, N'vcardenas14', N'valeria.cardenas14@test.com', N'022345684', N'0987654324', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (15, 1, N'Diego', N'Salazar Cuenca', N'0102345685', 25, N'dsalazar15', N'diego.salazar15@test.com', N'022345685', N'0987654325', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (16, 1, N'Camila', N'Benítez Guamán', N'0102345686', 29, N'cbenitez16', N'camila.benitez16@test.com', N'022345686', N'0987654326', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (17, 1, N'Juan', N'Patiño Rivera', N'0102345687', 18, N'jpatino17', N'juan.patino17@test.com', N'022345687', N'0987654327', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (18, 1, N'Fernanda', N'Cevallos Tapia', N'0102345688', 16, N'fcevallos18', N'fernanda.cevallos18@test.com', N'022345688', N'0987654328', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (19, 1, N'Ricardo', N'Mejía Bravo', N'0102345689', 15, N'rmejia19', N'ricardo.mejia19@test.com', N'022345689', N'0987654329', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (20, 1, N'Alejandra', N'Peña Solís', N'0102345690', 39, N'apena20', N'alejandra.pena20@test.com', N'022345690', N'0987654330', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (21, 1, N'Cristian', N'Lema Chicaiza', N'0102345691', 30, N'clema21', N'cristian.lema21@test.com', N'022345691', N'0987654331', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (22, 1, N'Gabriela', N'Acosta Ulloa', N'0102345692', 48, N'gacosta22', N'gabriela.acosta22@test.com', N'022345692', N'0987654332', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (23, 1, N'Iván', N'Ordóñez Terán', N'0102345693', 47, N'iordonez23', N'ivan.ordonez23@test.com', N'022345693', N'0987654333', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (24, 1, N'Lorena', N'Villamar Jaramillo', N'0102345694', 32, N'lvillamar24', N'lorena.villamar24@test.com', N'022345694', N'0987654334', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (25, 1, N'Oscar', N'Yánez Borja', N'0102345695', 28, N'oyanez25', N'oscar.yanez25@test.com', N'022345695', N'0987654335', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (26, 1, N'Melissa', N'Rosales Núñez', N'0102345696', 25, N'mrosales26', N'melissa.rosales26@test.com', N'022345696', N'0987654336', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (27, 1, N'Henry', N'Montalvo Quilumba', N'0102345697', 26, N'hmontalvo27', N'henry.montalvo27@test.com', N'022345697', N'0987654337', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (28, 1, N'Dayana', N'Córdova Guallpa', N'0102345698', 16, N'dcordova28', N'dayana.cordova28@test.com', N'022345698', N'0987654338', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (29, 1, N'Edwin', N'Fierro Paredes', N'0102345699', 18, N'efierro29', N'edwin.fierro29@test.com', N'022345699', N'0987654339', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (30, 1, N'Karina', N'Guamán Iza', N'0102345700', 29, N'kguaman30', N'karina.guaman30@test.com', N'022345700', N'0987654340', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (31, 1, N'Roberto', N'Pazmiño Álvarez', N'0102345701', 19, N'rpazmino31', N'roberto.pazmino31@test.com', N'022345701', N'0987654341', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (32, 1, N'Pamela', N'Hurtado Enríquez', N'0102345702', 19, N'phurtado32', N'pamela.hurtado32@test.com', N'022345702', N'0987654342', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (33, 1, N'Wilson', N'Cuji Pilataxi', N'0102345703', 20, N'wcuji33', N'wilson.cuji33@test.com', N'022345703', N'0987654343', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (34, 1, N'Natalia', N'Burbano Ibarra', N'0102345704', 21, N'nburbano34', N'natalia.burbano34@test.com', N'022345704', N'0987654344', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (35, 1, N'César', N'Velasco Carrillo', N'0102345705', 22, N'cvelasco35', N'cesar.velasco35@test.com', N'022345705', N'0987654345', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (36, 1, N'Verónica', N'Loor Macías', N'0102345706', 29, N'vloer36', N'veronica.loor36@test.com', N'022345706', N'0987654346', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (37, 1, N'Patricio', N'Guacho Tipán', N'0102345707', 28, N'pguacho37', N'patricio.guacho37@test.com', N'022345707', N'0987654347', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (38, 1, N'Tatiana', N'Simbaña Toapanta', N'0102345708', 35, N'tsimbana38', N'tatiana.simbana38@test.com', N'022345708', N'0987654348', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (39, 1, N'Freddy', N'Pillajo Yumbo', N'0102345709', 38, N'fpillajo39', N'freddy.pillajo39@test.com', N'022345709', N'0987654349', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (40, 1, N'Andrea', N'Bonilla Arroyo', N'0102345710', 49, N'abonilla40', N'andrea.bonilla40@test.com', N'022345710', N'0987654350', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (41, 1, N'Mauricio', N'Rivadeneira Nieto', N'0102345711', 50, N'mrivadeneira41', N'mauricio.rivadeneira41@test.com', N'022345711', N'0987654351', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (42, 1, N'Johanna', N'Calderón Nieto', N'0102345712', 55, N'jcalderon42', N'johanna.calderon42@test.com', N'022345712', N'0987654352', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (43, 1, N'Kevin', N'Carvajal Espinoza', N'0102345713', 51, N'kcarvajal43', N'kevin.carvajal43@test.com', N'022345713', N'0987654353', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (44, 1, N'Silvana', N'Jara Pozo', N'0102345714', 53, N'sjara44', N'silvana.jara44@test.com', N'022345714', N'0987654354', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (45, 1, N'Byron', N'Guamán Navas', N'0102345715', 22, N'bguaman45', N'byron.guaman45@test.com', N'022345715', N'0987654355', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (46, 1, N'Angie', N'Reinoso Viteri', N'0102345716', 29, N'areinoso46', N'angie.reinoso46@test.com', N'022345716', N'0987654356', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (47, 1, N'Darwin', N'Ochoa Cabezas', N'0102345717', 23, N'dochoa47', N'darwin.ochoa47@test.com', N'022345717', N'0987654357', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (48, 1, N'Mónica', N'Segovia Bustos', N'0102345718', 24, N'msegovia48', N'monica.segovia48@test.com', N'022345718', N'0987654358', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (49, 1, N'Alex', N'Quintero Rangel', N'0102345719', 26, N'aquintero49', N'alex.quintero49@test.com', N'022345719', N'0987654359', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (50, 1, N'Evelyn', N'Cobo Vallejo', N'0102345720', 19, N'ecobo50', N'evelyn.cobo50@test.com', N'022345720', N'0987654360', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (51, 1, N'Raúl', N'Torres Santillán', N'0102345721', 20, N'rtorres51', N'raul.torres51@test.com', N'022345721', N'0987654361', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (52, 1, N'Diana', N'Jaramillo Quintana', N'0102345722', 52, N'djaramillo52', N'diana.jaramillo52@test.com', N'022345722', N'0987654362', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (53, 1, N'Hugo', N'Alarcón Paredes', N'0102345723', 43, N'halarcon53', N'hugo.alarcon53@test.com', N'022345723', N'0987654363', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (54, 1, N'Karen', N'Pinos Guerrero', N'0102345724', 46, N'kpinos54', N'karen.pinos54@test.com', N'022345724', N'0987654364', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (55, 1, N'Franklin', N'Tapia Mora', N'0102345725', 37, N'ftapia55', N'franklin.tapia55@test.com', N'022345725', N'0987654365', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (56, 1, N'Susana', N'Moya Beltrán', N'0102345726', 45, N'smoya56', N'susana.moya56@test.com', N'022345726', N'0987654366', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (57, 1, N'Xavier', N'Vaca Cárdenas', N'0102345727', 16, N'xvaca57', N'xavier.vaca57@test.com', N'022345727', N'0987654367', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (58, 1, N'Liliana', N'Borja Carrasco', N'0102345728', 15, N'lborja58', N'liliana.borja58@test.com', N'022345728', N'0987654368', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (59, 1, N'Jonathan', N'Rosero Silva', N'0102345729', 19, N'jrosero59', N'jonathan.rosero59@test.com', N'022345729', N'0987654369', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (60, 1, N'Maritza', N'Cifuentes Lara', N'0102345730', 17, N'mcifuentes60', N'maritza.cifuentes60@test.com', N'022345730', N'0987654370', NULL, 1, NULL, N'admin', NULL, NULL, N'ACbaPBNv7pWyRkUNWYmy+PTvKjX11b18c7gRdquhM5gFll6d4pTo/A8ZH5S+xDlBNA==')
GO
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Parametros] ON 
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, N'EmailSettings', N'Remitente', N'medicare.notificacion@gmail.com', N'Correo Remitente', 1, CAST(N'2025-12-10T00:47:02.087' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, N'EmailSettings', N'UserName', N'', N'Usuario para enviar correo', 1, CAST(N'2025-12-10T00:47:45.753' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, N'EmailSettings', N'AppPassword', N'', N'Clave para enviar email', 1, CAST(N'2025-12-10T00:48:43.190' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, N'EmailSettings', N'Host', N'smtp.gmail.com', N'Host para enviar notificacion', 1, CAST(N'2025-12-10T00:49:14.490' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, N'EmailSettings', N'Port', N'587', N'Puerto para enviar notificacion', 1, CAST(N'2025-12-10T00:49:43.160' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (6, N'EmailSettings', N'SSL', N'false', N'Envio seguro', 1, CAST(N'2025-12-10T00:50:21.803' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (8, N'Calender', N'InterHora', N'30', N'Intervalo de tiempo hora cita', 1, CAST(N'2025-12-27T12:27:58.440' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (9, N'Calender', N'Renderizar', N'6', N'Renderizar el calendario', 1, CAST(N'2025-12-28T17:17:39.337' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Parametros] ([ParamId], [Tipo], [Codigo], [Valor], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (10, N'Login', N'TokenExpiracionMinutos', N'60', N'Horario de expiracióndel token', 1, CAST(N'2026-01-01T01:49:18.183' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Parametros] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 
GO
INSERT [dbo].[Perfil] ([PerfilId], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Codigo]) VALUES (1, N'Paciente', 1, CAST(N'2025-11-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'COD_PAC')
GO
INSERT [dbo].[Perfil] ([PerfilId], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Codigo]) VALUES (2, N'Medico', 1, CAST(N'2025-12-08T12:55:15.080' AS DateTime), N'admin', NULL, NULL, N'COD_MED')
GO
INSERT [dbo].[Perfil] ([PerfilId], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Codigo]) VALUES (3, N'Usuario', 1, CAST(N'2025-12-08T12:55:31.617' AS DateTime), N'admin', NULL, NULL, N'COD_USU')
GO
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 
GO
INSERT [dbo].[Pregunta] ([PreguntaId], [TextoPregunta], [Categoria], [TipoRespuesta], [Orden], [Activa]) VALUES (1, N'¿Cómo calificaría la atención del médico?', N'Atención del médico', N'Escala', 1, 1)
GO
INSERT [dbo].[Pregunta] ([PreguntaId], [TextoPregunta], [Categoria], [TipoRespuesta], [Orden], [Activa]) VALUES (2, N'¿El tiempo de espera fue adecuado?', N'Tiempo de espera', N'Escala', 2, 1)
GO
INSERT [dbo].[Pregunta] ([PreguntaId], [TextoPregunta], [Categoria], [TipoRespuesta], [Orden], [Activa]) VALUES (3, N'¿Recomendaría este servicio a otros?', N'Satisfacción general', N'Sí/No', 3, 1)
GO
INSERT [dbo].[Pregunta] ([PreguntaId], [TextoPregunta], [Categoria], [TipoRespuesta], [Orden], [Activa]) VALUES (4, N'Comentarios adicionales', N'General', N'Texto', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([RolId], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Codigo]) VALUES (1, N'Administrador', 1, CAST(N'2025-12-08T13:12:28.780' AS DateTime), N'admin', NULL, NULL, N'COD_ADMIN')
GO
INSERT [dbo].[Rol] ([RolId], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Codigo]) VALUES (2, N'Usuario', 1, CAST(N'2025-12-08T13:12:39.200' AS DateTime), N'admin', NULL, NULL, N'COD_USU')
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 
GO
INSERT [dbo].[UserLogin] ([Id], [PerfilId], [UserId], [FechaUltLogin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, 1, 1, CAST(N'2026-01-03T19:16:34.250' AS DateTime), 1, CAST(N'2026-01-02T05:29:45.477' AS DateTime), N'cperez1', CAST(N'2026-01-03T19:16:34.300' AS DateTime), N'cperez1')
GO
INSERT [dbo].[UserLogin] ([Id], [PerfilId], [UserId], [FechaUltLogin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, 0, 1, CAST(N'2026-01-02T05:39:25.533' AS DateTime), 1, CAST(N'2026-01-02T05:39:25.600' AS DateTime), N'cperez1', NULL, NULL)
GO
INSERT [dbo].[UserLogin] ([Id], [PerfilId], [UserId], [FechaUltLogin], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, 2, 1, CAST(N'2026-01-04T00:59:43.273' AS DateTime), 1, CAST(N'2026-01-04T00:56:08.167' AS DateTime), N'scardenas', CAST(N'2026-01-04T00:59:43.287' AS DateTime), N'scardenas')
GO
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([UsuarioId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (4, 3, N'Vanessa', N'Aguas', N'0909090987', 28, N'vane_aguas', N'vane@gmail.com', N'2654534', N'0908786765', N'Sacues 9 principal', 1, CAST(N'2025-12-08T14:37:15.973' AS DateTime), N'admin', CAST(N'2025-12-08T14:43:48.440' AS DateTime), N'admin', NULL)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
/****** Object:  Index [Idx_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Estado] ON [dbo].[Catalogo]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_TipoCodigo]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_TipoCodigo] ON [dbo].[Catalogo]
(
	[Tipo] ASC,
	[Codigo] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Estado] ON [dbo].[Cita]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_FechaCita]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_FechaCita] ON [dbo].[Cita]
(
	[FechaCita] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_RelacionMP]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_RelacionMP] ON [dbo].[Cita]
(
	[PacienteId] ASC,
	[MedicoId] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Encuesta__748387381E401D8A]    Script Date: 4/1/2026 1:16:40 ******/
ALTER TABLE [dbo].[Encuesta] ADD UNIQUE NONCLUSTERED 
(
	[CodigoAcceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Encuesta_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Encuesta_Estado] ON [dbo].[Encuesta]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Encuesta_Medico]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Encuesta_Medico] ON [dbo].[Encuesta]
(
	[MedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Encuesta_Paciente]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Encuesta_Paciente] ON [dbo].[Encuesta]
(
	[PacienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medico_Especialida]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Medico_Especialida] ON [dbo].[Especialidad]
(
	[EspecialidadId] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Anios]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Anios] ON [dbo].[Feriado]
(
	[Anio] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Estado] ON [dbo].[Feriado]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Estado] ON [dbo].[Horario]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_Horas]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Horas] ON [dbo].[Horario]
(
	[HoraInicio] ASC,
	[HoraFin] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Estado] ON [dbo].[HorarioMedico]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Medico_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [Idx_Medico_Estado] ON [dbo].[HorarioMedico]
(
	[MedicoId] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medico_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Medico_Estado] ON [dbo].[Medico]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Paciente_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Paciente_Estado] ON [dbo].[Paciente]
(
	[Nombres] ASC,
	[Apellidos] ASC,
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usuario_Estado]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_Estado] ON [dbo].[Paciente]
(
	[PerfilId] ASC,
	[Identificacion] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medico_Perfil]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Medico_Perfil] ON [dbo].[Perfil]
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Paciente_Perfil]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Paciente_Perfil] ON [dbo].[Perfil]
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuario_Perfil]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_Perfil] ON [dbo].[Perfil]
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RespuestasEncuesta_Encuesta]    Script Date: 4/1/2026 1:16:40 ******/
CREATE NONCLUSTERED INDEX [IX_RespuestasEncuesta_Encuesta] ON [dbo].[RespuestasEncuesta]
(
	[EncuestaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignacion] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Asignacion] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Catalogo] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Catalogo] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Cita] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Cita_V2] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Encuesta] ADD  DEFAULT (getdate()) FOR [FechaEnvio]
GO
ALTER TABLE [dbo].[Encuesta] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[Encuesta] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Especialidad] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Especialidad] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Feriado] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Feriado] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Fidelizacion] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Fidelizacion] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Historico] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Historico] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Horario] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Horario] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((0)) FOR [MesInicio]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((0)) FOR [AnioInicio]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((0)) FOR [SecuenciaDia]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((0)) FOR [DiaFin]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((0)) FOR [MesFin]
GO
ALTER TABLE [dbo].[HorarioMedico] ADD  DEFAULT ((0)) FOR [AnioFin]
GO
ALTER TABLE [dbo].[Medico] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Medico] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Notificacion] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Notificacion] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Parametros] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Parametros] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Perfil] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Perfil] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT ((1)) FOR [Orden]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT ((1)) FOR [Activa]
GO
ALTER TABLE [dbo].[RespuestasEncuesta] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Asignacion] FOREIGN KEY([RolId])
REFERENCES [dbo].[Rol] ([RolId])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Roles_Asignacion]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Medico] FOREIGN KEY([MedicoId])
REFERENCES [dbo].[Medico] ([MedicoId])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Medico]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Paciente] FOREIGN KEY([PacienteId])
REFERENCES [dbo].[Paciente] ([PacienteId])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Paciente]
GO
ALTER TABLE [dbo].[Cita_V2]  WITH CHECK ADD  CONSTRAINT [FK_Cita_V2_Medico] FOREIGN KEY([MedicoId])
REFERENCES [dbo].[Medico] ([MedicoId])
GO
ALTER TABLE [dbo].[Cita_V2] CHECK CONSTRAINT [FK_Cita_V2_Medico]
GO
ALTER TABLE [dbo].[Cita_V2]  WITH CHECK ADD  CONSTRAINT [FK_Cita_V2_Paciente] FOREIGN KEY([PacienteId])
REFERENCES [dbo].[Paciente] ([PacienteId])
GO
ALTER TABLE [dbo].[Cita_V2] CHECK CONSTRAINT [FK_Cita_V2_Paciente]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_Cita] FOREIGN KEY([CitaId])
REFERENCES [dbo].[Cita] ([CitaId])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_Cita]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_Medico] FOREIGN KEY([MedicoId])
REFERENCES [dbo].[Medico] ([MedicoId])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_Medico]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_Paciente] FOREIGN KEY([PacienteId])
REFERENCES [dbo].[Paciente] ([PacienteId])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_Paciente]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Especialidad_Medico] FOREIGN KEY([EspecialidadId])
REFERENCES [dbo].[Especialidad] ([EspecialidadId])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Especialidad_Medico]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Medico] FOREIGN KEY([PerfilId])
REFERENCES [dbo].[Perfil] ([PerfilId])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Perfil_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Paciente] FOREIGN KEY([PerfilId])
REFERENCES [dbo].[Perfil] ([PerfilId])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Perfil_Paciente]
GO
ALTER TABLE [dbo].[RespuestasEncuesta]  WITH CHECK ADD  CONSTRAINT [FK_RespuestasEncuesta_Encuesta] FOREIGN KEY([EncuestaId])
REFERENCES [dbo].[Encuesta] ([EncuestaId])
GO
ALTER TABLE [dbo].[RespuestasEncuesta] CHECK CONSTRAINT [FK_RespuestasEncuesta_Encuesta]
GO
ALTER TABLE [dbo].[RespuestasEncuesta]  WITH CHECK ADD  CONSTRAINT [FK_RespuestasEncuesta_Pregunta] FOREIGN KEY([PreguntaId])
REFERENCES [dbo].[Pregunta] ([PreguntaId])
GO
ALTER TABLE [dbo].[RespuestasEncuesta] CHECK CONSTRAINT [FK_RespuestasEncuesta_Pregunta]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario] FOREIGN KEY([PerfilId])
REFERENCES [dbo].[Perfil] ([PerfilId])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Perfil_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_Delete]    Script Date: 4/1/2026 1:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Asignacion_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Asignacion_GetAll]
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Asignacion_GetById]
  @AsignarId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Asignacion WHERE AsignarId=@AsignarId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Asignacion_Insert]
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Asignacion_Update]
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Catalogo_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Catalogo_GetAll]
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Catalogo_GetById]
  @CatalogoId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Catalogo WHERE CatalogoId=@CatalogoId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Catalogo_Insert]
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec [dbo].[sp_Catalogo_Update] 1,'EST_CITA','PEN','PENDI',1,'admin'
CREATE PROC [dbo].[sp_Catalogo_Update]
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC  [dbo].[sp_Cita_GetAll] @Combo = 'S'
CREATE PROC [dbo].[sp_Cita_GetAll]
	@PacienteId		int = null,
	@MedicoId		int = null,
	@FechaInicio	datetime = NULL,
	@FechaFin		datetime = NULL,
	@Estado			nvarchar(10) = null,
	@Combo			varchar(1) = 'N',
	@PageNumber INT = 1,
	@PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;
   
IF @COMBO = 'N'
BEGIN
  SELECT [CitaId]
      ,[PacienteId]
      ,[MedicoId]
      ,[FechaCita]
      ,[Motivo]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
      ,[EstadoCita]
  FROM Cita
  WHERE (@PacienteId IS NULL OR PacienteId=@PacienteId)
    AND (@MedicoId IS NULL OR MedicoId=@MedicoId)
    AND ((@FechaInicio IS NULL AND @FechaFin IS NULL) OR (FechaCita between @FechaInicio and @FechaFin))
  ORDER BY CitaId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Cita
  WHERE ((@PacienteId IS NULL OR PacienteId=@PacienteId)
    AND (@MedicoId IS NULL OR MedicoId=@MedicoId)
    AND (FechaCita between @FechaInicio and @FechaFin));
END
ELSE
BEGIN
	SELECT [CitaId]
      ,[PacienteId]
      ,[MedicoId]
      ,[FechaCita]
      ,[Motivo]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
      ,[EstadoCita]
	FROM Cita
	WHERE Estado = 1
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cita_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_GetById]
  @CitaId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Cita WHERE CitaId=@CitaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cita_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_Insert]
@PacienteId		int,
@MedicoId		int,
@FechaCita		datetime,
@Motivo			nvarchar(400) = null,
@Estado			nvarchar(10) = 1,
@UsuarioCreacion	varchar(25)

AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @Row INT

  IF EXISTS(SELECT 1 FROM Cita WHERE MedicoId = @MedicoId AND FechaCita = @FechaCita AND EstadoCita IN ('ASIG','PROC'))
  BEGIN
		SET @Row = -9999
  END
  ELSE IF EXISTS(SELECT 1 FROM Cita WHERE MedicoId = @MedicoId AND Cast(FechaCita as date) = cast(@FechaCita as date) AND PacienteId = @PacienteId AND EstadoCita IN ('ASIG','PROC'))
  BEGIN
		SET @Row = -1111
  END
  ELSE
  BEGIN
		INSERT INTO Cita (PacienteId, MedicoId, FechaCita, Motivo, Estado, FechaCreacion, UsuarioCreacion, EstadoCita)
		 VALUES (@PacienteId, @MedicoId, @FechaCita, @Motivo, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion, 'ASIG');
		 SET @Row = SCOPE_IDENTITY();
  END
  

  SELECT @Row
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cita_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_Update]
	@CitaId INT = 0,
	@PacienteId		int,
	@MedicoId		int,
	@FechaCita		datetime,
	@Motivo			nvarchar(400) = null,
	@EstadoCita		nvarchar(10) = NULL,
	@UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;

	UPDATE Cita
		SET EstadoCita = @EstadoCita,
			FechaModificacion = GETDATE(),
			UsuarioModificacion=@UsuarioModificacion
		WHERE CitaId = @CitaId;

	SELECT @CitaId;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_DashBoard_SeccionOne]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_DashBoard_SeccionOne]
AS
BEGIN

DECLARE @Medicos INT, @Especialidades INT,@Pacientes INt,@CitasAsistidas INT

--Medicos
SELECT @Medicos = COUNT(*)
FROM Medico WITH(NOLOCK)

--Especialidades
SELECT @Especialidades = COUNT(*)
FROM Especialidad WITH(NOLOCK)

--Pacientes
SELECT @Pacientes = COUNT(*)
FROM Paciente WITH(NOLOCK)

--Citas Asistidas
SELECT @CitasAsistidas = COUNT(*)
FROM Cita WITH(NOLOCK)
WHERE EstadoCita = 'EST-ASIST'


--RESULTADO
SELECT @Medicos 'Medicos',@Especialidades 'Especialidades',@Pacientes 'Pacientes',@CitasAsistidas 'CitasAsistidas'

END
GO
/****** Object:  StoredProcedure [dbo].[sp_DatosCache_Parametros]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_DatosCache_Parametros]
AS
BEGIN
  SELECT [ParamId]
      ,[Tipo]
      ,[Codigo]
      ,[Valor]
      ,[Descripcion]
      ,[Estado]
  FROM Parametros WITH(NOLOCK)
  WHERE Estado = 1
  ORDER BY ParamId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Encuesta_Delete]
  @EncuestaId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Encuesta
  SET Estado='Cancelada', FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE EncuestaId=@EncuestaId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Encuesta_GetAll]
  @PacienteId INT = NULL,
  @MedicoId INT = NULL,
  @CitaId INT = NULL,
  @Estado NVARCHAR(20) = NULL,
  @CanalEnvio NVARCHAR(20) = NULL
AS
BEGIN
  SELECT *
  FROM Encuesta
  WHERE (@PacienteId IS NULL OR PacienteId=@PacienteId)
    AND (@MedicoId IS NULL OR MedicoId=@MedicoId)
    AND (@CitaId IS NULL OR CitaId=@CitaId)
    AND (@Estado IS NULL OR Estado=@Estado)
    AND (@CanalEnvio IS NULL OR CanalEnvio=@CanalEnvio)
  ORDER BY FechaCreacion DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Encuesta_GetById]
  @EncuestaId INT
AS
BEGIN
  SELECT * FROM Encuesta WHERE EncuestaId=@EncuestaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Encuesta_Insert]
  @PacienteId INT = NULL,
  @MedicoId INT = NULL,
  @CitaId INT = NULL,
  @FechaEnvio DATETIME = NULL,
  @Estado NVARCHAR(20) = 'Pendiente',
  @CodigoAcceso NVARCHAR(50),
  @CanalEnvio NVARCHAR(20) = NULL,
  @ObservacionGeneral NVARCHAR(MAX) = NULL,
  @CalificacionGlobal DECIMAL(3,2) = NULL,
  @CreadoPor NVARCHAR(50) = NULL,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Encuesta (PacienteId, MedicoId, CitaId, FechaEnvio, Estado, CodigoAcceso, CanalEnvio, ObservacionGeneral, CalificacionGlobal, CreadoPor, FechaCreacion, UsuarioCreacion)
  VALUES (@PacienteId, @MedicoId, @CitaId, ISNULL(@FechaEnvio, GETDATE()), @Estado, @CodigoAcceso, @CanalEnvio, @ObservacionGeneral, @CalificacionGlobal, @CreadoPor, GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Encuesta_Update]
  @EncuestaId INT,
  @FechaRespuesta DATETIME = NULL,
  @Estado NVARCHAR(20),
  @ObservacionGeneral NVARCHAR(MAX) = NULL,
  @CalificacionGlobal DECIMAL(3,2) = NULL,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Encuesta
  SET FechaRespuesta=@FechaRespuesta,
      Estado=@Estado,
      ObservacionGeneral=@ObservacionGeneral,
      CalificacionGlobal=@CalificacionGlobal,
      FechaModificacion=GETDATE(),
      UsuarioModificacion=@UsuarioModificacion
  WHERE EncuestaId=@EncuestaId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Especialidad_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_Especialidad_GetAll]
  @Estado BIT = NULL,
  @Input VARCHAR(150) = NULL,
  @Combo varchar(1) = 'N',
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN

IF @Combo = 'N'
BEGIN
  SELECT [EspecialidadId]
      ,[Descripcion]
      ,[Observacion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM Especialidad WITH(NOLOCK)
  WHERE (@Estado IS NULL OR Estado = @Estado)
  AND (@Input IS NULL OR Descripcion LIKE '%' + @Input + '%')
  ORDER BY EspecialidadId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) 
  FROM Especialidad WITH(NOLOCK)
  WHERE (@Estado IS NULL OR Estado=@Estado);
END
ELSE 
BEGIN
SELECT [EspecialidadId]
      ,[Descripcion]
      ,[Observacion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM Especialidad WITH(NOLOCK)
  WHERE Estado = 1
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Especialidad_GetById]
  @EspecialidadId INT
AS
BEGIN
  SELECT [EspecialidadId]
      ,[Descripcion]
      ,[Observacion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion] 
  FROM Especialidad
  WHERE EspecialidadId=@EspecialidadId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Especialidad_Insert]
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Especialidad_Update]
  @EspecialidadId INT,
  @Descripcion NVARCHAR(100),
  @Observacion NVARCHAR(MAX) = NULL,
  @Estado BIT = 1,
  @UsuarioModificacion VARCHAR(25) = NULL
AS
BEGIN
  UPDATE Especialidad
  SET Descripcion=@Descripcion, Observacion=@Observacion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE EspecialidadId=@EspecialidadId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Feriado_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec [dbo].[sp_Feriado_GetAll] @Anios = '2026'
CREATE   PROC [dbo].[sp_Feriado_GetAll]
  @Anios VARCHAR(MAX) = NULL,
  @Estado BIT = 1
AS
BEGIN
  SET NOCOUNT ON;

  SELECT [FeriadoId]
      ,[Anio]
      ,[Mes]
      ,[Dia]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM dbo.Feriado
  WHERE (@Anios IS NULL OR 
       Anio IN (SELECT CAST(Valor AS BIGINT) FROM dbo.SplitString(@Anios, ',')))
  AND Estado = @Estado
  ORDER BY FeriadoId ASC

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Fidelizacion_Delete]
  @FidelizacionId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Fidelizacion
    SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE FidelizacionId=@FidelizacionId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Fidelizacion_GetAll]
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;

  SELECT *
  FROM Fidelizacion
  WHERE (@Estado IS NULL OR Estado=@Estado)
  ORDER BY FidelizacionId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Fidelizacion
  WHERE (@Estado IS NULL OR Estado=@Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Fidelizacion_GetById]
  @FidelizacionId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Fidelizacion WHERE FidelizacionId=@FidelizacionId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Fidelizacion_Insert]
  @Descripcion VARCHAR(400),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO Fidelizacion (Descripcion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Fidelizacion_Update]
  @FidelizacionId INT,
  @Descripcion VARCHAR(400),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  SET NOCOUNT ON;
  UPDATE Fidelizacion
    SET Descripcion=@Descripcion, Estado=@Estado,
        FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE FidelizacionId=@FidelizacionId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerarHorariosMedicos]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GenerarHorariosMedicos @MedicoId = 2, @EspecialidadId = 7,@FechaDia = '2025-12-31'
CREATE   PROCEDURE [dbo].[sp_GenerarHorariosMedicos](
@MedicoId BIGINT = 0,
@EspecialidadId BIGINT = 0,
@PacienteId BIGINT = 0,
@FechaDia VARCHAR(10) = ''
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @FechaInicio DATETIME, @FechaFin DATETIME, @HoraActual TIME

	SET @FechaInicio = GETDATE();
	SET @HoraActual = CAST(@FechaInicio AS TIME);

	/***********************************
	 obtener el parametros de calendario
	***********************************/
	DECLARE @INTERHORA INT

	SELECT @INTERHORA = CAST(VALOR AS INT)
	FROM DBO.Parametros WHERE Tipo = 'Calender' AND Codigo = 'InterHora'

	/***********************************
	 obtener datos principales
	***********************************/

	CREATE TABLE #TempHorarios (
	Id	INT NOT NULL,
    MedicoId INT NOT NULL,
    Nombre VARCHAR(150),
	EspecialidadId INT,
	DescEspecialidad VARCHAR(150),
	HorarioId INT,
	HoraInicio VARCHAR(6),
	HoraFin VARCHAR(6),
	DiaInicio INT,
	MesInicio INT,
	AnioInicio  INT,
	FechaInicioLaboral DATETIME,
	SecuenciaDia VARCHAR(15),
	DiaFin INT,
	MesFin INT,
	AnioFin  INT,
	FechaFinLaboral DATETIME,
	Foto VARCHAR(500)
)

INSERT INTO #TempHorarios
SELECT hm.HoraMedicoId, m.MedicoId, CONCAT(M.Nombres,' ',M.Apellidos) AS Nombre,
esp.EspecialidadId,esp.Descripcion AS DescEspecialidad,h.HorarioId, h.HoraInicio, h.HoraFin, hm.DiaInicio, hm.MesInicio, hm.AnioInicio, DATEFROMPARTS(hm.AnioInicio, hm.MesInicio, hm.DiaInicio), hm.SecuenciaDia,
hm.DiaFin, hm.MesFin, hm.AnioFin,DATEFROMPARTS(hm.AnioFin, hm.MesFin, hm.DiaFin),null
FROM ProcesoMedico.DBO.HorarioMedico hm WITH(NOLOCK)
INNER JOIN DBO.Horario h ON hm.HorarioId = h.HorarioId AND h.Estado = 1
INNER JOIN DBO.Medico m ON hm.MedicoId = m.MedicoId AND m.Estado = 1
INNER JOIN DBO.Especialidad esp ON m.EspecialidadId = esp.EspecialidadId AND esp.Estado = 1
WHERE (@EspecialidadId = 0 OR esp.EspecialidadId = @EspecialidadId)
AND (@MedicoId = 0 OR m.MedicoId = @MedicoId)
AND ((@FechaDia = '' AND CAST(DATEFROMPARTS(hm.AnioInicio, hm.MesInicio, hm.DiaInicio) AS DATE) >= CAST(GETDATE() AS DATE))
	OR (CAST(DATEFROMPARTS(hm.AnioInicio, hm.MesInicio, hm.DiaInicio) AS DATE) = CAST(@FechaDia AS DATE)))

update #TempHorarios
set Foto = 'assets/img/logo-small.png'
where foto is null

--******************************************
-- 1.- TABLA DE MEDICO INFORMACIÓN PRINCIPAL
--******************************************
CREATE TABLE #TempMedicos (
    MedicoId INT NOT NULL,
    Nombre VARCHAR(150),
	EspecialidadId INT,
	DescEspecialidad VARCHAR(150),
	FechaInicioLaboral DATETIME,
	FechaFinLaboral DATETIME,
	HorarioTexto VARCHAR(500),
	Foto VARCHAR(500)
)


INSERT INTO #TempMedicos
SELECT MedicoId,Nombre,EspecialidadId,DescEspecialidad,FechaInicioLaboral,FechaFinLaboral,
STRING_AGG(
    HoraInicio + ' - ' + HoraFin,
    ' / '
) WITHIN GROUP (ORDER BY HoraInicio) AS HorarioTexto,
Foto
FROM #TempHorarios
GROUP BY MedicoId,Nombre,EspecialidadId,DescEspecialidad,FechaInicioLaboral,FechaFinLaboral,Foto
 

;WITH Rangos AS (
    SELECT
        MedicoId,
        FechaInicioLaboral,
        FechaFinLaboral,
        MIN(CAST(HoraInicio AS time)) AS HoraInicioMin,
        MAX(CAST(HoraFin AS time))    AS HoraFinMax
    FROM #TempHorarios
    GROUP BY
        MedicoId,
        FechaInicioLaboral,
        FechaFinLaboral
)

UPDATE M
SET
    FechaInicioLaboral =
        DATEADD(
            MINUTE,
            DATEDIFF(MINUTE, '00:00', R.HoraInicioMin),
            CAST(CAST(M.FechaInicioLaboral AS date) AS datetime)
        ),

    FechaFinLaboral =
		DATEADD(
            MINUTE,
            DATEDIFF(MINUTE, '00:00', R.HoraFinMax),
            CAST(CAST(M.FechaFinLaboral AS date) AS datetime)
        )
FROM #TempMedicos M
INNER JOIN Rangos R
    ON R.MedicoId = M.MedicoId
   AND R.FechaInicioLaboral = M.FechaInicioLaboral
   AND R.FechaFinLaboral    = M.FechaFinLaboral;

--ELIMINACION DE REGISTRO Q YA ESTAN FUERA DEL HORARIO
DELETE FROM #TempMedicos WHERE FechaFinLaboral < GETDATE() 

SELECT  MedicoId,
    Nombre,
	EspecialidadId,
	DescEspecialidad,
	FechaInicioLaboral,
	FechaFinLaboral,
	HorarioTexto,
	Foto
FROM #TempMedicos

--**********************************
--2.- SECUENCIA DE DIAS
--**********************************
/*CREATE TABLE #TempSecuencia (
    MedicoId INT NOT NULL,
    Nombre VARCHAR(150),
	SecuenciaDia VARCHAR(500),
	HorarioId INT,
	FechaInicioLaboral DATETIME,
	FechaFinLaboral DATETIME
)

INSERT INTO #TempSecuencia*/
SELECT MedicoId,
    Nombre,
    SecuenciaDia,
	HorarioId,
	FechaInicioLaboral,
	FechaFinLaboral
FROM #TempHorarios
ORDER BY FechaInicioLaboral ASC;
/*
SELECT MedicoId ,
    Nombre,
	SecuenciaDia,
	HorarioId,
	FechaInicioLaboral,
	FechaFinLaboral
FROM #TempSecuencia
ORDER BY MedicoId ASC*/

--*************************************
--3.- horas de atención mediante el rango
--*************************************
CREATE TABLE #TempRangosMedico (
    HoraMedicoId INT NOT NULL,
    MedicoId INT NOT NULL,
    Nombre VARCHAR(150),
	HorarioId INT NOT NULL,
	FechaInicio DATETIME NOT NULL,
	FechaFin DATETIME NOT NULL
) 

INSERT INTO #TempRangosMedico
SELECT Id,MedicoId,Nombre,HorarioId,DATEADD(
    MINUTE,
    DATEPART(HOUR, HoraInicio + ':00.000') * 60 + DATEPART(MINUTE,  HoraInicio + ':00.000'),
    CAST(DATEFROMPARTS(AnioInicio, MesInicio, DiaInicio) AS DATETIME)
) AS FechaInicio,
DATEADD(
    MINUTE,
    DATEPART(HOUR, HoraFin + ':00.000') * 60 + DATEPART(MINUTE,  HoraFin + ':00.000'),
    CAST(DATEFROMPARTS(AnioFin, MesFin, DiaFin) AS DATETIME)
) AS FechaFin
FROM #TempHorarios

--**********************************
--2.- CITAS ASIGNADAD
--**********************************
UPDATE DBO.Cita
SET EstadoCita = 'NASIS'
WHERE FechaCita < GETDATE()
AND EstadoCita IN ('ASIG')

CREATE TABLE #TempCitas (
	CitaId INT,
    MedicoId INT NOT NULL,
	PacienteId INT NOT NULL,
	FechaCita DATETIME NOT NULL,
	Motivo VARCHAR(250) NULL,
	EstadoCita VARCHAR(10) NOT NULL,
	DescEstadoCita VARCHAR(100) NULL
)

INSERT INTO #TempCitas(CitaId,MedicoId,PacienteId,FechaCita,Motivo,EstadoCita,DescEstadoCita)
SELECT c.CitaId,c.MedicoId,c.PacienteId,c.FechaCita,c.Motivo,c.EstadoCita, cat.Descripcion
FROM DBO.Cita c
LEFT JOIN DBO.Catalogo cat ON C.EstadoCita = CAT.Codigo AND CAT.Tipo = 'EST_CITA'
WHERE MedicoId in (SELECT MedicoId FROM #TempHorarios GROUP BY MedicoId)
AND (@PacienteId = 0 OR PacienteId = @PacienteId)
AND CAT.Codigo IN ('ASIG','PROC')
AND C.Estado = 1


CREATE TABLE #TempRangos (
	IdRango INT IDENTITY(1,1),
    MedicoId INT NOT NULL,
    Nombre VARCHAR(150),
	Hora DATETIME NOT NULL,
	FechaInicio DATETIME NOT NULL,
	FechaFin DATETIME NOT NULL,
	HorarioId INT NOT NULL
)

;WITH Numeros AS (
    -- 48 medias horas por día (suficiente incluso si cruza medianoche)
    SELECT TOP (100)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS N
    FROM sys.objects
)

INSERT INTO #TempRangos
SELECT
    h.MedicoId,
    h.Nombre,

    -- Hora generada cada 30 minutos
    Hora = DATEADD(MINUTE, n.N * @INTERHORA, h.FechaInicio),

    h.FechaInicio,
    h.FechaFin,
	h.HorarioId
FROM #TempRangosMedico h
JOIN Numeros n
    ON DATEADD(MINUTE, n.N * @INTERHORA, h.FechaInicio) <= h.FechaFin
ORDER BY
    h.MedicoId,
	H.HoraMedicoId,
	h.FechaInicio,
    Hora;

SELECT 
r.IdRango,
r.MedicoId,
r.Nombre,
r.Hora,
r.FechaInicio,
r.FechaFin,
r.HorarioId
FROM #TempRangos r
WHERE NOT EXISTS (
    SELECT 1
    FROM #TempCitas c
    WHERE c.MedicoId = r.MedicoId
      AND c.FechaCita = r.Hora
)
ORDER BY r.Hora ASC;
  

/*********************
--MOSTRAR CITAS
**********************/
SELECT c.CitaId,c.MedicoId,c.PacienteId,c.FechaCita,c.Motivo,c.EstadoCita, C.DescEstadoCita
FROM #TempCitas C

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Historico_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Historico_GetAll]
  @Usuario VARCHAR(50) = NULL,
  @Pantalla VARCHAR(200) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SET NOCOUNT ON;

  SELECT *
  FROM Historico
  WHERE (@Usuario IS NULL OR Usuario=@Usuario)
  AND (@Pantalla IS NULL OR Pantalla=@Pantalla)
  AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY LogId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Historico
  WHERE (@Usuario IS NULL OR Usuario=@Usuario)
  AND (@Pantalla IS NULL OR Pantalla=@Pantalla)
  AND (@Estado IS NULL OR Estado=@Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Historico_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Historico_GetById]
  @LogId INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT * FROM Historico WHERE LogId=@LogId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Historico_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Historico_Insert]
  @Pantalla VARCHAR(200),
  @Usuario VARCHAR(50),
  @Maquina VARCHAR(100),
  @DatosEntrada VARCHAR(MAX),
  @Descripcion VARCHAR(400),
  @Estado BIT = 1
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO Historico (Pantalla, Usuario, Maquina, DatosEntrada, Descripcion, Estado, FechaCreacion)
  VALUES (@Pantalla, @Usuario, @Maquina, @DatosEntrada, @Descripcion, ISNULL(@Estado,1), GETDATE());
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login_Sistema]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec [dbo].[sp_Login_Sistema] @UsuarioEmail = 'scardenas@gmail.com', @TipoUsuario = 'M'
CREATE PROC [dbo].[sp_Login_Sistema]
  @UsuarioEmail VARCHAR(75) = NULL,
  @Clave VARCHAR(500) = NULL,
  @TipoUsuario VARCHAR(1) = 'P'
AS
BEGIN

IF @TipoUsuario = 'P'
BEGIN
	SELECT Nombres as 'LoginNombre',
	Apellidos as 'LoginApellidos',
	Identificacion as 'LoginIdentificacion',
	Usuario AS 'LoginUsuario', 
	PacienteId AS 'LoginId',
	P.PerfilId AS 'LoginPerfilId',
	'P' as 'LoginPerfil',
	pe.Descripcion as 'LoginDescPerfil',
	p.Clave as 'LoginClave',
	ul.FechaUltLogin as 'LoginFecUltLogin',
	(select top 1 isnull(Valor, '0') from dbo.parametros where Tipo = 'Login' and Codigo = 'TokenExpiracionMinutos') as 'LoginExpToken'
  FROM DBO.Paciente P
  INNER JOIN DBO.PERFIL PE ON P.PerfilId = PE.PerfilId AND PE.Codigo = 'COD_PAC' 
  LEFT JOIN DBO.[UserLogin] ul ON P.PacienteId = ul.UserId and p.PerfilId = ul.PerfilId
  WHERE (Email = @UsuarioEmail OR Usuario = @UsuarioEmail)
END
ELSE IF @TipoUsuario = 'A'
BEGIN
	SELECT Nombres as 'LoginNombre',
	Apellidos as 'LoginApellidos',
	Identificacion as 'LoginIdentificacion',
	Usuario AS 'LoginUsuario', 
	UsuarioId AS 'LoginId',
	P.PerfilId AS 'LoginPerfilId',
	'P' as 'LoginPerfil',
	pe.Descripcion as 'LoginDescPerfil',
	p.Clave as 'LoginClave',
	ul.FechaUltLogin as 'LoginFecUltLogin',
	(select top 1 isnull(Valor, '0') from dbo.parametros where Tipo = 'Login' and Codigo = 'TokenExpiracionMinutos') as 'LoginExpToken'
  FROM DBO.Usuario P
  INNER JOIN DBO.PERFIL PE ON P.PerfilId = PE.PerfilId AND PE.Codigo = 'COD_USU' 
  LEFT JOIN DBO.[UserLogin] ul ON P.UsuarioId = ul.UserId and p.PerfilId = ul.PerfilId
  WHERE (Email = @UsuarioEmail OR Usuario = @UsuarioEmail)
END
ELSE
BEGIN
	SELECT Nombres as 'LoginNombre',
	Apellidos as 'LoginApellidos',
	Identificacion as 'LoginIdentificacion',
	Usuario AS 'LoginUsuario', 
	MedicoId AS 'LoginId',
	P.PerfilId AS 'LoginPerfilId',
	'M' as 'LoginPerfil',
	pe.Descripcion as 'LoginDescPerfil',
	p.Clave as 'LoginClave',
	ul.FechaUltLogin as 'LoginFecUltLogin',
	(select top 1 isnull(Valor, '0') from dbo.parametros where Tipo = 'Login' and Codigo = 'TokenExpiracionMinutos') as 'LoginExpToken'
  FROM DBO.Medico P
  INNER JOIN DBO.PERFIL PE ON P.PerfilId = PE.PerfilId AND PE.Codigo = 'COD_MED' 
  LEFT JOIN DBO.[UserLogin] ul ON P.MedicoId = ul.UserId and p.PerfilId = ul.PerfilId
  WHERE (Email = @UsuarioEmail OR Usuario = @UsuarioEmail)
END
  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Medico_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Medico_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_GetAll]
  @EspecialidadId INT = NULL,
  @Identificacion NVARCHAR(15) = NULL,
  @Input VARCHAR(150) = NULL,
  @Combo varchar(1) = 'N',
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN

IF @Combo = 'N'
BEGIN
  SELECT [MedicoId]
      ,me.[EspecialidadId]
      ,me.[PerfilId]
      ,[Nombres]
      ,[Apellidos]
      ,[Identificacion]
      ,[Edad]
      ,[Usuario]
      ,[Email]
      ,[Telefono]
      ,[Celular]
      ,[Direccion]
      ,me.[Estado]
      ,me.[FechaCreacion]
      ,me.[UsuarioCreacion]
      ,me.[FechaModificacion]
      ,me.[UsuarioModificacion]
	  ,per.Descripcion AS DescPerfil
	  ,ep.Descripcion AS DescEspecialidad
  FROM Medico me WITH(NOLOCK)
  INNER JOIN Perfil per ON me.PerfilId = PER.PerfilId
  INNER JOIN Especialidad ep ON me.EspecialidadId = ep.EspecialidadId
  WHERE (@EspecialidadId IS NULL OR me.EspecialidadId=@EspecialidadId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR me.Estado=@Estado)
  ORDER BY MedicoId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) 
  FROM Medico WITH(NOLOCK)
  WHERE (@EspecialidadId IS NULL OR EspecialidadId=@EspecialidadId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado);
END
ELSE
BEGIN
SELECT [MedicoId]
      ,me.[EspecialidadId]
      ,me.[PerfilId]
      ,[Nombres]
      ,[Apellidos]
      ,[Identificacion]
      ,[Edad]
      ,[Usuario]
      ,[Email]
      ,[Telefono]
      ,[Celular]
      ,[Direccion]
      ,me.[Estado]
      ,me.[FechaCreacion]
      ,me.[UsuarioCreacion]
      ,me.[FechaModificacion]
      ,me.[UsuarioModificacion]
	  ,per.Descripcion AS DescPerfil
	  ,ep.Descripcion AS DescEspecialidad
  FROM Medico me WITH(NOLOCK)
  INNER JOIN Perfil per ON me.PerfilId = PER.PerfilId
  INNER JOIN Especialidad ep ON me.EspecialidadId = ep.EspecialidadId
  WHERE (@EspecialidadId IS NULL OR me.EspecialidadId=@EspecialidadId)
    AND me.Estado = 1
  ORDER BY MedicoId
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Medico_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_GetById]
  @MedicoId INT
AS
BEGIN
  SELECT [MedicoId]
      ,me.[EspecialidadId]
      ,me.[PerfilId]
      ,[Nombres]
      ,[Apellidos]
      ,[Identificacion]
      ,[Edad]
      ,[Usuario]
      ,[Email]
      ,[Telefono]
      ,[Celular]
      ,[Direccion]
      ,me.[Estado]
      ,me.[FechaCreacion]
      ,me.[UsuarioCreacion]
      ,me.[FechaModificacion]
      ,me.[UsuarioModificacion]
	  ,per.Descripcion AS DescPerfil
	  ,ep.Descripcion AS DescEspecialidad
  FROM Medico me WITH(NOLOCK)
  INNER JOIN Perfil per ON me.PerfilId = PER.PerfilId
  INNER JOIN Especialidad ep ON me.EspecialidadId = ep.EspecialidadId 
  WHERE MedicoId=@MedicoId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Medico_GetByUser]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_GetByUser]
  @Usuario VARCHAR(50)
AS
BEGIN
  SELECT MedicoId
      ,[Usuario]
  FROM Medico me WITH(NOLOCK)
  WHERE me.Usuario = @Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Medico_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_Insert]
@PerfilId		int = 0,
@EspecialidadId int = 0,
@Nombres			nvarchar(200),
@Apellidos		nvarchar(200),
@Identificacion	varchar	(13) = null,
@Edad			int = 0,
@Usuario			nvarchar(200) = null,
@Email			nvarchar(200) = null,
@Telefono		nvarchar(40) = null,
@Celular			nvarchar(40) = null,
@Direccion		nvarchar(300) = null,
@Estado			bit = 1,
@UsuarioCreacion	varchar(25) = null,
@CodPerfil varchar(10) = '',
@CodEspecialidad varchar(10) = ''
AS
BEGIN
  IF @PerfilId = 0 OR ISNULL(@PerfilId, '') = ''
  BEGIN
	SET @PerfilId = (SELECT PerfilId FROM Perfil WHERE CODIGO = @CodPerfil)
  END

  IF @EspecialidadId = 0 OR ISNULL(@EspecialidadId, '') = ''
  BEGIN
	SET @EspecialidadId = 11
  END

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
/****** Object:  StoredProcedure [dbo].[sp_Medico_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_Update]
  @MedicoId INT,
  @EspecialidadId INT = 0,
  @PerfilId INT = 0,
  @Nombres NVARCHAR(200),
  @Apellidos NVARCHAR(200),
  @Identificacion NVARCHAR(13),
  @Edad INT,
  @Usuario VARCHAR(200) = null,
  @Email VARCHAR(200) = null,
  @Telefono VARCHAR(40) = null,
  @Celular VARCHAR(40) = null,
  @Direccion VARCHAR(300) = null,
  @Estado BIT = 1,
  @UsuarioModificacion VARCHAR(25) = null
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Notificacion_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Notificacion_GetAll]
  @Codigo NVARCHAR(10) = NULL,
  @Tipo NVARCHAR(15) = NULL,
  @Canal NVARCHAR(20) = NULL,
  @Estado BIT = NULL,
  @Input VARCHAR(150) = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT [NotificacionId]
      ,[Codigo]
      ,[Tipo]
      ,[Canal]
      ,[Plantilla]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM Notificacion WITH(NOLOCK)
  WHERE (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Canal IS NULL OR Canal=@Canal)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY NotificacionId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) 
  FROM Notificacion WITH(NOLOCK)
  WHERE (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Canal IS NULL OR Canal=@Canal)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Notificacion_GetById]
  @NotificacionId INT
AS
BEGIN
  SELECT [NotificacionId]
      ,[Codigo]
      ,[Tipo]
      ,[Canal]
      ,[Plantilla]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM Notificacion WITH(NOLOCK)
  WHERE NotificacionId=@NotificacionId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Notificacion_Insert]
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Notificacion_Update]
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Paciente_Delete]
  @PacienteId INT,
  @UsuarioModificacion VARCHAR(25)
AS
BEGIN
  UPDATE Paciente
  SET Estado=0, FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE PacienteId=@PacienteId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Paciente_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Paciente_GetAll]
  @PerfilId INT = NULL,
  @Identificacion NVARCHAR(15) = NULL,
  @Estado BIT = NULL,
  @Input VARCHAR(150) = NULL,
  @Combo varchar(1) = 'N',
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN

IF @Combo = 'N'
BEGIN
  SELECT PacienteId,pa.[PerfilId]
           ,[Nombres]
           ,[Apellidos]
           ,[Identificacion]
           ,[Edad]
           ,[Usuario]
           ,[Email]
           ,[Telefono]
           ,[Celular]
           ,[Direccion]
           ,PA.[Estado]
           ,PA.[FechaCreacion]
           ,PA.[UsuarioCreacion],
		   PER.Descripcion AS DescPerfil
  FROM Paciente pa WITH(NOLOCK)
  INNER JOIN Perfil per ON PA.PerfilId = PER.PerfilId
  WHERE (@PerfilId IS NULL OR pa.PerfilId=@PerfilId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR pA.Estado=@Estado)
	AND (@Input IS NULL OR (Nombres LIKE '%' + @Input + '%' OR Apellidos LIKE '%' + @Input + '%' OR Usuario LIKE '%' + @Input + '%'))
  ORDER BY PacienteId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) FROM Paciente
  WHERE (@PerfilId IS NULL OR PerfilId=@PerfilId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado);
END
ELSE
BEGIN
SELECT [PacienteId]
		[PacienteId]
      ,[PerfilId]
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
      ,CONCAT([Identificacion],' - ',[Nombres],' ',[Apellidos]) AS PacienteInfo
  FROM Paciente WITH(NOLOCK)
  WHERE Estado = 1
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Paciente_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Paciente_GetById]
  @PacienteId INT
AS
BEGIN
  SELECT PacienteId,pa.[PerfilId]
           ,[Nombres]
           ,[Apellidos]
           ,[Identificacion]
           ,[Edad]
           ,[Usuario]
           ,[Email]
           ,[Telefono]
           ,[Celular]
           ,[Direccion]
           ,PA.[Estado]
           ,PA.[FechaCreacion]
           ,PA.[UsuarioCreacion],
		   PER.Descripcion AS DescPerfil
  FROM Paciente pa WITH(NOLOCK)
  INNER JOIN Perfil per ON PA.PerfilId = PER.PerfilId
  WHERE PacienteId=@PacienteId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Paciente_GetByUser]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_Paciente_GetByUser]
  @Usuario VARCHAR(50)
AS
BEGIN
  SELECT PacienteId
      ,[Usuario]
  FROM Paciente pa WITH(NOLOCK)
  WHERE pa.Usuario = @Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Paciente_Insert]
@PerfilId		int = 0,
@Nombres			nvarchar(200),
@Apellidos		nvarchar(200),
@Identificacion	varchar	(13),
@Edad			int,
@Usuario			nvarchar(200),
@Email			nvarchar(200),
@Telefono		nvarchar(40) = null,
@Celular			nvarchar(40) = null,
@Direccion		nvarchar(300) = null,
@Estado			bit = 1,
@UsuarioCreacion	varchar(25),
@CodPerfil varchar(10) = ''
AS
BEGIN

  IF @PerfilId = 0 OR ISNULL(@PerfilId, '') = ''
  BEGIN
	SET @PerfilId = (SELECT PerfilId FROM Perfil WHERE CODIGO = @CodPerfil)
  END


  INSERT INTO [dbo].[Paciente]
           ([PerfilId]
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_Paciente_Update @PacienteId=8,@PerfilId=1,@Nombres=N'Erick Omar',@Apellidos=N'Sanchez Barahona',@Identificacion=N'0923445667',@Edad=18,@Usuario=N'erick_3645',@Email=N'ing.scardenasortiz@gmail.com',@Telefono=N'3542635',@Celular=N'0983756546',@Direccion=N'Acuarela Del Río Mz 1180',@Estado=1,@UsuarioModificacion=N'admin'
CREATE PROC [dbo].[sp_Paciente_Update]
  @PacienteId INT,
  @PerfilId INT = 0,
  @Nombres NVARCHAR(200) = null,
  @Apellidos NVARCHAR(200) = null,
  @Identificacion NVARCHAR(13) = null,
  @Edad INT = 0,
  @Usuario VARCHAR(200) = null,
  @Email VARCHAR(200) = null,
  @Telefono VARCHAR(40) = null,
  @Celular VARCHAR(40) = null,
  @Direccion VARCHAR(300) = null,
  @Estado BIT = 1,
  @UsuarioModificacion VARCHAR(25) = null
AS
BEGIN
  UPDATE Paciente
  SET PerfilId		= @PerfilId
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
WHERE PacienteId=@PacienteId;

SELECT @@ROWCOUNT;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_Parametros_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Parametros_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Parametros_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Parametros_GetAll]
  @Tipo NVARCHAR(50) = NULL,
  @Codigo NVARCHAR(50) = NULL,
  @Input NVARCHAR(150) = NULL,
  @Combo VARCHAR(1) = 'N',
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN

IF @Combo  = 'N'
BEGIN
  SELECT [ParamId]
      ,[Tipo]
      ,[Codigo]
      ,[Valor]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM Parametros WITH(NOLOCK)
  WHERE (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Estado IS NULL OR Estado=@Estado)
  ORDER BY Tipo asc
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) 
  FROM Parametros
  WHERE (@Tipo IS NULL OR Tipo=@Tipo)
    AND (@Codigo IS NULL OR Codigo=@Codigo)
    AND (@Estado IS NULL OR Estado=@Estado);
END
ELSE
BEGIN
	SELECT [ParamId]
      ,[Tipo]
      ,[Codigo]
      ,[Valor]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
  FROM Parametros
  WHERE Estado = 1
  AND (@Tipo IS NULL OR Tipo=@Tipo)
  AND (@Codigo IS NULL OR Codigo=@Codigo) 
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Parametros_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Parametros_GetById]
  @ParamId INT
AS
BEGIN
  SELECT [ParamId]
      ,[Tipo]
      ,[Codigo]
      ,[Valor]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion] 
  FROM Parametros WITH(NOLOCK)
  WHERE ParamId=@ParamId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Parametros_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Parametros_Insert]
  @Tipo NVARCHAR(50),
  @Codigo NVARCHAR(50),
  @Valor NVARCHAR(100),
  @Descripcion NVARCHAR(250),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  INSERT INTO Parametros (Tipo, Codigo, Valor, Descripcion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@Tipo, @Codigo, @Valor, @Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Parametros_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Parametros_Update]
  @ParamId INT,
  @Tipo NVARCHAR(50),
  @Codigo NVARCHAR(50),
  @Valor NVARCHAR(100),
  @Descripcion NVARCHAR(250),
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Perfil_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Perfil_GetAll]
  @Estado BIT = NULL,
  @Input VARCHAR(150) = NULL,
  @Combo varchar(1) = 'N',
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN

IF @Combo = 'N'
BEGIN
  SELECT [PerfilId]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
      ,[Codigo]
  FROM Perfil WITH(NOLOCK)
  WHERE (@Estado IS NULL OR Estado=@Estado)
  AND (@Input IS NULL OR (Descripcion like '%'+ @Input +'%' OR Codigo LIKE '%'+ @Input +'%'))
  ORDER BY PerfilId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*) 
  FROM Perfil WITH(NOLOCK)
  WHERE (@Estado IS NULL OR Estado=@Estado);
END
ELSE
BEGIN
SELECT [PerfilId]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
      ,[Codigo]
  FROM Perfil WITH(NOLOCK)
  WHERE Estado = 1
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Perfil_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Perfil_GetById]
  @PerfilId INT
AS
BEGIN
  SELECT [PerfilId]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
      ,[Codigo] 
  FROM Perfil 
  WHERE PerfilId=@PerfilId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Perfil_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Perfil_Insert]
  @Descripcion NVARCHAR(100),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25),
  @Codigo VARCHAR(10)
AS
BEGIN
  INSERT INTO Perfil (Descripcion, Estado, FechaCreacion, UsuarioCreacion, Codigo)
  VALUES (@Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion, @Codigo);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Perfil_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Perfil_Update]
  @PerfilId INT,
  @Descripcion NVARCHAR(100),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25),
  @Codigo VARCHAR(10)
AS
BEGIN
  UPDATE Perfil
  SET Descripcion=@Descripcion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion,
	  Codigo = @Codigo
  WHERE PerfilId=@PerfilId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Pregunta_Delete]
  @PreguntaId INT
AS
BEGIN
  DELETE FROM Pregunta WHERE PreguntaId=@PreguntaId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Pregunta_GetAll]
  @Categoria NVARCHAR(50) = NULL,
  @Activa BIT = NULL
AS
BEGIN
  SELECT *
  FROM Pregunta
  WHERE (@Categoria IS NULL OR Categoria=@Categoria)
    AND (@Activa IS NULL OR Activa=@Activa)
  ORDER BY Orden ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Pregunta_GetById]
  @PreguntaId INT
AS
BEGIN
  SELECT * FROM Pregunta WHERE PreguntaId=@PreguntaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Pregunta_Insert]
  @TextoPregunta NVARCHAR(500),
  @Categoria NVARCHAR(50) = NULL,
  @TipoRespuesta NVARCHAR(20),
  @Orden INT = 1,
  @Activa BIT = 1
AS
BEGIN
  INSERT INTO Pregunta (TextoPregunta, Categoria, TipoRespuesta, Orden, Activa)
  VALUES (@TextoPregunta, @Categoria, @TipoRespuesta, @Orden, @Activa);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Pregunta_Update]
  @PreguntaId INT,
  @TextoPregunta NVARCHAR(500),
  @Categoria NVARCHAR(50) = NULL,
  @TipoRespuesta NVARCHAR(20),
  @Orden INT = 1,
  @Activa BIT = 1
AS
BEGIN
  UPDATE Pregunta
  SET TextoPregunta=@TextoPregunta, Categoria=@Categoria, TipoRespuesta=@TipoRespuesta, Orden=@Orden, Activa=@Activa
  WHERE PreguntaId=@PreguntaId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RespuestasEncuesta_Delete]
  @RespuestaId INT
AS
BEGIN
  DELETE FROM RespuestasEncuesta WHERE RespuestaId=@RespuestaId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RespuestasEncuesta_GetAll]
  @EncuestaId INT = NULL,
  @PreguntaId INT = NULL
AS
BEGIN
  SELECT *
  FROM RespuestasEncuesta
  WHERE (@EncuestaId IS NULL OR EncuestaId=@EncuestaId)
    AND (@PreguntaId IS NULL OR PreguntaId=@PreguntaId)
  ORDER BY FechaRegistro DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RespuestasEncuesta_GetById]
  @RespuestaId INT
AS
BEGIN
  SELECT * FROM RespuestasEncuesta WHERE RespuestaId=@RespuestaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RespuestasEncuesta_Insert]
  @EncuestaId INT,
  @PreguntaId INT,
  @RespuestaTexto NVARCHAR(MAX) = NULL,
  @ValorNumerico INT = NULL
AS
BEGIN
  INSERT INTO RespuestasEncuesta (EncuestaId, PreguntaId, RespuestaTexto, ValorNumerico, FechaRegistro)
  VALUES (@EncuestaId, @PreguntaId, @RespuestaTexto, @ValorNumerico, GETDATE());
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RespuestasEncuesta_Update]
  @RespuestaId INT,
  @RespuestaTexto NVARCHAR(MAX) = NULL,
  @ValorNumerico INT = NULL
AS
BEGIN
  UPDATE RespuestasEncuesta
  SET RespuestaTexto=@RespuestaTexto, ValorNumerico=@ValorNumerico
  WHERE RespuestaId=@RespuestaId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Rol_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Rol_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Rol_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Rol_GetAll]
  @Estado BIT = NULL,
  @Input VARCHAR(150) = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT [RolId]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
	  ,[Codigo]
  FROM Rol WITH(NOLOCK)
  WHERE (@Estado IS NULL OR Estado=@Estado)
  ORDER BY RolId
  OFFSET (@PageNumber-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Rol WITH(NOLOCK)
  WHERE (@Estado IS NULL OR Estado=@Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Rol_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Rol_GetById]
  @RolId INT
AS
BEGIN
  SELECT [RolId]
      ,[Descripcion]
      ,[Estado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
      ,[FechaModificacion]
      ,[UsuarioModificacion]
	  ,[Codigo] 
  FROM Rol WITH(NOLOCK)
  WHERE RolId=@RolId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Rol_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Rol_Insert]
  @Descripcion NVARCHAR(100),
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25),
  @Codigo VARCHAR(10)
AS
BEGIN
  INSERT INTO Rol (Descripcion, Estado, FechaCreacion, UsuarioCreacion, Codigo)
  VALUES (@Descripcion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion, @Codigo);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Rol_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Rol_Update]
  @RolId INT,
  @Descripcion NVARCHAR(100),
  @Estado BIT,
  @UsuarioModificacion VARCHAR(25),
  @Codigo VARCHAR(10)
AS
BEGIN
  UPDATE Rol
  SET Descripcion=@Descripcion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion, Codigo = @Codigo
  WHERE RolId=@RolId;
  SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLogin_InsertUpdate]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_UserLogin_InsertUpdate]
  @Id INT = 0,
  @PerfilId INT = 0,
  @UserId INT = 0,
  @FechaUltLogin DATETIME,
  @UsuarioCreacion VARCHAR(25)
AS
BEGIN
  
  IF EXISTS(SELECT 1 FROM DBO.[UserLogin] WHERE PerfilId = @PerfilId and UserId = @UserId)
  BEGIN
	UPDATE DBO.[UserLogin]
	SET FechaUltLogin = @FechaUltLogin,
	UsuarioModificacion = @UsuarioCreacion,
	FechaModificacion = GETDATE()
	WHERE PerfilId = @PerfilId and UserId = @UserId
  END
  ELSE
  BEGIN
	 INSERT INTO [UserLogin] (PerfilId, UserId, FechaUltLogin, Estado, FechaCreacion, UsuarioCreacion)
	  VALUES (@PerfilId, @UserId, @FechaUltLogin, 1, GetDate(), @UsuarioCreacion);
  END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Delete]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Usuario_Delete]
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_GetAll]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Usuario_GetAll]
  @PerfilId INT = NULL,
  @Identificacion VARCHAR(13) = NULL,
  @Input VARCHAR(150) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
AS
BEGIN
  SELECT [UsuarioId]
      ,usu.[PerfilId]
      ,[Nombres]
      ,[Apellidos]
      ,[Identificacion]
      ,[Edad]
      ,[Usuario] AS UsuarioLogin
      ,[Email]
      ,[Telefono]
      ,[Celular]
      ,[Direccion]
      ,usu.[Estado]
      ,usu.[FechaCreacion]
      ,usu.[UsuarioCreacion]
      ,usu.[FechaModificacion]
      ,usu.[UsuarioModificacion]
	  ,per.Descripcion AS DescPerfil
  FROM Usuario usu WITH(NOLOCK)
  INNER JOIN Perfil per on usu.PerfilId = per.PerfilId
  WHERE (@PerfilId IS NULL OR usu.PerfilId=@PerfilId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR usu.Estado=@Estado)
  ORDER BY UsuarioId
  OFFSET (@PageNumber - 1) * @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY;

  SELECT COUNT(*)
  FROM Usuario WITH(NOLOCK)
  WHERE (@PerfilId IS NULL OR PerfilId=@PerfilId)
    AND (@Identificacion IS NULL OR Identificacion=@Identificacion)
    AND (@Estado IS NULL OR Estado=@Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_GetById]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Usuario_GetById]
  @UsuarioId INT
AS
BEGIN
  SELECT [UsuarioId]
      ,usu.[PerfilId]
      ,[Nombres]
      ,[Apellidos]
      ,[Identificacion]
      ,[Edad]
      ,[Usuario] AS UsuarioLogin
      ,[Email]
      ,[Telefono]
      ,[Celular]
      ,[Direccion]
      ,usu.[Estado]
      ,usu.[FechaCreacion]
      ,usu.[UsuarioCreacion]
      ,usu.[FechaModificacion]
      ,usu.[UsuarioModificacion]
	  ,per.Descripcion AS DescPerfil
  FROM Usuario usu WITH(NOLOCK)
  INNER JOIN Perfil per on usu.PerfilId = per.PerfilId
  WHERE UsuarioId=@UsuarioId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_GetByUser]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Usuario_GetByUser]
  @Usuario VARCHAR(50)
AS
BEGIN
  SELECT [UsuarioId]
      ,[Usuario] AS UsuarioLogin
  FROM Usuario usu WITH(NOLOCK)
  WHERE usu.Usuario = @Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Insert]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Usuario_Insert]
  @PerfilId INT = 0,
  @Nombres NVARCHAR(100),
  @Apellidos NVARCHAR(100),
  @Identificacion VARCHAR(13),
  @Edad INT,
  @UsuarioLogin NVARCHAR(100), -- property name
  @Email NVARCHAR(100) = NULL,
  @Telefono NVARCHAR(20) = NULL,
  @Celular NVARCHAR(20) = NULL,
  @Direccion NVARCHAR(150) = NULL,
  @Estado BIT = 1,
  @UsuarioCreacion VARCHAR(25),
  @CodPerfil varchar(10) = ''
AS
BEGIN
  IF @PerfilId = 0 OR ISNULL(@PerfilId, '') = ''
  BEGIN
	SET @PerfilId = (SELECT PerfilId FROM Perfil WHERE CODIGO = @CodPerfil)
  END

  INSERT INTO Usuario (PerfilId, Nombres, Apellidos, Identificacion, Edad, Usuario, Email, Telefono, Celular, Direccion, Estado, FechaCreacion, UsuarioCreacion)
  VALUES (@PerfilId, @Nombres, @Apellidos, @Identificacion, @Edad, @UsuarioLogin, @Email, @Telefono, @Celular, @Direccion, ISNULL(@Estado,1), GETDATE(), @UsuarioCreacion);
  SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Update]    Script Date: 4/1/2026 1:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_Usuario_Update]
  @UsuarioId INT,
  @PerfilId INT = 0,
  @Nombres NVARCHAR(100) = null,
  @Apellidos NVARCHAR(100) = null,
  @Identificacion VARCHAR(13) = null,
  @Edad INT = 0,
  @UsuarioLogin NVARCHAR(100) = null,
  @Email NVARCHAR(100) = NULL,
  @Telefono NVARCHAR(20) = NULL,
  @Celular NVARCHAR(20) = NULL,
  @Direccion NVARCHAR(150) = NULL,
  @Estado BIT = 1,
  @UsuarioModificacion VARCHAR(25) = null
AS
BEGIN
  UPDATE Usuario
  SET PerfilId=@PerfilId, Nombres=@Nombres, Apellidos=@Apellidos, Identificacion=@Identificacion, Edad=@Edad,
      Usuario=@UsuarioLogin, Email=@Email, Telefono=@Telefono, Celular=@Celular, Direccion=@Direccion, Estado=@Estado,
      FechaModificacion=GETDATE(), UsuarioModificacion=@UsuarioModificacion
  WHERE UsuarioId=@UsuarioId;
  SELECT @@ROWCOUNT;
END
GO
