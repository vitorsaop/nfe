object frmbase: Tfrmbase
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  Caption = 'frmbase'
  ClientHeight = 412
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object fadeout: TTimer
    Enabled = False
    Interval = 10
    OnTimer = fadeoutTimer
    Left = 240
    Top = 64
  end
  object fadein: TTimer
    Interval = 10
    OnTimer = fadeinTimer
    Left = 144
    Top = 80
  end
end
