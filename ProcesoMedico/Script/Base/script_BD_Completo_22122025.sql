USE [ProcesoMedico]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Catalogo]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Cita]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Encuesta]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Especialidad]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Feriado]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Fidelizacion]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Historico]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[HorarioMedico]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Medico]    Script Date: 22/12/2025 21:32:00 ******/
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
PRIMARY KEY CLUSTERED 
(
	[MedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 22/12/2025 21:32:00 ******/
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
	[Clave] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[PacienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Perfil]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[RespuestasEncuesta]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 22/12/2025 21:32:00 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/12/2025 21:32:00 ******/
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
PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catalogo] ON 
GO
INSERT [dbo].[Catalogo] ([CatalogoId], [Tipo], [Codigo], [Descripcion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, N'EST_CITA', N'PEN', N'PEDNI', 1, CAST(N'2025-11-11T14:12:35.750' AS DateTime), N'admin', CAST(N'2025-11-11T14:41:32.203' AS DateTime), N'Admin')
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
SET IDENTITY_INSERT [dbo].[Catalogo] OFF
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
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (20, 3, 5, 31, 1, CAST(N'2025-12-21T13:59:08.210' AS DateTime), N'ADMIN', NULL, NULL, 12, 2025, N'3', 31, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (21, 3, 1, 1, 1, CAST(N'2025-12-21T14:00:08.043' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'4', 1, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (22, 3, 3, 2, 1, CAST(N'2025-12-21T14:00:38.423' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'5', 2, 1, 2026)
GO
INSERT [dbo].[HorarioMedico] ([HoraMedicoId], [MedicoId], [HorarioId], [DiaInicio], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [MesInicio], [AnioInicio], [SecuenciaDia], [DiaFin], [MesFin], [AnioFin]) VALUES (23, 3, 1, 3, 1, CAST(N'2025-12-21T14:01:48.750' AS DateTime), N'ADMIN', NULL, NULL, 1, 2026, N'6', 3, 1, 2026)
GO
SET IDENTITY_INSERT [dbo].[HorarioMedico] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, 11, 2, N'Steven', N'Cardenas', N'0909090909', 36, N'scardenas', N'scardenas@gmail.com', N'2867565', N'0987878787', N'Acuarela del rio', 1, CAST(N'2025-12-09T23:36:57.180' AS DateTime), N'admin', CAST(N'2025-12-11T00:43:25.723' AS DateTime), N'admin')
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, 7, 2, N'Andrea', N'Sanchez', N'0978676767', 36, N'asanchez', N'ing.scardenasortiz@gmail.com', N'2756565', N'0990998980', N'Alborada 3ra etapa', 1, CAST(N'2025-12-11T02:39:05.407' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Medico] ([MedicoId], [EspecialidadId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, 1, 2, N'Erick', N'Cardenas', N'0978654535', 32, N'eocsanchez', N'ing.scardenasortiz@gmail.com', N'2653453', N'0908997767', N'Acuarela del rio', 1, CAST(N'2025-12-21T13:53:45.300' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (6, 1, N'Erick', N'Lino', N'0912232134', 28, N'erick_lino', N'erick_lino@gmail.com', NULL, N'0909090909', N'Sauces 9', 1, CAST(N'2025-11-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2025-12-07T00:35:31.957' AS DateTime), N'admin', NULL)
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (8, 1, N'Erick Omar', N'Sanchez Barahona', N'0923445667', 18, N'erick_3645', N'ing.scardenasortiz@gmail.com', N'3542635', N'0983756546', N'Acuarela Del Río Mz 1180, av. velasco parra', 1, CAST(N'2025-12-06T23:08:57.933' AS DateTime), N'admin', CAST(N'2025-12-07T00:34:41.037' AS DateTime), N'admin', NULL)
GO
INSERT [dbo].[Paciente] ([PacienteId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Clave]) VALUES (9, 1, N'Erick Ezequiel', N'Sanchez Cardenas', N'0923445667', 18, N'erick_3gyh', N'ing.scardenasortiz@gmail.com', N'3542635', N'0983756546', N'Acuarela Del Río Mz 1180', 1, CAST(N'2025-12-06T23:22:41.920' AS DateTime), N'admin', NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([UsuarioId], [PerfilId], [Nombres], [Apellidos], [Identificacion], [Edad], [Usuario], [Email], [Telefono], [Celular], [Direccion], [Estado], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, 3, N'Vanessa', N'Aguas', N'0909090987', 28, N'vane_aguas', N'vane@gmail.com', N'2654534', N'0908786765', N'Sacues 9 principal', 1, CAST(N'2025-12-08T14:37:15.973' AS DateTime), N'admin', CAST(N'2025-12-08T14:43:48.440' AS DateTime), N'admin')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Encuesta__748387389D2CB4EA]    Script Date: 22/12/2025 21:32:01 ******/
ALTER TABLE [dbo].[Encuesta] ADD UNIQUE NONCLUSTERED 
(
	[CodigoAcceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Encuesta_Estado]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Encuesta_Estado] ON [dbo].[Encuesta]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Encuesta_Medico]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Encuesta_Medico] ON [dbo].[Encuesta]
(
	[MedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Encuesta_Paciente]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Encuesta_Paciente] ON [dbo].[Encuesta]
(
	[PacienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medico_Especialida]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Medico_Especialida] ON [dbo].[Especialidad]
(
	[EspecialidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Estado]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [Idx_Estado] ON [dbo].[HorarioMedico]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Medico_Estado]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [Idx_Medico_Estado] ON [dbo].[HorarioMedico]
(
	[MedicoId] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medico_Estado]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Medico_Estado] ON [dbo].[Medico]
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Paciente_Estado]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Paciente_Estado] ON [dbo].[Paciente]
(
	[Nombres] ASC,
	[Apellidos] ASC,
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usuario_Estado]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_Estado] ON [dbo].[Paciente]
(
	[PerfilId] ASC,
	[Identificacion] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medico_Perfil]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Medico_Perfil] ON [dbo].[Perfil]
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Paciente_Perfil]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Paciente_Perfil] ON [dbo].[Perfil]
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuario_Perfil]    Script Date: 22/12/2025 21:32:01 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_Perfil] ON [dbo].[Perfil]
(
	[PerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RespuestasEncuesta_Encuesta]    Script Date: 22/12/2025 21:32:01 ******/
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
ALTER TABLE [dbo].[Paciente] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Paciente] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Asignacion_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Catalogo_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_GetAll]
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_Insert]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_Insert]
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
/****** Object:  StoredProcedure [dbo].[sp_Cita_Update]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Cita_Update]
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
/****** Object:  StoredProcedure [dbo].[sp_DashBoard_SeccionOne]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DatosCache_Parametros]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Encuesta_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Especialidad_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Fidelizacion_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GenerarHorariosMedicos]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_GenerarHorariosMedicos @MedicoId = 35
CREATE   PROCEDURE [dbo].[sp_GenerarHorariosMedicos](
@MedicoId BIGINT = 0,
@EspecialidadId BIGINT = 0
)
AS
BEGIN
    SET NOCOUNT ON;

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
    Hora = DATEADD(MINUTE, n.N * 30, h.FechaInicio),

    h.FechaInicio,
    h.FechaFin,
	h.HorarioId
FROM #TempRangosMedico h
JOIN Numeros n
    ON DATEADD(MINUTE, n.N * 30, h.FechaInicio) <= h.FechaFin
ORDER BY
    h.MedicoId,
	H.HoraMedicoId,
	h.FechaInicio,
    Hora;

SELECT IdRango,MedicoId,
    Nombre,
	Hora,
	FechaInicio,
	FechaFin,
	HorarioId
FROM #TempRangos
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Historico_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Historico_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Historico_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Medico_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Medico_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Medico_GetAll]
  @EspecialidadId INT = NULL,
  @Identificacion NVARCHAR(15) = NULL,
  @Input VARCHAR(150) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Medico_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Medico_GetByUser]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Medico_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Medico_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Paciente_GetAll]
  @PerfilId INT = NULL,
  @Identificacion NVARCHAR(15) = NULL,
  @Estado BIT = NULL,
  @Input VARCHAR(150) = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Paciente_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_GetByUser]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Login]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Paciente_Login]
  @Email NVARCHAR(50) = NULL,
  @Clave NVARCHAR(50) = NULL
AS
BEGIN
  SELECT Nombres,Apellidos,Identificacion,Edad,Usuario AS UsuarioNombre
  FROM DBO.Paciente
  WHERE Email = @Email AND Clave = @Clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Paciente_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Parametros_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Parametros_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Parametros_GetAll]
  @Tipo NVARCHAR(50) = NULL,
  @Codigo NVARCHAR(50) = NULL,
  @Input NVARCHAR(150) = NULL,
  @Estado BIT = NULL,
  @PageNumber INT = 1,
  @PageSize INT = 10
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Parametros_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Parametros_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Parametros_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Perfil_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Pregunta_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RespuestasEncuesta_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rol_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rol_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rol_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rol_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rol_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Delete]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_GetAll]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_GetById]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_GetByUser]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Insert]    Script Date: 22/12/2025 21:32:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Update]    Script Date: 22/12/2025 21:32:01 ******/
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
