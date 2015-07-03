; Buttons2Keys
; Allows mapping of joystick buttons and Point Of View switch to keyboard key
; combinations.
;
; USAGE NOTES:
; - Currently only one POV switch per joystick is handled (limited to AHK
;   capability)
; - Keyboard press and releases are in step with joystick button press and
;   releases. The timing accuracy is tied to the JButtonMapping timer value (aka
;   service period). No auto repeat or forced delay is built in.
;
; SCRIPT NOTES
; - Global variable usage
;     - All array variables are indexed starting at 1
;     - Arrays, indices and limits for system
;       Arrays    StrMap???    ShfMap???     HatMap???     ShfHatMap???
;       Limit     StrMapsCnt   ShfMapsCnt    HatMapsCnt    ShfHatMapsCnt
;       Purpose   Single       Shifted       Single        Shifted
;                 buttons      buttons       hat press     hat press
;
;       Array     UsedJoystick    UsedJoyBtn
;       Limit     NrJoysticks     NrJoyButtons
;       Purpose   Remember IDs    Non-shift button IDs
;                 of joysticks    used across all joysticks
;
;       Array     MapActionIdx    MapActionShf
;
;       Array     MapActionPOV    MapActPOVShf
;
; - Commented out ListVars/pause statements are for debugging
; - State variable values:
;     - MapActionShf: 0=btn, 1=shft+btn
;     - MapActPOVShf: 0=hat, 1=shft+hat
;
; POV registering function
;    RegisterPOVMapping(JoyNr, POVDirNr, KbdPrfx, NrKbdKeys)
;    RegisterShiftPOVMapping(JoyNr, POVDirNr, ShftName, KbdPrfx, NrKbdKeys)
;    POVDirNr: 0 no press, 2=up, 4=right, 6=down, 8=left
;
; Multiple button and independant Point Of View are 
;    Index the following variables:
;      MapActionIdx, MapActionShf, MapActionPOV, MapActPOVShf
;    for each action button and joystick/ POV switch detected. Keep track of
;    joysticks, action buttons and POV switches registered via
;      UsedJoyBtn<>, UsedPOVSwitch<>, UsedJoystick<>
;

; ==================STANDARD=SETUP================================
    
Init()
{
    SetKeyDelay ,50
    StrMapsCnt    = 0
    ShfMapsCnt    = 0
    HatMapsCnt    = 0
    ShfHatMapsCnt = 0
    ; MapActionIdx  = 0
    FuncJoyP      = 0
    ; MapActionPOV  = 0
    MapActPOVIdx  = 0
    ; MapActPOVShf  = 0
    NrJoyButtons  = 0
    NrJoysticks   = 0
}
    
Run()
{
    global
    ; ----Initialize-shift-and-index-state-variables------------------
    Loop %NrJoyButtons% {
        jbn := UsedJoyBtn%a_index% ; Joystick button number
        Loop %NrJoysticks% {
            jn := UsedJoystick%a_index% ; Joystick ID
            MapActionIdx%jn%_%jbn% = 0
            MapActionShf%jn%_%jbn% = 0
        }
    }
    Loop %NrJoysticks% {
        jn := UsedJoystick%a_index% ; Joystick ID
        MapActPOVIdx%jn% = 0
        MapActPOVShf%jn% = 0
    }

    ; ListVars ; DEBUG see setup names
    ; Pause    ; DEBUG

    SetTimer, JButtonMapping, 100   ; 10 times a second
}

