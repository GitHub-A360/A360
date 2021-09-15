Dim dateValue, retValue
If (WScript.Arguments.Count > 0) Then
	dateValue = WScript.Arguments.Item(0)
	'Doing this because AA turns 1/1/2000 into 1 divided by 2000
	dateValue = Replace(dateValue,"~","/")
	retValue = IsDate(dateValue) 
	If (retValue = true) Then
		WScript.StdOut.Write(1)
	Else
		WScript.StdOut.Write(0)
	End if
End if