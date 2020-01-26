DECLARE @skip       int = 10;
DECLARE @counter    INT = @skip;
DECLARE @norecords  int = 100000
 
WHILE @counter < (@norecords + @skip)
BEGIN
  PRINT @counter;
  SET @counter = @counter + 1;
  INSERT [dbo].[FareTypes] (
    [FareTypeId], 
    [FareTypeAbbr], 
    [Description], 
    [FlatFareAmt], 
    [FlatRate], 
    [DistanceRate], 
    [PolygonRate], 
    [TimeRate], 
    [PolyTypeId], 
    [PrepaidReq], 
    [FareAdjustDiffZon], 
    [FareAdjustSameZon], 
    [DistanceLimitSameZon], 
    [DistanceLimitDiffZon], 
    [NumCode], 
    [FareMode], 
    [FareCalcType], 
    [VariationOf], 
    [MinFare], 
    [MaxFare], 
    [RoundFare], 
    [DistanceLimit], 
    [RoundDirection], 
    [Accuracy], 
    [InActive]
  ) VALUES (
    @counter, 
    N'STA', 
    N'Standard Fare', 
    NULL, 
    2, 
    0, 
    0, 
    0, 
    0, 
    NULL, 
    0, 
    0, 
    0, 
    0, 
    1, 
    0, 
    0, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL
  )
END