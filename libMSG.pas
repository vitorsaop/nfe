unit libMSG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, dxAlertWindow;

type
  TAlerta = (Alerta, Erro, Informacao);
  TIcon   = (Nenhum, Warning, Information, Shield);

type
  TMensagem = class(TComponent)
  private
    FAlerta : TdxAlertWindowManager;
    FTipo   : TAlerta;
    FIcon   : TIcon;
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure  Alertar( ATipo : TAlerta = Informacao; AMSG : String = '' );
    function   Question(AMSG : String = ''; ATipo : TIcon = Nenhum; ACaption : String = 'Pergunta') : Boolean;
    { Public declarations }
  end;

//  procedure Alertar( ATipo : TAlerta = Informacao; AMSG : String = '' );
//  function  Question(AMSG : String = ''; ATipo : TIcon = Nenhum; ACaption : String = 'Pergunta') : Boolean;


implementation

(*
procedure Alertar( ATipo : TAlerta = Informacao; AMSG : String = '' );
var
  Alert : TdxAlertWindowManager;
begin
  Alert := TdxAlertWindowManager.Create(nil);
  try
    Alert.WindowPosition := awpAuto;
    case  ATipo of
      Erro       : Alert.Show('Erro', AMSG);
      Alerta     : Alert.Show('Alerta', AMSG);
      Informacao : Alert.Show('Informação', AMSG);
    end;
    Application.ProcessMessages;
  finally
    FreeAndNil(Alert);
  end;
end;

*)

{ TMensagem }

procedure TMensagem.Alertar(ATipo: TAlerta; AMSG: String);
begin
  FAlerta.WindowPosition := awpAuto;
  case  ATipo of
    Erro       : FAlerta.Show('Erro', AMSG);
    Alerta     : FAlerta.Show('Alerta', AMSG);
    Informacao : FAlerta.Show('Informação', AMSG);
  end;
end;

constructor TMensagem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAlerta := TdxAlertWindowManager.Create(AOwner);
  FTipo   := Informacao;
  FIcon   := Nenhum;
end;

destructor TMensagem.Destroy;
begin
  FreeAndNil(FAlerta);
  inherited Destroy;
end;

function TMensagem.Question(AMSG: String; ATipo: TIcon;
  ACaption: String): Boolean;
var
  td: TTaskDialog;
  tb: TTaskDialogBaseButtonItem;
begin
  Result := False;
  td := TTaskDialog.Create(nil);
  try
    td.Caption := ACaption;
    td.Text    := AMSG;
    case  ATipo of
      Nenhum      : td.MainIcon := tdiNone;
      Warning     : td.MainIcon := tdiWarning;
      Information : td.MainIcon := tdiInformation;
      Shield      : td.MainIcon := tdiShield;
    end;

    td.CommonButtons := [];

    tb := td.Buttons.Add;
    tb.Caption := 'Sim';
    tb.ModalResult := 1;

    tb := td.Buttons.Add;
    tb.Caption := 'Não';
    tb.ModalResult := 0;

    td.Execute;

    if td.ModalResult = 1 then
      Result := True
    else
    if td.ModalResult = 0 then
      Result := False;

//    case tb.ModalResult of
//      0: begin
//           ShowMessage('False');
//           Result := False;
//         end;
//      1: begin
//           ShowMessage('True');
//           Result := True;
//         end
//      else
//        Result := False;
//    end;

  finally
    FreeAndNil(td);
  end;
end;

end.
