object fmPesquisaBase: TfmPesquisaBase
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Base Pesquisa'
  ClientHeight = 358
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 312
    Width = 686
    Height = 46
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Pesquisar:'
    end
    object Label2: TLabel
      Left = 353
      Top = 18
      Width = 31
      Height = 13
      Caption = 'Status'
      Visible = False
    end
    object editPesquisar: TEdit
      Left = 63
      Top = 18
      Width = 391
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object btnPesquisar: TBitBtn
      Left = 460
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object btnSelecionar: TBitBtn
      Left = 534
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = btnSelecionarClick
    end
    object btnSair: TBitBtn
      Left = 608
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
    object cbStatus: TcxComboBox
      Left = 381
      Top = 16
      TabStop = False
      Properties.Items.Strings = (
        'Ativos'
        'Inativos'
        'Ambos')
      Style.BorderStyle = ebsOffice11
      Style.ButtonTransparency = ebtNone
      TabOrder = 4
      Text = 'Ativos'
      Visible = False
      Width = 84
    end
  end
  object dbGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 686
    Height = 281
    Align = alTop
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ds: TDataSource
    AutoEdit = False
    Left = 24
    Top = 208
  end
end
