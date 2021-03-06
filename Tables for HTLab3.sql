USE [HealthTechLab3]
GO
/****** Object:  Table [dbo].[Daily_Summary_20150101_20151106]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Daily_Summary_20150101_20151106](
	[Date] [varchar](50) NULL,
	[Steps] [varchar](50) NULL,
	[Calories] [varchar](50) NULL,
	[HR_Lowest] [varchar](50) NULL,
	[HR_Highest] [varchar](50) NULL,
	[HR_Average] [varchar](50) NULL,
	[Total_Kilometers_Moved] [varchar](50) NULL,
	[Active_Hours] [varchar](50) NULL,
	[Total_Seconds_All_Activities] [varchar](50) NULL,
	[Total_Calories_All_Activities] [varchar](50) NULL,
	[Sleep_Events] [varchar](50) NULL,
	[Sleep_Total_Calories] [varchar](50) NULL,
	[Total_Seconds_Slept] [varchar](50) NULL,
	[Run_Events] [varchar](50) NULL,
	[Run_Total_Seconds] [varchar](50) NULL,
	[Total_Kilometers_Ran] [varchar](50) NULL,
	[Run_Total_Calories] [varchar](50) NULL,
	[Bike_Events] [varchar](50) NULL,
	[Bike_Total_Seconds] [varchar](50) NULL,
	[Total_Kilometers_Biked] [varchar](50) NULL,
	[Bike_Total_Calories] [varchar](50) NULL,
	[Exercise_Events] [varchar](50) NULL,
	[Exercise_Total_Seconds] [varchar](50) NULL,
	[Exercise_Total_Calories] [varchar](50) NULL,
	[Guided_Workout_Events] [varchar](50) NULL,
	[Guided_Workout_Total_Seconds] [varchar](50) NULL,
	[Guided_Workout_Total_Calories] [varchar](50) NULL,
	[Golf_Events] [varchar](50) NULL,
	[Golf_Total_Seconds] [varchar](50) NULL,
	[Total_Kilometers_Golfed] [varchar](50) NULL,
	[Golf_Total_Calories] [varchar](50) NULL,
	[tapcount] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Health_Tech_Lab3]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Health_Tech_Lab3](
	[Start] [varchar](50) NULL,
	[Finish] [varchar](50) NULL,
	[Heart Rate (count min)] [varchar](50) NULL,
	[Steps (count)] [varchar](50) NULL,
	[TapCount] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientProfile]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientProfile](
	[PatKey] [int] NULL,
	[Name] [varchar](25) NULL,
	[Age] [int] NULL,
	[Date_of_Birth] [date] NULL,
	[Height] [float] NULL,
	[weight] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserFactDump]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserFactDump](
	[Name] [varchar](13) NOT NULL,
	[ActivityDate] [date] NULL,
	[Steps] [float] NULL,
	[HeartRate] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Dim].[Date]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Dim].[Date](
	[Datekey] [int] NULL,
	[Date] [date] NULL,
	[DateName] [varchar](30) NULL,
	[CalendarYearKey] [int] NULL,
	[CalendarYear] [varchar](4) NULL,
	[CalendarQuarterKey] [int] NULL,
	[CalendarQuarter] [varchar](8000) NULL,
	[CalendarQuarterOfYear] [int] NULL,
	[MonthKey] [int] NULL,
	[Month] [nvarchar](30) NULL,
	[MonthOfYear] [int] NULL,
	[WeekKey] [int] NULL,
	[Week] [varchar](8000) NULL,
	[WeekOfYear] [int] NULL,
	[DayOfWeekKey] [int] NULL,
	[DayOfWeek] [nvarchar](30) NULL,
	[DayOfMonth] [int] NULL,
	[DayOfYear] [int] NULL,
	[IsMonthEnd] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Dim].[Steps]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [Dim].[Steps](
	[Stepkey] [int] IDENTITY(1,1) NOT NULL,
	[StepCode] [int] NULL,
	[StepCodeDescription] [varchar](100) NULL,
	[stepsCount] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Dim].[Tapping]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Dim].[Tapping](
	[TapKey] [int] NULL,
	[Code] [int] NULL,
	[TappingCodeDescription] [varchar](100) NULL,
	[TappingCountRange] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Fact].[Tapping]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Tapping](
	[ColID] [int] IDENTITY(1,1) NOT NULL,
	[UserKey] [int] NULL,
	[Datekey] [int] NULL,
	[TapCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_HT_Lab3]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HT_Lab3] as 


		 select  substring([Start],4,2)+'-'+left([Start],2) +'-'+substring([Start],7,4) as StartDatetime,
		 
		 cast( [Heart Rate (count min)] as int)  as HeartRate,
		 
		 cast( [Steps (count)] as float)  as Steps,tapcount
		  from [dbo].[Health_Tech_Lab3]

				

GO
/****** Object:  View [dbo].[vw_HT_Lab_Heartrate_steps]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HT_Lab_Heartrate_steps] as 

SELECT 

   cast( [StartDatetime] as date) as ActivityDate
      ,[HeartRate]
      ,[Steps],tapcount
  FROM [HealthTechLab3].[dbo].[vw_HT_Lab3]




GO
/****** Object:  View [dbo].[PatientRawData]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create view  [dbo].[PatientRawData] as 

select 'Praveen Kumar' as Name, cast( [Date] as date)  as [ActivityDate] , [Steps],[HR_Average]  as HeartRate ,tapcount

--[Total_Kilometers_Moved],[Active_Hours],[Sleep_Events],[Total_Seconds_Slept]


 from [dbo].[Daily_Summary_20150101_20151106]

where cast( [Date] as date) > '2015-08-27'


UNION 

select 'Sunny Li' as Name ,[ActivityDate], [Steps],[HeartRate],tapcount

--[Total_Kilometers_Moved],[Active_Hours],[Sleep_Events],[Total_Seconds_Slept]


  from [dbo].[vw_HT_Lab_Heartrate_steps]





GO
/****** Object:  View [Fact].[Activity]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 
 
 
 CREATE view [Fact].[Activity] as 
 
  select  Patkey ,[DateKey]   , 
  
    case when [Steps] > 3000 then 1 
         when  Steps between 1001 and 3000 then 2 
		 when  steps  between 301 and 1000 then 3 
		 when  steps between 51 and 300 then 4
		 when  steps between 0 and 50 then 5 
  
  END as  Stepkey ,

      case when [tapcount] > 101 then 1 
         when  [tapcount] between 51 and 100 then 2 
		 when   [tapcount] between 21 and 50 then 3 
		 when  [tapcount] between 11 and 20 then 4
		 when [tapcount] between 0 and 10 then 5 
  
  END as TapKey ,

  [Steps],[HeartRate] , [tapcount] 

  
     from  [dbo].[PatientRawData] DataDump 

  Left outer Join [Dim].[Date] D on D.[Date] = DataDump.[ActivityDate]

  Left outer  join [dbo].[PatientProfile] [pat] on Pat.[Name]=DataDump.Name



GO
/****** Object:  View [dbo].[StepsZero]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  view [dbo].[StepsZero] as 

  select  [Patkey],[DateKey] ,count([Patkey]) as Fact from [Fact].[Activity]
  
  where [Steps] <=50
  group by [Patkey],[DateKey]

GO
/****** Object:  View [dbo].[Tap]    Script Date: 06/11/2015 23:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Tap] as 
select * from [Dim].[Tapping]
GO
