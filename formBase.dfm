object fmFormBase: TfmFormBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Formul'#225'rio Base'
  ClientHeight = 456
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pn: TPanel
    Left = 0
    Top = 408
    Width = 673
    Height = 48
    Align = alBottom
    TabOrder = 0
    object btnSair: TBitBtn
      Left = 482
      Top = 11
      Width = 80
      Height = 28
      Action = actSair
      Caption = 'Sair'
      TabOrder = 0
    end
    object btnGravar: TBitBtn
      Left = 404
      Top = 11
      Width = 80
      Height = 28
      Action = actGravar
      Caption = 'Gravar'
      TabOrder = 1
    end
    object btnExcluir: TBitBtn
      Left = 326
      Top = 11
      Width = 80
      Height = 28
      Action = actExcluir
      Caption = 'Excluir'
      TabOrder = 2
    end
    object btnCancelar: TBitBtn
      Left = 248
      Top = 11
      Width = 80
      Height = 28
      Action = actCancelar
      Caption = 'Cancelar'
      TabOrder = 3
    end
    object btnEditar: TBitBtn
      Left = 170
      Top = 11
      Width = 80
      Height = 28
      Action = actEditar
      Caption = 'Editar'
      TabOrder = 4
    end
    object btnPesquisar: TBitBtn
      Left = 92
      Top = 11
      Width = 80
      Height = 28
      Action = actPesquisar
      Caption = 'Pesquisar'
      TabOrder = 5
    end
  end
  object cxNav: TcxDBNavigator
    Left = 498
    Top = 8
    Width = 138
    Height = 27
    Buttons.ConfirmDelete = False
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Enabled = False
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Enabled = False
    Buttons.NextPage.Visible = False
    Buttons.Insert.Enabled = False
    Buttons.Insert.Visible = False
    Buttons.Append.Enabled = False
    Buttons.Delete.Enabled = False
    Buttons.Delete.Visible = False
    Buttons.Edit.Enabled = False
    Buttons.Edit.Visible = False
    Buttons.Post.Enabled = False
    Buttons.Post.Visible = False
    Buttons.Cancel.Enabled = False
    Buttons.Cancel.Visible = False
    Buttons.Refresh.Enabled = False
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Enabled = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Enabled = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Enabled = False
    Buttons.Filter.Visible = False
    DataSource = ds
    LookAndFeel.NativeStyle = False
    TabOrder = 1
  end
  object btnIncluir: TBitBtn
    Left = 47
    Top = 8
    Width = 80
    Height = 28
    Action = actIncluir
    Caption = 'Incluir'
    TabOrder = 2
  end
  object act: TActionList
    Images = dmIMG.imgCadastro
    Left = 304
    Top = 32
    object actIncluir: TAction
      Caption = 'Incluir'
      ImageIndex = 9
      OnExecute = actIncluirExecute
    end
    object actPesquisar: TAction
      Caption = 'Pesquisar'
      ImageIndex = 5
    end
    object actEditar: TAction
      Caption = 'Editar'
      ImageIndex = 4
      OnExecute = actEditarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      ImageIndex = 10
      OnExecute = actCancelarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 11
      OnExecute = actExcluirExecute
    end
    object actGravar: TAction
      Caption = 'Gravar'
      ImageIndex = 12
      OnExecute = actGravarExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      ImageIndex = 13
      OnExecute = actSairExecute
    end
  end
  object ds: TDataSource
    DataSet = FDqu
    OnDataChange = dsDataChange
    Left = 448
    Top = 64
  end
  object FDqu: TFDQuery
    CachedUpdates = True
    Transaction = dmConnection.FDTransaction
    SchemaAdapter = FDAdapter
    Left = 448
    Top = 16
  end
  object FDAdapter: TFDSchemaAdapter
    Left = 448
    Top = 112
  end
end
