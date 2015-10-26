; Provides Logitech Extreme 3D Pro button mapping to X3 Reunion v2.5
; dog fighting craft
;
; VARIANT: Battle Actions
;
; USAGE NOTES:
; - Button 2 left as configured by default X3 control (missile load/ fire)
; - Use default assignments for standard keys only except for:
;     Fire Guns     Left Control
;
; CONVENTIONS:
; - Shift modifiers per joystick button is
;   Unshifted, Cross (+), Star (*)
;
; HISTORY
; 2014/10/04  B.Dahl  Start of coding
; 2015/10/25  B.Dahl  Correct typos

#Persistent

JoyID = 1

Init()

; ==============SHIFT=BUTTONS=DEFINED=HERE========================
CrossJoyShift = %JoyID%Joy7
StarJoyShift = %JoyID%Joy11

; ==================MAPPINGS======================================

; Button 1
RegisterMapping(JoyID, 1, "Guns", 1)             ;- Guns
GunsButton1 = LCtrl
; RegisterShiftMapping(JoyID, 1, "Star", "YY", 1) ;- YY
; YYButton1 = 
RegisterShiftMapping(JoyID, 1, "Cross", "TgtInfo", 1) ;- TgtInfo
;TgtInfoButton1 = Shift
TgtInfoButton1 = i

; Button 3
RegisterMapping(JoyID, 3, "TrackTgt", 1)             ;- 
TrackTgtButton1 = t
RegisterShiftMapping(JoyID, 3, "Star", "OpenBay", 1) ;- Open freight bay doors
OpenBayButton1 = o
RegisterShiftMapping(JoyID, 3, "Cross", "Freight", 1) ;- Freight menu
FreightButton1 = f

; Button 4
RegisterMapping(JoyID, 4, "LaserMode", 1)             ;- Laser mode
LaserModeButton1 = k
RegisterShiftMapping(JoyID, 4, "Star", "NextTurr", 1) ;- Next turret
NextTurrButton1 = F1
RegisterShiftMapping(JoyID, 4, "Cross", "VidGog", 1) ;- Video Goggles/ zoom
VidGogButton1 = v

; Button 5
RegisterMapping(JoyID, 5, "NextEnemy", 1)             ;- Next enemy
NextEnemyButton1 = Home
RegisterShiftMapping(JoyID, 5, "Star", "Gravidar", 2) ;- Gravidar mode
GravidarButton1 = Shift
GravidarButton2 = m
RegisterShiftMapping(JoyID, 5, "Cross", "MsgLog", 1) ;- Pilot message log
MsgLogButton1 = ]
;MsgLogButton2 = l

; Button 6
RegisterMapping(JoyID, 6, "Boost", 1)             ;- Speed boost
BoostButton1 = Tab
RegisterShiftMapping(JoyID, 6, "Star", "DockNow", 2) ;- Dock now
DockNowButton1 = Shift
DockNowButton2 = d
RegisterShiftMapping(JoyID, 6, "Cross", "Eject", 2) ;- Eject pilot
EjectButton1 = Shift
EjectButton1 = e

; Button 8
RegisterMapping(JoyID, 8, "Up", 1)             ;- Up
UpButton1 = w
RegisterShiftMapping(JoyID, 8, "Star", "Seta", 1) ;- SETA
SetaButton1 = j
RegisterShiftMapping(JoyID, 8, "Cross", "JumpDrive", 2) ;- Jump Drive
JumpDriveButton1 = Shift
JumpDriveButton2 = j

; Button 9
RegisterMapping(JoyID, 9, "Left", 1)             ;- Left
LeftButton1 = a
; RegisterShiftMapping(JoyID, 9, "Star", "YY", 1) ;- 
; YYButton1 = 
; RegisterShiftMapping(JoyID, 9, "Cross", "ZZ", 1) ;- 
; ZZButton1 = 

; Button 10
RegisterMapping(JoyID, 10, "Right", 1)             ;- Right
RightButton1 = d
; RegisterShiftMapping(JoyID, 10, "Star", "YY", 1) ;- 
; YYButton1 = 
; RegisterShiftMapping(JoyID, 10, "Cross", "ZZ", 1) ;- 
; ZZButton1 = 

; Button 12
RegisterMapping(JoyID, 12, "Down", 1)             ;- Down
DownButton1 = s
; RegisterShiftMapping(JoyID, 12, "Star", "YY", 1) ;- 
; YYButton1 = 
; RegisterShiftMapping(JoyID, 12, "Cross", "ZZ", 1) ;- 
; ZZButton1 = 

; POV Up
RegisterPOVMapping(JoyID, 2, "WpnGrp1", 1) ;- Wpn Grp 1
WpnGrp1Button1 = 1

; POV Right
RegisterPOVMapping(JoyID, 4, "WpnGrp2", 1) ;- Wpn Grp 2
WpnGrp2Button1 = 2

; POV Down
RegisterPOVMapping(JoyID, 6, "WpnGrp3", 1) ;- Wpn Grp 3
WpnGrp3Button1 = 3

; POV Left
RegisterPOVMapping(JoyID, 8, "WpnGrp4", 1) ;- Wpn Grp 4
WpnGrp4Button1 = 4

Run()

#Include Buttons2Keys.ahk
