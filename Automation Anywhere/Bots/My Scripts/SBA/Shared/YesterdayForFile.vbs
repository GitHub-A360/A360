Dim yesterday, m, d, y
yesterday = Date() - 1
m = Right(100 + Month(yesterday),2) '- pad month with a zero if needed
d = Right(100 + Day(yesterday),2) '- ditto for the day
y = Right(Year(yesterday),4)
MyDateFormat = y & "_" & m & "_" & d
WScript.StdOut.Write(MyDateFormat)
