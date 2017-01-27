unit baseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  Tfrmbase = class(TForm)
    fadeout: TTimer;
    fadein: TTimer;
    procedure fadeinTimer(Sender: TObject);
    procedure fadeoutTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function getCaption : string; virtual; abstract;
  public
    { Public declarations }
  end;

var
  frmbase: Tfrmbase;

implementation

{$R *.dfm}

procedure Tfrmbase.fadeinTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue + 15;
  fadein.Enabled := not (AlphaBlendValue = 255);
end;

procedure Tfrmbase.fadeoutTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue - 15;
  if AlphaBlendValue = 0 then
    Close;
end;

procedure Tfrmbase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case KEY of
    VK_ESCAPE : fadeout.Enabled := True;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0); //esse comando perform não passa pelo SO. é enviado um comando para passar para o próximo foco sem passar pela fila do SO.
  end;
end;

procedure Tfrmbase.FormShow(Sender: TObject);
begin
  //frmbase.Caption := getCaption;
end;

end.
