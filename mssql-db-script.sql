/****** Object:  Table [dbo].[Address]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Unit] [varchar](50) NOT NULL,
	[BuildingBlock] [varchar](500) NULL,
	[Street] [varchar](500) NULL,
	[Postal] [varchar](50) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderedQuantity] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Description] [varchar](5000) NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 1/1/2022 6:20:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0dc7e80e-3006-4795-870e-8d6b79a5a731', N'User', N'USER', N'9c388ebf-ce97-4c7f-802f-b9c4d1a1cee4')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f174633e-4b98-4bb3-b96b-b9532dce2971', N'Admin', N'ADMIN', N'5e79c8ae-0ddc-4743-9d73-a17334552ff4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f4ecdfcd-51c6-41a4-9f9b-bf470ddc2606', N'f174633e-4b98-4bb3-b96b-b9532dce2971')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bfa3c76a-55b6-49e9-9f98-f293e171fdaa', N'user', N'USER', N'test@example.com', N'USER@RMALL.COM', 0, N'AQAAAAEAACcQAAAAEP6E+WjpTEhNFWGZqNzLlYgJHhOIDCAWZzjKNW6b2tmcb2ohwDlT/VOAahebBkCGYg==', N'SCXM753NIV4AI2VQ4FPAY76XOY6CKFNI', N'73fbbe5f-4bf8-4e51-82b2-5188d010d41e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f4ecdfcd-51c6-41a4-9f9b-bf470ddc2606', N'admin', N'ADMIN', N'admin@rmall.com', N'ADMIN@RMALL.COM', 0, N'AQAAAAEAACcQAAAAELL8MajAQIpd2Yk2tXCk8s6h0xsbkE5LHY4rBgXxAbd4ti/vDwq1s9M1Cwn23889Iw==', N'ZSFVWM5HNXUDKDKPGO5NVRVUG463ITT4', N'51f4d97e-d9e4-4b50-b8ef-5b78bb1fe67b', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[CartItem] ON 

INSERT [dbo].[CartItem] ([Id], [OrderedQuantity], [ProductId], [UserId]) VALUES (2, 5, 1, N'bfa3c76a-55b6-49e9-9f98-f293e171fdaa')
INSERT [dbo].[CartItem] ([Id], [OrderedQuantity], [ProductId], [UserId]) VALUES (20, 4, 2, N'f4ecdfcd-51c6-41a4-9f9b-bf470ddc2606')
INSERT [dbo].[CartItem] ([Id], [OrderedQuantity], [ProductId], [UserId]) VALUES (21, 2, 1, N'f4ecdfcd-51c6-41a4-9f9b-bf470ddc2606')
INSERT [dbo].[CartItem] ([Id], [OrderedQuantity], [ProductId], [UserId]) VALUES (22, 1, 11, N'bfa3c76a-55b6-49e9-9f98-f293e171fdaa')
SET IDENTITY_INSERT [dbo].[CartItem] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (1, N'
The Alchemist', N'The inspiring spiritual tale of self-discovery that has touched millions of lives around the world. Combining magic, mysticism, wisdom and wonder, The Alchemist has become a modern classic, selling millions of copies around the world and transforming the lives of countless readers across generations. Paulo Coelho''s masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure. His quest will lead him to riches far different--and far more satisfying--than he ever imagined. Santiago''s journey teaches us about the essential wisdom of listening to our hearts, of recognizing opportunity and learning to read the omens strewn along life''s path, and, most importantly, to follow our dreams', 15.3700)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (2, N'All the Light We Cannot See', N'National Book Award Finalist From the highly acclaimed, multiple award-winning Anthony Doerr, the beautiful, stunningly ambitious instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World War II. Marie-Laure lives with her father in Paris near the Museum of Natural History, where he works as the master of its thousands of locks. When she is six, Marie-Laure goes blind and her father builds a perfect miniature of their neighborhood so she can memorize it by touch and navigate her way home. When she is twelve, the Nazis occupy Paris and father and daughter flee to the walled citadel of Saint-Malo, where Marie-Laures reclusive great-uncle lives in a tall house by the sea. With them they carry what might be the museums most valuable and dangerous jewel. In a mining town in Germany, the orphan Werner grows up with his younger sister, enchanted by a crude radio they find. Werner becomes an expert at building and fixing these crucial new instruments, a talent that wins him a place at a brutal academy for Hitler Youth, then a special assignment to track the resistance. More and more aware of the human cost of his intelligence, Werner travels through the heart of the war and, finally, into Saint-Malo, where his story and Marie-Laures converge. Doerrs stunning sense of physical detail and gorgeous metaphors (San Francisco Chronicle) are dazzling. Deftly interweaving the lives of Marie-Laure and Werner, he illuminates the ways, against all odds, people try to be good to one another.', 41.8700)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (3, N'Best Friends', N'Shannon knows sixth grade is going to be a perfect year. She''s got a spot in the in-crowd called The Group, and her best friend is their leader Jen, the most popular girl in school.But the rules are always changing, and Shannon has to scramble to keep up. She never knows which TV shows are cool, what songs to listen to, and, most importantly, which boys you''re allowed to talk to. Who makes these rules anyway? And does Shannon have to follow them to stay friends with The Group?Less

', 20.1200)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (6, N'It Ends with Us: A Novel', N'Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town in Maine where she grew up she graduated from college, moved to Boston, and started her own business. So when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life suddenly seems almost too good to be true. Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head.', 22.5600)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (7, N'The Fault in Our Stars', N'About the BookOne of the most popular young adult fiction books to read is The Fault in Our Stars by John Green. It is a poignant story that deals with the lives of two cancer-stricken teenagers. Hazel is a 16-year-old girl who has been diagnosed with thyroid cancer. She is sent to a cancer support society to cope with her illness where she meets Augustus Waters, a fellow cancer survivor. They share a love that takes them through an unforgettable journey which forms the crux of the story. It is one of the best young adult fiction books which makes it a must-read for the young bibliophiles. Buy The Fault in Our Stars book online and connect with the protagonists in a very intense and emotional way. About John Green John Green is a New York Times bestselling author of popular young adult fiction books such as The Fault in Our Stars, Looking for Alaska, Paper Towns and many more critically acclaimed books. He has won the 2006 Printz award for his debut novel, Looking for Alaska. He was also selected as by TIME magazine as one of the 100 Most Influential People in the World.', 8.5900)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (8, N'They Both Die At The End', N'A love story with a difference - an unforgettable tale of life loss and making each day count in the NO. 1 BESTSELLING book of TIKTOK fame by Adam Silvera. On September 5th a little after midnight Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: they''re going to die today. Mateo and Rufus are total strangers but for different reasons they''re both looking to make a new friend on their End Day. The good news: there''s an app for that. It''s called the Last Friend and through it Rufus and Mateo are about to meet up for one last great adventure - to live a lifetime in a single day.', 13.9500)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (10, N'The Book of Why', N'A pioneer of artificial intelligence shows how the study of causality revolutionized science and the world. ''Correlation does not imply causation.'' This mantra was invoked by scientists for decades in order to avoid taking positions as to whether one thing caused another, such as smoking and cancer and carbon dioxide and global warming. But today, that taboo is dead. The causal revolution, sparked by world-renowned computer scientist Judea Pearl and his colleagues, has cut through a century of confusion and placed cause and effect on a firm scientific basis. Now, Pearl and science journalist Dana Mackenzie explain causal thinking to general readers for the first time, showing how it allows us to explore the world that is and the worlds that could have been. It is the essence of human and artificial intelligence. About the Authors Judea Pearl is a world-renowned Israeli-American computer scientist and philosopher, known for his world-leading work in AI and the development of Bayesian networks, as well as his theory of causal and counterfactual inference. In 2011, he won the most prestigious award in computer science, the Alan Turing Award. He has also received the Rumelhart Prize (Cognitive Science Society), the Benjamin Franklin Medal (Franklin Institute) and the Lakatos Award (London School of Economics), and he is the founder and president of the Daniel Pearl Foundation. Dana Mackenzie, a Ph.D. mathematician turned science writer, has written for such magazines as Science, New Scientist, and Discover.', 16.9500)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (11, N'Surrounded by Idiots', N'You are not alone. Originally published in Swedish in 2014 as Omgiven Av Idioter, Erikon’s Surrounded by Idiots is already an international phenomenon, selling over 1.5 million copies worldwide, of which over 750,000 copies have been sold in Sweden alone. Erikson will help you understand yourself better, hone communication and social skills, handle conflict with confidence, improve dynamics with your boss and team, and get the best out of the people you deal with and manage. He also shares simple tricks on body language, improving written communication and advice on when to back away or when to push on, and when to speak up or indeed shut up. Packed with ‘aha!’ and ‘oh no!’ moments, Surrounded by Idiots will help you understand and influence those around you, even people you currently think are beyond all comprehension. And with a bit of luck you can also be confident that the idiot out there isn’t you!', 16.6000)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price]) VALUES (12, N'Red White Royal Blue', N'When his mother became President, Alex Claremont-Diaz was promptly cast as the American equivalent of a young royal. Handsome, charismatic, genius-his image is pure millennial-marketing gold for the White House.

', 22.9300)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductInventory] ON 

INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (1, 1, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (2, 2, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (3, 3, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (4, 6, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (5, 7, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (6, 8, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (7, 10, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (8, 11, 99)
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [Quantity]) VALUES (9, 12, 99)
SET IDENTITY_INSERT [dbo].[ProductInventory] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_AspNetUsers]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Product]
GO
