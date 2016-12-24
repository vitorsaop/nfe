unit teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uPessoa,uEnderecos;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ender : TEndereco;
  pess  : TPessoa;
begin
  pess := TPessoa.Create;
  ender := TEndereco.Create;
  ender.Nome := 'Antonio d Andrea';
  ender.Tipo := 'AV';
  ender.Numero := '564';
  ender.Bairro := 'PQ Nossa Senhora das Dores';

  ShowMessage(ender.EnderecoCompleto(ender));

end;

end.
