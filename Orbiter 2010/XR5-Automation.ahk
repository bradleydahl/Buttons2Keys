; Provides Logitech Extreme 3D Pro button mapping to Orbiter 2010 Altea
; Aerospace XR5 control
;
; VARIANT: Hands-On Automation
;
; USAGE NOTES:
; - All axes configured via FlyByWire addon
;
; CONVENTIONS:
; - Overloaded shift modifier per joystick switch is
;   Unshifted, Blue, Yellow, Red, Altitude, Attitude, Speed
;
; HISTORY
; 2014/06/18  B.Dahl  Start of coding
; 2014/07/15  B.Dahl  Re-arrange for 'fixed RCS rotation mode'
; 2014/07/22  B.Dahl  Correct typos/ missed items after testing

#Persistent

JoyID = 1

Init()

; ==================SHIFT=BUTTONS=================================
; Alt:Altitude, Att:Attitude, Spd:Speed
BlueJoyShift   = %JoyID%Joy7
YellowJoyShift = %JoyID%Joy9
RedJoyShift    = %JoyID%Joy11
AltJoyShift    = %JoyID%Joy8
AttJoyShift    = %JoyID%Joy10
SpdJoyShift    = %JoyID%Joy12

; ==================MAPPINGS======================================

; Button 1
RegisterMapping(JoyID, 1, "CtrlKey", 1)                          ;- Control Key
CtrlKeyButton1 = Ctrl
RegisterShiftMapping(JoyID, 1, "Blue", "APUPower", 2)            ;- APU Power
APUPowerButton1 = Ctrl
APUPowerButton2 = a
RegisterShiftMapping(JoyID, 1, "Yellow", "ResetMWSWarning", 2)   ;- Reset MWS Warning
ResetMWSWarningButton1 = Ctrl
ResetMWSWarningButton2 = w
RegisterShiftMapping(JoyID, 1, "Red", "ToggleACSControl", 2)     ;- Toggle ACS Control
ToggleACSControlButton1 = Alt
ToggleACSControlButton2 = NumpadDiv
RegisterShiftMapping(JoyID, 1, "Alt", "EngageatCurrentValueAlt", 1) ;- Engage at Current Value
EngageatCurrentValueAltButton1 = NumpadDot
RegisterShiftMapping(JoyID, 1, "Att", "EngageatCurrentValueAtt", 2) ;- Engage at Current Value
EngageatCurrentValueAttButton1 = Ctrl
EngageatCurrentValueAttButton2 = l
RegisterShiftMapping(JoyID, 1, "Spd", "EngageatCurrentValueSpd", 1) ;- Engage at Current Value
EngageatCurrentValueSpdButton1 = NumpadEnter

; Button 2
RegisterMapping(JoyID, 2, "KillRotn", 1)                            ;- Kill rotation
KillRotnButton1 = Numpad5
RegisterShiftMapping(JoyID, 2, "Blue", "ToggleDockingRCSconfigure", 2) ;- Toggle Docking RCS configure
ToggleDockingRCSconfigureButton1 = Alt
ToggleDockingRCSconfigureButton2 = j
RegisterShiftMapping(JoyID, 2, "Yellow", "SwitchHUDMode", 1)     ;- Switch HUD Mode
SwitchHUDModeButton1 = h
RegisterShiftMapping(JoyID, 2, "Red", "TogglePause", 2)          ;- Toggle Pause
TogglePauseButton1 = Ctrl
TogglePauseButton2 = p
RegisterShiftMapping(JoyID, 2, "Alt", "ToggleOnOffAlt", 1)       ;- Toggle On/Off
ToggleOnOffAltButton1 = a
RegisterShiftMapping(JoyID, 2, "Att", "ToggleOnOffAtt", 1)       ;- Toggle On/Off
ToggleOnOffAttButton1 = l
RegisterShiftMapping(JoyID, 2, "Spd", "ToggleOnOffSpd", 2)       ;- Toggle On/Off
ToggleOnOffSpdButton1 = Alt
ToggleOnOffSpdButton2 = s

; Button 3
RegisterMapping(JoyID, 3, "KillThrst", 1)                        ;- Kill Main Thrust
KillThrstButton1 = NumpadMult
RegisterShiftMapping(JoyID, 3, "Blue", "LeftWheelbrake", 1)      ;- Left wheel brake
LeftWheelbrakeButton1 = ,
; RegisterShiftMapping(JoyID, 3, "PS", "", 1)                            ;
RegisterShiftMapping(JoyID, 3, "Red", "Gear", 1)                 ;- Gear
GearButton1 = g
RegisterShiftMapping(JoyID, 3, "Alt", "DecreaseLargeAlt", 2)     ;- Decrease Large
DecreaseLargeAltButton1 = Ctrl
DecreaseLargeAltButton2 = Numpad2
RegisterShiftMapping(JoyID, 3, "Att", "DecreaseLargeAtt", 1)     ;- Decrease Large
DecreaseLargeAttButton1 = Numpad8
RegisterShiftMapping(JoyID, 3, "Spd", "DecreaseLargeSpd", 2)     ;- Decrease Large
DecreaseLargeSpdButton1 = Ctrl
DecreaseLargeSpdButton2 = NumpadSub

