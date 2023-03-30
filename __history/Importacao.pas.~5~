unit Importacao;

interface

uses
  System.SysUtils, System.Variants, UConexao, FireDAC.Comp.Client, UUtils,
  System.Win.ComObj, Vcl.Dialogs, Vcl.Forms, Vcl.Controls, Winapi.Windows ;

type
  TDadosArquivoImpostos = class
    CodigoNMC,
    DescricaoProduto,
    Imposto: string;
    CodigoEstado,
    CodigoMunicipio: Integer;
    constructor Create();
    class procedure ZerarDados(FDados: TDadosArquivoImpostos);
  end;

  TImportarArquivo = class
  public
    class procedure Importar(ANomeArquivo, ATipoImposto: string; AFDConexao: TConexao);
    class procedure GravarImpostoNacional(ADadosArquivoImpostos: TDadosArquivoImpostos; AFDConexao: TConexao);
    class procedure GravarImpostoEstadual(ADadosArquivoImpostos: TDadosArquivoImpostos; AFDConexao: TConexao);
    class procedure GravarImpostoMunicipal(ADadosArquivoImpostos: TDadosArquivoImpostos; AFDConexao: TConexao);
    class procedure ExcluirDadosImposto(ATipoImposto: string; AFDConexao: TConexao);
  end;

  TArquivoExcel = class
    class function fCreateObject(): IDispatch;
    class procedure CarregarArquivo(AXLSAplicacao : OLEVariant; ACaminho: string);
    class function BuscarArquivo: string;
    class function GetValorCelula(AExcel: OLEVariant; ALinha, AColuna: Integer; AValorSeVazio: string): string;
  end;

  TColunas = class
    const
      A_ = 1;
      B_ = 2;
      C_ = 3;
      D_ = 4;
      E_ = 5;
      F_ = 6;
      G_ = 7;
      H_ = 8;

      class function GetLetraColunaExcel(ANumeroColuna: Integer): String;
      class function GetLetraColunaLinhaExcel(ANumeroColuna, ANumeroLinha: Integer): String;
  end;
implementation

{ TImportarArquivo }

class procedure TImportarArquivo.ExcluirDadosImposto(ATipoImposto: string; AFDConexao: TConexao);
begin
  if ATipoImposto = 'Nacional' then
    AFDConexao.FDQExcluirImpostoNacional.ExecSQL
  else if ATipoImposto = 'Estadual' then
    AFDConexao.FDQExcluirImpostoEstadual.ExecSQL
  else if ATipoImposto = 'Municipal' then
    AFDConexao.FDQExcluirImpostoMunicipal.ExecSQL;
end;

class procedure TImportarArquivo.GravarImpostoEstadual(
  ADadosArquivoImpostos: TDadosArquivoImpostos; AFDConexao: TConexao);
begin
  AFDConexao.FDQImportarImpostoEstadual.Active:= True;
  AFDConexao.FDQImportarImpostoEstadual.Append;
  AFDConexao.FDQImportarImpostoEstadual.FieldByName('nmc_codigo').AsString      := ADadosArquivoImpostos.CodigoNMC;
  AFDConexao.FDQImportarImpostoEstadual.FieldByName('codigo_estado').AsInteger  := ADadosArquivoImpostos.CodigoEstado;
  AFDConexao.FDQImportarImpostoEstadual.FieldByName('imposto_estadual').AsFloat := StrToFloat(ADadosArquivoImpostos.Imposto);
  AFDConexao.FDQImportarImpostoEstadual.Post;
end;

class procedure TImportarArquivo.GravarImpostoMunicipal(
  ADadosArquivoImpostos: TDadosArquivoImpostos; AFDConexao: TConexao);
begin
  AFDConexao.FDQImportarImpostoMunicipal.Active:= True;
  AFDConexao.FDQImportarImpostoMunicipal.Append;
  AFDConexao.FDQImportarImpostoMunicipal.FieldByName('nmc_codigo').AsString        := ADadosArquivoImpostos.CodigoNMC;
  AFDConexao.FDQImportarImpostoMunicipal.FieldByName('codigo_municipio').AsInteger := ADadosArquivoImpostos.CodigoMunicipio;
  AFDConexao.FDQImportarImpostoMunicipal.FieldByName('codigo_estado').AsInteger    := ADadosArquivoImpostos.CodigoEstado;
  AFDConexao.FDQImportarImpostoMunicipal.FieldByName('imposto_municipal').AsFloat  := StrToFloat(ADadosArquivoImpostos.Imposto);
  AFDConexao.FDQImportarImpostoMunicipal.Post;

end;

class procedure TImportarArquivo.GravarImpostoNacional(
  ADadosArquivoImpostos: TDadosArquivoImpostos; AFDConexao: TConexao);
begin
  AFDConexao.FDQImportarImpostoNacional.Active:= True;
  AFDConexao.FDQImportarImpostoNacional.Append;
  AFDConexao.FDQImportarImpostoNacional.FieldByName('nmc_codigo').AsString      := ADadosArquivoImpostos.CodigoNMC;
  AFDConexao.FDQImportarImpostoNacional.FieldByName('imposto_nacional').AsFloat := StrToFloat(ADadosArquivoImpostos.Imposto);
  AFDConexao.FDQImportarImpostoNacional.Post;
end;

class procedure TImportarArquivo.Importar(ANomeArquivo, ATipoImposto: string; AFDConexao: TConexao);
var
  XLSAplicacao : OLEVariant;
  DadoCelula: string;
  Linha: Integer;
  DadosArquivoImpostos: TDadosArquivoImpostos;
