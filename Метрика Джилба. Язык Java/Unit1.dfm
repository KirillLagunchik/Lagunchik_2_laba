object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1052#1077#1090#1088#1080#1082#1072' '#1044#1078#1080#1083#1073#1072'. '#1071#1079#1099#1082' Java. '#1051#1072#1075#1091#1085#1095#1080#1082
  ClientHeight = 464
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 408
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 112
    Top = 8
    Width = 195
    Height = 30
    Caption = #1052#1077#1090#1088#1080#1082#1072' '#1044#1078#1080#1083#1073#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 80
    Top = 427
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 8
    Top = 65
    Width = 81
    Height = 33
    Caption = 'Open file'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 405
    Height = 227
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 352
    Width = 81
    Height = 33
    Caption = 'Test'
    TabOrder = 2
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Left = 96
    Top = 24
  end
end
