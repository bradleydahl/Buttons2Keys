; Based off X3DtoHOTAS-singleEvents.ahk
; Provides Logitech Extreme 3D Pro button mapping to DCS A10C default keys
;
; USAGE NOTES:
; - No DCS key modifiers must exist for the Joystick buttons, as AHK will not
;   detect such buttons.
; - Keyboard press and releases are in step with joystick button press and
;   releases.
;

#Persistent

JoyID = 2

Init()

; ==================SHIFT=BUTTONS=================================
OrangeJoyShift = %JoyID%Joy7
BlueJoyShift = %JoyID%Joy8
GreenJoyShift = %JoyID%Joy9
PurpleJoyShift = %JoyID%Joy10
RedJoyShift = %JoyID%Joy11
YellowJoyShift = %JoyID%Joy12

; ==================MAPPINGS======================================

; ------------Non-shifted buttons and POV--------------------
RegisterMapping(JoyID, 2, "RelWpn", 2) ; Release weapon
RelWpnButton1 = RAlt
RelWpnButton2 = Space

RegisterMapping(JoyID, 1, "Cannon", 1) ; Fire cannon
CannonButton1 = Space ; Fire cannon

RegisterMapping(JoyID, 5, "PAC1", 1) ; PAC 1
PAC1Button1 := "p"

RegisterMapping(JoyID, 3, "NoseWlStr", 1) ; Nose Wheel Steering
NoseWlStrButton1 = Ins

RegisterMapping(JoyID, 6, "ChinaFwd", 1) ; China Hat
ChinaFwdButton1 := "v"

RegisterMapping(JoyID, 4, "ChinaAft", 1) ; China Hat
ChinaAftButton1 := "c"

RegisterPOVMapping(JoyID, 2, "SlewUp", 1) ; JoyNr, POVDirNr, KbdPrfx, NrKbdKeys
RegisterPOVMapping(JoyID, 4, "SlewRt", 1)
RegisterPOVMapping(JoyID, 6, "SlewDn", 1)
RegisterPOVMapping(JoyID, 8, "SlewLt", 1)
SlewUpButton1 := ";"
SlewRtButton1 := "/"
SlewDnButton1 := "."
SlewLtButton1 := ","

;-------------Orange shifted buttons and POV-----------------
RegisterShiftMapping(JoyID, 2, "Orange", "MasterMode", 1) ; Change Master Mode
MasterModeButton1 := "m"

RegisterShiftMapping(JoyID, 5, "Orange", "FlapUp", 2) ; [Flaps up]
FlapUpButton1 = LShift
FlapUpButton2 := "f"

RegisterShiftMapping(JoyID, 3, "Orange", "FlapDn", 1) ; [Flaps down]
FlapDnButton1 := "f"

RegisterShiftMapping(JoyID, 6, "Orange", "AirBrkCls", 2) ; [Close Air Brake]
AirBrkClsButton1 = LShift
AirBrkClsButton2 := "b"

RegisterShiftMapping(JoyID, 4, "Orange", "AirBrkOpn", 2) ; [Open Air Brake]
AirBrkOpnButton1 = LCtrl
AirBrkOpnButton2 := "b"

RegisterShiftPOVMapping(JoyID, 2, "Orange", "TrimUp", 2) ; Trim switch
RegisterShiftPOVMapping(JoyID, 4, "Orange", "TrimRt", 2)
RegisterShiftPOVMapping(JoyID, 6, "Orange", "TrimDn", 2)
RegisterShiftPOVMapping(JoyID, 8, "Orange", "TrimLt", 2)
TrimUpButton1 = RCtrl
TrimUpButton2 := ";"
TrimRtButton1 = RCtrl
TrimRtButton2 := "/"
TrimDnButton1 = RCtrl
TrimDnButton2 := "."
TrimLtButton1 = RCtrl
TrimLtButton2 := ","

;-------------Blue shifted buttons and POV-----------------
RegisterShiftMapping(JoyID, 5, "Blue", "BoatFore", 2) ; Boat Fore
BoatForeButton1 = RAlt
BoatForeButton2 = Right

RegisterShiftMapping(JoyID, 3, "Blue", "BoatCtr", 2) ; Boat Center
BoatCtrButton1 = RAlt
BoatCtrButton2 = Down

RegisterShiftMapping(JoyID, 6, "Blue", "BoatAft", 2) ; Boat Aft
BoatAftButton1 = RAlt
BoatAftButton2 = Left

