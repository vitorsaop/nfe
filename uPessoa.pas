unit uPessoa;

interface

uses
  uEnderecos, System.Generics.Collections;
type
  TPessoa = class(TObject)
  private
    FNome: string;
//    FNomeFantasia : string;
    FEndereco : TEndereco;
    FCNPJ : string;
    FCPF : string;
    FInscricaoEstadual: string;
    FRG : string;
    FInscricaoMunicipal: string;
//    FEnderecoEntrega  : TList<TEndereco>;
//    FEnderecoCobranca : TList<TEndereco>;
//    FCNAE: Integer;

//    FCRT: Integer;
    FPessoa: string;
    FInscrEstadualST: TDictionary<TEstados,string>;
  protected
    procedure SetInscrEstadualST(const Value: TDictionary<TEstados,string>);
    function getInscrEstadual: string;
    function getInscrFederal: string;
    function getInscrMunicipal: string;
    procedure setInscrEstadual(const Value: string);
    procedure setInscrFederal(const Value: string);
    procedure setInscrMunicipal(const Value: string);
  public
    constructor Create;
    destructor Destroy;
    property Nome : string                       read FNome             write FNOme;
//    property NomeFantasia : string               read FNomeFantasia     write FNomeFantasia;
    property InscricaoFederal: string            read getInscrFederal   write setInscrFederal;
    property InscricaoEstadual: string           read getInscrEstadual  write setInscrEstadual;
    property InscricaoMunicipal: string          read getInscrMunicipal write setInscrMunicipal;
    property InscrEstadualST: TDictionary<TEstados,string>
                                                 read FInscrEstadualST write SetInscrEstadualST;
//    property CNAE: Integer                       read FCNAE             write FCNAE;
//    property CRT : Integer                       read FCRT              write FCRT;
    property Pessoa: string                      read FPessoa           write FPessoa;
    property Endereco: TEndereco                 read FEndereco         write FEndereco;
//    property EnderecoCobranca : TList<TEndereco> read FEnderecoCobranca write FEnderecoEntrega;
//    property EnderecoEntrega  : TList<TEndereco> read FEnderecoEntrega  write FEnderecoEntrega;
  end;

implementation

uses
  System.SysUtils;

{ TPessoa }

constructor TPessoa.Create;
begin
  inherited;
  FEndereco         := TEndereco.Create;
//  FEnderecoEntrega  := TList<TEndereco>.Create;
//  FEnderecoCobranca := TList<TEndereco>.Create;
end;

destructor TPessoa.Destroy;
begin
  FEndereco.Free;
//  FEnderecoEntrega.Free;
//  FEnderecoCobranca.Free;
  inherited;
end;

function TPessoa.getInscrEstadual: string;
begin
  if Pessoa = 'F' then
    Result := FRG
  else
  if Pessoa = 'J' then
    Result := FInscricaoEstadual
  else
    Result := '';
end;


function TPessoa.getInscrFederal: string;
begin
  if Pessoa = 'F' then
    Result := FCPF
  else
  if Pessoa = 'J' then
    Result := FCNPJ
  else
    Result := '';
end;


function TPessoa.getInscrMunicipal: string;
begin
  if Pessoa = 'J' then
    Result := FInscricaoMunicipal
  else
    Result := '';
end;


procedure TPessoa.setInscrEstadual(const Value: string);
begin
  if Pessoa = 'F' then
    FRG := Value
  else
  if Pessoa = 'J' then
    FInscricaoEstadual := Value;
end;


procedure TPessoa.SetInscrEstadualST(const Value: TDictionary<TEstados,string>);
begin
  FInscrEstadualST := Value;
end;

procedure TPessoa.setInscrFederal(const Value: string);
begin
  if Pessoa = 'F' then
    FCPF := Value
  else
  if Pessoa = 'J' then
    FCNPJ := Value;
end;


procedure TPessoa.setInscrMunicipal(const Value: string);
begin
  if Pessoa = 'J' then
    FInscricaoMunicipal := Value;
end;

end.
