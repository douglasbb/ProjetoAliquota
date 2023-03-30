﻿unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UConexao, cxGraphics, cxControls, Importacao,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, UUtils,
  cxData, cxDataStorage, cxEdit, cxNavigator, CxGridExportLink, ShellAPI,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  dxLayoutContainer, dxLayoutControlAdapters, Vcl.Menus, cxClasses,
  dxLayoutLookAndFeels, Vcl.StdCtrls, cxButtons, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, cxDBCheckComboBox, cxCustomListBox,
  cxCheckListBox, cxCheckBox, cxCurrencyEdit, cxCalc;

type
  TPrincipal = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxgridProdutos: TcxGridDBTableView;
    cxgProdutoLevel1: TcxGridLevel;
    cxgProduto: TcxGrid;
    dxLayoutItem1: TdxLayoutItem;
    dsListaProdutos: TDataSource;
    btnImportarArquivoImposto: TcxButton;
    libtnBuscarArquivoImportacao: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    dxLayoutGroup1: TdxLayoutGroup;
    OpenDialog: TOpenDialog;
    ckbListaProdutos: TcxCheckComboBox;
    liListadeProdutos: TdxLayoutItem;
    dsProdutos: TDataSource;
    cxgridProdutosnmc: TcxGridDBColumn;
    cxgridProdutosdescricao: TcxGridDBColumn;
    cxgridProdutosvalor_produto: TcxGridDBColumn;
    cxgImpostoNacional: TcxGridDBColumn;
    cxgImpostoEstadual: TcxGridDBColumn;
    cxgImpostoMunicipal: TcxGridDBColumn;
    cxgridProdutosvalor_final: TcxGridDBColumn;
    dxLayoutGroup2: TdxLayoutGroup;
    ckbImpostos: TcxCheckComboBox;
    dxLayoutItem6: TdxLayoutItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmbTipoImposto: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    cxgridProdutosEstado: TcxGridDBColumn;
    cxgridProdutosMunicipio: TcxGridDBColumn;
    dxLayoutGroup3: TdxLayoutGroup;
    sdExportarExcel: TSaveDialog;
    cxStyle2: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure btnImportarArquivoImpostoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbListaProdutosPropertiesChange(Sender: TObject);
    procedure cxCheckComboBox1PropertiesChange(Sender: TObject);
    procedure cxgridProdutosvalor_produtoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cmbTipoImpostoPropertiesChange(Sender: TObject);
    procedure dxLayoutGroup3Button0Click(Sender: TObject);
    procedure dxLayoutGroup1Button0Click(Sender: TObject);
    procedure dxLayoutGroup2Button0Click(Sender: TObject);
  private
    procedure pConectarBaseDados;
    procedure pImportarArquivo;
    procedure pCarregarComboBoxProdutos;
    procedure pConfigurarVisaoGrid;
    procedure pCalcularValorProduto(AValor: string);
    procedure pLimparSelecaoProdutos;
    procedure pExportarGridParaExcel(AGrid: TcxGrid; ANomeArquivo: string);

    function fCarregarProdutosSelecionados: string;
    function fGetValorImposto(AStateCheckbox: TcxCheckBoxState; AFieldNameImposto: string;
      AValorProduto: Double): Double;
  public

  end;

var
  Principal: TPrincipal;
  FConexao: TConexao;
implementation

{$R *.dfm}

procedure TPrincipal.ckbListaProdutosPropertiesChange(Sender: TObject);
var
  ListaProdutos: string;
begin
  ListaProdutos:= fCarregarProdutosSelecionados;
  if ListaProdutos <> '' then
    FConexao.pBuscarProdutos(ckbImpostos.Text, ListaProdutos);
end;

procedure TPrincipal.cmbTipoImpostoPropertiesChange(Sender: TObject);
begin
  //Exibirá a opção de buscar arquivo somente se o tipo de imposto for selecionado, cada arquivo tem seu padrão
  libtnBuscarArquivoImportacao.Enabled:= TUtils.IIF<boolean>(cmbTipoImposto.Text = 'Selecione', False, True);
