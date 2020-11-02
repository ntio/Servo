object Form1: TForm1
  Left = 260
  Height = 316
  Top = 133
  Width = 276
  BorderStyle = bsSingle
  Caption = 'SERVO'
  ClientHeight = 316
  ClientWidth = 276
  OnClose = FormClose
  OnCreate = FormCreate
  LCLVersion = '7.2'
  object btopen: TButton
    Left = 88
    Height = 32
    Top = 8
    Width = 100
    Caption = 'OPEN'
    OnClick = btopenClick
    TabOrder = 0
  end
  object mkservo: TmKnob
    Left = 48
    Height = 156
    Top = 112
    Width = 178
    AngleRange = arTop180
    BorderColor = clMoneyGreen
    BorderSpacing.Bottom = 1
    BorderSpacing.InnerBorder = 3
    FaceColor = clGradientActiveCaption
    Position = 0
    Max = 255
    OnChange = mkservoChange
  end
end
