USE [master]
-- DROP DATABASE [QLNH]
GO
/****** Object:  Database [QLNH]    Script Date: 14/04/2025 9:53:51 PM ******/
CREATE DATABASE [QLNH]
GO


ALTER DATABASE [QLNH] SET COMPATIBILITY_LEVEL = 160
GO


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO


ALTER DATABASE [QLNH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_WARNINGS OFF 
GO


ALTER DATABASE [QLNH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNH] SET NUMERIC_ROUNDABORT OFF 
GO


ALTER DATABASE [QLNH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO


ALTER DATABASE [QLNH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNH] SET READ_COMMITTED_SNAPSHOT OFF 
GO


ALTER DATABASE [QLNH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNH] SET DELAYED_DURABILITY = DISABLED 
GO



ALTER DATABASE [QLNH] SET  MULTI_USER 
GO


ALTER DATABASE [QLNH] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLNH] SET QUERY_STORE 
(
	OPERATION_MODE = READ_WRITE, 
	CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), 
	DATA_FLUSH_INTERVAL_SECONDS = 900, 
	INTERVAL_LENGTH_MINUTES = 60, 
	MAX_STORAGE_SIZE_MB = 1000, 
	QUERY_CAPTURE_MODE = AUTO, 
	SIZE_BASED_CLEANUP_MODE = AUTO, 
	MAX_PLANS_PER_QUERY = 200
)


GO
ALTER DATABASE [QLNH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNH] SET TRUSTWORTHY OFF 

GO
ALTER DATABASE [QLNH] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [QLNH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNH', N'ON'
GO
USE [QLNH]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 14/04/2025 9:53:51 PM ******/
-- drop table [dbo].[Ban]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [varchar](5) NOT NULL,
	[SoGhe] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[Lau] INT NOT NULL ,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaLam]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLam](
	[MaCa] [varchar](10) NOT NULL,
	[TenCa] [nvarchar](30) NULL,
	[ThoiGianBatDau] [time](7) NOT NULL,
	[ThoiGianketThuc] [time](7) NOT NULL,
	[LuongTheoGio] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[SoLuong] [int] NOT NULL,
	[SanPham] [varchar](10) NOT NULL,
	[HoaDon] [varchar](15) NOT NULL,
	[KichThuoc] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SanPham] ASC,
	[HoaDon] ASC,
	[KichThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [varchar](15) NOT NULL,
	[NhanVien] [varchar](10) NOT NULL,
	[Ban] [varchar](5) NULL,
	[KhachHang] [varchar](10) NOT NULL,
	[NgayTao] [datetime] NULL,
	[PhuongThucThanhToan] [varchar](15) NULL,
	[TrangThaiThanhToan] [bit] NOT NULL,
	[GhiChu] [varchar](1150) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DienThoai] [varchar](11) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [varchar](10) NOT NULL,
	[TenKhuyenMai] [nvarchar](150) NOT NULL,
	[MoTa] [nvarchar](150) NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[PhanTramGiamGia] [real] NOT NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](150) NULL,
	[CoPhanLoai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](10) NOT NULL,
	[MaTaiKhoan] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[GioiTinh] [bit] NOT NULL,
	[Sdt] [varchar](11) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[ChucVu] [bit] NOT NULL,
	[NgayTuyenDung] [datetime] NULL,
	[DiaChi] [varchar](100) NULL,
	[KhuVuc] [nvarchar](100) NULL,
	[Email] [varchar](50) NULL,
	[TrangThai] [bit] NOT NULL,
	[HinhAnh] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [varchar](10) NOT NULL,
	[KhuyenMai] [varchar](10) NULL,
	[LoaiSanPham] [varchar](10) NOT NULL,
	[TenSanPham] [nvarchar](150) NULL,
	[KichThuoc] [char](1) NOT NULL,
	[Gia] [real] NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[HinhAnh] [varchar](150) NULL,
	[MoTa] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[KichThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [varchar](10) NOT NULL,
	[TenTaiKhoan] [varchar](20) NOT NULL,
	[MatKhau] [varchar](160) NULL,
	[LoaiTaiKhoan] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinCa]    Script Date: 14/04/2025 9:53:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinCa](
	[MaCa] [varchar](10) NOT NULL,
	[MaNhanVien] [varchar](10) NOT NULL,
	[NgayLam] [date] NOT NULL,
	[TongDoanhThu] [real] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'1', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'2', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'3', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'4', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'5', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'6', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'7', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'8', 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'9', 6, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'10', 6, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'11', 6, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'12', 6, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'13', 8, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'14', 8, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'15', 8, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'16', 8, 0, 1)

INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'17', 6, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'18', 8, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'19', 4, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'20', 6, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'21', 8, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'22', 4, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'23', 6, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'24', 8, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'25', 4, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'26', 6, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'27', 8, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'28', 4, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'29', 6, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'30', 8, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'31', 4, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'32', 6, 0, 2)

INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'33', 8, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'34', 4, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'35', 6, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'36', 8, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'37', 4, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'38', 6, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'39', 8, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'40', 4, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'41', 6, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'42', 8, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'43', 4, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'44', 6, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'45', 8, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'46', 4, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'47', 6, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [SoGhe], [TinhTrang], [Lau]) VALUES (N'48', 8, 0, 3)