end;

procedure TPrincipal.btnImportarArquivoImpostoClick(Sender: TObject);
begin
  pImportarArquivo;
end;

procedure TPrincipal.cxCheckComboBox1PropertiesChange(Sender: TObject);
begin
  //A cada produto selecionado, atualiza a lista de acordo com o a visão de imposto
  liListadeProdutos.Enabled:= TUtils.IIF<boolean>(ckbImpostos.Text = 'Selecione', False, True);
  pConfigurarVisaoGrid;
  dsProdutos.DataSet.Close;
  pLimparSelecaoProdutos;
end;

procedure TPrincipal.cxgridProdutosvalor_produtoPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin     
  if VarToStr(DisplayValue) <> '' then
    pCalcularValorProduto(VarToStr(DisplayValue));
end;

procedure TPrincipal.dxLayoutGroup3Button0Click(Sender: TObject);
begin
  pExportarGridParaExcel(cxgProduto, 'Lista de produtos.xlsx');
end;

function TPrincipal.fCarregarProdutosSelecionados: string;
var
  I: Integer;
begin
  Result:= '';
  for I := 0 to ckbListaProdutos.Properties.Items.Count -1 do
  begin
    Result:= Result + TUtils.IIF<string>(ckbListaProdutos.States[I] = cbsChecked, (IntToStr(ckbListaProdutos.Properties.Items.Items[I].Tag) + ',') , '' );
  end;
  Result:= TUtils.IIF<string>(Result = '(', '', ('(' + Copy(Result, 0, Length(Result) - 1) + ')'));
end;

function TPrincipal.fGetValorImposto(AStateCheckbox: TcxCheckBoxState; AFieldNameImposto: string;
      AValorProduto: Double): Double;
begin
  Result:= 0;
  if (AStateCheckbox = cbsChecked) then
  begin
    Result:= (AValorProduto * (dsProdutos.DataSet.FieldByName(AFieldNameImposto).AsFloat / 100.00));
  end;
end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FConexao);
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  pConectarBaseDados;
  dsProdutos.DataSet:= FConexao.FDQBuscarProdutos;
  dsListaProdutos.DataSet:= FConexao.FDQListaProdutos;
  FConexao.FDQListaProdutos.Active:= True;
  pCarregarComboBoxProdutos;
end;

procedure TPrincipal.pCalcularValorProduto(AValor: string);
var
  Valor, ImpostoNacional, ImpostoEstadual, ImpostoMunicipal: Double;
begin
  //De acordo com os impostos selecionados, calcula o valor final do produto
  Valor:= StrToFloat(AValor);
  ImpostoNacional := fGetValorImposto(ckbImpostos.States[0], 'imposto_nacional', Valor);
  ImpostoEstadual := fGetValorImposto(ckbImpostos.States[1], 'imposto_estadual', Valor);
  ImpostoMunicipal:= fGetValorImposto(ckbImpostos.States[2], 'imposto_municipal', Valor);
  dsProdutos.DataSet.FieldByName('valor_final').AsFloat:= TUtils.fValorFinalProduto(Valor, (ImpostoNacional + ImpostoEstadual + ImpostoMunicipal));
  dsProdutos.DataSet.FieldByName('valor').AsFloat:= StrToFloat(AValor);
end;

procedure TPrincipal.pCarregarComboBoxProdutos;
var
  I: Integer;
begin
  //Carrega a lista de produtos préviamente cadastrada no sistema
  dsListaProdutos.DataSet.First;
  TcxCheckComboBoxProperties(ckbListaProdutos.Properties).Items.Clear;
  I:= 0;
  while not(dsListaProdutos.DataSet.Eof) do
  begin
    TcxCheckComboBoxProperties(ckbListaProdutos.Properties).Items.Add;
    TcxCheckComboBoxProperties(ckbListaProdutos.Properties).Items.Items[I].Description := dsListaProdutos.DataSet.FieldByName('descricao').AsString;
    TcxCheckComboBoxProperties(ckbListaProdutos.Properties).Items.Items[I].Tag         := dsListaProdutos.DataSet.FieldByName('codigo').AsInteger;
    dsListaProdutos.DataSet.Next;
    Inc(I);
  end;