const
  LinhaInicioDadosImportacao = 2;
  ValorVazioString = '';
  ValorVazioNumerico = '0';
begin
  try
    DadosArquivoImpostos := TDadosArquivoImpostos.Create;
    TImportarArquivo.ExcluirDadosImposto(ATipoImposto, AFDConexao);
    Linha := LinhaInicioDadosImportacao;
//    TCursor.IniciarProcessamento;
    XLSAplicacao:= TArquivoExcel.fCreateObject;
    try
      XLSAplicacao.DisplayAlerts := False;
    except
    end;
    XLSAplicacao.Visible := False;
    TArquivoExcel.CarregarArquivo(XLSAplicacao, ANomeArquivo);
    XLSAplicacao.Workbooks[ExtractFileName(ANomeArquivo)].WorkSheets[1].Activate;
    DadoCelula  := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.A_, ValorVazioString);
    while DadoCelula <> '' do
    begin
      DadosArquivoImpostos.CodigoNMC        := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.A_, ValorVazioString);
      DadosArquivoImpostos.DescricaoProduto := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.B_, ValorVazioString);
      if ATipoImposto = 'Nacional' then
      begin
        DadosArquivoImpostos.Imposto          := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.C_, ValorVazioNumerico);
        TImportarArquivo.GravarImpostoNacional(DadosArquivoImpostos, AFDConexao);
      end
      else if ATipoImposto = 'Estadual' then
      begin
        DadosArquivoImpostos.CodigoEstado     := StrToInt(TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.D_, ValorVazioNumerico));
        DadosArquivoImpostos.Imposto          := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.E_, ValorVazioNumerico);
        TImportarArquivo.GravarImpostoEstadual(DadosArquivoImpostos, AFDConexao);
      end
      else if ATipoImposto = 'Municipal' then
      begin
        DadosArquivoImpostos.CodigoEstado     := StrToInt(TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.D_, ValorVazioNumerico));
        DadosArquivoImpostos.CodigoMunicipio  := StrToInt(TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.F_, ValorVazioNumerico));
        DadosArquivoImpostos.Imposto          := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.G_, ValorVazioNumerico);
        TImportarArquivo.GravarImpostoMunicipal(DadosArquivoImpostos, AFDConexao);
      end;
      Sleep(100);
      TDadosArquivoImpostos.ZerarDados(DadosArquivoImpostos);
      Inc(Linha);
      DadoCelula  := TArquivoExcel.GetValorCelula(XLSAplicacao, Linha, TColunas.A_, ValorVazioString);
    end;

  finally
//    TCursor.FinalizarProcessamento;
    WinExec('taskkill /F /IM excel.exe', SW_HIDE);
    FreeAndNil(DadosArquivoImpostos);
  end;
end;

{ TArquivoExcel }

class function TArquivoExcel.BuscarArquivo: string;
var
  vOpenDialog: TOpenDialog;
begin
  try
    vOpenDialog:= TOpenDialog.Create(nil);
    vOpenDialog.Execute;
    Result:= vOpenDialog.FileName ;
    if Result = '' then
      Abort;
  finally
    FreeAndNil(vOpenDialog);
  end;

end;

class procedure TArquivoExcel.CarregarArquivo(AXLSAplicacao: OLEVariant;
  ACaminho: string);
begin
  try
    AXLSAplicacao.Workbooks.Open(ACaminho, ReadOnly := True);
  except
  end;
end;

class function TArquivoExcel.fCreateObject: IDispatch;
begin
  try
    Result:= GetActiveOleObject('Excel.Application');
  except
    Result:= CreateOleObject('Excel.Application');
  end;
end;

class function TArquivoExcel.GetValorCelula(AExcel: OLEVariant; ALinha, AColuna: Integer;
  AValorSeVazio: string): string;
var
  vValor: string;
begin
  vValor:= AExcel.WorkBooks[1].Sheets[1].Range[TColunas.GetLetraColunaLinhaExcel(AColuna, ALinha)].Value;
  Result:= TUtils.IIF((vValor = ''), AValorSeVazio, vValor);
end;

{ TColunas }

class function TColunas.GetLetraColunaExcel(ANumeroColuna: Integer): String;
begin
  case ANumeroColuna of
    TColunas.A_: Result:= 'A';
    TColunas.B_: Result:= 'B';
    TColunas.C_: Result:= 'C';
    TColunas.D_: Result:= 'D';
    TColunas.E_: Result:= 'E';
    TColunas.F_: Result:= 'F';
    TColunas.G_: Result:= 'G';
    TColunas.H_: Result:= 'H';
  end;
end;

class function TColunas.GetLetraColunaLinhaExcel(ANumeroColuna,
  ANumeroLinha: Integer): String;
begin
  Result:= TColunas.GetLetraColunaExcel(ANumeroColuna) + IntToStr(ANumeroLinha);
end;

{ TDadosArquivoImpostos }

constructor TDadosArquivoImpostos.Create;
begin
  TDadosArquivoImpostos.ZerarDados(Self);
end;

class procedure TDadosArquivoImpostos.ZerarDados(FDados: TDadosArquivoImpostos);
begin
  FDados.CodigoNMC        := '';
  FDados.DescricaoProduto := '';
  FDados.Imposto          := '0';
  FDados.CodigoEstado     := 0;
  FDados.CodigoMunicipio  := 0;
end;

end.
