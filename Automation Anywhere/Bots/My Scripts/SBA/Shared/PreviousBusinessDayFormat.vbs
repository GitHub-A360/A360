Dim CalcDate
CalcDate =  Date() - 1
Dim wdStr, wdNum
wdNum = Weekday(CalcDate)
wdStr = WeekdayName(wdNum)
if wdStr = "Sunday" then
	CalcDate = DateAdd("d",-2,CalcDate)
elseif wdStr = "Satruday" then
	CalcDate = DateAdd("d",-1,CalcDate)
end if
WScript.StdOut.Write(CalcDate)