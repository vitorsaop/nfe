unit uEnderecos;

interface

type
  TMunicipio = class(TObject)
  private
    FCodigo: Integer;
    FNome: string;
    FUF: string;
    FCEP: string;
    FCodigoPais: integer;
    FNomePais: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property UF: string read FUF write FUF;
    property CEP: string read FCEP write FCEP;
    property CopigoPais: Integer read FCodigoPais write FCodigoPais;
    property NomePais: string read FNOmePais write FNomePais;
  end;

  TEndereco = class(TObject)
  private
    FTipo : string;
    FNome : string;
    FNumero : string;
    FComplemento : string;
    FBairro : string;
    FMunicipio : TMunicipio;
  public
    constructor Create;
    destructor Destroy;
    property Tipo: string read FTipo write FTipo;
    property Nome: string read FNome write FNome;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Municipio: TMunicipio read FMunicipio write FMunicipio;
    function EnderecoCompleto(endereco: TEndereco): string;
  end;

implementation

uses
  System.SysUtils;
{ TEndereco }

constructor TEndereco.Create;
begin
  inherited;
  FMunicipio := TMunicipio.Create;
end;

destructor TEndereco.Destroy;
begin
  FMunicipio.Free;
  inherited;
end;


function TEndereco.EnderecoCompleto(endereco: TEndereco): string;
var
  s : TStringBuilder;
begin
  s := TStringBuilder.Create(endereco.Tipo);
  s.Append(':');
  s.Append(endereco.Nome);
  s.Append(' ');
  s.Append(endereco.Numero);
  s.Append(' ');
  s.Append(endereco.Bairro);
  Result := s.ToString;
end;

end.
