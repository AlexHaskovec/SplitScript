#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

sleep, 6000

Array := []

Loop, Read, times.txt
{
	Array.Push(A_LoopReadLine)
}

for index, element in Array ; Enumeration is the recommended approach in most cases.
{

	Send, ^a
	sleep, 300
	Click
	sleep, 300
	Send, %element%
	sleep, 300
	Send, ^x
	sleep, 300
	Send, ^n
	sleep, 300
	Send, ^v
	sleep, 300
	Send, {shift Down}^e{shift Up}
	sleep, 300
	if FileExist(tracklist.txt)
	{
		FileReadLine, title, tracklist.txt, %index%
		Send, %title%
	}
	else
	{
		Send, Track %index%
	}
	sleep, 300
	Send, {Enter}
	sleep, 300
	Loop 7
	{
		Send, {Tab}
	}
	sleep, 300
	Send, %index%
	sleep, 300
	Loop 17
	{
		Send, {Tab}
	}
	sleep, 300
	Send, {Enter}
	sleep, 300
	Send, ^w
	Send, {Right}
	Send, {Enter}
}
Esc::ExitApp
