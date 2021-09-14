Dim IncomingDate, CalcDate
IncomingDate = WScript.Arguments.Item(0)
IncomingDate = Replace(IncomingDate,"~","/")
CalcDate = CDate(IncomingDate)
CalcDate = DateAdd("d",-1,CalcDate)
Dim wdStr, wdNum
wdNum = Weekday(CalcDate)
wdStr = WeekdayName(wdNum)
if wdStr = "Sunday" then
	CalcDate = DateAdd("d",-2,CalcDate)
elseif wdStr = "Satruday" then
	CalcDate = DateAdd("d",-1,CalcDate)
end if
WScript.StdOut.Write(CalcDate)