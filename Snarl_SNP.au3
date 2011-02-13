; SNP Library for Snarl on Windows
; (c) 2011 Eric Merz
; Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
; ( http://creativecommons.org/licenses/by-nc-sa/3.0/ )



Func snpConnect( $HOST="localhost", $PORT=9887)
	TCPStartUp()
	$IP = TCPNameToIP($HOST)
	$socket = -1
	$socket = TCPConnect($IP,$PORT)
	If @error Then
		MsgBox(4112,"Error Connecting","An error occured when trying to connect. WSA Error " & @error)
		Return 0
	Else
		Return $socket
	EndIf
EndFunc

Func snpRegister($socket,$appname="App")
	$sendstring = "type=SNP#?version=1.0#?action=register#?app=" & $appname
	$sent = TCPSend($socket,$sendstring)
	If @error Then
		MsgBox(1,"Error Sending","An error occured registering app '" & $appname &"' to Snarl. Please check Snarl to make sure it's allowing connections and try again. WSA Error: " & @error)
		Return 0
		Exit
	EndIf
	Return 1
EndFunc

Func snpUnregister($socket,$appname="App")
	$sendstring = "type=SNP#?version=1.0#?action=unregister#?app=" & $appname
	$sent = -1
	$sent = TCPSend($socket,$sendstring)
	If @error Then
		MsgBox(1,"Error Sending","An error occured unregistering app '" & $appname &"' to Snarl. Please check Snarl to make sure it's allowing connections and try again. WSA Error: " & @error)
		Return 0
		Exit
	EndIf
	Return 1
EndFunc

Func snpAddClass($socket,$class="AppClass",$appname="App",$title="")
	If $title = "" Then
		$sendstring = "type=SNP#?version=1.0#?action=add_class#?app=" & $appname & "#?class=" & $class
	Else
		$sendstring = "type=SNP#?version=1.0#?action=add_class#?app=" & $appname & "#?class=" & $class & "#?title=" & $title
	EndIf
	$sent = -1
	$sent = TCPSend($socket,$sendstring)
	If @error Then
		MsgBox(1,"Error Sending","An error occured adding class. WSA Error: " & @error)
		Return 0
		Exit
	EndIf
	Return 1
EndFunc

Func snpNotify( $socket, $title, $text = "", $timeout = 10, $class = "AppClass", $appname="App")
	$sendstring = "type=SNP#?version=1.0#?action=notification#?app=" & $appname & "#?class=" & $class & "#?title=" & $title & "#?text=" & $text & "#?timeout=" & $timeout
	$sent = -1
	$sent = TCPSend($socket,$sendstring)
	If @error Then
		MsgBox(1,"Error Sending","An error occured sending notification. WSA Error: " & @error)
		Return 0
		Exit
	EndIf
	Return 1
EndFunc


