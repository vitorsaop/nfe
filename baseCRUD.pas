unit baseCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, baseForm, Vcl.ExtCtrls, Data.DB,
  System.Generics.Collections, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.StdCtrls, cxPC,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Grids, Vcl.DBGrids;

type
  Tfrmbasecrud = class(Tfrmbase)
    dscrud: TDataSource;
    dsquery: TDataSource;
    sbinfo: TStatusBar;
    imgpesquisa: TImageList;
    pnCaption: TPanel;
    Image1: TImage;
    Label1: TLabel;
    pntools: TPanel;
    pc: TPageControl;
    tabcrud: TTabSheet;
    tabquery: TTabSheet;
    Panel1: TPanel;
    edtbusca: TButtonedEdit;
    dbquery: TDBGrid;
    accrud: TActionList;
    btnnovo: TSpeedButton;
    btnexcluir: TSpeedButton;
    btnimprimir: TSpeedButton;
    btncancelar: TSpeedButton;
    btnsalvar: TSpeedButton;
    btnsair: TSpeedButton;
    btneditar: TSpeedButton;
    btnultimo: TSpeedButton;
    btnproximo: TSpeedButton;
    btnanterior: TSpeedButton;
    btnprimeiro: TSpeedButton;
    imgcrud: TImageList;
    actnovoenable: TAction;
    acteditarenable: TAction;
    actexcluirenable: TAction;
    actimprimirenable: TAction;
    actcancelarenable: TAction;
    actsalvarenable: TAction;
    actsairenable: TAction;
    actnovodisable: TAction;
    acteditardisable: TAction;
    actexcluirdisable: TAction;
    actimprimirdisable: TAction;
    actcancelardisable: TAction;
    actsalvardisable: TAction;
    actsairdisable: TAction;
    actanteriorenable: TAction;
    actproximoenable: TAction;
    actprimeiroenable: TAction;
    actultimoenable: TAction;
    actanteriordisable: TAction;
    actproximodisable: TAction;
    actprimeirodisable: TAction;
    actultimodisable: TAction;
    actbuscardisable: TAction;
    actbuscarenable: TAction;
    btnbuscar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnnovoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnnovoMouseLeave(Sender: TObject);
    procedure actsalvarenableUpdate(Sender: TObject);
    procedure actnovoenableUpdate(Sender: TObject);
  private
    FCheckUnique : TDictionary<string,string>;
    procedure setCheckUnique(const value : TDictionary<string,string>);
    procedure DoAfterScroll(Dataset : TdataSet);
    procedure habilitarbotao(Sender : TObject; vaction : TAction );
  protected
    FindFilter : TField;
    //função que retorna o nome do campo chave para filtrar o registro no dataset de CRUD;
    function getQueryKeyField : string;virtual;abstract;
    //função que retorna o campo chave do dataset CRUD
    function getKeyField : string;virtual;abstract;
    //definir se o usuário logado poderá excluir,alterar,cadastrar,imprimir
    procedure LoadPermissao; virtual;
    //permissão para acesso a campos
    procedure LoadRestricao;virtual;
    //função para verificar se já existe um registro já cadastro com base nos campos passados pra ela
    function DoCheckUnique: boolean;virtual;
  public
    property CheckUnique : TDictionary<string,string> read FCheckUnique write setCheckUnique;
  end;

var
  frmbasecrud: Tfrmbasecrud;

implementation

{$R *.dfm}

{ Tfrmbasecrud }

procedure Tfrmbasecrud.actnovoenableUpdate(Sender: TObject);
begin
  inherited;
  if not(dscrud.State in [dsinsert,dsedit]) then
  begin
    //TSpeedButton(Sender).Action := TAction(Sender).ActionList[
    //TAction(Sender).Enabled := false;
    //TAction(Sender).ImageIndex := TAction(Sender).ImageIndex -1;
  end;

  //TAction(Sender).Enabled := not(dscrud.State in [dsinsert,dsedit]);
end;

procedure Tfrmbasecrud.actsalvarenableUpdate(Sender: TObject);
begin
  inherited;
  if dscrud.State in [dsinsert,dsedit] then
  begin
    //TAction(Sender).Enabled := true;
    //TAction(Sender).ImageIndex := TAction(Sender).ImageIndex +1;
    //TAction(Sender).Enabled := dscrud.State in [dsinsert,dsedit];
  end;

end;

procedure Tfrmbasecrud.DoAfterScroll(Dataset: TdataSet);
begin
  if not Dsquery.DataSet.IsEmpty then
  begin
    dscrud.DataSet.Filter := getKeyField +'='+ dsquery.DataSet.FieldByName(getQueryKeyField).asstring;
    dscrud.DataSet.Filtered := true;
    if not dscrud.DataSet.Active then
      dscrud.DataSet.Open;
    sbinfo.SimpleText := 'Total de Registros: ' + IntToStr(dsquery.DataSet.RecordCount);
  end;

end;

function Tfrmbasecrud.DoCheckUnique: boolean;
begin

end;

procedure Tfrmbasecrud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCheckUnique.Free;
  inherited;
end;

procedure Tfrmbasecrud.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckUnique := TDictionary<string,string>.Create();
  //dsquery.DataSet.AfterScroll := DoAfterScroll();
end;

procedure Tfrmbasecrud.LoadPermissao;
begin

end;

procedure Tfrmbasecrud.LoadRestricao;
begin

end;

procedure Tfrmbasecrud.setCheckUnique(const value: TDictionary<string, string>);
begin
  FCheckUnique := value;
end;

procedure Tfrmbasecrud.btnnovoMouseLeave(Sender: TObject);
begin
  inherited;
  //accrud.Actions[0].ImageIndex := 0;
 // SpeedButton4.Action := actnovodisable;
  //if btnnovo.Action = actnovoenable then
   // habilitarbotao(Sender,actnovodisable);
end;

procedure Tfrmbasecrud.btnnovoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //accrud.Actions[0].ImageIndex := 1;
  //SpeedButton4.Action := actnovoenable;
  //if btnnovo.Action = actnovodisable then
    //habilitarbotao(Sender,actnovoenable);
end;

procedure Tfrmbasecrud.habilitarbotao(Sender: TObject; vaction: TAction);
begin
  //TSpeedButton(Sender).Action := vaction;
end;

end.
