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
    property CopigoPais: string read FCodigoPais write FCodigoPais;
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
  end;

  TEnderecosList = class(Tlist)
  private
    function getItem(Index: Integer): TEndereco;
    procedure setItem(Index: Integer; const Value: TEndereco);
  public
    property Item[Index: Integer]: TEndereco read getItem write setItem; default;
  end;

implementation

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

{ TEnderecosList }

function TEnderecosList.getItem(Index: Integer): TEndereco;
begin
  result := inherited
end;

procedure TEnderecosList.setItem(Index: Integer; const Value: TEndereco);
begin

end;

end.
