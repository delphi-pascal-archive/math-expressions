object Form1: TForm1
  Left = 216
  Top = 134
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Math Expressions'
  ClientHeight = 507
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 70
    Height = 16
    Caption = 'Expression:'
  end
  object Image1: TImage
    Left = 288
    Top = 144
    Width = 401
    Height = 353
  end
  object Label3: TLabel
    Left = 8
    Top = 256
    Width = 41
    Height = 16
    Caption = 'Result:'
  end
  object Label2: TLabel
    Left = 288
    Top = 8
    Width = 32
    Height = 16
    Caption = 'F(x) ='
  end
  object Bevel1: TBevel
    Left = 280
    Top = 8
    Width = 9
    Height = 489
    Shape = bsLeftLine
  end
  object Memo1: TMemo
    Left = 8
    Top = 32
    Width = 265
    Height = 217
    Lines.Strings = (
      'a=10'
      'b=5^0.3'
      'c=a+ln(b)'
      'x=cos(c)'
      'y=sin(c)'
      'total=x^2+y^2')
    TabOrder = 0
    OnChange = Memo1Change
  end
  object Memo2: TMemo
    Left = 8
    Top = 280
    Width = 265
    Height = 217
    TabOrder = 1
  end
  object Memo3: TMemo
    Left = 288
    Top = 32
    Width = 401
    Height = 105
    Lines.Strings = (
      'sin(x)'
      'x^3/5+x^2-x'
      'logn(2,0;x)'
      'abs(x)')
    TabOrder = 2
    OnChange = Memo3Change
  end
end
