#cs ----------------------------------------------------------------------------

 Author:         Eric Merz

 Script Function:
	Test script for the SNARL SNP Library.

#ce ----------------------------------------------------------------------------

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#include "Snarl_SNP.au3"

MsgBox(1,"Test","This will display a test!")

$socket = snpConnect()
sleep (3000)
snpRegister($socket)
sleep (3000)
snpAddClass($socket)
sleep (3000)
snpNotify($socket,"Test Dialog","This is a Test Notification")
