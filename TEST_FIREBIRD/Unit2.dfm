object Form2: TForm2
  Left = 576
  Top = 190
  BorderStyle = bsToolWindow
  Caption = #1053#1086#1074#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
  ClientHeight = 224
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 422
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1060#1086#1088#1084#1072' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1090#1077#1082#1091#1097#1091#1102' '#1041#1044
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 55
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103': '
  end
  object Label3: TLabel
    Left = 16
    Top = 76
    Width = 28
    Height = 13
    Caption = #1048#1084#1103': '
  end
  object Label4: TLabel
    Left = 16
    Top = 101
    Width = 53
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086': '
  end
  object Label5: TLabel
    Left = 16
    Top = 128
    Width = 26
    Height = 13
    Caption = #1055#1086#1083': '
  end
  object Edit1: TEdit
    Left = 80
    Top = 46
    Width = 321
    Height = 21
    Cursor = crIBeam
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 80
    Top = 72
    Width = 321
    Height = 21
    Cursor = crIBeam
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 80
    Top = 98
    Width = 321
    Height = 21
    Cursor = crIBeam
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 248
    Top = 176
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 176
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 128
    Width = 321
    Height = 21
    Cursor = crHandPoint
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      #1046#1077#1085#1089#1082#1080#1081
      #1052#1091#1078#1089#1082#1086#1081)
  end
end