; ==================MAIN=SERVICING=ROUTINE========================
JButtonMapping:
    Loop %NrJoysticks% {
        Joystk := UsedJoystick%a_index% ; Joystick number
        Loop %NrJoyButtons% {
            JoyBtn := UsedJoyBtn%a_index% ; Joystick button number
            if (MapActionIdx%Joystk%_%JoyBtn% = 0) {
                handled = 0
                ; Handle button shift operations
                Loop {
                    IfEqual, ShfMapJoy%a_index%,, Break
                    jn  := ShfMapJoy%a_index% ; Joystick number
                    jbn := ShfMapJBN%a_index% ; Joystick button number
                    if (jbn = JoyBtn and jn = Joystk) {
                        btn = %jn%Joy%jbn% ; Joystick button key name
                        if GetKeyState(btn) ; is a non-shift button pressed
                        {
                            shID := ShfMapMod%a_index% ; shift name to check press for
                            btnshf := %shID%JoyShift ; shift button name (moniker)
                            ; btnshf = %btnshf% ; AHK key name of shift button
                            ; ListVars ; DEBUG see button dereferences
                            ; Pause   ; DEBUG
                            if GetKeyState(btnshf) { ; is the shift button pressed
                              ; MapActionShf%i% and MapActionIdx%i% need indexing per joystick too
                                MapActionIdx%Joystk%_%JoyBtn% = %a_index% ; operation number in effect
                                ; MapActionBtn = %btn% ; the primary button to check for
                                MapActionShf%Joystk%_%JoyBtn% = 1 ; note that 'shift operation in effect'
                                prefix := ShfMapPre%a_index%
                                nrkeys := ShfMapNrK%a_index%
                                ; ListVars ; DEBUG see buttons about to be pressed
                                PressButtons(prefix,nrkeys)
                                handled = 1
                                Break
                            }
                        }
                    }
                } ; end of Loop

                if (not handled) {
                    ; Handle button straight operations
                    Loop {
                        IfEqual, StrMapJoy%a_index%,, Break
                        jn := StrMapJoy%a_index% ; Joystick number
                        jbn := StrMapJBN%a_index% ; Joystick button number
                        if (jbn = JoyBtn and jn = Joystk) {
                            btn = %jn%Joy%jbn% ; Joystick button key name
                            ; ListVars ; DEBUG see button dereferences
                            ; Pause   ; DEBUG
                            if GetKeyState(btn) {
                                MapActionIdx%Joystk%_%JoyBtn% = %a_index% ; operation number in effect
                                ; MapActionBtn = %btn% ; the primary button to check for
                                MapActionShf%Joystk%_%JoyBtn% = 0
                                prefix := StrMapPre%a_index%
                                nrkeys := StrMapNrK%a_index%
                                ; ListVars ; DEBUG see buttons about to be pressed
                                ; Pause   ; DEBUG
                                PressButtons(prefix,nrkeys)
                                handled = 1
                                Break
                            }
                        }
                    } ; end of Loop
                }
            }
            else {
                mai := MapActionIdx%Joystk%_%JoyBtn%
                jn := StrMapJoy%mai% ; Joystick number
                btn = %jn%Joy%JoyBtn% ; Joystick button key name
                if not GetKeyState(btn) {  ; Button action undo
                    if (MapActionShf%Joystk%_%JoyBtn% = 1) {
                        prefix := ShfMapPre%mai%
                        nrkeys := ShfMapNrK%mai%
                        ; ListVars ; DEBUG see buttons about to be released
                        ; Pause   ; DEBUG
                        ReleaseButtons(prefix,nrkeys)
                    } else {
                        prefix := StrMapPre%mai%
                        nrkeys := StrMapNrK%mai%
                        ; ListVars ; DEBUG see buttons about to be released
                        ; Pause   ; DEBUG
                        ReleaseButtons(prefix,nrkeys)
                    }
                    MapActionIdx%Joystk%_%JoyBtn% = 0
                }
            }
        } ; end of Loop %NrJoyButtons%
    } ; end of Loop %NrJoysticks%
    
    ;_ POV switch handling (1 Point Of View switch per joystick)
    Loop %NrJoysticks% {
        Joystk := UsedJoystick%a_index% ; Joystick number
        if (MapActionPOV%Joystk% = 0) {
            handled = 0
    
            if (not handled) {
                ; Handle shift POV operations
                hat := GetPOVState(Joystk)
                if (hat > 0) {
                    Loop {
                        IfEqual, ShfHatMapJoy%a_index%,, Break
                        jn  := ShfHatMapJoy%a_index% ; Joystick number
                        hatm := ShfHatMapPOV%a_index% ; POV direction number
                        if (hat = hatm and Joystk = jn) ; hat position and joyID must match
                        {
                            shID := ShfHatMapMod%a_index% ; shift name to check press for
                            btnshf := %shID%JoyShift ; shift button name (moniker)
                            ; btnshf = %btnshf% ; AHK key name of shift button
                            if GetKeyState(btnshf) { ; is the shift button pressed
                                MapActPOVIdx%Joystk% = %a_index% ; operation number in effect
                                MapActionPOV%Joystk% = %hat% ; the primary button to check for
                                MapActPOVShf%Joystk% = 1 ; note that 'shift POV operation in effect'
                                prefix := ShfHatMapPre%a_index%
                                nrkeys := ShfHatMapNrK%a_index%
                                ; ListVars ; DEBUG see buttons about to be pressed
                                ; Pause   ; DEBUG
                                PressButtons(prefix,nrkeys)
                                handled = 1
                                Break
                            }
                        }
                    }
                }
            }

            if (not handled) {
                ; Handle straight POV operations
                hat := GetPOVState(Joystk)
                if (hat > 0) {
                    Loop {
                        IfEqual, HatMapJoy%a_index%,, Break
                        if(HatMapJoy%a_index% = Joystk and hat = HatMapPOV%a_index%) {
                            MapActPOVShf%Joystk% = 0
                            MapActionPOV%Joystk% := hat
                            MapActPOVIdx%Joystk% = %a_index% ; operation number in effect
                            prefix := HatMapPre%a_index%
                            nrkeys := HatMapNrK%a_index%
                            ; ListVars ; DEBUG see buttons about to be pressed
                            ; Pause   ; DEBUG
                            PressButtons(prefix,nrkeys)
                            handled = 1
                        }
                    }
                }
            }
        }
        else {
            hat := GetPOVState(Joystk) ; Hat action undo
            if (hat <> MapActionPOV%Joystk%) {
                POVidx := MapActPOVIdx%Joystk%
                if (MapActPOVShf%Joystk% = 1) {
                    prefix := ShfHatMapPre%POVidx%
                    nrkeys := ShfHatMapNrK%POVidx%
                    ; ListVars ; DEBUG see buttons about to be released
                    ; Pause   ; DEBUG
                    ReleaseButtons(prefix,nrkeys)
                } else {
                    prefix := HatMapPre%POVidx%
                    nrkeys := HatMapNrK%POVidx%
                    ; ListVars ; DEBUG see buttons about to be released
                    ; Pause   ; DEBUG
                    ReleaseButtons(prefix,nrkeys)
                }
                MapActPOVIdx%Joystk% = 0
                MapActionPOV%Joystk% = 0
            }
        }
    } ; end of Loop %NrJoysticks%
