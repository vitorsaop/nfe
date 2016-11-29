unit libForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxPC, cxStyles, cxCustomData, formBase;

  function CriarAba(ACxPC : TcxPageControl; AClsForm : TFormClass;
                    ANome : string; var AForm : TForm) : TcxTabSheet;
  function AbaExiste(ACxPC : TcxPageControl; NomeAba: string): Boolean;
  procedure FecharAba(ACxPC : TcxPageControl; NomeAba: string; AFecharTudo : Boolean = False);

implementation

uses
  libMSG;


function CriarAba(ACxPC : TcxPageControl; AClsForm : TFormClass;
                  ANome : string; var AForm : TForm) : TcxTabSheet;
var
  Form     : TForm;
  TabSheet : TCxTabSheet;
begin
  try
    Result := nil;

    if AbaExiste(ACxPC, ANome) then
      Exit;

    TabSheet := TCxTabSheet.Create(nil);
    Form     := AClsForm.Create(TabSheet);

    with TabSheet do
    begin
      TabSheet.Color    := clGray;
      PageControl       := AcxPC;
      Caption           := Form.Caption;
    end;

    with Form do
    begin
      Align             := alNone;
      BorderStyle       := bsSizeable;
      Parent            := TabSheet;
      Caption           := ANome;
      Show;
      ACxPC.ActivePage  := TabSheet;
      Left              := Round((Parent.Width  - Form.Width)/2);
      Top               := Round((Parent.Height - Form.Height)/2);
    end;

    AForm  := (Form as AClsForm);
    Result := TabSheet;

  except on E:Exception do
    begin
        //Alertar(Erro, 'Erro ao criar aba.'+#13
        //      +E.Message+#13
        //      +E.ClassName);
    end;
  end;
end;

function AbaExiste(ACxPC : TcxPageControl; NomeAba: string): Boolean;
var
  i: Integer;
  Aba: TCxTabSheet;
begin
  Result := False;
  for i := 0 to AcxPC.PageCount - 1 do
  begin
    if AcxPC.Pages[i].Caption = NomeAba then
    begin
      Aba := AcxPC.Pages[i];
      AcxPC.ActivePage := Aba;
      Result := True;
      break;
    end;
  end;
end;

procedure FecharAba(ACxPC : TcxPageControl; NomeAba: string; AFecharTudo : Boolean = False);
var
  i: integer;
  Aba: TCxTabSheet;
begin
  for i := 0 to ACxPC.PageCount - 1 do
  begin
    if (Trim(NomeAba) = '') and (AFecharTudo) then
    begin
      Aba := ACxPC.Pages[i];
      Aba.Destroy;
    end
    else
    if (ACxPC.Pages[i].Caption = NomeAba) and (not AFecharTudo) then
    begin
      Aba := ACxPC.Pages[i];
      Aba.free;
      ACxPC.ActivePageIndex := 0;
    end;
    if not AFecharTudo then
      break;
  end;
end;

end.
