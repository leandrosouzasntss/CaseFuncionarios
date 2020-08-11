program GerenciadorFuncionarios;

uses
  Vcl.Forms,
  uFrmCadastroFuncionario in 'VIEW\uFrmCadastroFuncionario.pas' {frmCadastroFuncionario},
  classeEndereco in 'MODEL\classeEndereco.pas',
  classeFuncionario in 'MODEL\classeFuncionario.pas',
  DmConexao in 'DAO\DmConexao.pas' {uDmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastroFuncionario, frmCadastroFuncionario);
  Application.CreateForm(TuDmConexao, uDmConexao);
  Application.Run;
end.