GO
INSERT [dbo].[CaLam] ([MaCa], [TenCa], [ThoiGianBatDau], [ThoiGianketThuc], [LuongTheoGio]) VALUES (N'CA01', N'Ca Sáng', CAST(N'00:00:00' AS Time), CAST(N'11:30:00' AS Time), 23000)
INSERT [dbo].[CaLam] ([MaCa], [TenCa], [ThoiGianBatDau], [ThoiGianketThuc], [LuongTheoGio]) VALUES (N'CA02', N'Ca Chiều', CAST(N'11:30:00' AS Time), CAST(N'16:30:00' AS Time), 23000)
INSERT [dbo].[CaLam] ([MaCa], [TenCa], [ThoiGianBatDau], [ThoiGianketThuc], [LuongTheoGio]) VALUES (N'CA03', N'Ca Tối', CAST(N'16:30:00' AS Time), CAST(N'23:59:00' AS Time), 25000)
GO
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP001', N'HD0427001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (4, N'SP001', N'HD070524008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP001', N'HD080524011', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP001', N'HD080524012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP001', N'HD080524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP001', N'HD090524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP001', N'HD090524002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP001', N'HD110624001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP001', N'HD210524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP001', N'HD280524002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (5, N'SP001', N'HD280524002', N'S')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP001', N'HD290624001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (4, N'SP001', N'HD290624002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP002', N'HD0427001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP002', N'HD060724002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP002', N'HD070524004', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP002', N'HD070524007', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP002', N'HD070524012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP002', N'HD070524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP002', N'HD070524014', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP002', N'HD070524015', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP002', N'HD080524003', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (6, N'SP002', N'HD080524008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP002', N'HD080524017', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP002', N'HD110624007', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (4, N'SP002', N'HD110624010', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP002', N'HD110624014', N'L')
GO
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (10000000, N'SP002', N'HD110624015', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP002', N'HD210524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP002', N'HD260524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP002', N'HD260524002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP003', N'HD0427002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (5, N'SP003', N'HD070524005', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP003', N'HD070524008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP003', N'HD080524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP003', N'HD080524014', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP003', N'HD280524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD0427002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (6, N'SP004', N'HD070524007', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP004', N'HD070524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD070524017', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD070524018', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD080524005', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD080524006', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP004', N'HD080524011', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD080524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD080524014', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD080524016', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD090524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP004', N'HD090524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD090524003', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD110524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD110624003', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD110624004', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP004', N'HD110624005', N'L')
GO
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1000000000, N'SP004', N'HD110624011', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (999, N'SP004', N'HD110624012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD110624013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (10, N'SP004', N'HD110624016', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (100, N'SP004', N'HD260524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP004', N'HD290624002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP005', N'HD0427003', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP005', N'HD060724001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP005', N'HD060724001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP005', N'HD070524001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP005', N'HD070524003', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP005', N'HD070524010', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP005', N'HD110524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1000, N'SP005', N'HD280524003', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP006', N'HD070524002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP006', N'HD070524006', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (5, N'SP006', N'HD070524009', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP006', N'HD280524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP008', N'HD070524001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP010', N'HD280524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP012', N'HD060724002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP012', N'HD070524006', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (7, N'SP012', N'HD070524008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP012', N'HD070524012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP012', N'HD080524007', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP012', N'HD080524012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP012', N'HD080524014', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP012', N'HD080524015', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP013', N'HD070524008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (4, N'SP013', N'HD070524011', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP013', N'HD090524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP013', N'HD110624010', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP013', N'HD110624017', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD070524004', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP014', N'HD070524007', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP014', N'HD070524016', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD080524012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP014', N'HD080524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD080524015', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD080524017', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD080524018', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD110524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (5, N'SP014', N'HD110624002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD110624006', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP014', N'HD280524001', N'S')
GO
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP015', N'HD040724001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (13, N'SP015', N'HD040724001', N'S')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (4, N'SP015', N'HD070524012', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP015', N'HD080524004', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP015', N'HD080524009', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP015', N'HD080524010', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP015', N'HD080524013', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (4, N'SP015', N'HD080524018', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP015', N'HD110524002', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP016', N'HD070524001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP026', N'HD070524003', N'D')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP026', N'HD080524014', N'D')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP026', N'HD110624006', N'D')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP026', N'HD260524002', N'D')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP035', N'HD070524002', N'D')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP036', N'HD090524003', N'D')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP046', N'HD070524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP046', N'HD080524001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP046', N'HD110624008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP047', N'HD210524001', N'M')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP048', N'HD080624001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP054', N'HD110624008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (5, N'SP056', N'HD080524002', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP056', N'HD250524001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (1, N'SP058', N'HD070524001', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (5, N'SP058', N'HD110624006', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (2, N'SP058', N'HD110624008', N'L')
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [SanPham], [HoaDon], [KichThuoc]) VALUES (3, N'SP059', N'HD110624009', N'L')
GO
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD040724001', N'NV002', N'8', N'KH002', CAST(N'2025-07-04T21:37:00.357' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD0427001', N'NV001', N'1', N'KH001', CAST(N'2025-04-27T07:01:33.000' AS DateTime), N'CASH', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD0427002', N'NV001', N'2', N'KH002', CAST(N'2025-04-27T07:31:02.000' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD0427003', N'NV001', N'3', N'KH003', CAST(N'2025-04-27T08:41:10.000' AS DateTime), N'CASH', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD060724001', N'NV002', N'1', N'KH002', CAST(N'2025-07-06T20:43:14.437' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD060724002', N'NV002', N'11', N'KH062', CAST(N'2025-07-06T21:58:21.580' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524001', N'NV003', N'1', N'KH002', CAST(N'2025-05-07T16:45:05.127' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524002', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T16:56:38.297' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524003', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:01:54.100' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524004', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:09:47.907' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524005', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:11:56.193' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524006', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:13:52.017' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524007', N'NV003', N'15', N'KH002', CAST(N'2025-05-07T17:25:49.137' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524008', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:29:17.967' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524009', N'NV003', N'6', N'KH002', CAST(N'2025-05-07T17:31:15.343' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524010', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:34:36.883' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524011', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T17:36:42.960' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524012', N'NV003', N'3', N'KH002', CAST(N'2025-05-07T19:07:27.183' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524013', N'NV003', N'2', N'KH002', CAST(N'2025-05-07T19:09:16.863' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524014', N'NV003', NULL, N'KH002', CAST(N'2025-05-07T19:20:10.823' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524015', N'NV003', NULL, N'KH002', CAST(N'2025-05-07T19:20:24.027' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524016', N'NV003', NULL, N'KH002', CAST(N'2025-05-07T19:36:21.270' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524017', N'NV003', NULL, N'KH002', CAST(N'2025-05-07T19:55:05.120' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD070524018', N'NV003', NULL, N'KH002', CAST(N'2025-05-07T19:58:50.287' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524001', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T01:41:43.650' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524002', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T01:42:20.283' AS DateTime), N'BANK_TRANSFER', 1, N'')
GO
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524003', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T01:48:59.890' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524004', N'NV002', N'1', N'KH002', CAST(N'2025-05-08T01:51:41.170' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524005', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T01:53:28.107' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524006', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T01:57:03.053' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524007', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T01:58:16.120' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524008', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T02:52:16.570' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524009', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T02:54:19.177' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524010', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T03:23:55.260' AS DateTime), N'BANK_TRANSFER', 1, N'')
GO
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524011', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T08:29:07.757' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524012', N'NV002', N'3', N'KH002', CAST(N'2025-05-08T08:31:02.077' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524013', N'NV002', N'1', N'KH002', CAST(N'2025-05-08T08:32:59.807' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524014', N'NV002', N'2', N'KH002', CAST(N'2025-05-08T14:55:32.727' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524015', N'NV002', N'6', N'KH057', CAST(N'2025-05-08T14:58:36.040' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524016', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T15:33:39.583' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080524017', N'NV002', N'1', N'KH002', CAST(N'2025-05-08T15:43:02.500' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD080524018', N'NV002', NULL, N'KH002', CAST(N'2025-05-08T15:48:57.270' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD080624001', N'NV002', N'3', N'KH002', CAST(N'2025-06-08T17:27:17.760' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD090524001', N'NV002', N'1', N'KH002', CAST(N'2025-05-09T12:06:47.777' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD090524002', N'NV002', NULL, N'KH002', CAST(N'2025-05-09T17:16:52.103' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD090524003', N'NV002', NULL, N'KH002', CAST(N'2025-05-09T17:25:58.457' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110524001', N'NV002', NULL, N'KH002', CAST(N'2025-05-11T08:50:25.137' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD110524002', N'NV002', N'3', N'KH002', CAST(N'2025-05-11T09:20:15.803' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624001', N'NV002', NULL, N'KH002', CAST(N'2025-06-11T17:21:06.103' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624002', N'NV002', N'3', N'KH002', CAST(N'2025-06-11T17:51:59.903' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624003', N'NV002', NULL, N'KH002', CAST(N'2025-06-11T17:53:33.350' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD110624004', N'NV002', N'12', N'KH002', CAST(N'2025-06-11T17:53:48.270' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624005', N'NV002', N'3', N'KH002', CAST(N'2025-06-11T17:58:02.890' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD110624006', N'NV002', N'3', N'KH002', CAST(N'2025-06-11T18:56:57.253' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD110624007', N'NV002', N'2', N'KH002', CAST(N'2025-06-11T19:31:58.620' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624008', N'NV002', N'10', N'KH002', CAST(N'2025-06-11T19:39:24.600' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624009', N'NV002', N'12', N'KH002', CAST(N'2025-06-11T19:39:52.237' AS DateTime), N'BANK_TRANSFER', 1, N'')
GO
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624010', N'NV002', N'16', N'KH057', CAST(N'2025-06-11T19:47:00.353' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624011', N'NV002', N'3', N'KH057', CAST(N'2025-06-11T19:53:09.867' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624012', N'NV002', N'9', N'KH058', CAST(N'2025-06-11T19:58:48.457' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624013', N'NV002', N'8', N'KH059', CAST(N'2025-06-11T20:05:37.647' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624014', N'NV002', N'15', N'KH002', CAST(N'2025-06-11T20:20:33.527' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624015', N'NV002', N'1', N'KH002', CAST(N'2025-06-11T20:22:13.397' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD110624016', N'NV002', N'2', N'KH002', CAST(N'2025-06-11T20:29:33.970' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD110624017', N'NV002', N'14', N'KH002', CAST(N'2025-06-11T20:49:17.297' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD210524001', N'NV002', N'1', N'KH002', CAST(N'2025-05-21T20:09:33.190' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD250524001', N'NV002', N'12', N'KH002', CAST(N'2025-05-25T14:08:24.627' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD260524001', N'NV002', NULL, N'KH002', CAST(N'2025-05-26T15:00:11.527' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD260524002', N'NV002', N'3', N'KH002', CAST(N'2025-05-26T15:04:38.283' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD280524001', N'NV002', N'3', N'KH002', CAST(N'2025-05-28T19:42:00.793' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD280524002', N'NV002', N'3', N'KH002', CAST(N'2025-05-28T19:46:30.537' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD280524003', N'NV002', N'3', N'KH002', CAST(N'2025-05-28T19:56:04.943' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu])
VALUES (N'HD290624001', N'NV002', N'4', N'KH002', CAST(N'2025-06-29T13:19:26.743' AS DateTime), N'BANK_TRANSFER', 1, N'')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NhanVien], [Ban], [KhachHang], [NgayTao], [PhuongThucThanhToan], [TrangThaiThanhToan], [GhiChu]) 
VALUES (N'HD290624002', N'NV002', N'5', N'KH002', CAST(N'2025-06-29T21:21:53.723' AS DateTime), N'BANK_TRANSFER', 1, N'')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH001', N'Nguyễn Thị Hằng', 0, N'0987654321', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH002', N'Trần Văn Hùng', 1, N'0123456789', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH003', N'Lê Thị Minh Châu', 0, N'0978123456', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH004', N'Phạm Hoàng Nam', 1, N'0932123456', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH005', N'Vũ Thị Linh', 0, N'0918234567', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH006', N'Nguyễn Văn An', 1, N'0987654321', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH007', N'Hoàng Thị Mai', 0, N'0909123456', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH008', N'Trần Văn Long', 1, N'0987123456', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH009', N'Nguyễn Thị Hằng', 0, N'0938123456', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH010', N'Phạm Thị Hoa', 0, N'0976123456', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH011', N'Lê Văn Đức', 1, N'0987123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH012', N'Nguyễn Thị Thanh', 0, N'0978123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH013', N'Trần Thị Hồng', 0, N'0918234567', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH014', N'Phạm Văn Tùng', 1, N'0987123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH015', N'Hoàng Văn Nam', 1, N'0932123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH016', N'Lê Thị Thu', 0, N'0909123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH017', N'Nguyễn Văn Lâm', 1, N'0938123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH018', N'Trần Thị Hương', 0, N'0976123456', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH019', N'Phạm Văn Tuấn', 1, N'0987123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH020', N'Lê Thị Thảo', 0, N'0978123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH021', N'Trần Văn Hải', 1, N'0918234567', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH022', N'Nguyễn Thị Bích', 0, N'0987123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH023', N'Phạm Văn Hiếu', 1, N'0932123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH024', N'Hoàng Thị Ngọc', 0, N'0909123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH025', N'Trần Văn Tiến', 1, N'0938123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH026', N'Lê Thị Thu Hà', 0, N'0976123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH027', N'Nguyễn Văn Thắng', 1, N'0978123456', CAST(N'2025-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH028', N'Nguyễn Thị Hương', 0, N'0987123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH029', N'Trần Văn Tuấn', 1, N'0978123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH030', N'Phạm Thị Lan', 0, N'0918234567', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH031', N'Lê Văn Dũng', 1, N'0987123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH032', N'Nguyễn Thị Hà', 0, N'0932123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH033', N'Trần Văn Nam', 1, N'0909123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH034', N'Phạm Thị Hằng', 0, N'0938123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH035', N'Hoàng Văn Hùng', 1, N'0976123456', CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH036', N'Nguyễn Thị Lan Anh', 0, N'0987123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH037', N'Trần Văn Quân', 1, N'0978123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH038', N'Phạm Thị Hà', 0, N'0918234567', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH039', N'Lê Văn Minh', 1, N'0987123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH040', N'Nguyễn Thị Thu Hà', 0, N'0932123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH041', N'Trần Văn Long', 1, N'0909123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH042', N'Phạm Thị Hương', 0, N'0938123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH043', N'Lê Văn Đức', 1, N'0976123456', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH044', N'Nguyễn Thị Mai', 0, N'0987123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH045', N'Trần Văn Tuấn', 1, N'0978123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH046', N'Phạm Thị Lan', 0, N'0918234567', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH047', N'Lê Văn Dũng', 1, N'0987123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH048', N'Nguyễn Thị Hà', 0, N'0932123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH049', N'Trần Văn Nam', 1, N'0909123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH050', N'Phạm Thị Hằng', 0, N'0938123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH051', N'Lê Văn Hùng', 1, N'0976123456', CAST(N'2025-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH052', N'Nguyễn Thị Thanh', 0, N'0987123456', CAST(N'2025-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH053', N'Trần Thị Hồng', 0, N'0978123456', CAST(N'2025-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH054', N'Phạm Văn Tùng', 1, N'0918234567', CAST(N'2025-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH055', N'Lê Thị Thu', 0, N'0987123456', CAST(N'2025-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH057', N'Phan Phuoc Hiep', 1, N'0123456789', CAST(N'2025-05-06T15:55:04.477' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH058', N'PPH1111', 1, N'0000000000', CAST(N'2025-06-11T19:58:48.413' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH059', N'PPH', 1, N'0999988888', CAST(N'2025-06-11T20:05:37.610' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH060', N'sđ', 1, N'dfdf', CAST(N'2025-06-11T21:16:55.840' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH061', N'đsđss', 1, N'34243', CAST(N'2025-07-04T21:38:08.270' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [GioiTinh], [DienThoai], [NgayThem]) VALUES (N'KH062', N'HIệp kk', 1, N'0900000000', CAST(N'2025-07-06T21:58:21.537' AS DateTime))
GO
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [MoTa], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [TrangThai])
VALUES (N'KM001', N'Giảm giá 20% cho tất cả sản phẩm', N'Áp dụng cho tất cả các sản phẩm trong cửa hàng', 
		CAST(N'2025-10-30T00:00:00.000' AS DateTime), CAST(N'2025-12-01T00:00:00.000' AS DateTime), 20, 0)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [MoTa], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [TrangThai]) 
VALUES (N'KM002', N'Giảm giá 15% cho bánh ngọt', N'Chương trình khuyến mãi đặc biệt cho bánh ngọt', 
		CAST(N'2025-11-01T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [MoTa], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [TrangThai]) 
VALUES (N'KM003', N'd', N'test', CAST(N'2025-01-30T00:00:00.000' AS DateTime), 
		CAST(N'2025-02-28T00:00:00.000' AS DateTime), 90, 0)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [CoPhanLoai]) VALUES (N'Loai01', N'Buffet', N'Dịch vụ ăn uống tự chọn với nhiều món đa dạng được bày sẵn cho khách tự phục vụ theo nhu cầu', 1)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [CoPhanLoai]) VALUES (N'Loai02', N'Món Thái', N'Các món ăn đặc trưng của ẩm thực Thái Lan với hương vị cay nồng, chua ngọt và nhiều gia vị đặc biệt', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [CoPhanLoai]) VALUES (N'Loai03', N'Lẩu & Nướng', N'Các loại lẩu với nước dùng đặc trưng và các món nướng đa dạng phục vụ cho nhóm hoặc gia đình', 1)
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [Sdt], [NgaySinh], [ChucVu], [NgayTuyenDung], [DiaChi], [KhuVuc], [Email], [TrangThai], [HinhAnh]) 
VALUES (N'NV000', N'TK000', N'Đồng Văn Xướng', 1, N'0376782409', CAST(N'2004-11-14T00:00:00.000' AS DateTime), 0, CAST(N'2025-05-31T00:00:00.000' AS DateTime), N'TP.H? Chí Minh', NULL, N'xuongdong525@gmail.com', 1, NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [Sdt], [NgaySinh], [ChucVu], [NgayTuyenDung], [DiaChi], [KhuVuc], [Email], [TrangThai], [HinhAnh]) 
VALUES (N'NV001', N'TK001', N'Quang', 1, N'0326829327', CAST(N'2004-04-20T00:00:00.000' AS DateTime), 1, CAST(N'2025-04-26T00:00:00.000' AS DateTime), N'TP.H? Chí Minh', N'Quận 12', N'quang2k4@gmail.com', 1, NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [Sdt], [NgaySinh], [ChucVu], [NgayTuyenDung], [DiaChi], [KhuVuc], [Email], [TrangThai], [HinhAnh]) 
VALUES (N'NV002', N'TK002', N'Ngoc', 1, N'0376782409', CAST(N'2004-11-14T00:00:00.000' AS DateTime), 0, CAST(N'2025-04-26T00:00:00.000' AS DateTime), N'TP.H? Chí Minh', N'Huyện Hóc Môn', N'ngoc2k4@gmail.com', 1, NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [Sdt], [NgaySinh], [ChucVu], [NgayTuyenDung], [DiaChi], [KhuVuc], [Email], [TrangThai], [HinhAnh]) 
VALUES (N'NV003', N'TK003', N'Long', 1, N'0376782409', CAST(N'2004-11-14T00:00:00.000' AS DateTime), 0, CAST(N'2025-05-31T00:00:00.000' AS DateTime), N'TP.H? Chí Minh', NULL, N'long2k45@gmail.com', 1, NULL)

GO
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP001', N'KM002', N'Loai01', N'Salad-chay', N'L', 40000, 1, N'/icon/salad-chay.jpg  ', N'Salad chay dành cho người ăn chay và thịt.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP001', N'KM002', N'Loai01', N'Salad-chay', N'M', 35000, 1, N'/icon/salad-chay.jpg  ', N'Salad chay dành cho người ăn chay và thịt.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP001', N'KM002', N'Loai01', N'Salad-chay', N'S', 25000, 1, N'/icon/salad-chay.jpg  ', N'Salad chay dành cho người ăn chay và thịt.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP002', N'KM002', N'Loai01', N'Bò xào sa tế', N'L', 35000, 1, N'/icon/tom_nuong_sa_te.jpg', N'Bò xào sa tế đậm đặc với hương vị đặc trưng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP002', N'KM002', N'Loai01', N'Bò xào sa tế', N'M', 30000, 1, N'/icon/tom_nuong_sa_te.jpg', N'Bò xào sa tế đậm đặc với hương vị đặc trưng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP002', N'KM002', N'Loai01', N'Bò xào sa tế', N'S', 25000, 1, N'/icon/tom_nuong_sa_te.jpg', N'Bò xào sa tế đậm đặc với hương vị đặc trưng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP003', N'KM002', N'Loai01', N'Sườn bò chua cay', N'L', 30000, 1, N'/icon/bo_la_lot.jpg', N'Sườn bò chua cay , đậm đà ,hấp dẫn')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP003', N'KM002', N'Loai01', N'Sườn bò chua cayBạc xỉu', N'M', 25000, 1, N'/icon/bo_la_lot.jpg', N'Sườn bò chua cay , đậm đà ,hấp dẫn')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP003', N'KM002', N'Loai01', N'Sườn bò chua cay', N'S', 20000, 1, N'/icon/bo_la_lot.jpg', N'Sườn bò chua cay , đậm đà ,hấp dẫn')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP004', N'KM002', N'Loai01', N'Sụn gà nướng', N'L', 38000, 1, N'/icon/chan_ga_nuong.jpg', N'Sụn gà nướng với nươc chấm ớt xanh mịn màng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP004', N'KM002', N'Loai01', N'Sụn gà nướng', N'M', 33000, 1, N'/icon/chan_ga_nuong.jpg', N'Sụn gà nướng với nươc chấm ớt xanh mịn màng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP004', N'KM002', N'Loai01', N'Sụn gà nướng', N'S', 28000, 1, N'/icon/chan_ga_nuong.jpg', N'Sụn gà nướng với nươc chấm ớt xanh mịn màng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP005', N'KM002', N'Loai01', N'Cá diêu hồng cuộn trứng muối', N'L', 30000, 1, N'/icon/ca_dieu_hong.jpg', N'Cá diêu hồng cuộn trứng muối thơm ngon, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP005', N'KM002', N'Loai01', N'Cá diêu hồng cuộn trứng muối', N'M', 25000, 1, N'/icon/ca_dieu_hong.jpg', N'Cá diêu hồng cuộn trứng muối thơm ngon, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP005', N'KM002', N'Loai01', N'Cá diêu hồng cuộn trứng muối', N'S', 20000, 1, N'/icon/ca_dieu_hong.jpg', N'Cá diêu hồng cuộn trứng muối thơm ngon, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP006', N'KM002', N'Loai01', N'Sườn dê', N'L', 35000, 1, N'/icon/suon_de.jpg', N'Sườn dê thơm ngon, sắc nét, đậm đà.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP006', N'KM002', N'Loai01', N'Sườn dê', N'M', 34000, 1, N'/icon/suon_de.jpg', N'Sườn dê thơm ngon, sắc nét, đậm đà.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP006', N'KM002', N'Loai01', N'Sườn dê', N'S', 32000, 1, N'/icon/suon_de.jpg', N'Sườn dê thơm ngon, sắc nét, đậm đà.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP007', N'KM002', N'Loai01', N'Mì ý xào bò', N'L', 40000, 1, N'/icon/mì-xao-tron-bo.jpg', N'Mỳ Ý xào cũng với bò Wagyu .')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP007', N'KM002', N'Loai01', N'Mì ý xào bò', N'M', 35000, 1, N'/icon/mì-xao-tron-bo.jpg', N'Mỳ Ý xào cũng với bò Wagyu .')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP007', N'KM002', N'Loai01', N'Mì ý xào bò', N'S', 25000, 1, N'/icon/mì-xao-tron-bo.jpg', N'Mỳ Ý xào cũng với bò Wagyu .')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP008', N'KM002', N'Loai01', N'Bánh mì xốt cá', N'L', 45000, 1, N'/icon/banh-mi-xot.jpg', N'Bánh mì xốt cá ngừ dịu dàng bao ngon')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP008', N'KM002', N'Loai01', N'Bánh mì xốt cá', N'M', 40000, 1, N'/icon/banh-mi-xot.jpg', N'Bánh mì xốt cá ngừ dịu dàng bao ngon')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP008', N'KM002', N'Loai01', N'Bánh mì xốt cá', N'S', 35000, 1, N'/icon/banh-mi-xot.jpg', N'Bánh mì xốt cá ngừ dịu dàng bao ngon')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP009', N'KM002', N'Loai01', N'Bánh xếp nhân gà', N'L', 48000, 1, N'/icon/banh-xep-nhan-ga.jpg', N'Bánh xếp nhân gà kèm với mayonnaise.')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP009', N'KM002', N'Loai01', N'Bánh xếp nhân gà', N'M', 43000, 1, N'/icon/banh-xep-nhan-ga.jpg', N'Bánh xếp nhân gà kèm với mayonnaise.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP009', N'KM002', N'Loai01', N'Bánh xếp nhân gà', N'S', 38000, 1, N'/icon/banh-xep-nhan-ga.jpg', N'Bánh xếp nhân gà kèm với mayonnaise.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP010', N'KM002', N'Loai01', N'Mực chiên bột', N'L', 36000, 1, N'/icon/muc_chien_bot.jpg', N'Mực chiên bột đơn giản và ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP010', N'KM002', N'Loai01', N'Mực chiên bột', N'M', 31000, 1, N'/icon/muc_chien_bot.jpg', N'Mực chiên bột đơn giản và ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP010', N'KM002', N'Loai01', N'Mực chiên bột', N'S', 26000, 1, N'/icon/muc_chien_bot.jpg', N'Mực chiên bột đơn giản và ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP011', N'KM002', N'Loai01', N'Salad', N'L', 42000, 1, N'/icon/salad.jpg', N'Salad ngọt ngào kèm với xúc xích')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP011', N'KM002', N'Loai01', N'Salad', N'M', 37000, 1, N'/icon/salad.jpg', N'Salad ngọt ngào kèm với xúc xích.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP011', N'KM002', N'Loai01', N'Salad', N'S', 32000, 1, N'/icon/salad.jpg', N'Salad ngọt ngào kèm với xúc xích.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP012', N'KM002', N'Loai01', N'Bò-ba-chỉ', N'L', 28000, 1, N'/icon/ba_chi_bo.jpg', N'Bò ba chỉ đậm đà, thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP012', N'KM002', N'Loai01', N'Bò-ba-chỉ', N'M', 23000, 1, N'/icon/ba_chi_bo.jpg', N'Bò ba chỉ đậm đà, thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP012', N'KM002', N'Loai01', N'Bò-ba-chỉ', N'S', 18000, 1, N'/icon/ba_chi_bo.jpg', N'Bò ba chỉ đậm đà, thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP013', N'KM002', N'Loai01', N'Burrito', N'L', 38000, 1, N'goi_cuon_tom_thit.jpg', N'Bánh cuộn tôm, thịt đầy đặn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP013', N'KM002', N'Loai01', N'Burrito', N'M', 33000, 1, N'goi_cuon_tom_thit.jpg', N'Bánh cuộn tôm, thịt đầy đặn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP013', N'KM002', N'Loai01', N'Burrito', N'S', 28000, 1, N'goi_cuon_tom_thit.jpg', N'Bánh cuộn tôm, thịt đầy đặn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP014', N'KM002', N'Loai01', N'Cơm trộn', N'L', 40000, 1, N'/icon/com_chien_duong_chau.jpg', N'Cơm trộn thịt nướng độc đáo, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP014', N'KM002', N'Loai01', N'Cơm trộn', N'M', 35000, 1, N'/icon/com_chien_duong_chau.jpg', N'Cơm trộn thịt nướng độc đáo, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP014', N'KM002', N'Loai01', N'Cơm trộn', N'S', 30000, 1, N'/icon/com_chien_duong_chau.jpg', N'Cơm trộn thịt nướng độc đáo, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP015', N'KM002', N'Loai01', N'Gà xào hạt điều', N'L', 42000, 1, N'/icon/ga_xao_hat_dieu_thai.jpg', N'Gà xào hạt điều thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP015', N'KM002', N'Loai01', N'Gà xào hạt điều', N'M', 37000, 1, N'/icon/ga_xao_hat_dieu_thai.jpg', N'Gà xào hạt điều thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP015', N'KM002', N'Loai01', N'Gà xào hạt điều', N'S', 32000, 1, N'/icon/ga_xao_hat_dieu_thai.jpg', N'Gà xào hạt điều thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP016', N'KM002', N'Loai01', N'Gỏi đu đủ Thái', N'L', 45000, 1, N'/icon/goi_du_du_thai.jpg', N'Gỏi đu đủ Thái kiểu mới, mát lạnh.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP016', N'KM002', N'Loai01', N'Gỏi đu đủ Thái', N'M', 40000, 1, N'/icon/goi_du_du_thai.jpg', N'Gỏi đu đủ Thái kiểu  mới, mát lạnh.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP016', N'KM002', N'Loai01', N'Gỏi đu đủ Thái', N'S', 35000, 1, N'/icon/goi_du_du_thai.jpg', N'Gỏi đu đủ Thái kiểu mới, mát lạnh.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP017', N'KM002', N'Loai01', N'Gỏi hải sản', N'L', 28000, 1, N'/icon/goi_hai_san_thai.png', N'Gỏi hải sản đậm đà, thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP017', N'KM002', N'Loai01', N'Gỏi hải sản', N'M', 23000, 1, N'/icon/goi_hai_san_thai.png', N'Gỏi hải sản đậm đà, thơm ngon.')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP017', N'KM002', N'Loai01', N'Gỏi hải sản ', N'S', 18000, 1, N'/icon/goi_hai_san_thai.png', N'Gỏi hải sản đậm đà, thơm ngon.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP018', N'KM002', N'Loai02', N'Gỏi thịt băm thái', N'D', 45000, 1, N'/icon/goi_thit_bam_thai.jpg', N'Gỏi thịt băm thái ngọt thanh, hòa quyện cùng vị nhẹ nhàng của thịt bò tươi.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP019', N'KM002', N'Loai02', N'Mì cà ri vàng', N'D', 38000, 1, N'/icon/mi_ca_ri_vang_thai.jpg', N'Mì thơm ngon, mềm mịn, kết hợp với vị ngọt tự nhiên của cà ri.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP021', N'KM002', N'Loai02', N'Mì xào thái', N'D', 28000, 1, N'/icon/mi_xao_thai.jpg', N'Mì xào thái kết hợp với tôm và bò.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP022', N'KM002', N'Loai02', N'Sườn Thái cay', N'D', 32000, 1, N'/icon/suon_cay_thai.jpg', 'Sườn thái cay thơm mềm, vị cay đặc trưng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP023', N'KM002', N'Loai02', N'Tép nhảy Goong', N'D', 35000, 1, N'tep_nhay_goong_ten_thai.jpg', N'Tép nhảy Goong thơm ngon, đậm đà, giòn rụm ở ngoài và mềm mịn ở trong.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP024', N'KM002', N'Loai02', N'Thịt bò húng quế', N'D', 40000, 1, N'/icon/thit_bo_xao_hung_que_thai.jpeg', N'Thịt bò thơm ngon, mềm mịn, phủ lớp húng quế.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP026', N'KM002', N'Loai02', N'Thịt heo xiên nướng', N'D', 30000, 1, N'/icon/thit_heo_xien_nuong_thai.jpg', N'Thịt heo xiên nướng thái ngọt ngào, thơm ngon, cực kỳ hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP027', N'KM002', N'Loai02', N'Thịt xiên nướng phô mai', N'D', 35000, 1, N'/icon/thit_xien_nuong_pho_mai_thai.jpg', N'Thịt xiên nướng phô mai thơm ngon,  hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP028', N'KM002', N'Loai02', N'Xốt xoài Thái', N'D', 25000, 1, N'/icon/xoi_xoai_thai.jpg', N'Xốt xoài Thái ngọt ngào, thích hợp cho mọi dịp.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP029', N'KM002', N'Loai02', N'Bún cá Thái', N'D', 38000, 1, N'/icon/bun_ca_thai.jpg', N'Bún cá Thái thơm ngon, mềm mịn, vị Thái béo ngậy.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP030', N'KM002', N'Loai02', N'Cá Nướng muối', N'D', 20000, 1, N'/icon/ca_nuong_muoi_thai.jpg', N'Cá Nướng muối thơm ngon, giòn rụm, vị Thái đặc trưng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP031', N'KM002', N'Loai02', N'Cà ri đỏ Thái', N'D', 42000, 1, N'/icon/ca_ri_do_thai.jpg', N'Cà ri đỏ Thái bắt mắt, ngon miệng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP032', N'KM002', N'Loai02', N'Cà ri xanh Thái', N'D', 38000, 1, N'/icon/ca_ri_xanh_thai.jpg', N'Cà ri xanh Thái chanh thơm mát, chua dễ chịu, hòa quyện với vị ngọt.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP033', N'KM002', N'Loai02', N'Cánh gà chiên Thái', N'D', 35000, 1, N'/icon/canh_ga_chien_thai.jpg', N'Cánh gà chiên Thái thơm ngon, mềm mịn, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP034', N'KM002', N'Loai02', N'Cánh gà cốt dừa', N'D', 30000, 1, N'/icon/canh_ga_nau_cot_dua_thai.jpg', N'Cánh gà thơm ngon, giòn rụm, đầy đặn vị cốt dừa.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP035', N'KM002', N'Loai02', N'Canh chua Thái', N'D', 35000, 1, N'/icon/canh-chua-thai.jpg', N'Canh Thái mềm mịn, thơm ngon, phủ lớp chua.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP036', N'KM002', N'Loai02', N'Chả cá Thái', N'D', 45000, 1, N'/icon/cha_ca_thai.jpg', N'Chả cá Thái mềm mịn, đậm đà vị cay, kết hợp với sốt chua cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP037', N'KM002', N'Loai02', N'Cơm chiên dứa', N'D', 25000, 1, N'/icon/com_chien_dua.jpg', N'Cơm chiên dứa thơm ngon, đậm đà, hấp dẫn.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP038', N'KM002', N'Loai02', N'Cơm chiên Thái', N'D', 42000, 1, N'/icon/com_chien_thai.jpg', N'Cơm chiên thơm ngon, đậm đà vị thái, bên trên phủ lớp tôm.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP045', N'KM002', N'Loai03', N'Gà nấu riêng Thái ', N'L', 35000, 1, N'/icon/ga_nau_rieng_thai.jpg', N'Gà nấu riêng Thái  giàu vitamin và chất dinh dưỡng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP045', N'KM002', N'Loai03', N'Gà nấu riêng Thái ', N'M', 30000, 1, N'/icon/ga_nau_rieng_thai.jpg', N'Gà nấu riêng Thái  giàu vitamin và chất dinh dưỡng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP045', N'KM002', N'Loai03', N'Gà nấu riêng Thái ', N'S', 25000, 1, N'/icon/ga_nau_rieng_thai.jpg', N'Gà nấu riêng Thái  giàu vitamin và chất dinh dưỡng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP046', N'KM002', N'Loai03', N'Xôi xéo ruốc hành', N'L', 38000, 1, N'/icon/xoi_xeo_ruoc_hanh.jpg', N'Xôi xéo ruốc hành.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP046', N'KM002', N'Loai03', N'Xôi xéo ruốc hành', N'M', 33000, 1, N'/icon/xoi_xeo_ruoc_hanh.jpg', N'Xôi xéo ruốc hành.')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP046', N'KM002', N'Loai03', N'Xôi xéo ruốc hành', N'S', 28000, 1, N'/icon/xoi_xeo_ruoc_hanh.jpg', N'Xôi xéo ruốc hành')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP047', N'KM002', N'Loai03', N'Bạch tuột nướng sa tế', N'L', 36000, 1, N'/icon/bach_tuoc_nuong_sa_te.jpg', N'Bạch tuột nướng sa tế')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP047', N'KM002', N'Loai03', N'Bạch tuột nướng sa tế', N'M', 31000, 1, N'/icon/bach_tuoc_nuong_sa_te.jpg', N'Bạch tuột nướng sa tế')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP047', N'KM002', N'Loai03', N'Bạch tuột nướng sa tế', N'S', 26000, 1, N'/icon/bach_tuoc_nuong_sa_te.jpg', N'Bạch tuột nướng sa tế')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP048', N'KM002', N'Loai03', N'Chân gà nướng mật ong', N'L', 40000, 1, N'/icon/chan_ga_nuong_mat_ong.jpg', N'Chân gà nướng mật ong')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP048', N'KM002', N'Loai03', N'Chân gà nướng mật ong', N'M', 35000, 1, N'/icon/chan_ga_nuong_mat_ong.jpg', N'Chân gà nướng mật ong')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP048', N'KM002', N'Loai03', N'Chân gà nướng mật ong', N'S', 30000, 1, N'/icon/chan_ga_nuong_mat_ong.jpg', N'Chân gà nướng mật ong')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP049', N'KM002', N'Loai03', N'Đùi gà nướng bơ tỏi', N'L', 42000, 1, N'/icon/dui_ga_nuong_bo_toi.jpg', N'Đùi gà nướng bơ tỏi')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP049', N'KM002', N'Loai03', N'Đùi gà nướng bơ tỏi', N'M', 37000, 1, N'/icon/dui_ga_nuong_bo_toi.jpg', N'Đùi gà nướng bơ tỏi')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP049', N'KM002', N'Loai03', N'Đùi gà nướng bơ tỏi', N'S', 32000, 1, N'/icon/dui_ga_nuong_bo_toi.jpg', N'Đùi gà nướng bơ tỏi')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP050', N'KM002', N'Loai03', N'Gà nướng muối ớt', N'L', 42000, 1, N'/icon/ga_nuong_muoi_ot.png', N'Gà nướng muối ớt')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP050', N'KM002', N'Loai03', N'Gà nướng muối ớt', N'M', 37000, 1, N'/icon/ga_nuong_muoi_ot.png', N'Gà nướng muối ớt')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP050', N'KM002', N'Loai03', N'Gà nướng muối ớt', N'S', 32000, 1, N'/icon/ga_nuong_muoi_ot.png', N'Gà nướng muối ớt')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP051', N'KM002', N'Loai03', N'Hàu nướng mỡ hành', N'L', 37000, 1, N'/icon/hau_nuong_mo_hanh.jpg', N'Hàu nướng mỡ hành')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP051', N'KM002', N'Loai03', N'Hàu nướng mỡ hành', N'M', 32000, 1, N'/icon/hau_nuong_mo_hanh.jpg', N'Hàu nướng mỡ hành')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP051', N'KM002', N'Loai03', N'Hàu nướng mỡ hành', N'S', 27000, 1, N'/icon/hau_nuong_mo_hanh.jpg', N'Hàu nướng mỡ hành')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP052', N'KM002', N'Loai03', N'Lẩu bò nhúng ớt', N'L', 36000, 1, N'/icon/Lau_bo_nhung_ot.jpg', N'Lẩu bò nhúng ớt tươi mát, giàu vitamin và chất xơ.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP052', N'KM002', N'Loai03', N'Lẩu bò nhúng ớt', N'M', 31000, 1, N'/icon/Lau_bo_nhung_ot.jpg', N'Lẩu bò nhúng ớt tươi mát, giàu vitamin và chất xơ.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP052', N'KM002', N'Loai03', N'Lẩu bò nhúng ớt', N'S', 26000, 1, N'/icon/Lau_bo_nhung_ot.jpg', N'Lẩu bò nhúng ớt tươi mát, giàu vitamin và chất xơ.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP053', N'KM002', N'Loai03', N'Lẩu cá diêu hồng', N'L', 38000, 1, N'/icon/lau_ca_dieu_hong.jpg', N'Lẩu cá diêu hồng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP053', N'KM002', N'Loai03', N'Lẩu cá diêu hồng', N'M', 33000, 1, N'/icon/lau_ca_dieu_hong.jpg', N'Lẩu cá diêu hồng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP053', N'KM002', N'Loai03', N'Lẩu cá diêu hồng', N'S', 28000, 1, N'/icon/lau_ca_dieu_hong.jpg', N'Lẩu cá diêu hồng.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP054', N'KM002', N'Loai03', N'Lẩu cá hồi', N'L', 30000, 1, N'/icon/lau_ca_hoi.jpg', N'Lẩu cá hồi cay dịu, là một lựa chọn tuyệt vời để giải khát trong ngày mưa.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP054', N'KM002', N'Loai03', N'Lẩu cá hồi', N'M', 25000, 1, N'/icon/lau_ca_hoi.jpg', N'Lẩu cá hồi cay dịu, là một lựa chọn tuyệt vời để giải khát trong ngày mưa.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP054', N'KM002', N'Loai03', N'Lẩu cá hồi', N'S', 20000, 1, N'/icon/lau_ca_hoi.jpg', N'Lẩu cá hồi cay dịu, là một lựa chọn tuyệt vời để giải khát trong ngày mưa.')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP055', N'KM002', N'Loai03', N'Lẩu cá tầm', N'L', 32000, 1, N'/icon/lau_ca_tam.jpg', N'Lẩu cá tầm ngọt dịu, thơm mát, là sự kết hợp hoàn hảo giữa vị chua của lẩu và ngọt của cá tầm.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP055', N'KM002', N'Loai03', N'Lẩu cá tầm', N'M', 27000, 1, N'/icon/lau_ca_tam.jpg', N'Lẩu cá tầm ngọt dịu, thơm mát, là sự kết hợp hoàn hảo giữa vị chua của lẩu và ngọt của cá tầm.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP056', N'KM002', N'Loai03', N'Lẩu ếch', N'L', 32000, 1, N'/icon/lau_ech_mang_cay.jpg', N'Lẩu ếch bị cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP056', N'KM002', N'Loai03', N'Lẩu ếch', N'M', 27000, 1, N'/icon/lau_ech_mang_cay.jpg', N'Lẩu ếch bị cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP056', N'KM002', N'Loai03', N'Lẩu ếch', N'S', 22000, 1, N'/icon/lau_ech_mang_cay.jpg', N'Lẩu ếch bị cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP058', N'KM002', N'Loai03', N'lẩu gà', N'L', 34000, 1, N'/icon/lau_ga.jpg', N'lẩu gà.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP058', N'KM002', N'Loai03', N'lẩu gà', N'M', 29000, 1, N'/icon/lau_ga.jpg', N'lẩu gà.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP058', N'KM002', N'Loai03', N'lẩu gà', N'S', 24000, 1, N'/icon/lau_ga.jpg', N'lẩu gà.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP059', N'KM002', N'Loai03', N'Lẩu à lá é', N'L', 34000, 1, N'/icon/lau_ga_la_e.jpg', N'Lẩu gà chua dễ chịu, thêm hương thơm của lá é, là lựa chọn lý tưởng cho một mưa tầm tã.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP059', N'KM002', N'Loai03', N'Lẩu à lá é', N'M', 29000, 1, N'/icon/lau_ga_la_e.jpg', N'Lẩu gà chua dễ chịu, thêm hương thơm của lá é, là lựa chọn lý tưởng cho một mưa tầm tã.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP059', N'KM002', N'Loai03', N'Lẩu à lá é', N'S', 24000, 1, N'/icon/lau_ga_la_e.jpg', N'Lẩu gà chua dễ chịu, thêm hương thơm của lá é, là lựa chọn lý tưởng cho một mưa tầm tã.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP05S', N'KM002', N'Loai03', N'lẩu kim chi', N'S', 22000, 1, N'/icon/lau_kim_chi.jpg', N'Lẩu kim chi .')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP060', N'KM002', N'Loai03', N'lẩu Thái bò nấm', N'L', 35000, 1, N'/icon/lau_thai_bo_nam.jpg', N'lẩu Thái vị chua ngọt, giàu vitamin và thịt bò nấm.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP060', N'KM002', N'Loai03', N'lẩu Thái bò nấm', N'M', 30000, 1, N'/icon/lau_thai_bo_nam.jpg', N'lẩu Thái vị chua ngọt, giàu vitamin và thịt bò nấm.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP060', N'KM002', N'Loai03', N'lẩu Thái bò nấm', N'S', 25000, 1, N'/icon/lau_thai_bo_nam.jpg', N'lẩu Thái vị chua ngọt, giàu vitamin và thịt bò nấm.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP061', N'KM002', N'Loai03', N'lẩu Thái chua cay', N'L', 35000, 1, N'/icon/lau_thai_chua_cay.jpg', N'lẩu Thái chua cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP061', N'KM002', N'Loai03', N'lẩu Thái chua cay', N'M', 30000, 1, N'/icon/lau_thai_chua_cay.jpg', N'lẩu Thái chua cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP061', N'KM002', N'Loai03', N'lẩu Thái chua cay', N'S', 25000, 1, N'/icon/lau_thai_chua_cay.jpg', N'lẩu Thái chua cay.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP062', N'KM002', N'Loai03', N'lẩu Thái hải sản', N'L', 38000, 1, N'/icon/lau_thai_hai_san.jpg', N'lẩu Thái hải sản.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP062', N'KM002', N'Loai03', N'lẩu Thái hải sản', N'M', 33000, 1, N'/icon/lau_thai_hai_san.jpg', N'lẩu Thái hải sản.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP062', N'KM002', N'Loai03', N'lẩu Thái hải sản', N'S', 28000, 1, N'/icon/lau_thai_hai_san.jpg', N'lẩu Thái hải sản.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP063', N'KM002', N'Loai03', N'Lẩu vịt hun khói', N'L', 38000, 1, N'/icon/lau_vit_hun_khoi.jpg', N'Lẩu vịt hun khói.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP063', N'KM002', N'Loai03', N'Lẩu vịt hun khói', N'M', 33000, 1, N'/icon/lau_vit_hun_khoi.jpg', N'Lẩu vịt hun khói.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP063', N'KM002', N'Loai03', N'Lẩu vịt hun khói', N'S', 28000, 1, N'/icon/lau_vit_hun_khoi.jpg', N'Lẩu vịt hun khói.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP064', N'KM002', N'Loai03', N'Mực nướng sa tế', N'L', 36000, 1, N'/icon/muc_nuong_sa_te.jpg', N'Mực nướng sa tế.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP064', N'KM002', N'Loai03', N'Mực nướng sa tế', N'M', 31000, 1, N'/icon/muc_nuong_sa_te.jpg', N'Mực nướng sa tế.')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP064', N'KM002', N'Loai03', N'Mực nướng sa tế', N'S', 26000, 1, N'/icon/muc_nuong_sa_te.jpg', N'Mực nướng sa tế.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP065', N'KM002', N'Loai03', N'Ramen', N'L', 35000, 1, N'/icon/ramen.jpg', N'Ramen.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa]) 
VALUES (N'SP065', N'KM002', N'Loai03', N'Ramen', N'M', 30000, 1, N'/icon/ramen.jpg', N'Ramen.')
INSERT [dbo].[SanPham] ([MaSanPham], [KhuyenMai], [LoaiSanPham], [TenSanPham], [KichThuoc], [Gia], [TrangThai], [HinhAnh], [MoTa])
VALUES (N'SP065', N'KM002', N'Loai03', N'Ramen', N'S', 25000, 1, N'/icon/ramen.jpg', N'Ramen.')
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [LoaiTaiKhoan]) VALUES (N'TK000', N'DongVanXuong', N'pass', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [LoaiTaiKhoan]) VALUES (N'TK003', N'long', N'1', 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [LoaiTaiKhoan]) VALUES (N'TK002', N'ngoc', N'2', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [LoaiTaiKhoan]) VALUES (N'TK001', N'quang', N'password', 1)
GO
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA01', N'NV000', CAST(N'2025-04-27' AS Date), 1500000)
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA01', N'NV001', CAST(N'2025-05-07' AS Date), 1500000)
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA01', N'NV002', CAST(N'2025-05-08' AS Date), 1500000)
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA02', N'NV001', CAST(N'2025-05-08' AS Date), 1500000)
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA02', N'NV002', CAST(N'2025-05-07' AS Date), 1500000)
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA03', N'NV002', CAST(N'2025-04-27' AS Date), 1200000)
INSERT [dbo].[ThongTinCa] ([MaCa], [MaNhanVien], [NgayLam], [TongDoanhThu]) VALUES (N'CA03', N'NV002', CAST(N'2025-06-11' AS Date), 335000)
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon] FOREIGN KEY([HoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([SanPham], [KichThuoc])
REFERENCES [dbo].[SanPham] ([MaSanPham], [KichThuoc])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HD_Ban] FOREIGN KEY([Ban])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HD_Ban]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HD_KH] FOREIGN KEY([KhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HD_KH]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NV] FOREIGN KEY([NhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NV]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NV] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_TaiKhoan_NV]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_KhuyenMai] FOREIGN KEY([KhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([MaKhuyenMai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_KhuyenMai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([LoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
ALTER TABLE [dbo].[ThongTinCa]  WITH CHECK ADD  CONSTRAINT [FK_NV_Ca_CaLam] FOREIGN KEY([MaCa])
REFERENCES [dbo].[CaLam] ([MaCa])
GO
ALTER TABLE [dbo].[ThongTinCa] CHECK CONSTRAINT [FK_NV_Ca_CaLam]
GO
ALTER TABLE [dbo].[ThongTinCa]  WITH CHECK ADD  CONSTRAINT [FK_NV_Ca_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ThongTinCa] CHECK CONSTRAINT [FK_NV_Ca_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [QLNH] SET  READ_WRITE 
GO
