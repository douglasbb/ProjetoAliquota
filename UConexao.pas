unit UConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,  StrUtils,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  Data.DBXOdbc, Data.SqlExpr, Data.DbxSqlite, Datasnap.DBClient,
  Datasnap.DSConnect, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TConexao = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQListaProdutos: TFDQuery;
    FDQImportarImpostoNacional: TFDQuery;
    FDQBuscarProdutos: TFDQuery;
    FDQExcluirImpostoNacional: TFDQuery;
    FDQImportarImpostoEstadual: TFDQuery;
    FDQExcluirImpostoEstadual: TFDQuery;
    FDQImportarImpostoMunicipal: TFDQuery;
    FDQExcluirImpostoMunicipal: TFDQuery;
  private
    function fGetSQL(AListaProdutos, AVisaoImpostos: string): string;
  public
    procedure pBuscarProdutos(AVisaoImpostos, AListaProdutos: string);

  end;

  TUtils = class
    class function IIF<T>(ACondition: Boolean; ResultTrue, ResultFalse: T): T;
  end;

var
  Conexao: TConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TConexao }

function TConexao.fGetSQL(AListaProdutos, AVisaoImpostos: string): string;
begin
  Result:=
    'select distinct '+
        'nmc, '+
        'descricao, '+
        TUtils.IIF<string>(ContainsText(AVisaoImpostos, 'Nacional'), 'imposto_nacional, ', '') +
        TUtils.IIF<string>(ContainsText(AVisaoImpostos, 'Estadual'), 'estado, imposto_estadual, ', '') +
        TUtils.IIF<string>(ContainsText(AVisaoImpostos, 'Nacional'), 'municipio, imposto_municipal, ', '') +
        '0.00 as valor, '+
        '0.00 as valor_final '+
    'from ( '+
        'select distinct '+
            'produto.nmc, '+
            'produto.descricao, '+
            'estado.descricao as estado, '+
            'municipio.descricao as municipio, '+
            'produto_imposto_nacional.imposto_nacional, '+
            'produto_imposto_estadual.imposto_estadual, '+
            'produto_imposto_municipal.imposto_municipal '+
        'from '+
            'produto '+
            'join produto_imposto_nacional on produto_imposto_nacional.nmc_codigo = produto.nmc '+
            'join produto_imposto_estadual on produto_imposto_estadual.nmc_codigo = produto.nmc '+
            'join estado on estado.codigo = produto_imposto_estadual.codigo_estado '+
            'join produto_imposto_municipal on produto_imposto_municipal.nmc_codigo = produto_imposto_estadual.nmc_codigo and '+
                'produto_imposto_municipal.codigo_estado = produto_imposto_estadual.codigo_estado '+
            'join municipio on municipio.codigo = produto_imposto_municipal.codigo_municipio '+
        'where '+
            'produto.codigo in  '+AListaProdutos+
        'order by '+
            '2,3,4 '+
    ')cons';
end;

procedure TConexao.pBuscarProdutos(AVisaoImpostos, AListaProdutos: string);
begin
  FDQBuscarProdutos.Active:= False;
  FDQBuscarProdutos.SQL.Clear;
  FDQBuscarProdutos.SQL.Add(fGetSQL(AListaProdutos, AVisaoImpostos));
  FDQBuscarProdutos.Open;
end;

{ TUtils }

class function TUtils.IIF<T>(ACondition: Boolean; ResultTrue,
  ResultFalse: T): T;
begin
  if ACondition then
    Result := ResultTrue
  else
    Result := ResultFalse;
end;

end.
