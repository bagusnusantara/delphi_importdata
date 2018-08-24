object Form1: TForm1
  Left = 218
  Top = 179
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 16
    Width = 173
    Height = 40
    Caption = 'Aplikasi Import Data'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Niagara Engraved'
    Font.Style = []
    ParentFont = False
  end
  object openFile: TButton
    Left = 456
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Open File ...'
    TabOrder = 0
    OnClick = openFileClick
  end
  object edt_import: TEdit
    Left = 288
    Top = 88
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 96
    Top = 136
    Width = 257
    Height = 25
    Caption = 'Import Data Supplier'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 168
    Width = 257
    Height = 25
    Caption = 'Import Data Customer'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 96
    Top = 200
    Width = 257
    Height = 25
    Caption = 'Import Data Barang'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 696
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 96
    Top = 232
    Width = 257
    Height = 25
    Caption = 'Import Faktur Pembelian DTL'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 96
    Top = 264
    Width = 257
    Height = 25
    Caption = 'Import Faktur Pembelian HDR'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 432
    Top = 136
    Width = 257
    Height = 25
    Caption = 'Import Faktur Penjualan DTL'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 432
    Top = 168
    Width = 257
    Height = 25
    Caption = 'Import Faktur Penjualan HDR'
    TabOrder = 9
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 432
    Top = 200
    Width = 257
    Height = 25
    Caption = 'Import Item HPP Hist'
    TabOrder = 10
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 432
    Top = 232
    Width = 257
    Height = 25
    Caption = 'Import Stock Card'
    TabOrder = 11
    OnClick = Button10Click
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'dbisc_erp_gf'
    User = 'root'
    Password = 'abn'
    Protocol = 'mysql'
    Left = 56
    Top = 40
  end
  object q1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 112
    Top = 40
  end
  object od1: TOpenDialog
    Left = 544
    Top = 88
  end
end
