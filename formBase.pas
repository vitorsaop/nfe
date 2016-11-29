unit formBase;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinsDefaultPainters,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxNavigator, cxDBNavigator,
  cxClasses, cxContainer, cxEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, dxAlertWindow,
  cxLabel, FireDAC.Comp.Client, ACBrBase,
  CxPc, Vcl.Buttons, libMSG;

type
  TfmFormBase = class(TForm)
    pn: TPanel;
    cxNav: TcxDBNavigator;
    act: TActionList;
    actIncluir: TAction;
    actPesquisar: TAction;
    actEditar: TAction;
    actCancelar: TAction;
    actExcluir: TAction;
    actGravar: TAction;
    actSair: TAction;
    ds: TDataSource;
    FDqu: TFDQuery;
    FDAdapter: TFDSchemaAdapter;
    btnSair: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnIncluir: TBitBtn;
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FMSG     : TMensagem;
    procedure ChangeEnter(Sender: TObject);
    procedure ChangeExit(Sender: TObject);
    procedure HabilitarControlesVisuais(AStatus: Boolean);
    { Private declarations }
  protected
    { Protected declarations }
  public
      CxPC : TcxPageControl;
    { Public declarations }
  end;

var
  fmFormBase: TfmFormBase;

implementation


{$R *.dfm}

uses
  //libMSG,
  dataConnection,
  dataImg;

procedure TfmFormBase.ChangeEnter(Sender: TObject);
begin
  (*
  if Sender is TCXDBTextEdit then
    TCXDBTextEdit(Sender).Style.Color := $00E6FED8;
  if Sender is TCXDBMemo then
    TCXDBMemo(Sender).Style.Color := $00E6FED8
  else
  if Sender is TCXDBComboBox then
    TCXDBComboBox(Sender).Style.Color := $00E6FED8
  else
  if Sender is TcxCustomLookupComboBox then
    TcxCustomLookupComboBox(Sender).Style.Color := $00E6FED8
  *)
end;

procedure TfmFormBase.ChangeExit(Sender: TObject);
begin
  (*
  if Sender is TCXDBTextEdit then
    TCXDBTextEdit(Sender).Style.Color := clWindow
  else
  if Sender is TCXDBMemo then
    TCXDBMemo(Sender).StyleHot.Color := clWindow
  else
  if Sender is TCXDBComboBox then
    TCXDBComboBox(Sender).StyleHot.Color := clWindow
  else
  if Sender is TcxCustomLookupComboBox then
    TcxCustomLookupComboBox(Sender).StyleHot.Color := clWindow;
  *)
end;

procedure TfmFormBase.dsDataChange(Sender: TObject; Field: TField);
begin
  btnIncluir.Enabled    := not (ds.State in [dsInsert, dsEdit]);
  BtnGravar.Enabled     := (ds.State in [dsInsert, dsEdit]);
  BtnEditar.Enabled     := (ds.State in [dsBrowse]);
  BtnExcluir.Enabled    := (ds.State in [dsBrowse, dsEdit]);
  BtnCancelar.Enabled   := (ds.State in [dsInsert, dsEdit]);
  BtnPesquisar.Enabled  := not (ds.State in [dsInsert, dsEdit]);
end;

procedure TfmFormBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//var
//  I : Integer;
begin
(*  for I := 0 to ComponentCount -1 do
  begin
    if Components[i] is TFDQuery then
    begin
      if (TFDQuery(Components[I]).State in [dsEdit, dsInsert]) then
      begin

      end;
    end;
  end;
*)
end;

