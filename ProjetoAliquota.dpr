program ProjetoAliquota;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Principal},
  UConexao in 'UConexao.pas' {Conexao: TDataModule},
  Importacao in 'Importacao.pas',
  UUtils in 'UUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TConexao, Conexao);
  Application.Run;
end.
