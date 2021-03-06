CREATE DATABASE [ToDoListDB]

begin
EXEC [ToDoListDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToDoListDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToDoListDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToDoListDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToDoListDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToDoListDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToDoListDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToDoListDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ToDoListDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToDoListDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToDoListDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToDoListDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToDoListDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToDoListDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToDoListDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToDoListDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToDoListDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToDoListDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToDoListDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToDoListDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToDoListDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToDoListDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToDoListDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToDoListDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToDoListDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToDoListDB] SET  MULTI_USER 
GO
ALTER DATABASE [ToDoListDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToDoListDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToDoListDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToDoListDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ToDoListDB]
GO
/****** Object:  StoredProcedure [dbo].[AddTask]    Script Date: 23/09/2021 17:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddTask] 
	-- Add the parameters for the stored procedure here
	@DESCRIPTION NVARCHAR(255),
	@ISFINISHED BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Tasks(description, isFinished) VALUES (@DESCRIPTION, @ISFINISHED)
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteTask]    Script Date: 23/09/2021 17:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTask] 
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Tasks WHERE id = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[SelectAllTasks]    Script Date: 23/09/2021 17:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllTasks]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Tasks
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateTask]    Script Date: 23/09/2021 17:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTask]
	-- Add the parameters for the stored procedure here
	@ID INT,
	@DESCRIPTION NVARCHAR(255),
	@ISFINISHED BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Tasks SET description=@DESCRIPTION, isFinished=@ISFINISHED WHERE id=@ID
END

GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 23/09/2021 17:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[isFinished] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [ToDoListDB] SET  READ_WRITE 
GO
