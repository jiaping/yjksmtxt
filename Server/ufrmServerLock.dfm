object FormServerLock: TFormServerLock
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FormServerLock'
  ClientHeight = 192
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 192
    Align = alClient
    Caption = 'Panel1'
    Color = 16775666
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 171
    ExplicitTop = 24
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      448
      192)
    object lblID: TLabel
      Left = 44
      Top = 52
      Width = 114
      Height = 19
      Caption = #31649#29702#21592#23494#30721#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5000268
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object btnGrade: TCnSpeedButton
      Left = 171
      Top = 107
      Width = 115
      Height = 30
      Anchors = [akRight]
      Color = 15966293
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      HotTrackColor = 16551233
      ModernBtnStyle = bsFlat
      Caption = #35299#38145
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      Margin = 4
      ParentFont = False
      OnClick = btnLoginClick
      ExplicitLeft = -92
      ExplicitTop = 11
    end
    object edtPwd: TEdit
      Left = 155
      Top = 49
      Width = 222
      Height = 27
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
  end
end