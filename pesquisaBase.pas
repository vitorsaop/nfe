unit pesquisaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, FMTBcd, SqlExpr, Provider,
  DBClient, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxNavigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfmPesquisaBase = class(TForm)
    ds: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    editPesquisar: TEdit;
    btnPesquisar: TBitBtn;
    btnSelecionar: TBitBtn;
    btnSair: TBitBtn;
    cbStatus: TcxComboBox;
    Label2: TLabel;
    dbGrid: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  protected
    { Protected declararion }
    AChave      : Integer;
    AField      : String;
    ASQL        : String;
    AConnection : TFDCustomConnection;
    AFDQ         : TFDQuery;
    procedure AbrirPesquisa(AConsulta : string);
  public
    { Public declarations }
  end;

var
  fmPesquisaBase: TfmPesquisaBase;

implementation

{$R *.dfm}

uses
  libMSG;

procedure TfmPesquisaBase.btnPesquisarClick(Sender: TObject);
begin
  if (editPesquisar.Text='') then
  begin
    //Alertar(Informacao, 'É necessário preencher o campo de pesquisa.');
    editPesquisar.SetFocus;
    Exit;
  end;
  AbrirPesquisa(editPesquisar.Text);
end;

procedure TfmPesquisaBase.btnSairClick(Sender: TObject);
begin
  AChave := 0;
  Close;
end;

procedure TfmPesquisaBase.btnSelecionarClick(Sender: TObject);
begin
  if (AFDQ.Active) and (not AFDQ.IsEmpty) then
  begin
    AChave := AFDQ.FieldByName(AField).AsInteger;
    Close;
  end;
end;

procedure TfmPesquisaBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AFDQ.Close;
end;

procedure TfmPesquisaBase.FormShow(Sender: TObject);
begin
  editPesquisar.Text := '%';
end;

procedure TfmPesquisaBase.AbrirPesquisa(AConsulta : string);
begin
  try
    if Trim(ASQL) = '' then
      Exit;

    AFDQ.Active     := False;
    AFDQ.Connection := AConnection;
    AFDQ.SQL.Clear;
    AFDQ.SQL.Add(ASQL);

    if AConsulta > '' then
      AFDQ.Params.ParamByName('pBUSCAR').Value := AConsulta + '%'
    else
      AFDQ.Params.ParamByName('pBUSCAR').Value := '';

    AFDQ.Active := True;

    //if AFDQ.IsEmpty then
        //Alertar(Informacao, 'Nenhum registro encontrado. ');

  except on E:Exception do
    begin
      //Alertar(Erro, 'erro ao executar pesquisa. '+#13
      //              +E.Message+#13
      //              +E.ClassName);
    end;
  end;
end;

end.