end;

procedure TPrincipal.pConectarBaseDados;
begin
  FConexao:= TConexao.Create(Self);
  FConexao.FDConexao.Connected:= True;
end;

procedure TPrincipal.pConfigurarVisaoGrid;
begin
  //De acordo com os impostos selecionados exibe ou não as colunas no grid
  cxgImpostoNacional.Visible      := TUtils.IIF<Boolean>(ckbImpostos.States[0] = cbsChecked, True, False);
  cxgImpostoEstadual.Visible      := TUtils.IIF<Boolean>(ckbImpostos.States[1] = cbsChecked, True, False);
  cxgridProdutosEstado.Visible    := TUtils.IIF<Boolean>(ckbImpostos.States[1] = cbsChecked, True, False);
  cxgImpostoMunicipal.Visible     := TUtils.IIF<Boolean>(ckbImpostos.States[2] = cbsChecked, True, False);
  cxgridProdutosMunicipio.Visible := TUtils.IIF<Boolean>(ckbImpostos.States[2] = cbsChecked, True, False);
end;

procedure TPrincipal.pExportarGridParaExcel(AGrid: TcxGrid;
  ANomeArquivo: string);
var
  AFileName: string;
begin
  inherited;
  //Passa nome padrão do arquivo e exporta a lista dos dados para excel, após finalizar, exibe mensagem
  // pedindo se o usuário deseja abrir
  sdExportarExcel.FileName := ANomeArquivo;
  if sdExportarExcel.Execute then
  begin
    try
      AFileName := sdExportarExcel.FileName;
      TCursor.IniciarProcessamento;
      ExportGridToXLSX(sdExportarExcel.FileName, AGrid, True, True, True, 'xlsx', self);
    finally
      TCursor.FinalizarProcessamento;
      if FileExists(AFileName) then
      begin
        if Application.MessageBox('Arquivo exportado com sucesso, deseja abri-lo? ','DotSE',MB_YESNO+MB_ICONINFORMATION) = mrYes then
        begin
          ShellExecute(handle,'open',PChar(AFileName), '','',SW_SHOWNORMAL);
        end;
      end
    end;
  end;

end;

procedure TPrincipal.pImportarArquivo;
var
  NomeArquivo: string;
begin
  try
    //Busca o nome do arquivo e chama a função passando como parâmetro o nome do arquivo e qual o  tipo de imposto está sendo importado}
    NomeArquivo:= TArquivoExcel.BuscarArquivo;
    TCursor.IniciarProcessamento;
    TImportarArquivo.Importar(NomeArquivo, cmbTipoImposto.Text, FConexao);
  finally
    TCursor.FinalizarProcessamento;
  end;

end;

procedure TPrincipal.pLimparSelecaoProdutos;
var
  I: Integer;
begin
  for I := 0 to ckbListaProdutos.Properties.Items.Count -1 do
    ckbListaProdutos.States[I] := cbsUnchecked;
end;

procedure TPrincipal.dxLayoutGroup1Button0Click(Sender: TObject);
begin
  Application.MessageBox(pchar('As planilhas com padrão de importação estão no diretório "Modelos Arquivos" da raíz do projeto!'),'Informação', MB_OK + MB_ICONINFORMATION);
end;

procedure TPrincipal.dxLayoutGroup2Button0Click(Sender: TObject);
var
  vMensagemOrientacao: string;
begin
  vMensagemOrientacao:= 'Selecione quais impostos deseja incluir nos cálculos e após, quais produtos. Eles serão listados abaixo.'+
    #13+#13+'O valor do Produto deverá ser informado na coluna "Valor", após, o valor final com desconto dos impostos será'+
    ' exibido na coluna "Valor Final".';
  Application.MessageBox(pchar(vMensagemOrientacao),'Orientação', MB_OK + MB_ICONINFORMATION);
end;

initialization
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
end.
