USE [fastcover]
GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 3/20/2017 9:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployChecksum]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployChecksum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [nvarchar](32) NOT NULL,
	[entityGuid] [uniqueidentifier] NULL,
	[entityPath] [nvarchar](256) NULL,
	[localChecksum] [nvarchar](32) NOT NULL,
	[compositeChecksum] [nvarchar](32) NULL,
 CONSTRAINT [PK_umbracoDeployChecksum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployDependency]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployDependency](
	[sourceId] [int] NOT NULL,
	[targetId] [int] NOT NULL,
	[mode] [int] NOT NULL,
 CONSTRAINT [PK_umbracoDeployDependency] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC,
	[targetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 3/20/2017 9:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1050, 1048)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1048, N'contentHubPage', N'icon-document', N'folder.png', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', CAST(0x0000A73C012EE9D0 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (2, 1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', CAST(0x0000A73C012F1FBF AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (3, 1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', CAST(0x0000A73C015349F4 AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1050, N'<contentHubPage id="1050" key="6e0ed2e1-19cd-4cba-bfff-f644a44066da" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-03-20T18:22:52" updateDate="2017-03-20T20:35:18" nodeName="Stacked Numbered Info" urlName="stacked-numbered-info" path="-1,1050" isDoc="" nodeType="1048" creatorName="Harshwardhan Dangra" writerName="Harshwardhan Dangra" writerID="0" template="1047" nodeTypeAlias="contentHubPage"><gridLayout><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "label": "Headline",
          "name": "Headline",
          "areas": [
            {
              "grid": 12,
              "hasConfig": false,
              "controls": [
                {
                  "value": null,
                  "editor": {
                    "alias": "fcstackednumberinfo"
                  },
                  "active": true
                }
              ],
              "hasActiveChild": true,
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "797c3b2b-36a5-ce35-69d5-ced1be6c05f9",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}]]></gridLayout></contentHubPage>')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (16, 1034, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (17, 1035, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (18, 1036, N'Umbraco.MemberPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (21, 1040, N'Umbraco.RelatedLinks', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (25, 1045, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1046, N'Umbraco.Grid', N'Ntext')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'updateDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'username', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1045, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1046, N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})"
    }
  ],
  "config": [
    {
      "label": "Class",
      "description": "Set a css class",
      "key": "class",
      "view": "textstring"
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    },
    {
      "name": "2 column layout",
      "sections": [
        {
          "grid": 4
        },
        {
          "grid": 8
        }
      ]
    }
  ],
  "layouts": [
    {
      "label": "Headline",
      "name": "Headline",
      "areas": [
        {
          "grid": 12,
          "editors": [
            "headline"
          ]
        }
      ]
    },
    {
      "label": "Article",
      "name": "Article",
      "areas": [
        {
          "grid": 4
        },
        {
          "grid": 8
        }
      ]
    }
  ]
}', 1, N'items')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1046, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 2, N'rte')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', N'Orange Linked Boxes v2 (FC21-Orange Linked Boxes v2)', NULL, NULL, CAST(0x0000A73C012EE9D0 AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'45c5ce21-474c-4c98-ac37-74166a0cd174', N'Orange Linked Boxes v2 (FC21-Orange Linked Boxes v2)', NULL, NULL, CAST(0x0000A73C012F1FBF AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 1, 0, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', N'Stacked Numbered Info', NULL, NULL, CAST(0x0000A73C015349F4 AS DateTime), 1047, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1048, 1047, 1)
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', CAST(0x0000A73C012EE9ED AS DateTime), N'<contentHubPage id="1050" key="6e0ed2e1-19cd-4cba-bfff-f644a44066da" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-03-20T18:22:52" updateDate="2017-03-20T18:22:52" nodeName="Orange Linked Boxes v2 (FC21-Orange Linked Boxes v2)" urlName="orange-linked-boxes-v2-fc21-orange-linked-boxes-v2" path="-1,1050" isDoc="" nodeType="1048" creatorName="Harshwardhan Dangra" writerName="Harshwardhan Dangra" writerID="0" template="1047" nodeTypeAlias="contentHubPage" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', CAST(0x0000A73C012F1FCE AS DateTime), N'<contentHubPage id="1050" key="6e0ed2e1-19cd-4cba-bfff-f644a44066da" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-03-20T18:22:52" updateDate="2017-03-20T18:23:38" nodeName="Orange Linked Boxes v2 (FC21-Orange Linked Boxes v2)" urlName="orange-linked-boxes-v2-fc21-orange-linked-boxes-v2" path="-1,1050" isDoc="" nodeType="1048" creatorName="Harshwardhan Dangra" writerName="Harshwardhan Dangra" writerID="0" template="1047" nodeTypeAlias="contentHubPage"><gridLayout><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "label": "Headline",
          "name": "Headline",
          "areas": [
            {
              "grid": 12,
              "hasConfig": false,
              "controls": [
                {
                  "value": null,
                  "editor": {
                    "alias": "orangelinkedboxesv2"
                  },
                  "active": true,
                  "radiocollection": [
                    {
                      "text": "Left",
                      "value": "left"
                    },
                    {
                      "text": "Right",
                      "value": "right"
                    }
                  ],
                  "imagealign": "left",
                  "imagealign1": "left",
                  "imagealign2": "left",
                  "imagealign3": "left"
                }
              ],
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "797c3b2b-36a5-ce35-69d5-ced1be6c05f9",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}]]></gridLayout></contentHubPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', CAST(0x0000A73C01534ADE AS DateTime), N'<contentHubPage id="1050" key="6e0ed2e1-19cd-4cba-bfff-f644a44066da" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-03-20T18:22:52" updateDate="2017-03-20T20:35:18" nodeName="Stacked Numbered Info" urlName="stacked-numbered-info" path="-1,1050" isDoc="" nodeType="1048" creatorName="Harshwardhan Dangra" writerName="Harshwardhan Dangra" writerID="0" template="1047" nodeTypeAlias="contentHubPage"><gridLayout><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "label": "Headline",
          "name": "Headline",
          "areas": [
            {
              "grid": 12,
              "hasConfig": false,
              "controls": [
                {
                  "value": null,
                  "editor": {
                    "alias": "fcstackednumberinfo"
                  },
                  "active": true
                }
              ],
              "hasActiveChild": true,
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "797c3b2b-36a5-ce35-69d5-ced1be6c05f9",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}]]></gridLayout></contentHubPage>')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1050, N'047264f5-1b53-4ff8-a2b1-3e3b9b50b7d5', 35, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', 39, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "label": "Headline",
          "name": "Headline",
          "areas": [
            {
              "grid": 12,
              "hasConfig": false,
              "controls": [
                {
                  "value": null,
                  "editor": {
                    "alias": "orangelinkedboxesv2"
                  },
                  "active": true,
                  "radiocollection": [
                    {
                      "text": "Left",
                      "value": "left"
                    },
                    {
                      "text": "Right",
                      "value": "right"
                    }
                  ],
                  "imagealign": "left",
                  "imagealign1": "left",
                  "imagealign2": "left",
                  "imagealign3": "left"
                }
              ],
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "797c3b2b-36a5-ce35-69d5-ced1be6c05f9",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1050, N'45c5ce21-474c-4c98-ac37-74166a0cd174', 35, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', 39, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "label": "Headline",
          "name": "Headline",
          "areas": [
            {
              "grid": 12,
              "hasConfig": false,
              "controls": [
                {
                  "value": null,
                  "editor": {
                    "alias": "fcstackednumberinfo"
                  },
                  "active": true
                }
              ],
              "hasActiveChild": true,
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "797c3b2b-36a5-ce35-69d5-ced1be6c05f9",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1050, N'43b7c584-dea5-4b1a-8894-9a477e788ad6', 35, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, -88, 1048, 12, N'title', N'Title', 0, 0, NULL, NULL, N'fd4f7378-eb6a-41dc-aa22-ea9f84ca2bab')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -88, 1048, 12, N'metaDescription', N'Meta Description', 1, 0, NULL, NULL, N'67a33b11-c1ff-4878-9e8a-7762a78e8bcc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, -88, 1048, 12, N'heading1', N'Heading1', 2, 0, NULL, NULL, N'0b2b3de4-1a9d-4f38-bada-7dcbac176c34')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (38, -88, 1048, 12, N'headingtext', N'Headingtext', 3, 0, NULL, NULL, N'e5675ea7-88bd-40cf-9429-414540ac7a3b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (39, 1046, 1048, 12, N'gridLayout', N'GridLayout', 4, 0, NULL, NULL, N'0d7752e0-9e94-4c29-84e0-d642c42a4621')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1048, N'Content', 0, N'dfe058e0-9cf0-4ddb-83d0-1a389b19eefe')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (1, 1047, N'ContentHubPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "MasterSite2015.cshtml";
}
@section HeadAdditionalTags{
    <title>@Umbraco.Field("title")</title>
    <meta name="description" content="@Umbraco.Field(" metaDescription")">
}
<script type="text/javascript">
    $(document).ready(function () {

        $(".expander").click(function () {
            var theHref;
            if ($(this).hasClass(''expander'')) {
                theHref = $(this);
            }
            else {
                theHref = $(this).parentsUntil(''.expander'');
            }
            if (theHref.hasClass(''expanded'')) {
                theHref.find(''.expandercontent'').slideUp(500);
                theHref.removeClass(''expanded'');
            }
            else {
                theHref.find(''.expandercontent'').slideDown(500);
                theHref.addClass(''expanded'');
            }
            //$(this).parent().find(''.expandercontent'').slideDown(500);
            return false;
        }); // end of expander click



        $("div.disinf.chgridrte h3").click(function () {
            if ($(this).hasClass("expanded")) {
                $(this).nextUntil("h3").not("hr").slideUp(500);
                $(this).removeClass("expanded");
            }
            else {
                $(this).nextUntil("h3").slideDown(500);
                $(this).addClass("expanded");
            }


            /*
            var theHref;
            if ($(this).hasClass(''expanded'')) {
            theHref = $(this);
            }
            else {
            theHref = $(this).parentsUntil(''.expander'');
            }
            if (theHref.hasClass(''expanded'')) {
            theHref.find(''.expandercontent'').slideUp(500);
            theHref.removeClass(''expanded'');
            }
            else {
            theHref.find(''.expandercontent'').slideDown(500);
            theHref.addClass(''expanded'');
            }
            */
            //$(this).parent().find(''.expandercontent'').slideDown(500);
            return false;
        }); // end of expander click





    });    // end of document.ready
</script>

<style>
    body, .body, .page-head::after {
        background: #F4F4F4;
    }

    .grid-section {
        color: #7F7F7F;
        font-size: 16px;
    }

        .grid-section ol, .grid-section ul {
            list-style-type: none;
        }

    .col-sm-8.column {
        width: 75%;
        float: left;
    }

    .col-sm-4.column {
        width: 25%;
        float: left;
    }

    .umb-grid .container {
        margin-top: 40px;
        width: 100%;
    }

    .wideimage75pc {
        max-width: 75%;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }

    /*.chsectionHeading {
        width: 100%;
        max-height: 200px;
        min-height: 68px;
        margin-bottom: 20px;
    }

    .chheading {
        color: #FFF;
        background: #F1592A;
        width: 100%;
        min-height: 68px;
        display: table;
        position: relative;
        bottom: 0px;
        clear: both;
        border-radius: 20px;
        display: table;
    }

        .chheading h2 {
            color: #FFF;
            line-height: 1.0;
            font-size: 30px;
            letter-spacing: 6px;
            padding-left: 2%;
            font-weight: 700;
            display: table-cell;
            vertical-align: middle;
            width: 70%;
            position: relative;
            min-height: 68px;

        }

    .chheadingimg1 {
        float: right;
        position: absolute;
        right: 20px;
        bottom: 0px;
        display: inline-block;
        max-width: 10%;
    }

        .chheadingimg1 img {
            width: 100%;
        }

    .chgridrte h3 {
        color: #eb4f1d;
        font-size: 35px;
        line-height: 50px;
    }

    .chgridrte hr {
        border: 1px dashed #eb4f1d;
    }*/

    .expander div.outter {
        position: relative;
        margin-left: auto;
        margin-right: auto;
    }

        .expander div.outter.narrow {
            width: 70%;
        }

        .expander div.outter.wide {
            width: 100%;
        }

        .expander div.outter div.heading {
            font-size: 18px;
            line-height: 20px;
            border: 4px solid #eb4f1d;
            background: #eb4f1d;
            padding-left: 50%;
            padding-bottom: 10px;
            padding-top: 10px;
            padding-left: 2%;
            padding-right: 2%;
            color: White;
            width: 100%;
            float: left;
            text-align: center;
        }

            .expander div.outter div.heading div.readmore {
                float: right;
                right: 2%;
                padding-bottom: 10px;
                padding-top: 10px;
                background: #eb4f1d;
                line-height: 20px;
                font-size: 15px;
                border: 4px solid #eb4f1d;
                color: White;
                position: absolute;
                top: 0px;
            }

    .expander div.readmore.up, .expander.expanded div.readmore.down {
        display: none;
    }

    .expander div.readmore.down, .expander.expanded div.readmore.up {
        display: block;
    }

    .expander div.outter div.text {
        margin-top: 0px;
        font-size: 18px;
        padding-bottom: 15px;
        color: #7F7F7F;
        padding-top: 20px;
        padding-left: 2%;
        padding-right: 2%;
        display: none;
    }

    .expander div.outter.narrow div.text {
        border: 4px solid #eb4f1d;
    }

    .expander div.outter.wide div.heading {
        font-size: 36px;
        line-height: 36px;
        margin-bottom: 5px;
    }

    .expander div.outter.wide div.expandercontent img {
        width: 100%;
    }

    .expander .expandercontent {
        display: none;
    }



    div.heading2outter {
        width: 90%;
        position: relative;
        margin-left: auto;
        margin-right: auto;
    }

        div.heading2outter div.himage {
            width: 12.5%;
            float: left;
            text-align: center;
        }

            div.heading2outter div.himage img {
                width: 100%;
                max-height: 80px;
            }

        div.heading2outter div.heading2 {
            width: 75%;
            float: left;
        }

    div.heading2 div.heading2table {
        width: 100%;
        color: #FFF;
        text-align: center;
        background: #eb4f1d;
        min-height: 80px;
        display: table;
    }

    div.heading2 div.heading2cell {
        display: table-cell;
        line-height: 40px;
        font-size: 40px;
        font-weight: 500;
        vertical-align: middle;
    }

    div.heading2 div.summary {
        width: 100%;
        margin-top: 20px;
        text-align: center;
    }

    div.imgcols {
        width: 50%;
        padding-left: 5%;
        padding-right: 5%;
        float: left;
    }

        div.imgcols .img {
            width: 75%;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            max-width: 250px;
        }

            div.imgcols .img img {
                width: 100%;
            }

        div.imgcols .heading {
            margin-top: 20px;
            font-weight: 600;
            width: 100%;
            text-align: center;
            color: #eb4f1d;
            font-size: 30px;
            line-height: 50px;
        }

        div.imgcols .expander {
            width: 100%;
            margin-bottom: 20px;
        }

            div.imgcols .expander .readmore {
                width: 100%;
                text-align: center;
            }

            div.imgcols .expander .expandercontent {
                width: 100%;
            }

    div.onesix {
        width: 16.6%;
        float: left;
        z-index: 10;
    }

        div.onesix:after {
            content: "";
            position: relative;
            z-index: 5;
            top: 0;
            bottom: 0;
            left: 50%;
            border-left: 4px solid #EB4F1C;
            line-height: 200px;
            font-size: 160px;
        }

        div.onesix img {
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
            position: relative;
        }

    /* diseases and infctions */
    div.vaccinations .rte1 {
        margin-top: 40px;
        border: 4px solid #EB4F1C;
        border-radius: 10px;
        padding-bottom: 5px;
        color: #7F7F7F;
        padding-top: 10px;
        padding-left: 1%;
        padding-right: 1%;
    }

    div.vaccinations div.rightimage {
        width: 100%;
        text-align: right;
    }

        div.vaccinations div.rightimage img {
            max-width: 15%;
            position: relative;
            margin-left: auto;
            margin-right: -2%;
            display: block;
            margin-top: -3%;
        }

    div.vaccinations div.subheading {
        margin-top: -8%;
    }

        div.vaccinations div.subheading div.orangebg {
            background: #EB4F1C;
            PADDING-right: 20%;
            border-radius: 10px 0px 0px 0px;
            float: right;
            color: #FFF;
            padding-left: 5%;
            margin-top: 0%;
            height: 40px;
            font-weight: bold;
            padding-top: 4px;
        }

            div.vaccinations div.subheading div.orangebg div.heading {
                height: 40px;
                font-size: 25px;
                letter-spacing: 6px;
                display: table-cell;
                vertical-align: middle;
            }

    div.vaccinations div.subheadingrte {
        clear: both;
        margin-top: 0px;
        border: 4px solid #EB4F1C;
        border-radius: 10px;
        padding-bottom: 25px;
        color: #7F7F7F;
        padding-top: 10px;
        padding-right: 20%;
        padding-left: 3%;
    }

    div.vaccinations div.warningheading {
        width: 100%;
        clear: both;
        padding-left: 0%;
        padding-right: 0%;
        height: 100px;
        position: relative;
        top: -60px;
        z-index: 20;
    }

        div.vaccinations div.warningheading div.textandcircle {
            position: absolute;
            top: 15px;
            height: 70px;
            background: #EB4F1C;
            color: #FFF;
            width: 70%;
            left: 15%;
            text-align: center;
            font-size: 28px;
            font-weight: 700;
            line-height: 70px;
            float: right;
            z-index: 20;
        }

            div.vaccinations div.warningheading div.textandcircle div.leftext {
                float: left;
                width: 40%;
                text-align: right;
                padding-right: 5%;
                letter-spacing: 6px;
            }

            div.vaccinations div.warningheading div.textandcircle div.circle {
                float: left;
                background: url(''/media/13967/big-dash-circle.svg'') no-repeat;
                background-size: contain;
                background-position: 50%;
                line-height: 16px;
                font-size: 12px;
                height: 150px;
                width: 20%;
                padding: 0px 15px 0px 15px;
                margin-top: -40px;
            }

                div.vaccinations div.warningheading div.textandcircle div.circle span {
                    display: inline-block;
                    line-height: normal;
                    vertical-align: middle;
                    margin-top: 35px;
                    font-size: 13px;
                    line-height: 18px;
                }

            div.vaccinations div.warningheading div.textandcircle div.righttext {
                float: left;
                width: 40%;
                text-align: left;
                padding-left: 5%;
                letter-spacing: 6px;
            }

        div.vaccinations div.warningheading img.warning {
            margin-left: 10%;
            float: left;
            position: absolute;
            height: 100%;
            z-index: 20;
        }

            div.vaccinations div.warningheading img.warning.right {
                right: 10%;
                margin-left: 0%;
            }

    div.disinf.chgridrte p {
        display: none;
    }

    div.disinf.chgridrte hr {
        width: 50%;
    }

    div.disinf.chgridrte h3 {
        margin-bottom: 30px;
    }

        div.disinf.chgridrte h3.expanded {
            margin-bottom: 0px;
        }

        div.disinf.chgridrte h3:hover {
            cursor: pointer;
        }

        div.disinf.chgridrte h3:after {
            content: ''\25BC'';
            line-height: 20px;
            font-size: 20px;
            position: absolute;
            left: 0px;
            width: 100%;
            text-align: center;
            margin-top: 50px;
        }

        div.disinf.chgridrte h3.expanded:after {
            content: "";
        }

    /*div.chrichtext h2 {
        font-size: 25px;
        font-weight: 700;
        padding-bottom: 20px;
    }

    div.chrichtext p {
        padding-bottom: 15px;
    }

    div.chrichtext h4 {
        font-size: 150%;
        font-weight: bold;
    }*/

    div.imgMobAlt {
        width: 50%;
        margin-left: 25%;
    }

    @@media screen and (max-width: 767px) {
        /*.chheading {
            z-index: 5;
        }

            .chheading h2 {
                width: 100%;
                text-align: center;
                z-index: 150;
                position: relative;
            }*/

        .chheadingimg1 {
            right: 40%;
            width: 20%;
            z-index: 100;
        }

        .expander div.outter {
            width: 90%;
        }

        div.heading2 div.heading2table {
            min-height: 50px;
        }

        div.heading2 div.heading2cell {
            font-size: 25px;
            line-height: 30px;
        }

        .expander div.outter.wide div.heading {
            font-size: 24px;
            line-height: 24px;
        }
    }

    @@media screen and (max-width: 480px) {
        div.imgcols {
            width: 100%;
            padding-left: 10%;
            padding-right: 10%;
            padding-bottom: 20px;
        }

        div.imgMobAlt {
            width: 75%;
            margin-left: 12.5%;
        }
    }
</style>

<div class="page-head">
    <div class="over">
        <div class="left-man cl"><div class="svg svg-man-q svg-man-q-dims"></div></div>
    </div>
    <div class="container">
        <h1>@Umbraco.Field("heading1")</h1>
        <p>@Umbraco.Field("headingtext")</p>
    </div>
</div>
<div class="body">
    <div class="container">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        @CurrentPage.GetGridHtml("gridLayout")

        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>

    </div>

</div>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (2, 1049, N'MasterSite2015', N'@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
    Layout = null;
}
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <link rel="apple-touch-icon" sizes="57x57" href="https://fastcover.com.au/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="https://fastcover.com.au/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="https://fastcover.com.au/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="https://fastcover.com.au/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="https://fastcover.com.au/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="https://fastcover.com.au/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="https://fastcover.com.au/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="https://fastcover.com.au/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="https://fastcover.com.au/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="https://fastcover.com.au/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="https://fastcover.com.au/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="https://fastcover.com.au/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="https://fastcover.com.au/manifest.json">
    <link rel="mask-icon" href="https://fastcover.com.au/safari-pinned-tab.svg" color="#ff4d15">
    <meta name="msapplication-TileColor" content="#2b5797">
    <meta name="msapplication-TileImage" content="https://fastcover.com.au/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <meta name="msvalidate.01" content="E9A670D6464947160AE43EBE892D7782" />
    <link rel="stylesheet" href="https://fastcover.com.au/css/app.css?v=@DateTime.Now.ToString("ddmmyyHHMMss")" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="https://fastcover.com.au/css/sprite.css?v=@DateTime.Now.ToString("ddmmyyHHMMss")" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="https://fastcover.com.au/css/animate.css?v=@DateTime.Now.ToString("ddmmyyHHMMss")" type="text/css" media="screen, projection" />
    <link href="~/css/chub.css?v=@DateTime.Now.ToString("ddmmyyHHMMss")" rel="stylesheet" type="text/css" media="screen, projection" />
    <script type="text/javascript" src="https://fastcover.com.au/scripts/Site2015JS/oldbrowser.js?v=@DateTime.Now.ToString("ddmmyyHHMMss")"></script>
    <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js?v=@DateTime.Now.ToString("ddmmyyHHMMss")"></script>
    <![endif]-->
    <!-- structured data for Google -->
    <script type="application/ld+json">
        @*{
                "@context": "http://schema.org",
                "@type": "LocalBusiness",
                "name": "Fast Cover",
                "address": {
                    "@type": "PostalAddress",
                    "streetAddress": "Suite 2, Level 15, 9 Castlereagh Street",
                    "addressLocality": "Sydney",
                    "addressRegion": "NSW",
                    "postalCode": "2000"
                },
                "telephone": "+611300409322",
                "email":"enquiries@fastcover.com.au",
                "@type" : "Organization",
                "name" : "Fast Cover",
                "logo" : "https://fastcover.com.au/img/logo.svg",
                "url" : "https://fastcover.com.au/",
                "sameAs" : [
                    "https://www.facebook.com/fastcover",
                    "https://www.linkedin.com/company/fast-cover-travel-insurance",
                    "https://plus.google.com/+FastcoverAustralia/posts",
                    "https://twitter.com/FastCover",
                    "http://pinterest.com/fastcover/",
                    "http://instagram.com/fastcovertravel"
                ]
            }*@
        @RenderSection("HeadAdditionalTags", false)
    </script>
    <title></title>
    <meta name="description" content="">
    <meta name="robots" content="noindex,nofollow" />
</head>
<body>
    <header id="header">
        <div class="container header-box">
            <a href="/" id="logo" title="Fastcover"></a>
            <div class="phone"><a href="tel:1300409322"><div class="svg svg-phone svg-phone-dims"></div><span class="google_number">1300 409 322</span></a></div>
            <nav id="menu">
                <div class="trigger"></div>
                <ul>
                    <li>
                        <a href="#">Travel Insurance</a>
                        <div class="dropdown-full">
                            <div class="col">
                                <p class="mhead">Traveller Type</p>
                                <ul>
                                    <li><a href="/solo-travel-insurance"><div class="svg svg-m1 svg-m1-dims"></div>Solo</a></li>
                                    <li><a href="/student-travel-insurance"><div class="svg svg-m2 svg-m2-dims"></div>Student</a></li>
                                    <li><a href="/couples-travel-insurance"><div class="svg svg-m3 svg-m3-dims"></div>Couple</a></li>
                                    <li><a href="/friends-travel-insurance"><div class="svg svg-m4 svg-m4-dims"></div>Friends</a></li>
                                    <li><a href="/group-travel-insurance"><div class="svg svg-m5 svg-m5-dims"></div>Group</a></li>
                                    <li><a href="/family-travel-insurance"><div class="svg svg-m6 svg-m6-dims"></div>Family</a></li>
                                    <li><a href="/seniors-travel-insurance"><div class="svg svg-m7 svg-m7-dims"></div>Senior</a></li>
                                </ul>
                            </div>
                            <div class="col">
                                <p class="mhead">Trip Type</p>
                                <ul>
                                    <li><a href="/holiday-insurance"><div class="svg svg-m8 svg-m8-dims"></div>Holiday</a></li>
                                    <li><a href="/domestic-travel-insurance"><div class="svg svg-m9 svg-m9-dims"></div>Domestic</a></li>
                                    <li><a href="/international-travel-insurance"><div class="svg svg-m10 svg-m10-dims"></div>International</a></li>
                                    <li><a href="/cruise-travel-insurance"><div class="svg svg-m11 svg-m11-dims"></div>Cruise</a></li>
                                    <li><a href="/backpacker-travel-insurance"><div class="svg svg-m12 svg-m12-dims"></div>Backpacking</a></li>
                                    <li><a href="/working-holiday-travel-insurance"><div class="svg svg-m13 svg-m13-dims"></div>Working holiday</a></li>
                                    <li><a href="/business-travel-insurance"><div class="svg svg-m14 svg-m14-dims"></div>Business</a></li>
                                </ul>
                            </div>
                            <div class="col">
                                <p class="mhead">Cover Type</p>
                                <ul>
                                    <li><a href="/budget-travel-insurance"><div class="svg svg-m15 svg-m15-dims"></div>Budget</a></li>
                                    <li><a href="/medical-only-travel-insurance"><div class="svg svg-m16 svg-m16-dims"></div>Medical Only</a></li>
                                    <li><a href="/standard-travel-insurance"><div class="svg svg-m17 svg-m17-dims"></div>Standard</a></li>
                                    <li><a href="/comprehensive-travel-insurance"><div class="svg svg-m18 svg-m18-dims"></div>Comprehensive</a></li>
                                    <li><a href="/multi-trip"><div class="svg svg-m19 svg-m19-dims"></div>Multi-Trip</a></li>
                                </ul>
                            </div>
                            <div class="col">
                                <p class="mhead">Sports</p>
                                <ul>
                                    <li><a href="/travel-insurance-for-skiing-and-snowboarding"><div class="svg svg-m21 svg-m21-dims"></div>Skiing &amp; Snowboarding</a></li>
                                    <li><a href="/adventure-travel-insurance"><div class="svg svg-m22 svg-m22-dims"></div>Adventure Activities</a></li>
                                </ul>
                                <p class="mhead">Medical</p>
                                <ul>
                                    <li><a href="/travel-insurance-for-pre-existing-medical-conditions"><div class="svg svg-m23 svg-m23-dims"></div>Pre-Existing Medical</a></li>
                                    <li><a href="/travel-insurance-when-youre-pregnant"><div class="svg svg-m24 svg-m24-dims"></div>Pregnancy</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="/what-we-cover">What We Cover</a>
                        <div class="dropdown-full cols3">
                            <div class="col3">
                                <ul>
                                    <li><a href="/what-we-cover/medical"><div class="svg svg-f5 svg-f5-dims"></div>Medical</a></li>
                                    <li><a href="/what-we-cover/luggage-and-personal-effects"><div class="svg svg-f4 svg-f4-dims"></div>Luggage & Personal Effects</a></li>
                                    <li><a href="/what-we-cover/while-you-are-travelling"><div class="svg svg-m10 svg-m10-dims"></div>While you''re travelling</a></li>
                                </ul>
                            </div>
                            <div class="col3">
                                <ul>
                                    <li><a href="/what-we-cover/cancellation"><div class="svg svg-f1 svg-f1-dims"></div>Cancellation</a></li>
                                    <li><a href="/what-we-cover/financial"><div class="svg svg-f3 svg-f3-dims"></div>Financial</a></li>
                                    <li><a href="/what-we-cover/work-and-study"><div class="svg svg-m2 svg-m2-dims"></div>Work & Study</a></li>
                                </ul>
                            </div>
                            <div class="col3 spread">
                                <ul>
                                    <li><a href="/what-we-cover/pre-existing-medical-conditions"><div class="svg svg-m23 svg-m23-dims"></div>Pre-Existing Medical Conditions</a></li>
                                    <li><a href="/what-we-cover/activities"><div class="svg svg-m22 svg-m22-dims"></div>Activities</a></li>
                                    <li><a href="/what-we-cover/traveller-types"><div class="svg svg-m4 svg-m4-dims"></div>Traveller Types</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#">Your Policy</a>
                        <div class="dropdown-full">
                            <div class="cols">
                                <div class="col5">
                                    <p class="mhead">Look up quote</p>
                                    <form action="/fcp/quote" method="get">
                                        <button type="submit"><div class="svg svg-searcht svg-searcht-dims"></div></button>
                                        <input type="text" name="number" placeholder="quote number">
                                    </form>
                                </div>
                                <div class="col5">
                                    <a href="/your-policy">
                                        <p class="mhead">Extend or Change</p>
                                        <div class="svg svg-pol1 svg-pol1-dims"></div>
                                    </a>
                                </div>
                                <div class="col5">
                                    <a href="/pds">
                                        <p class="mhead">Download PDS</p>
                                        <div class="svg svg-pol2 svg-pol2-dims"></div>
                                    </a>
                                </div>
                                <div class="col5">
                                    <a href="/travel-alerts">
                                        <p class="mhead">Travel Warnings</p>
                                        <div class="svg svg-pol3 svg-pol3-dims"></div>
                                    </a>
                                </div>
                                <div class="col5">
                                    <a href="/claims">
                                        <p class="mhead">Make a claim</p>
                                        <div class="svg svg-pol4 svg-pol4-dims"></div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="blue-point">
                        <a href="/faq">FAQs</a>
                        <div class="dropdown-full">
                            <ul>
                                <li><a href="/faq/pre-existing-medical-conditions"><div class="svg svg-m23 svg-m23-dims"></div>Pre-Existing Medical Conditions</a></li>
                                <li><a href="/faq/cancellation"><div class="svg svg-f1 svg-f1-dims"></div>Cancellation</a></li>
                                <li><a href="/faq/claims"><div class="svg svg-f3 svg-f3-dims"></div>Making a claim</a></li>
                                <li><a href="/faq/luggage"><div class="svg svg-f4 svg-f4-dims"></div>Luggage</a></li>
                            </ul>
                            <ul>
                                <li><a href="/faq/medical"><div class="svg svg-f5 svg-f5-dims"></div>Medical</a></li>
                                <li><a href="/faq/cancellation"><div class="svg svg-f6 svg-f6-dims"></div>Flight Delays</a></li>
                                <li><a href="/faq/snow"><div class="svg svg-f7 svg-f7-dims"></div>Snow Sports</a></li>
                                <li><a href="/faq/cruise"><div class="svg svg-f8 svg-f8-dims"></div>Cruises</a></li>
                            </ul>
                            <div class="search-form">
                                <p class="mhead">Search FAQs</p>
                                <form action="/faq/search">
                                    <input type="text" name="query" placeholder="enter your question">
                                    <button type="submit"><div class="svg svg-searchtb svg-searchtb-dims"></div></button>
                                </form>
                            </div>
                            <div class="all-q">
                                <a href="/faq">
                                    <span class="text">All FAQs</span>
                                    <span class="question">?</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li><a href="/emergency-contacts/">Emergency</a></li>
                </ul>
            </nav>
            <!-- / navigation -->
        </div>
        <!-- / container -->
    </header>
    <!-- / header -->
    <!-- / header -->
    @RenderBody()

    <div class="contact-row">
        <div class="container">
            <div class="stay-widget">
                <div class="social-side">
                    <img src="https://fastcover.com.au/img/logo.svg" width="240" alt="">
                    <ul class="social-icons">
                        <li><a href="http://facebook.com/fastcover"><div class="svg svg-social-fb svg-social-fb-dims"></div></a></li>
                        <li><a href="https://twitter.com/FastCover"><div class="svg svg-social-tw svg-social-tw-dims"></div></a></li>
                        <li><a href="https://plus.google.com/+FastcoverAustralia/"><div class="svg svg-social-gp svg-social-gp-dims"></div></a></li>
                        <li><a href="http://pinterest.com/fastcover/"><div class="svg svg-social-pi svg-social-pi-dims"></div></a></li>
                        <li><a href="http://instagram.com/fastcovertravel"><div class="svg svg-social-it svg-social-it-dims"></div></a></li>
                        <li><a href="http://api.addthis.com/oexchange/0.8/offer?url=http://fastcover.com.au"><div class="svg svg-social-sh svg-social-sh-dims"></div></a></li>
                    </ul>
                    <div class="underwritten">
                        <p>underwritten by</p>
                        <div class="svg svg-blue_l svg-blue_l-dims"></div>
                    </div>
                </div>

                <div class="newsletter-side">
                    <div class="signup-form">
                        <!-- IsDevMode = True -->
                        <form name="newsletteradd" id="newsletteradd" action="/fcp/subscribeMailerLite" method="post" target="_blank">
                            <fieldset>
                                <label><strong>Want travel tips &amp; freebies?</strong> <br>Join our newsletter!</label>
                                <input type="text" id="newslettername" errorlabel="Name" required name="firstname" placeholder="Your name">
                                <input type="email" id="newsletteremail" errorlabel="Email" required name="email" placeholder="Email address">
                            </fieldset>
                            <button type="submit" class="btn btn-alt">Sign Up</button>
                        </form>
                    </div>
                    <div class="thankyou-screen">
                        <form>
                            <fieldset>
                                <label><strong>Thank You</strong> <br /><br />We have sent you an email which you need to open and confirm your address to receive our newsletters.</label>
                            </fieldset>
                        </form>
                    </div>
                </div>

            </div>
            <div class="text-widget">
                <h3><strong><a href="/contact">Need a hand?</a></strong></h3>
                <p><span class="google_number" style="display:inline;">1300 409 322</span><br><a href="mailto:enquiries@fastcover.com.au">enquiries@fastcover.com.au</a><br>Fax: (02) 8252 4710</p>
            </div>
            <div class="text-widget">
                <h3><strong><a href="/claims">Making a claim?</a></strong></h3>
                <p><span class="google_number" style="display:inline;">1300 409 322</span><br><a href="mailto:claims@fastcover.com.au">claims@fastcover.com.au</a><br>Fax: (07) 3305 7016</p>
                <p class="white"><a href="/contact">See all our contact details</a></p>
            </div>
        </div>
    </div>

    <footer id="footer">
        <div class="container">
            <section class="hori-links">
                <article>
                    <h3>Cover</h3>
                    <ul>
                        <li><a href="/travel-insurance-for-pre-existing-medical-conditions">Pre-existing Medical Conditions</a></li>
                        <li><a href="/pds">Product Disclosure Statement (PDS)</a></li>
                        <li><a href="/seniors-travel-insurance">Seniors Travel Insurance</a></li>
                        <li><a href="/family-travel-insurance">Family Travel Insurance</a></li>
                        <li><a href="/working-holiday-travel-insurance">Working Holiday &amp; Back Packers</a></li>
                        <li><a href="/multi-trip">Multi-Trip Cover</a></li>
                    </ul>
                </article>
                <article>
                    <h3>Support</h3>
                    <ul>
                        <li><a href="/your-policy">Make a change to your policy</a></li>
                        <li><a href="#HelpBox" class="call-modal trigger">Ask a Question</a></li>
                        <li><a href="/faq">Frequently Asked Questions</a></li>
                        <li><a href="/claims">Make a Claim</a></li>
                        <li><a href="/contact">Fast Cover Contacts</a></li>
                        <li><a href="/emergency-contacts">Emergency Assistance</a></li>
                        <li><a href="/alerts">Cover Advisories</a></li>
                    </ul>
                </article>
                <article>
                    <h3>About</h3>
                    <ul>
                        <li><a href="/about-us">About Us</a></li>
                        <li><a href="/travel-suitcase">Blog</a></li>
                        <li><a href="/contact">Contact Us</a></li>
                        <li><a href="/your-duty-of-disclosure">Duty of Disclosure</a></li>
                        <li><a href="/media-centre">Media Centre</a></li>
                        <li><a href="/privacy">Privacy Policy</a></li>
                        <li><a href="/sponsorship">Sponsorship</a></li>
                    </ul>
                </article>
            </section>
            <div class="copy">
                <p>
                    Fast Cover Pty Ltd ABN 98 143 196 098 AR No.381399 arranges this insurance as an authorised representative of AGA Assistance Australia Pty Ltd,
                    ABN 52 097 227 177, AFSL 245631 trading as Allianz Global Assistance. Travel Insurance is issued and managed by Allianz Global Assistance
                    as agent of the insurer Allianz Australia Insurance Limited ABN 15 000 122 850 AFSL 234708. Terms, conditions, limits and exclusions apply.
                    We do not provide any advice on this insurance based on any consideration of your objectives, financial situation or needs. You should consider the
                    Combined Financial Services Guide and <a href="/pds" target=_blank>Product Disclosure Statement</a> (including policy wording) available on this website before buying this product to
                    decide if this product is right for you. If you purchase a policy, Fast Cover receives a commission which is a percentage of your premium - ask us for more information.
                </p>
            </div>
        </div>
        <!-- / container -->
    </footer>
    <!-- / footer -->


    <div class="help-bar">
        <a href="#HelpBox" class="call-modal trigger">?</a>
    </div>
    <div class="lightbox helpbox" id="HelpBox">
        <div class="content lightbox.helpbox">
            <span class="tooltip-div" style="float:left;"><span class="icon">?</span></span>
            <h2>Need Help?</h2>

            <ul>
                <li>Look for the help icons <span class="tooltip-div"><span class="icon">?</span></span>, you''ll find answers there</li>
                <li>See our <a href="/what-we-cover">What We Cover section</a></li>
                <li>Check our <a href="/faq">Frequently Asked Questions</a></li>
                <li>Call us on <a href="tel:1300409322">1300 409 322</a></li>

                <li>Ask your <a href="#" onclick="GoToAskQuestion(); return true;">Question Here</a></li>
            </ul>
        </div>
        <div class="greyback">
            <div class="content">

                <form class="helpform" method="post" action="">
                    <input type="hidden" name="subject" value="Question from Help Popup" />
                    <input type="hidden" name="submitted_from" value="" />
                    <input type="hidden" name="set_tags" value="web_widget" />
                    <input type="hidden" name="via_id" value="48" />
                    <input type="hidden" name="locale_id" value="1" />
                    <p>Question</p>
                    <textarea name="description" class="vert" required="" id="description" errorlabel="Question" cols="25" rows="3"></textarea>

                    <div>
                        <div class="col col1">
                            <p>Name</p>
                            <input name="name" type="text" required="" id="name" errorlabel="Name" maxlength="50" />
                        </div>
                        <div class="col col2">
                            <p>Email</p>
                            <input name="email" type="email" required="" id="email" errorlabel="Email" maxlength="50" />
                        </div>
                    </div>
                    <div class="checkbox">
                        <input name="addnewsletter" type="checkbox" id="crf-input-1" class="crf-i" style="position: absolute; left: -9999em;">
                        <label class="crf" for="crf-input-1">
                            <div class="ico">
                                <div class="svg svg-checkbox svg-checkbox-dims"></div>
                            </div>
                            <div class="label">Send me exclusive offers & travel tips.</div>
                        </label>
                    </div>
                    <div class="">
                        <a href="#" class="btn btn-green submit">Submit</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="greyback alt">
            <div class="content">
                <p>Thank you. A Travel Insurance Specialist will answer your question shortly.</p>
            </div>
        </div>
    </div>
    <!-- Zendesk -->

    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <script type="text/javascript" src="https://fastcover.com.au/scripts/Site2015JS/global.js?v=@DateTime.Now.ToString("ddmmyyHHMMss")"></script>
    <script type="text/javascript" src="https://fastcover.com.au/scripts/Site2015JS/page.js?v=@DateTime.Now.ToString("ddmmyyHHMMss")"></script>

    <script type="text/javascript" src="~/scripts/chub.js?v=@DateTime.Now.ToString("ddmmyyHHMMss")"></script>
    <script type="text/javascript" src="~/scripts/readmore.js?v=@DateTime.Now.ToString("ddmmyyHHMMss")"></script>
</body>
</html>')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1, CAST(0x0000A73C00D3973A AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"623a8acd-e3a9-45e3-a3b0-0d242f47a202\",\"Id\":1046}]"}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (2, CAST(0x0000A73C00D39C85 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1047]","JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"contentHubPage\",\"Id\":1048,\"PropertyTypeIds\":[35,36,37,38,39],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (3, CAST(0x0000A73C00D3C9B0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1049]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (4, CAST(0x0000A73C00D3D6FD AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1049]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (5, CAST(0x0000A73C00D3E7DE AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1047]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (6, CAST(0x0000A73C00D40616 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1047]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (7, CAST(0x0000A73C00D44D6C AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1050]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (8, CAST(0x0000A73C00D47CE0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1050]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1050]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P8056/D2] 628EB89E298949F69D9B4930334E7873')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (9, CAST(0x0000A73C00F8A8B0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1050]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1050]","JsonPayload":null}]', N'HARSHWARDHAN//LM/W3SVC/2/ROOT [P6452/D2] 305D6DA3786243E1B6EE7284CB73EC79')
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, 1046, CAST(0x0000A73C012E3A46 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, 1047, CAST(0x0000A73C012E3F29 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 1048, CAST(0x0000A73C012E3F9A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 1049, CAST(0x0000A73C012E6CC6 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 1049, CAST(0x0000A73C012E7A19 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1047, CAST(0x0000A73C012E8AFD AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 1047, CAST(0x0000A73C012EA933 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 0, CAST(0x0000A73C012EB879 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 1050, CAST(0x0000A73C012EEA6A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, 1050, CAST(0x0000A73C012F1FFB AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 1050, CAST(0x0000A73C01534B95 AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(0x0000A73C00FCF392 AS DateTime), N'7.5.11')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-331, 0, -1, 0, 1, N'-1,-331', -1, N'0af5e610-a310-4b6f-925f-e928d5416af7', N'LOCK: Servers', N'87a9f1ff-b1e4-4a25-babb-465a4a47ec41', CAST(0x0000A73C00FCF075 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF05F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF05E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF05D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF053 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF053 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF054 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF055 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF055 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF056 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF056 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF057 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF058 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF059 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF059 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF05A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF05B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF05C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A73C00FCF052 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A73C00FCF051 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A73C00FCF011 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A73C00FCF05F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A73C00FCF06D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A73C00FCF06E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF06E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF06F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF06F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF070 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF071 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF072 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A73C00FCF072 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 2, N'7e3962cc-ce20-4ffc-b661-5897a894ba7e', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C00FCF073 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 24, N'623a8acd-e3a9-45e3-a3b0-0d242f47a202', N'ContentHubPage - GridLayout - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A73C012E38F3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, 1049, NULL, 1, N'-1,1049,1047', 0, N'51d758f1-d51d-4ff7-8cf5-609b1107cb19', N'ContentHubPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A73C012E3F07 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 0, N'eb72d698-6984-4953-86af-3265a9a64c3a', N'ContentHubPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A73C012E3F4F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, -1, NULL, 1, N'-1,1049', 0, N'f4049351-9362-4743-a7b0-aa0038cf42b9', N'MasterSite2015', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A73C012E6CB8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 0, N'6e0ed2e1-19cd-4cba-bfff-f644a44066da', N'Stacked Numbered Info', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A73C012EE9D0 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:49523/umbraco', N'HARSHWARDHAN//LM/W3SVC/2/ROOT', CAST(0x0000A73C00FD2EFC AS DateTime), CAST(0x0000A73C015DF6DA AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (0, 0, 0, 1, -1, -1, N'Harshwardhan Dangra', N'harshwardhan.in@gmail.com', N'v1GF4Sg6rq0h3BzAToqMB+O/S8c=', N'harshwardhan.in@gmail.com', N'en-GB', N'f4d9b300-bd9c-4480-ac30-acf11edb6a6c', NULL, NULL, CAST(0x0000A73C00FCF6F9 AS DateTime), CAST(0x0000A73C015314F8 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'forms')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON 

INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoMigration] ADD  CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1] FOREIGN KEY([sourceId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2] FOREIGN KEY([targetId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueID])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
GO