return

; ==================SUPPORT=FUNCTIONS=============================

RegisterMapping(JoyNr, JoyBtnNr, KbdPrfx, NrKbdKeys)
{
    global
    StrMapsCnt++
    StrMapJoy%StrMapsCnt% = %JoyNr%
    StrMapJBN%StrMapsCnt% = %JoyBtnNr%
    StrMapPre%StrMapsCnt% = %KbdPrfx%
    StrMapNrK%StrMapsCnt% = %NrKbdKeys%
    RegisterButton(JoyNr,JoyBtnNr)
}
  

RegisterShiftMapping(JoyNr, JoyBtnNr, ShftName, KbdPrfx, NrKbdKeys)
{
    global
    ShfMapsCnt++
    ShfMapJoy%ShfMapsCnt% = %JoyNr%
    ShfMapJBN%ShfMapsCnt% = %JoyBtnNr%
    ShfMapMod%ShfMapsCnt% = %ShftName%
    ShfMapPre%ShfMapsCnt% = %KbdPrfx%
    ShfMapNrK%ShfMapsCnt% = %NrKbdKeys%
    RegisterButton(JoyNr,JoyBtnNr)
}

RegisterPOVMapping(JoyNr, POVDirNr, KbdPrfx, NrKbdKeys)
{
    global
    HatMapsCnt++
    HatMapPOV%HatMapsCnt% = %POVDirNr%
    HatMapJoy%HatMapsCnt% = %JoyNr%
    HatMapPre%HatMapsCnt% = %KbdPrfx%
    HatMapNrK%HatMapsCnt% = %NrKbdKeys%
}

RegisterShiftPOVMapping(JoyNr, POVDirNr, ShftName, KbdPrfx, NrKbdKeys)
{
    global
    ShfHatMapsCnt++
    ShfHatMapJoy%ShfHatMapsCnt% = %JoyNr%
    ShfHatMapPOV%ShfHatMapsCnt% = %POVDirNr%
    ShfHatMapPre%ShfHatMapsCnt% = %KbdPrfx%
    ShfHatMapNrK%ShfHatMapsCnt% = %NrKbdKeys%
    ShfHatMapMod%ShfHatMapsCnt% = %ShftName%
}

PressButtons(Prefix,NrBtns)
{
    Loop %NrBtns% {
        ; IfEqual, %a_index%, %NrBtns%, Break
        key := %Prefix%Button%a_index%
        ; ListVars ; DEBUG see buttons about to be pressed
        ; Pause   ; DEBUG
        Send {%key% Down}
    }
}

ReleaseButtons(Prefix,NrBtns)
{
    Loop %NrBtns% { ; Reverse
        ; IfEqual, %a_index%, %NrBtns%, Break
        idx := NrBtns - a_index + 1
        key := %Prefix%Button%idx%
        ; ListVars ; DEBUG see buttons about to be pressed
        ; Pause   ; DEBUG
        Send {%key% Up}
    }    
}

GetPOVState(JoyNr)
{
    GetKeyState, joyp, %JoyNr%JoyPOV
    if (joyp < 0)   ; No angle to report
    {
        FuncJoyP = 0
    }
    else if(joyp = 0)
    {
        FuncJoyP=2 ; Zoom in
    }
    else if(joyp = 9000)
    {
        FuncJoyP=4 ;
    }
    else if(joyp = 18000)
    {
        FuncJoyP=6 ; Zoom out
    }
    else if(joyp = 27000)
    {
        FuncJoyP=8 ;
    }
    else
    {
        FuncJoyP = 0
    }
    Return FuncJoyP
}

RegisterButton(JoyNr,JoyBtnNr)
{
    global
    ; ---- Check for new joysticks being registered ----
    Exists = 0
    Loop %NrJoysticks% {
        if (UsedJoystick%a_index% = JoyNr) {
            Exists = 1
            Break
        }
    }

    if(not Exists)
    {
        NrJoysticks++
        UsedJoystick%NrJoysticks% = %JoyNr%
    }
    
    ; ---- Check for new button (on any joystick) being registered ----
    Exists = 0
    Loop %NrJoyButtons% {
        if (UsedJoyBtn%a_index% = JoyBtnNr) {
            Exists = 1
            Break
        }
    }

    if(not Exists)
    {
        NrJoyButtons++
        UsedJoyBtn%NrJoyButtons% = %JoyBtnNr%
    }
}
