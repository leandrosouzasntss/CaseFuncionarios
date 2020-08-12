program GerenciadorFuncionarios;

uses
  Vcl.Forms,
  uFrmCadastroFuncionario in 'VIEW\uFrmCadastroFuncionario.pas' {frmCadastroFuncionario},
  DmConexao in 'DAO\DmConexao.pas' {uDmConexao: TDataModule},
  uFrmMenuPrincipal in 'VIEW\uFrmMenuPrincipal.pas' {frmMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.CreateForm(TuDmConexao, uDmConexao);
  Application.Run;
end.