; Button 4
RegisterMapping(JoyID, 4, "Airbrake", 2)                         ;- Airbrake
AirbrakeButton1 = Ctrl
AirbrakeButton2 = b
RegisterShiftMapping(JoyID, 4, "Blue", "RightWheelBrake", 1)      ;- Right wheel brake
RightWheelBrakeButton1 = .
RegisterShiftMapping(JoyID, 4, "Yellow", "DecrHUDBrightness", 2) ;- Decr HUD brightness
DecrHUDBrightnessButton1 = Alt
DecrHUDBrightnessButton2 = z
RegisterShiftMapping(JoyID, 4, "Red", "SCRAMDoors", 2)           ;- SCRAM Doors
SCRAMDoorsButton1 = Ctrl
SCRAMDoorsButton2 = g
RegisterShiftMapping(JoyID, 4, "Alt", "DecreaseSmallAlt", 1)     ;- Decrease Small
DecreaseSmallAltButton1 = Numpad2
RegisterShiftMapping(JoyID, 4, "Att", "DecreaseSmallAtt", 2)     ;- Decrease Small
DecreaseSmallAttButton1 = Alt
DecreaseSmallAttButton2 = Numpad8
RegisterShiftMapping(JoyID, 4, "Spd", "DecreaseSmallSpd", 1)     ;- Decrease Small
DecreaseSmallSpdButton1 = NumpadSub

; Button 5
RegisterMapping(JoyID, 5, "RCSBk", 1)                            ;- RCS Back
RCSBkButton1 = Numpad9
RegisterShiftMapping(JoyID, 5, "Blue", "MaxRevThrust", 1)        ;- Maximum Reverse Thrust
MaxRevThrustButton1 = NumpadSub
RegisterShiftMapping(JoyID, 5, "Yellow", "HUDcolor", 2)          ;- HUD color
HUDcolorButton1 = Alt
HUDcolorButton2 = h
RegisterShiftMapping(JoyID, 5, "Red", "RetroDoors", 2)           ;- Retro Doors
RetroDoorsButton1 = Ctrl
RetroDoorsButton2 := "\"
RegisterShiftMapping(JoyID, 5, "Alt", "IncreaseLargeAlt", 2)     ;- Increase Large
IncreaseLargeAltButton1 = Ctrl
IncreaseLargeAltButton2 = Numpad8
RegisterShiftMapping(JoyID, 5, "Att", "IncreaseLargeAtt", 1)     ;- Increase Large
IncreaseLargeAttButton1 = Numpad2
RegisterShiftMapping(JoyID, 5, "Spd", "IncreaseLargeSpd", 2)     ;- Increase Large
IncreaseLargeSpdButton1 = Ctrl
IncreaseLargeSpdButton2 = NumpadAdd

; Button 6
RegisterMapping(JoyID, 6, "RCSFwd", 1)                           ;- RCS Forward
RCSFwdButton1 = Numpad6
RegisterShiftMapping(JoyID, 6, "Blue", "MaxFwdThrust", 1)        ;- Maximum fwd Thrust
MaxFwdThrustButton1 = NumpadAdd
RegisterShiftMapping(JoyID, 6, "Yellow", "IncrHUDbrightness", 2) ;- Incr HUD brightness
IncrHUDbrightnessButton1 = Alt
IncrHUDbrightnessButton2 = x
RegisterShiftMapping(JoyID, 6, "Red", "DockingPort", 2)          ;- Docking Port
DockingPortButton1 = Ctrl
DockingPortButton2 = k
RegisterShiftMapping(JoyID, 6, "Alt", "IncreaseSmallAlt", 1)     ;- Increase Small
IncreaseSmallAltButton1 = Numpad8
RegisterShiftMapping(JoyID, 6, "Att", "IncreaseSmallAtt", 2)     ;- Increase Small
IncreaseSmallAttButton1 = Alt
IncreaseSmallAttButton2 = Numpad2
RegisterShiftMapping(JoyID, 6, "Spd", "IncreaseSmallSpd", 1)     ;- Increase Small
IncreaseSmallSpdButton1 = NumpadAdd

