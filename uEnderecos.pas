unit uEnderecos;

interface

type
  TEstados = (ufAC,ufAM,ufAP,ufRO,ufRR,ufPA,ufTO,ufMA,ufCE,ufRN,ufPI,ufPB,ufSE,
              ufPE,ufAL,ufBA,ufGO,ufDF,ufMT,ufMS,ufMG,ufES,ufRJ,ufSP,ufPR,ufSC,
              ufRS,ufEX);

  TMunicipio = class(TObject)
  private
    FCodigo: Integer;
    FNome: string;
    FUF: TEstados;
    FCEP: string;
    FCodigoPais: integer;
    FNomePais: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property UF: TEstados read FUF write FUF;
    property CEP: string read FCEP write FCEP;
    property CopigoPais: Integer read FCodigoPais write FCodigoPais;
    property NomePais: string read FNOmePais write FNomePais;
  end;

  TEndereco = class(TObject)
  private
    FID : Integer;
    FTipo : string;
    FNome : string;
    FNumero : string;
    FComplemento : string;
    FBairro : string;
    FMunicipio : TMunicipio;
  public
    constructor Create;
    destructor Destroy;
    property ID: Integer read FID write FID;
    property Tipo: string read FTipo write FTipo;
    property Nome: string read FNome write FNome;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Municipio: TMunicipio read FMunicipio write FMunicipio;
    function EnderecoCompleto(endereco: TEndereco): string;
  end;

  function TEstadostoUF(AValue: TEstados): string;
  function UFtoTEstados(AValue: string): TEstados;

implementation

uses
  System.SysUtils;

function TEstadostoUF(AValue: TEstados): string;
begin
  case AValue of
    ufAC: Result := 'AC';
    ufAM: Result := 'AM';
    ufAP: Result := 'AP';
    ufRO: Result := 'RO';
    ufRR: Result := 'RR';
    ufPA: Result := 'PA';
    ufTO: Result := 'TO';
    ufMA: Result := 'MA';
    ufCE: Result := 'CE';
    ufRN: Result := 'RN';
    ufPI: Result := 'PI';
    ufPB: Result := 'PB';
    ufSE: Result := 'SE';
    ufPE: Result := 'PE';
    ufAL: Result := 'AL';
    ufBA: Result := 'BA';
    ufGO: Result := 'GO';
    ufDF: Result := 'DF';
    ufMT: Result := 'MT';
    ufMS: Result := 'MS';
    ufMG: Result := 'MG';
    ufES: Result := 'ES';
    ufRJ: Result := 'RJ';
    ufSP: Result := 'SP';
    ufPR: Result := 'PR';
    ufSC: Result := 'SC';
    ufRS: Result := 'RS';
    ufEX: Result := 'EX';
  else
    raise Exception.Create('UF informada é inválida.');
  end;
end;

function UFtoTEstados(AValue: string): TEstados;
begin
  if AValue = 'AC' then
    Result := ufAC
  else
  if AValue = 'AM' then
    Result := ufAM
  else
  if AValue = 'AP' then
    Result := ufAP
  else
  if AValue = 'RO' then
    Result := ufRO
  else
  if AValue = 'RR' then
    Result := ufRR
  else
  if AValue = 'PA' then
    Result := ufPA
  else
  if AValue = 'TO' then
    Result := ufTO
  else
  if AValue = 'MA' then
    Result := ufMA
  else
  if AValue = 'CE' then
    Result := ufCE
  else
  if AValue = 'RN' then
    Result := ufRN
  else
  if AValue = 'PI' then
    Result := ufPI
  else
  if AValue = 'PB' then
    Result := ufPB
  else
  if AValue = 'SE' then
    Result := ufSE
  else
  if AValue = 'PE' then
    Result := ufPE
  else
  if AValue = 'AL' then
    Result := ufAL
  else
  if AValue = 'BA' then
    Result := ufBA
  else
  if AValue = 'GO' then
    Result := ufGO
  else
  if AValue = 'DF' then
    Result := ufDF
  else
  if AValue = 'MT' then
    Result := ufMT
  else
  if AValue = 'MS' then
    Result := ufMS
  else
  if AValue = 'MG' then
    Result := ufMG
  else
  if AValue = 'ES' then
    Result := ufES
  else
  if AValue = 'RJ' then
    Result := ufRJ
  else
  if AValue = 'SP' then
    Result := ufSP
  else
  if AValue = 'PR' then
    Result := ufPR
  else
  if AValue = 'SC' then
    Result := ufSC
  else
  if AValue = 'RS' then
    Result := ufRS
  else
  if AValue = 'EX' then
    Result := ufEX
  else
    raise Exception.Create('UF informada é inválida.');
end;
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
  s.Append(endereco.Complemento);
  Result := s.ToString;
end;

end.
