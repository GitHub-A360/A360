Dim SharepointAddress, LocalAddress, objNet, FS, colDrives, strDriveLetter, retValue

'Incoming Variables from AA
SharepointAddress = WScript.Arguments.Item(0)
LocalAddress = WScript.Arguments.Item(1)

'Network Setup                                     
Set objNet = CreateObject("WScript.Network")
Set wshNet = WScript.CreateObject("WScript.Network")

'Drive letter Definition
'strDriveLetter = "X:"

'Return Value Initialization
retValue = "True"
'Determine if drive already mapped.  If so, remove it.
Set colDrives = wshNet.EnumNetworkDrives
If colDrives.Count <> 0 Then
	For i = 0 To colDrives.Count - 1 Step 2
		If (ColDrives(i) = "X:") Then
			wshNet.RemoveNetworkDrive colDrives(i)
		End If
	Next
End If
'Map drive and copy file
objNet.MapNetworkDrive "X:", SharepointAddress
Set FS = CreateObject("Scripting.FileSystemObject")
If FS.FileExists(LocalAddress) Then
	Err.Clear
	FS.CopyFile LocalAddress, "X:\"
	If Err.Number <> 0 Then
		retValue = "False"
		Err.Clear
	End If
Else
	retValue = "False"
End If

'Make sure the file is copied.
WScript.sleep 5
objNet.RemoveNetworkDrive "X:"
WScript.sleep 5
'Clear the Network Objects
Set objNet = Nothing
Set wshNet = Nothing
Set FS = Nothing
WScript.StdOut.Write(retValue)