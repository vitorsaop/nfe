unit uPessoa;

interface

type
  TPessoa = class(TObject)
  protected
    FCNPJ: string;
    FCPF: string;
    FNome: string;
    FEndereco: TEndereco;
  published
    constructor Create;
    destructor Destroy;
  public
    property CNPJ: string read FCNPJ write FCNPJ;
    property CPF: string read FCPF write FCPF;
    property Nome: string read FNome write FNOme;
    property Endereco: TEndereco read FEndereco write FEndereco;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin
  inherited Create;
  Municipio.Create;
end;

end.