procedure TfmFormBase.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  (*
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TCXDBTextEdit then
    begin
      TCXDBTextEdit(Components[I]).OnEnter  := ChangeEnter;
      TCXDBTextEdit(Components[I]).OnExit   := ChangeExit;
    end
    else
    if Components[I] is TcxCustomLookupComboBox then
    begin
      TcxCustomLookupComboBox(Components[I]).OnEnter := ChangeEnter;
      TcxCustomLookupComboBox(Components[I]).OnExit  := ChangeExit;
    end
    else
    if Components[I] is TCXDBComboBox then
    begin
      TCXDBComboBox(Components[I]).OnEnter := ChangeEnter;
      TCXDBComboBox(Components[I]).OnExit  := ChangeExit;
    end
    else
    if Components[I] is TCXDBMemo then
    begin
      TCXDBMemo(Components[I]).OnEnter   := ChangeEnter;
      TCXDBMemo(Components[I]).OnExit    := ChangeExit;
    end
  end;
  *)
end;

procedure TfmFormBase.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMSG);
end;

procedure TfmFormBase.HabilitarControlesVisuais(AStatus : Boolean);
var
  I : Integer;
begin
  (*
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TCXDBTextEdit then
      TCXDBTextEdit(Components[I]).Enabled            := AStatus
    else
    if Components[I] is TcxCustomLookupComboBox then
      TcxCustomLookupComboBox(Components[I]).Enabled  := AStatus
    else
    if Components[I] is TCXDBComboBox then
      TCXDBComboBox(Components[I]).Enabled            := AStatus
    else
    if Components[I] is TCXDBMemo then
      TCXDBMemo(Components[I]).Enabled                := AStatus;
  end;
  *)
end;

procedure TfmFormBase.FormShow(Sender: TObject);
begin
  try
    FDqu.Active   := True;
    FMSG          := TMensagem.Create(Application);
    //HabilitarControlesVisuais(False);
  except on E:Exception do
    begin
      ShowMessage('Erro ao conectar base de dados' +#13+
                  'Erro : ' + E.Message +#13+
                  'Classe : ' + E.ClassName);
    end;
  end;
end;

procedure TfmFormBase.actCancelarExecute(Sender: TObject);
begin
  try
    FDqu.Cancel;
  except on E:Exception do
    begin
      FMSG.Alertar(Erro, 'Erro ao cancelar cadastro. '+#13
                   +E.Message+#13
                   +E.ClassName);
    end;
  end;
end;

procedure TfmFormBase.actEditarExecute(Sender: TObject);
begin
  try
    FDqu.Edit;
    //HabilitarControlesVisuais(True);
  except on E:Exception do
    begin
      FMSG.Alertar(Erro, 'Erro ao editar cadastro. '+#13
              +E.Message+#13
              +E.ClassName);
    end;
  end;
end;

procedure TfmFormBase.actExcluirExecute(Sender: TObject);
begin
  if not FMSG.Question('Deseja excluir ?') then
    Exit;

  try
    FDqu.Delete;
    FDAdapter.ApplyUpdates(0);
  except on E:Exception do
    begin
      FMSG.Alertar(Erro, 'Erro ao excluir cadastro. '+#13
                  +E.Message+#13
                  +E.ClassName);
    end;
  end;
end;

procedure TfmFormBase.actGravarExecute(Sender: TObject);
begin
  try
    if FDqu.State in [dsEdit, dsInsert] then
      FDqu.Post;

    fdAdapter.ApplyUpdates(0);
    FMSG.Alertar(Informacao,'Cadastro realizado com sucesso.');
    //HabilitarControlesVisuais(False);
  except on E:Exception do
    begin
      FMSG.Alertar(Erro, 'Erro ao gravar cadastro. '+#13
              +E.Message+#13
              +E.ClassName);
    end;
  end;
end;

procedure TfmFormBase.actIncluirExecute(Sender: TObject);
begin
  try
    FDqu.Insert;
    FDqu.Post;
    FDqu.Edit;
    //HabilitarControlesVisuais(True);
  except on E:Exception do
    begin
      FMSG.Alertar(Erro, 'Erro ao incluir cadastro. '+#13
              +E.Message+#13
              +E.ClassName);
      FDqu.Cancel;
    end;
  end;
end;

procedure TfmFormBase.actSairExecute(Sender: TObject);
begin
  Close;
end;

end.
