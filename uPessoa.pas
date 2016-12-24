unit uPessoa;

interface

uses
  uEnderecos, System.Generics.Collections;
type
  TPessoa = class(TObject)
  protected
    FCNPJ: string;
    FCPF: string;
    FNome: string;
    FEndereco : TEndereco;
    FEnderecoEntrega  : TList<TEndereco>;
    FEnderecoCobranca : TList<TEndereco>;

  published
    constructor Create;
    destructor Destroy;
  public
    property CNPJ : string                       read FCNPJ             write FCNPJ;
    property CPF  : string                       read FCPF              write FCPF;
    property Nome : string                       read FNome             write FNOme;
    property Endereco: TEndereco                 read FEndereco         write FEndereco;
    property EnderecoCobranca : TList<TEndereco> read FEnderecoCobranca write FEnderecoEntrega;
    property EnderecoEntrega  : TList<TEndereco> read FEnderecoEntrega  write FEnderecoEntrega;
  end;

implementation

uses
  System.SysUtils;
{ TPessoa }

constructor TPessoa.Create;
begin
  inherited;
  FEndereco         := TEndereco.Create;
  FEnderecoEntrega  := TList<TEndereco>.Create;
  FEnderecoCobranca := TList<TEndereco>.Create;
end;

destructor TPessoa.Destroy;
begin
  FEndereco.Free;
  FEnderecoEntrega.Free;
  FEnderecoCobranca.Free;
  inherited;
end;

end.
