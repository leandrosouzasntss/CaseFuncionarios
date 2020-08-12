unit DmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider, Data.DB;

type
  TuDmConexao = class(TDataModule)
    SQLConnection: TSQLConnection;
    sqlFuncionario: TSQLDataSet;
    sqlEndereco: TSQLDataSet;
    dspFuncionario: TDataSetProvider;
    dspEndereco: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    cdsEndereco: TClientDataSet;
    sqlFuncionariocodigo: TIntegerField;
    sqlFuncionarionome: TStringField;
    sqlFuncionariodtnasc: TDateField;
    sqlFuncionariosexo: TStringField;
    sqlFuncionariodtadmissao: TDateField;
    sqlFuncionariofuncao: TStringField;
    cdsFuncionariocodigo: TIntegerField;
    cdsFuncionarionome: TStringField;
    cdsFuncionariodtnasc: TDateField;
    cdsFuncionariosexo: TStringField;
    cdsFuncionariodtadmissao: TDateField;
    cdsFuncionariofuncao: TStringField;
    sqlListarFuncionario: TSQLDataSet;
    dspListarFuncionario: TDataSetProvider;
    cdsListarFuncionario: TClientDataSet;
    sqlListarFuncionariocodigo: TIntegerField;
    sqlListarFuncionarionome: TStringField;
    sqlListarFuncionariodtnasc: TDateField;
    sqlListarFuncionariosexo: TStringField;
    sqlListarFuncionariodtadmissao: TDateField;
    sqlListarFuncionariofuncao: TStringField;
    cdsListarFuncionariocodigo: TIntegerField;
    cdsListarFuncionarionome: TStringField;
    cdsListarFuncionariodtnasc: TDateField;
    cdsListarFuncionariosexo: TStringField;
    cdsListarFuncionariodtadmissao: TDateField;
    cdsListarFuncionariofuncao: TStringField;
    sqlEnderecoid: TIntegerField;
    sqlEnderecocodfunc: TIntegerField;
    sqlEnderecoendereco: TStringField;
    sqlEnderecobairro: TStringField;
    sqlEnderecocep: TStringField;
    sqlEnderecocidade: TStringField;
    cdsEnderecoid: TIntegerField;
    cdsEnderecocodfunc: TIntegerField;
    cdsEnderecoendereco: TStringField;
    cdsEnderecobairro: TStringField;
    cdsEnderecocep: TStringField;
    cdsEnderecocidade: TStringField;
    procedure cdsFuncionarioAfterPost(DataSet: TDataSet);
    procedure cdsFuncionarioBeforePost(DataSet: TDataSet);
    procedure cdsFuncionarioNewRecord(DataSet: TDataSet);
    procedure cdsListarFuncionarioAfterScroll(DataSet: TDataSet);
    procedure cdsFuncionarioAfterDelete(DataSet: TDataSet);
    procedure cdsEnderecoBeforePost(DataSet: TDataSet);
    procedure cdsEnderecoAfterPost(DataSet: TDataSet);
    procedure cdsEnderecoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure NovoFuncionario;
    procedure GravarFuncionario;
    procedure ListarFuncionario;
    procedure GravarEndereco;
    procedure NovoEndereco;
    procedure DeletarFuncionario;
    { Public declarations }
  end;

var
  uDmConexao: TuDmConexao;

implementation

uses
  MidasLib;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TuDmConexao.cdsEnderecoAfterDelete(DataSet: TDataSet);
begin
   GravarEndereco;
end;

procedure TuDmConexao.cdsEnderecoAfterPost(DataSet: TDataSet);
begin
  GravarEndereco;
end;

procedure TuDmConexao.cdsEnderecoBeforePost(DataSet: TDataSet);
var
  SQL: TSQLDataSet;
begin
  if DataSet.State = dsInsert then
  begin
    SQL := TSQLDataSet.Create(nil);
  end;

  try
    SQL.SQLConnection := SQLConnection;
    SQL.CommandText := 'SELECT MAX(COALESCE(ID,0)) AS ID FROM ENDFUNC';
    SQL.Open;

    cdsEnderecoid.AsInteger := SQL.FieldByName('ID').AsInteger + 1;

    cdsEnderecocodfunc.AsInteger := cdsFuncionariocodigo.AsInteger;
  finally
    SQL.Free;
  end;
end;

procedure TuDmConexao.cdsFuncionarioAfterDelete(DataSet: TDataSet);
begin
  GravarFuncionario;
end;

