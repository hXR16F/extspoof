#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; Programmed by hXR16F
; hXR16F.ar@gmail.com

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ###
$Form1 = GUICreate("Extension Spoofer", 500, 155, 282, 172)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
Dim $StatusBar1_PartsWidth[1] = [-1]
_GUICtrlStatusBar_SetParts($StatusBar1, $StatusBar1_PartsWidth)
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "Programmed by hXR16F", 0)
$Label1 = GUICtrlCreateLabel("File to spoof", 12, 12, 87, 17, $SS_CENTERIMAGE)
$Input1 = GUICtrlCreateInput("C:\Users\Admin\Desktop\virus.exe", 112, 12, 293, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$Label2 = GUICtrlCreateLabel("Spoofed filename", 12, 44, 86, 17, $SS_CENTERIMAGE)
$Input2 = GUICtrlCreateInput("not-virus.png", 112, 44, 293, 21)
$Button1 = GUICtrlCreateButton("Select file", 414, 10, 75, 25)
$Checkbox1 = GUICtrlCreateCheckbox("Add (.) before extension", 112, 76, 147, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Embed EICAR test virus", 112, 104, 147, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$Button2 = GUICtrlCreateButton("Generate", 310, 76, 95, 29)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Local $sFileOpenDialog = FileOpenDialog("Select file to spoof.", @ScriptDir & "\", "(*.*)", $FD_FILEMUSTEXIST)
			If @error Then
				MsgBox($MB_SYSTEMMODAL, "", "No file was selected.")
				FileChangeDir(@ScriptDir)
			Else
				GUICtrlSetData($Input1, $sFileOpenDialog)
				FileChangeDir(@ScriptDir)
			EndIF

		Case $Button2
			Local $Checkbox1Data = GUICtrlRead($Checkbox1)
			Local $Input1Data = GUICtrlRead($Input1)
			Local $Input2Data = GUICtrlRead($Input2)
			; Local $Checkbox2Data = GUICtrlRead($Checkbox2)
			If FileExists("input.ini") Then
				FileDelete("input.ini")
			EndIf
			FileWrite(@ScriptDir & "\input.ini", $Input1Data & @CRLF & $Input2Data & @CRLF & $Checkbox1Data & @CRLF & "0")
			ShellExecute(@ScriptDir & "\spoof.bat", "", "", "", @SW_HIDE)
	EndSwitch
WEnd
