USE [master]
GO
/****** Object:  Database [thuedi]    Script Date: 2/11/2022 11:46:06 PM ******/
CREATE DATABASE [thuedi]
 
ALTER DATABASE [thuedi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [thuedi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [thuedi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [thuedi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [thuedi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [thuedi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [thuedi] SET ARITHABORT OFF 
GO
ALTER DATABASE [thuedi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [thuedi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [thuedi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [thuedi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [thuedi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [thuedi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [thuedi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [thuedi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [thuedi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [thuedi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [thuedi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [thuedi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [thuedi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [thuedi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [thuedi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [thuedi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [thuedi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [thuedi] SET RECOVERY FULL 
GO
ALTER DATABASE [thuedi] SET  MULTI_USER 
GO
ALTER DATABASE [thuedi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [thuedi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [thuedi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [thuedi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [thuedi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [thuedi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'thuedi', N'ON'
GO
ALTER DATABASE [thuedi] SET QUERY_STORE = OFF
GO
USE [thuedi]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Post_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
 CONSTRAINT [PK_BOOKMARK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Area_review] [nvarchar](max) NULL,
	[Image_URL] [nvarchar](max) NULL,
 CONSTRAINT [PK_DISTRICT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NOT NULL,
	[Create_date] [datetime] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Area] [float] NOT NULL,
	[Number_of_bedrooms] [int] NOT NULL,
	[Number_of_restrooms] [int] NOT NULL,
	[Direction] [nvarchar](255) NOT NULL,
	[Address] [int] NOT NULL,
	[Address_detail] [nvarchar](255) NOT NULL,
	[Property_type_id] [int] NOT NULL,
 CONSTRAINT [PK_POST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_comment]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Post_id] [int] NOT NULL,
	[Comment] [varchar](255) NOT NULL,
	[User_id] [int] NOT NULL,
 CONSTRAINT [PK_POST_COMMENT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_image]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_image](
	[Post_id] [int] NOT NULL,
	[Image_link] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_report]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Post_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[Detail] [varchar](255) NOT NULL,
 CONSTRAINT [PK_POST_REPORT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property_type]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PROPERTY_TYPE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub_district]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_district](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[District_id] [int] NOT NULL,
	[Area_review] [nvarchar](255) NULL,
 CONSTRAINT [PK_SUB_DISTRICT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Role_id] [int] NOT NULL,
	[Create_date] [datetime] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_detail]    Script Date: 2/11/2022 11:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_detail](
	[User_Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [varchar](255) NULL,
	[Image_link] [varchar](255) NULL,
	[Personal_id] [varchar](255) NULL,
	[Contacts] [nvarchar](255) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (1, N'Hoàng Mai', N'Quận Hoàng Mai nằm ở phía Đông Nam Hà Nội, phía Bắc giáp quận Thanh Xuân, Hai Bà Trưng, phía Tây và Nam giáp huyện Thanh Trì, phía Đông giáp sông Hồng-quận Long Biên. Trải rộng từ Đông sang Tây, được chia làm 3 phần tương đối đều nhau bởi đường Giải Phóng, Tam Trinh (theo trục Bắc-Nam). Đơn vị hành chính gồm 14 phường trên cơ sở hợp nhất 9 xã thuộc huyện Thanh Trì và 5 phường của quận Hai Bà Trưng: Hoàng Liệt, Yên Sở, Vĩnh Hưng, Định Công, Đại Kim, Thịnh Liệt, Thanh Trì, Lĩnh Nam, Trần Phú, Mai Động, Tương Mai, Tân Mai, Giáp Bát, Hoàng Văn Thụ. Hoàng Mai vốn trước là vùng đất thuộc huyện Thanh Trì. Vùng Hoàng Mai có tên Nôm là Kẻ Mơ và tên chữ là Cổ Mai, vì mai là tiếng Hán của mơ, do trước kia nơi đây người dân sinh sống chủ yếu bằng trồng cây mai. Quận Hoàng Mai có nhiều làng nghề ẩm thực như làng nghề bánh cuốn Thanh Trì (phường Thanh Trì) là món ăn quen thuộc với người dân không chỉ bởi nó đã có từ lâu mà hương vị rất đậm đà, mang đậm nét truyền thống trong nền ẩm thực Hà Thành; rượu Hoàng Mai, làng bún Tứ Kỳ, bún ốc Pháp Vân (phường Hoàng Liệt), đậu phụ Mơ (phường Mai Động). Ngoài ra, phường Vĩnh Hưng và phường Lĩnh Nam có nghề trồng hoa, rau sạch; phường Yên Sở có làng cá Yên Sở.', N'https://cloud.mogi.vn/review/thumb-medium/districts/289.jpg')
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (2, N'Long Biên', N'Quận Long Biên là quận duy nhất nằm ở tả ngạn sông Hồng, được bao bọc bởi hai bờ đê sông Hồng và Sông Đuống, đồng thời là quận có diện tích lớn nhất của thủ đô Hà Nội với hơn 60km². Quận Long Biên nằm ở phía đông bắc thành phố Hà Nội. Phía đông của quận và phía nam giáp Gia Lâm. Phía tây giáp các quận Tây Hồ, Ba Đình, Hoàn Kiếm, Hai Bà Trưng với ranh giới tự nhiên là sông Hồng. Phía tây nam giáp quận Hoàng Mai với ranh giới là sông Hồng. Phía bắc giáp huyện Đông Anh với ranh giới là sông Đuống. Quận Long Biên có 14 đơn vị hành chính cấp xã trực thuộc, bao gồm 14 phường: Bồ Đề, Cự Khối, Đức Giang, Gia Thụy, Giang Biên, Long Biên, Ngọc Lâm, Ngọc Thụy, Phúc Đồng, Phúc Lợi, Sài Đồng, Thạch Bàn, Thượng Thanh, Việt Hưng. Đây là quận có vị trí chiến lược rất quan trọng về chính trị, kinh tế, văn hoá xã hội của Hà Nội .Được xây dựng với các tuyến đường giao thông quan trọng như đường sắt, đường bộ, đường thuỷ, đường không nối liền với các tỉnh phía bắc, đông bắc như Bắc Ninh, Bắc Giang, Hải Dương kết nốt Hải Phòng và Quảng Ninh; có sân bay Gia Lâm, khu vực quân sự, nhiều khu công nghiệp liên doanh với nước ngoài như: khu công nghiệp kỹ thuật cao Sài Đồng B, khu công nghiệp Sài Đồng A, nhiều công trình kinh tế, văn hoá, khoa học kỹ thuật, cơ quan nhà máy, đơn vị sản xuất kinh doanh của Trung ương, Thành phố và địa phương. Đặc biệt với lợi thế vị trí cửa ngõ của Hà Nội, nối liền với trục tam giác kinh tế Hà Nội- Hải Phòng- Quảng Ninh, đồng thời cũng là trục kinh tế sôi động hội nhập nền kinh tế trong khu vực và thế giới. Đó là những yếu tố cơ bản thuận lợi cho quận Long Biên phát triển nhanh, mạnh và bền vững về kinh tế- xã hội. Một mảnh đất an cư khá ổn định về mặt địa lý và phù hợp với giá cả.', N'https://cloud.mogi.vn/review/thumb-medium/districts/295.jpg')
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (3, N'Ba Đình', N'Một trong những quận trung tâm nhất của Hà Nội không thể bỏ qua quận Ba Đình, mang tên một trận đánh lớn đã đi vào lịch sử Việt Nam nay là một phần cốt lõi của thủ đô. Là Trung tâm hành chính – chính trị quốc gia, là cầu nối với các quận vệ tinh liền kề như Tây Hồ, Long Biên, Đống Đa, Hoàn Kiếm.', N'https://cloud.mogi.vn/review/thumb-medium/districts/290.jpg')
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (4, N'Đống Đa', N'Quận Đống Đa sôi động ngập tràn các quầy thực phẩm và quán ăn nhỏ phục vụ bún phở mì và gỏi xoài cay, cũng như quán lẩu ấm cúng và nhà hàng Việt Nam cao cấp. Khu vực cũng thu hút bao bước chân tìm đến Văn Miếu - Quốc Tử Giám, một khu phức hợp Nho giáo thế kỷ 11 gây ấn tượng với các gian nhà và pho tượng. Các cửa hàng thời trang nhỏ nằm cạnh các cửa hàng quần áo bình dân, trong khi khung cảnh cuộc sống về đêm bao trọn các quán bar phục vụ bia và quán karaoke.', N'https://cloud.mogi.vn/review/thumb-medium/districts/291.jpg')
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (5, N'Hai Bà Trưng', N'NULLQuận Hai Bà Trưng rộng lớn thu hút khách du lịch đến Công viên Thống Nhất, một không gian đô thị xanh mát được điểm tô với những lối đi bộ, điểm dã ngoại và Hồ Bảy Mẫu yên ả được nhiều người tìm đến để chèo thuyền. Cách đó không xa, Thủy cung Times City gây ấn tượng với đường hầm dưới nước đón nhiều lượt khách đến xem những chú cá mập và cá đuối gai độc. Các nhà hàng sushi và nhà hàng Việt Nam nằm kế bên các quán karaoke và quán bar rượu vang bình dân, còn điểm mua sắm phong phú, đa dạng từ các cửa hàng thời trang địa phương đến các khu chợ truyền thống.', N'https://cloud.mogi.vn/review/thumb-medium/districts/292.jpg')
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (6, N'Hoàn Kiếm', N'Hoàn Kiếm là trung tâm thành phố nhộn nhịp của Hà Nội, nơi có khu phố cổ ghi đậm dấu ấn với các cửa hàng đồ thủ công Việt Nam và quán bar bình dân, bên cạnh các quán ăn nhỏ bán phở và bánh mì sandwich. Trong số các địa danh thời Pháp thuộc, không thể không kể đến Nhà thờ Lớn Hà Nội theo phong cách tân Gothic và tàn tích của Nhà tù Hỏa Lò, hiện được dùng làm bảo tàng. Hồ Hoàn Kiếm là một điểm đi bộ nổi tiếng, trong khi Chợ Đêm Hà Nội cuối tuần thường nhộn nhịp với các quầy hàng lưu niệm, nghệ sĩ đường phố và các nghệ sĩ vẽ tranh cho người qua đường.', N'https://cloud.mogi.vn/review/thumb-medium/districts/293.jpg')
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (7, N'Bắc Từ Liêm', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (8, N'Nam Từ Liêm', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (9, N'Cầu Giấy', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (10, N'Hà Đông', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (11, N'Thanh Xuân', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (12, N'Tây Hồ', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (13, N'Đan Phượng', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (14, N'Đông Anh', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (15, N'Gia Lâm', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (16, N'Chương Mỹ', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (17, N'Hoài Đức', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (18, N'Ba Vì ', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (19, N'Mỹ Đức', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (20, N'Phúc Thọ', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (21, N'Mê Linh', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (22, N'Sóc Sơn', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (23, N'Thạch Thất', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (24, N'Quốc Oai', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (25, N'Thanh Trì', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (26, N'Thường Tín', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (27, N'Thanh Oai', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (28, N'Phú Xuyên', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (29, N'Ứng Hòa', NULL, NULL)
INSERT [dbo].[District] ([Id], [Name], [Area_review], [Image_URL]) VALUES (30, N'Sơn Tây', NULL, NULL)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [User_id], [Create_date], [Title], [Detail], [Price], [Area], [Number_of_bedrooms], [Number_of_restrooms], [Direction], [Address], [Address_detail], [Property_type_id]) VALUES (1, 3, CAST(N'2022-11-02T00:00:00.000' AS DateTime), N' Phòng trọ đẹp quá trời, mới xây, cam kết giống hình 100%', N'Cho thuê nhà mặt phố Ngọc Khánh, phường Giảng Võ, quận Ba Đình, Hà Nội
Diện tích 80m, xây dựng 6 tầng, mặt tiền rộng 5m, nhà thiết kế mỗi tầng chia 2 phòng, có điều hòa, nóng lạnh đầy đủ
Nhà phù hợp làm văn phòng, cafe, đào tạo...
Giá : 50 triệu/tháng
Liên hệ : Tuấn 0972536780', 50000000, 80, 5, 5, N'Đông Bắc', 9, N'Số 32, Ngọc Khánh, phường Giảng Võ, quận Ba Đình, Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
INSERT [dbo].[Post_image] ([Post_id], [Image_link]) VALUES (1, N'https://image.finhou.com/Resource/Blogs/Thumbnails/109/4251/tong-hop-kinh-nghiem-tim-nha-tro-sinh-vien-4251.jpg')
INSERT [dbo].[Post_image] ([Post_id], [Image_link]) VALUES (1, N'https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/1/6/dsc2478-1609901419020328534769.jpg')
GO
SET IDENTITY_INSERT [dbo].[Property_type] ON 

INSERT [dbo].[Property_type] ([Id], [Name]) VALUES (1, N'Nhà')
INSERT [dbo].[Property_type] ([Id], [Name]) VALUES (2, N'Chung cư')
INSERT [dbo].[Property_type] ([Id], [Name]) VALUES (3, N'Phòng Trọ')
INSERT [dbo].[Property_type] ([Id], [Name]) VALUES (4, N'Mặt Bằng')
SET IDENTITY_INSERT [dbo].[Property_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'user')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'landlord')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sub_district] ON 

INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (1, N'Đại Kim', 1, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (2, N'Định Công', 1, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (3, N'Giáp Bát', 1, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (4, N'Bồ Đề', 2, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (5, N'Long Biên', 2, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (6, N'Ngọc Lâm', 2, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (7, N'Ngọc Thụy', 2, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (9, N'Giảng Võ', 3, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (10, N'Đội Cấn', 3, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (11, N'Kim Mã', 3, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (12, N'Cát Linh', 4, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (13, N'Kim Liên', 4, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (14, N'Láng Hạ', 4, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (15, N'Bách Khoa', 5, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (16, N'Bạch Mai', 5, NULL)
INSERT [dbo].[Sub_district] ([Id], [Name], [District_id], [Area_review]) VALUES (17, N'Minh Khai', 5, NULL)
SET IDENTITY_INSERT [dbo].[Sub_district] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [Email], [Password], [Role_id], [Create_date], [Is_deleted]) VALUES (3, N'tuan@gmail.com', N'123123', 1, CAST(N'2022-02-09T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User_detail] ([User_Id], [Name], [Phone], [Image_link], [Personal_id], [Contacts]) VALUES (3, N'Le Tuan', N'0972536780', N'https://i.ytimg.com/vi/-v29otXMMCs/maxresdefault.jpg', N'184389693', N'hehe')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D1053460133202]    Script Date: 2/11/2022 11:46:07 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__A9D1053460133202] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__User_det__206D9171E771B245]    Script Date: 2/11/2022 11:46:07 PM ******/
ALTER TABLE [dbo].[User_detail] ADD  CONSTRAINT [UQ__User_det__206D9171E771B245] UNIQUE NONCLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User_det__5C7E359E8363EC8B]    Script Date: 2/11/2022 11:46:07 PM ******/
ALTER TABLE [dbo].[User_detail] ADD  CONSTRAINT [UQ__User_det__5C7E359E8363EC8B] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [Bookmark_fk0] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [Bookmark_fk0]
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [FK_Bookmark_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [FK_Bookmark_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Property_type] FOREIGN KEY([Property_type_id])
REFERENCES [dbo].[Property_type] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Property_type]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Sub_district] FOREIGN KEY([Address])
REFERENCES [dbo].[Sub_district] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Sub_district]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [Post_fk0] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [Post_fk0]
GO
ALTER TABLE [dbo].[Post_comment]  WITH CHECK ADD  CONSTRAINT [FK_Post_comment_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Post_comment] CHECK CONSTRAINT [FK_Post_comment_User]
GO
ALTER TABLE [dbo].[Post_comment]  WITH CHECK ADD  CONSTRAINT [Post_comment_fk0] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Post_comment] CHECK CONSTRAINT [Post_comment_fk0]
GO
ALTER TABLE [dbo].[Post_image]  WITH CHECK ADD  CONSTRAINT [Post_image_fk0] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Post_image] CHECK CONSTRAINT [Post_image_fk0]
GO
ALTER TABLE [dbo].[Post_report]  WITH CHECK ADD  CONSTRAINT [FK_Post_report_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Post_report] CHECK CONSTRAINT [FK_Post_report_User]
GO
ALTER TABLE [dbo].[Post_report]  WITH CHECK ADD  CONSTRAINT [Post_report_fk0] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Post_report] CHECK CONSTRAINT [Post_report_fk0]
GO
ALTER TABLE [dbo].[Sub_district]  WITH CHECK ADD  CONSTRAINT [FK_Sub_district_District] FOREIGN KEY([District_id])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Sub_district] CHECK CONSTRAINT [FK_Sub_district_District]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_fk0] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_fk0]
GO
ALTER TABLE [dbo].[User_detail]  WITH CHECK ADD  CONSTRAINT [User_detail_fk0] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User_detail] CHECK CONSTRAINT [User_detail_fk0]
GO
USE [master]
GO
ALTER DATABASE [thuedi] SET  READ_WRITE 
GO
