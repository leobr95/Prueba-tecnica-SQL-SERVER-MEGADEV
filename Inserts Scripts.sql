USE [BooksdbAPIMegaDev]
GO
SET IDENTITY_INSERT [dbo].[Editoriales] ON 
GO
INSERT [dbo].[Editoriales] ([EditorialId], [Nombre]) VALUES (1, N'Santillana')
GO
INSERT [dbo].[Editoriales] ([EditorialId], [Nombre]) VALUES (2, N'Del Norte')
GO
SET IDENTITY_INSERT [dbo].[Editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[Libros] ON 
GO
INSERT [dbo].[Libros] ([LibroId], [Titulo], [Fecha], [Costo], [PrecioSugerido], [Autor], [EditorialId]) VALUES (2, N'Sr. de los Anillos', CAST(N'1996-10-15' AS Date), 65000, 70000, N'Jr Tokien', 1)
GO
INSERT [dbo].[Libros] ([LibroId], [Titulo], [Fecha], [Costo], [PrecioSugerido], [Autor], [EditorialId]) VALUES (3, N'Biografia', CAST(N'1996-10-15' AS Date), 60000, 75000, N'Carlos Angarita', 2)
GO
SET IDENTITY_INSERT [dbo].[Libros] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 
GO
INSERT [dbo].[Empleados] ([EmpleadoId], [Nombres], [Apellidos], [Direccion], [TelefonoFijo], [Celular], [Cargo]) VALUES (1, N'Leonardo Burbano', N'Burbano Apraez', N'Calle78D', 6930239, 31526582, N'Desarrollador')
GO
INSERT [dbo].[Empleados] ([EmpleadoId], [Nombres], [Apellidos], [Direccion], [TelefonoFijo], [Celular], [Cargo]) VALUES (2, N'Carlos', N'Perez', N'Calle 40D', 5240239, 32048573, N'Desarrollador')
GO
INSERT [dbo].[Empleados] ([EmpleadoId], [Nombres], [Apellidos], [Direccion], [TelefonoFijo], [Celular], [Cargo]) VALUES (3, N'Juan', N'Diaz', N'Calle1', 342343, 310523423, N'Desarrollador')
GO
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([ClienteId], [Identificacion], [Nombres], [Apellidos], [DireccionEnvio], [TelefonoFijo], [Celular], [Email]) VALUES (1, 11441845, N'Leonardo David', N'Burbano Apraez', N'Calle 78D', 3930187, 317682018, N'br.david@gmail.com')
GO
INSERT [dbo].[Clientes] ([ClienteId], [Identificacion], [Nombres], [Apellidos], [DireccionEnvio], [TelefonoFijo], [Celular], [Email]) VALUES (2, 11453243, N'Mauricio', N'Martin', N'Calle 24T', 4323423, 31523423, N'mau@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (1, 2, 1, CAST(N'2021-11-24' AS Date), 65000, 1)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (2, 2, 1, CAST(N'2021-11-23' AS Date), 60000, 1)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (3, 3, 1, CAST(N'2020-10-23' AS Date), 60000, 1)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (4, 3, 2, CAST(N'2019-11-24' AS Date), 55000, 2)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (5, 3, 2, CAST(N'2019-11-23' AS Date), 40000, 2)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (6, 3, 1, CAST(N'2019-11-24' AS Date), 40000, 1)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (7, 2, 1, CAST(N'2019-11-24' AS Date), 60000, 1)
GO
INSERT [dbo].[Compras] ([CompraLibroId], [LibroId], [ClienteId], [Fecha], [Valor], [EmpleadoId]) VALUES (8, 2, 2, CAST(N'2019-11-24' AS Date), 60000, 1)
GO
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