procedure TuDmConexao.cdsFuncionarioAfterPost(DataSet: TDataSet);
begin
  inherited;
  GravarFuncionario;
end;

procedure TuDmConexao.cdsFuncionarioBeforePost(DataSet: TDataSet);
var
  SQL: TSQLDataSet;
begin
  inherited;

  if DataSet.State = dsInsert then
  begin
    // Quando der um Append / Post em um Registro o Status fica como dsInsert
    // Necessário verificar o ID + 1 no banco para assumir como ID do registro.
    SQL := TSQLDataSet.Create(nil);

    try
      SQL.SQLConnection := SQLConnection;
      SQL.CommandText := 'SELECT MAX(COALESCE(CODIGO,0)) AS ID FROM FUNCIONARIOS';
      SQL.Open;

      cdsFuncionariocodigo.AsInteger := SQL.FieldByName('ID').AsInteger + 1;
    finally
      SQL.Free;
    end;
  end;

end;

procedure TuDmConexao.cdsFuncionarioNewRecord(DataSet: TDataSet);
begin
  cdsFuncionariosexo.AsString := 'Outros';
end;

procedure TuDmConexao.cdsListarFuncionarioAfterScroll(DataSet: TDataSet);
begin
  uDmConexao.cdsFuncionario.Close;
  uDmConexao.cdsFuncionario.ParamByName('ID').AsInteger :=
  uDmConexao.cdsListarFuncionariocodigo.AsInteger;
  uDmConexao.cdsFuncionario.Open;

  uDmConexao.cdsEndereco.Close;
  uDmConexao.cdsEndereco.ParamByName('CODFUNC').AsInteger :=
  uDmConexao.cdsListarFuncionariocodigo.AsInteger;
  uDmConexao.cdsEndereco.Open;

end;

procedure TuDmConexao.DeletarFuncionario;
begin
   // Validação Para Deletar Funcionario
   cdsEndereco.Close;
   cdsEndereco.ParamByName('CODFUNC').AsInteger :=
   cdsFuncionarioCODIGO.AsInteger;
   cdsEndereco.Open;

   cdsEndereco.First;
   while not cdsEndereco.Eof do
      cdsEndereco.Delete;

   cdsFuncionario.Delete;
   ListarFuncionario;
end;

procedure TuDmConexao.GravarEndereco;
begin
  //Não pode estar em dsBrowse
  if (cdsEndereco.State in [dsEdit, dsInsert]) then
  begin
    cdsEndereco.Cancel;
  end;
  if not(cdsEndereco.State in [dsInactive]) then
    cdsEndereco.ApplyUpdates(-1);
end;

procedure TuDmConexao.GravarFuncionario;
begin
  if (cdsFuncionario.State in [dsEdit, dsInsert]) then
  begin
    // No AfterPost o State tem que estar em Browse, tratamento para
    // não dar Access Violation.
    cdsFuncionario.Cancel;
  end;

  // Verifica se o CDS não esta Inativo, (dsBrowse).
  // Se passar na Validação ele persiste do Post para o Banco (ApplyUpdates);
  if not(cdsFuncionario.State in [dsInactive]) then
    cdsFuncionario.ApplyUpdates(-1);
end;

procedure TuDmConexao.ListarFuncionario;
begin
  uDmConexao.cdsListarFuncionario.Close;
  uDmConexao.cdsListarFuncionario.ParamByName('ID').AsInteger := 0;
  uDmConexao.cdsListarFuncionario.Open;
end;

procedure TuDmConexao.NovoEndereco;
begin
  if cdsEnderecocodfunc.AsString.IsEmpty then
  begin

    if not (cdsEndereco.State in dsEditModes) then
    begin
      cdsEndereco.close;
        cdsEndereco.Params.ParamByName('CODFUNC')
        .AsInteger := -1;
      cdsEndereco.open;
    end;

    cdsEndereco.Append;
  end
    else
  begin
    cdsEndereco.Append;
  end;


//  cdsEndereco.Close;
//  cdsEndereco.ParamByName('CODFUNC').AsInteger := -1;
//  cdsEndereco.Open;
//  cdsEndereco.Append;

end;

procedure TuDmConexao.NovoFuncionario;
begin
  cdsFuncionario.Close;
  cdsFuncionario.ParamByName('ID').AsInteger := -1;
  cdsFuncionario.Open;
  // Novo Registro - -1 Não vai retornar nenhum registro
  cdsFuncionario.Append;
  // Append digo pro CDS que estou Criando um registro.

end;

end.
