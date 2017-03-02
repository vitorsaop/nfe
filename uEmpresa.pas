unit uEmpresa;

interface

uses
  uPessoa, uEnderecos, System.Generics.Collections;

type
  TEmpresa = class(TPessoa)
  private
    FCNAE: integer;
    FCRT: integer;
    FNomeFantasia: string;
    procedure SetCNAE(const Value: integer);
    procedure SetCRT(const Value: integer);
    procedure SetNomeFantasia(const Value: string);
  public
    property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;
    property CNAE: integer read FCNAE write SetCNAE;
    property CRT: integer read FCRT write SetCRT;
  end;

implementation

{ TEmpresa }

procedure TEmpresa.SetCNAE(const Value: integer);
begin
  FCNAE := Value;
end;

procedure TEmpresa.SetCRT(const Value: integer);
begin
  FCRT := Value;
end;

procedure TEmpresa.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

end.