; POV Up
RegisterPOVMapping(JoyID, 2, "RCSUp", 1)                         ;- RCS Up
RCSUpButton1 = Numpad2
; RegisterShiftPOVMapping(JoyID, 2, "Blue", "TurnPrograde", 1)      ;- Turn Prograde
; TurnProgradeButton1 = [
RegisterShiftPOVMapping(JoyID, 2, "Yellow", "NextPanelUp", 2)     ;- Next Panel Up
NextPanelUpButton1 = Ctrl
NextPanelUpButton2 = Up
RegisterShiftPOVMapping(JoyID, 2, "Red", "TrimUp", 1)             ;- Trim Up
TrimUpButton1 = Del
; RegisterShiftPOVMapping(JoyID, 2, "Alt", "AoAPitchToggleAlt", 1)  ;- AoA/ Pitch Toggle
; AoAPitchToggleAltButton1 = .
RegisterShiftPOVMapping(JoyID, 2, "Att", "AoAPitchToggleAtt", 1)  ;- AoA/ Pitch Toggle
AoAPitchToggleAttButton1 = Numpad9
; RegisterShiftPOVMapping(JoyID, 2, "Spd", "AoAPitchToggleSpd", 1)  ;- AoA/ Pitch Toggle
; AoAPitchToggleSpdButton1 = .

; POV Right
RegisterPOVMapping(JoyID, 4, "RCSRt", 1)                         ;- RCS Right
RCSRtButton1 = Numpad3
; RegisterShiftPOVMapping(JoyID, 4, "Blue", "OrbitNormal", 1)       ;- Orbit-normal
; OrbitNormalButton1 := ";"
RegisterShiftPOVMapping(JoyID, 4, "Yellow", "NextMultiDisp", 1)   ;- Next MultiDisp
NextMultiDispButton1 = d
RegisterShiftPOVMapping(JoyID, 4, "Red", "IncrSCRAM", 2)          ;- Incr SCRAM
IncrSCRAMButton1 = Ctrl
IncrSCRAMButton2 := "="
; RegisterShiftPOVMapping(JoyID, 4, "Alt", "DecBankAlt", 1)         ;- Dec Bank
; DecBankAltButton1 = .
RegisterShiftPOVMapping(JoyID, 4, "Att", "DecBankAtt", 1)         ;- Dec Bank
DecBankAttButton1 = Numpad4
; RegisterShiftPOVMapping(JoyID, 4, "Spd", "DecBankSpd", 1)         ;- Dec Bank
; DecBankSpdButton1 = .

; POV Down
RegisterPOVMapping(JoyID, 6, "RCSDown", 1)                        ;- RCS Down
RCSDownButton1 = Numpad8
; RegisterShiftPOVMapping(JoyID, 6, "Blue", "TurnRetrograde", 1)    ;- Turn Retrograde
; TurnRetrogradeButton1 = ]
RegisterShiftPOVMapping(JoyID, 6, "Yellow", "NextPanelDown", 2)   ;- Next Panel Down
NextPanelDownButton1 = Ctrl
NextPanelDownButton2 = Down
RegisterShiftPOVMapping(JoyID, 6, "Red", "TrimDown", 1)           ;- Trim Down
TrimDownButton1 = Ins
RegisterShiftPOVMapping(JoyID, 6, "Alt", "ZeroAutoLandAlt", 1)    ;- Zero/ Auto Land
ZeroAutoLandAltButton1 = Numpad0
RegisterShiftPOVMapping(JoyID, 6, "Att", "ZeroAutoLandAtt", 2)    ;- Zero/ Auto Land
ZeroAutoLandAttButton1 = Ctrl
ZeroAutoLandAttButton2 = Numpad7
RegisterShiftPOVMapping(JoyID, 6, "Spd", "ZeroAutoLandSpd", 1)    ;- Zero/ Auto Land
ZeroAutoLandSpdButton1 = NumpadMult

; POV Left
RegisterPOVMapping(JoyID, 8, "RCSLt", 1)                          ;- RCS Left
RCSLtButton1 = Numpad1
; RegisterShiftPOVMapping(JoyID, 8, "Blue", "OrbitAntinormal", 1)   ;- Orbit-antinormal
; OrbitAntinormalButton1 = '
RegisterShiftPOVMapping(JoyID, 8, "Yellow", "PrevMultiDisp", 2)   ;- Prev MultiDisp
PrevMultiDispButton1 = Alt
PrevMultiDispButton2 = d
RegisterShiftPOVMapping(JoyID, 8, "Red", "DecrSCRAM", 2)          ;- Decr SCRAM
DecrSCRAMButton1 = Ctrl
DecrSCRAMButton2 = -
; RegisterShiftPOVMapping(JoyID, 8, "Alt", "IncBankAlt", 1)         ;- Inc Bank
; IncBankAltButton1 = .
RegisterShiftPOVMapping(JoyID, 8, "Att", "IncBankAtt", 1)         ;- Inc Bank
IncBankAttButton1 = Numpad6
; RegisterShiftPOVMapping(JoyID, 8, "Spd", "IncBankSpd", 1)         ;- Inc Bank
; IncBankSpdButton1 = .

Run()


#include C:\Users\Brad\Saved Games\DCS\Config\Input\A-10C\Buttons2Keys.ahk
