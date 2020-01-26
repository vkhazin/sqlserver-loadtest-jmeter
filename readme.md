# Sql Server Load Test using JMeter

## Objectives

* Create [JMeter](https://jmeter.apache.org/) Load test
* To test a table of 100,000 rows with randomized insert/update/delete a few records at a time
* Each thread user should use a random range of pk values to avoid database dead-locks during the test

## Sql Server Setup

### DDL

```
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FareTypes](
	[FareTypeId] [int] NOT NULL,
	[FareTypeAbbr] [varchar](10) NULL,
	[Description] [varchar](30) NULL,
	[FlatFareAmt] [real] NULL,
	[FlatRate] [real] NULL,
	[DistanceRate] [real] NULL,
	[PolygonRate] [real] NULL,
	[TimeRate] [real] NULL,
	[PolyTypeId] [int] NULL,
	[PrepaidReq] [char](2) NULL,
	[FareAdjustDiffZon] [float] NULL,
	[FareAdjustSameZon] [float] NULL,
	[DistanceLimitSameZon] [float] NULL,
	[DistanceLimitDiffZon] [float] NULL,
	[NumCode] [smallint] NULL,
	[FareMode] [smallint] NULL,
	[FareCalcType] [smallint] NULL,
	[VariationOf] [int] NULL,
	[MinFare] [real] NULL,
	[MaxFare] [real] NULL,
	[RoundFare] [tinyint] NULL,
	[DistanceLimit] [int] NULL,
	[RoundDirection] [smallint] NULL,
	[Accuracy] [real] NULL,
	[InActive] [smallint] NULL,
	[Timestamp] [datetime2] DEFAULT SYSUTCDATETIME ( )
 CONSTRAINT [pkFareTypes] PRIMARY KEY CLUSTERED 
(
	[FareTypeId] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
```

### Sample DML

```
INSERT [dbo].[FareTypes] ([FareTypeId], [FareTypeAbbr], [Description], [FlatFareAmt], [FlatRate], [DistanceRate], [PolygonRate], [TimeRate], [PolyTypeId], [PrepaidReq], [FareAdjustDiffZon], [FareAdjustSameZon], [DistanceLimitSameZon], [DistanceLimitDiffZon], [NumCode], [FareMode], [FareCalcType], [VariationOf], [MinFare], [MaxFare], [RoundFare], [DistanceLimit], [RoundDirection], [Accuracy], [InActive]) VALUES (1, N'STA', N'Standard Fare', NULL, 2, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
```

### [DML to populate records](./populate-records.sql)

## JMeter Setup

* Download and install [Sql Server Jdbc Driver](https://stackoverflow.com/questions/49732923/how-to-resolve-error-cannot-load-jdbc-driver-class-displayed-in-jmeter-4-0)
* Store all parameters in the User Defined Variables - nothing is hard-coded
* Randomize the pk values range for insert/update/delete operation between threads to avoid dead-locks
* Collect the test results using `Aggregate Report` collector
* Collect the errors-only from the test using `View Results in Table` collector to monitor database errors

