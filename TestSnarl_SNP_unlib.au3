; SNP Library for Snarl on Windows
; (c) 2011 Eric Merz
; Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
; ( http://creativecommons.org/licenses/by-nc-sa/3.0/ )



$HOST="localhost"
$PORT=9887

TCPStartUp()
$socket = -1
$socket = TCPConnect("127.0.0.1",9887)
sleep(500)
If @error Then
	MsgBox(4112,"Error Connecting","An error occured when trying to connect. WSA Error " & @error)
EndIf
$sent = TCPSend($socket, @CR )
sleep(500)
$read = TCPRecv($socket,1024)
MsgBox(0,"Text",$read)

$appname="App"

$sendstring = "type=SNP#?version=1.0#?action=register#?app=" & $appname & @CR
$sent = TCPSend($socket,$sendstring)
If @error Then
	MsgBox(1,"Error Sending","An error occured registering app '" & $appname &"' to Snarl. Please check Snarl to make sure it's allowing connections and try again. WSA Error: " & @error)
	Exit
EndIf
sleep(500)
$read = TCPRecv($socket,1024)
MsgBox(0,"Text",$read)


$class="AppClass"
$sendstring = "type=SNP#?version=1.0#?action=add_class#?app=" & $appname & "#?class=" & $class & @CR
$sent = -1
$sent = TCPSend($socket,$sendstring)
sleep(500)
If @error Then
	MsgBox(1,"Error Sending","An error occured adding class. WSA Error: " & @error)
	Exit
EndIf
$read = TCPRecv($socket,1024)
MsgBox(0,"Text",$read)

$title="HurDur"
$text="Hurdur2"
$timeout = 10
$sendstring = "type=SNP#?version=1.0#?action=notification#?app=" & $appname & "#?class=" & $class & "#?title=" & $title & "#?text=" & $text & "#?timeout=" & $timeout & @CR
$sent = -1
$sent = TCPSend($socket,$sendstring)
sleep(500)
If @error Then
	MsgBox(1,"Error Sending","An error occured sending notification. WSA Error: " & @error)

	Exit
EndIf
$read = TCPRecv($socket,1024)
MsgBox(0,"Text",$read)

$sendstring = "type=SNP#?version=1.0#?action=unregister#?app=" & $appname & @CR
$sent = -1
$sent = TCPSend($socket,$sendstring)
sleep(500)
If @error Then
	MsgBox(1,"Error Sending","An error occured unregistering app '" & $appname &"' to Snarl. Please check Snarl to make sure it's allowing connections and try again. WSA Error: " & @error)
	Exit
EndIf
$read = TCPRecv($socket,1024)
MsgBox(0,"Text",$read)

TCPCloseSocket($socket)
TCPShutdown()

MsgBox(0,"Done","Completed App Test.")