RegisterShiftPOVMapping(JoyID, 2, "Blue", "CoolieUp", 1) ; Coolie Switch
RegisterShiftPOVMapping(JoyID, 4, "Blue", "CoolieRt", 1)
RegisterShiftPOVMapping(JoyID, 6, "Blue", "CoolieDn", 1)
RegisterShiftPOVMapping(JoyID, 8, "Blue", "CoolieLt", 1)
CoolieUpButton1 = u
CoolieRtButton1 = k
CoolieDnButton1 = j
CoolieLtButton1 = h

;-------------Green shifted buttons and POV----------------
RegisterShiftMapping(JoyID, 5, "Green", "PinkyFore", 2) ; Pinky Fore
PinkyForeButton1 = LAlt
PinkyForeButton2 = p

RegisterShiftMapping(JoyID, 3, "Green", "PinkyCtr", 2) ; Pinky Center
PinkyCtrButton1 = LShift
PinkyCtrButton2 = p

RegisterShiftMapping(JoyID, 6, "Green", "PinkyAft", 2) ; Pinky Aft
PinkyAftButton1 = LCtrl
PinkyAftButton2 = p

RegisterShiftPOVMapping(JoyID, 2, "Green", "DMSUp", 1) ; DMS Switch
RegisterShiftPOVMapping(JoyID, 4, "Green", "DMSRt", 1)
RegisterShiftPOVMapping(JoyID, 6, "Green", "DMSDn", 1)
RegisterShiftPOVMapping(JoyID, 8, "Green", "DMSLt", 1)
DMSUpButton1 = Home
DMSRtButton1 = PgDn
DMSDnButton1 = End
DMSLtButton1 = Delete

;-------------Purple shifted buttons and POV----------------
RegisterShiftMapping(JoyID, 5, "Purple", "MicFore", 2) ; Mic Fore
MicForeButton1 = LAlt
MicForeButton2 = NumpadAdd

RegisterShiftMapping(JoyID, 3, "Purple", "MicDn", 2) ; Mic Down
MicDnButton1 = LAlt
MicDnButton2 = NumpadSub

RegisterShiftMapping(JoyID, 4, "Purple", "MicAft", 2) ; Mic Aft
MicAftButton1 = LShift
MicAftButton2 = NumpadSub

RegisterShiftMapping(JoyID, 6, "Purple", "MicUp", 2) ; Mic Up
MicUpButton1 = LShift
MicUpButton2 = NumpadAdd

RegisterShiftPOVMapping(JoyID, 2, "Purple", "TMSUp", 2) ; TMS Switch
RegisterShiftPOVMapping(JoyID, 4, "Purple", "TMSRt", 2)
RegisterShiftPOVMapping(JoyID, 6, "Purple", "TMSDn", 2)
RegisterShiftPOVMapping(JoyID, 8, "Purple", "TMSLt", 2)
TMSUpButton1 = LCtrl
TMSUpButton2 = Up
TMSRtButton1 = LCtrl
TMSRtButton2 = Right
TMSDnButton1 = LCtrl
TMSDnButton2 = Down
TMSLtButton1 = LCtrl
TMSLtButton2 = Left

;-------------Yellow shifted buttons and POV----------------
RegisterShiftPOVMapping(JoyID, 2, "Yellow", "GglBrt", 3) ; Goggles
RegisterShiftPOVMapping(JoyID, 4, "Yellow", "GglTgl", 2)
RegisterShiftPOVMapping(JoyID, 6, "Yellow", "GglDim", 3)
RegisterShiftPOVMapping(JoyID, 8, "Yellow", "GglTgl", 2)
GglTglButton1 = RShift
GglTglButton2 = h
GglBrtButton1 = RShift
GglBrtButton2 = RCtrl
GglBrtButton3 = h
GglDimButton1 = RShift
GglDimButton2 = RAlt
GglDimButton3 = h

;-------------Red shifted buttons and POV----------------
RegisterShiftMapping(JoyID, 3, "Red", "Jammer", 1) ; Jammer/ CMS Z Axis
JammerButton1 := "-"

RegisterShiftPOVMapping(JoyID, 2, "Red", "CMSStrt", 1) ; CMS Switch
RegisterShiftPOVMapping(JoyID, 4, "Red", "CMSNext", 1)
RegisterShiftPOVMapping(JoyID, 6, "Red", "CMSStop", 1)
RegisterShiftPOVMapping(JoyID, 8, "Red", "CMSPrev", 1)
CMSStrtButton1 := "7"
CMSNextButton1 := "0"
CMSStopButton1 := "8"
CMSPrevButton1 := "9"

Run()

#include Buttons2Keys.ahk
