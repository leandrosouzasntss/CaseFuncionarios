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
    SQL: TSQLQuery;
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
    procedure cdsFuncionarioAfterPost(DataSet: TDataSet);
    procedure cdsFuncionarioBeforePost(DataSet: TDataSet);
    procedure cdsFuncionarioNewRecord(DataSet: TDataSet);
    procedure cdsListarFuncionarioAfterScroll(DataSet: TDataSet);
    procedure cdsFuncionarioAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure NovoFuncionario;
    procedure ListarFuncionario;
    procedure GravarFuncionario;
    { Public declarations }
  end;

var
  uDmConexao: TuDmConexao;

implementation

uses
  MidasLib;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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
   sql : TSQLDataSet;
begin
   inherited;

   if DataSet.State = dsInsert then
   begin
     //Quando der um Append / Post em um Registro o Status fica como dsInsert
     // Necessário verificar o ID + 1 no banco para assumir como ID do registro.
     sql := TSQLDataSet.Create(nil);

     try
       sql.SQLConnection := SQLConnection;
       sql.CommandText := 'SELECT MAX(CODIGO)+1 AS ID FROM FUNCIONARIOS';
       sql.Open;

       cdsFuncionarioCODIGO.AsInteger
                    := sql.FieldByName('ID').AsInteger;
     finally
        sql.Free;
     end;
   end;

end;

procedure TuDmConexao.cdsFuncionarioNewRecord(DataSet: TDataSet);
begin
  cdsFuncionarioSexo.AsString := 'Outros';
end;

procedure TuDmConexao.cdsListarFuncionarioAfterScroll(DataSet: TDataSet);
begin
  uDmConexao.cdsFuncionario.Close;
  uDmConexao.cdsFuncionario.ParamByName('ID').AsInteger :=
  uDmConexao.cdsListarFuncionarioCodigo.AsInteger;
  uDmConexao.cdsFuncionario.Open;

//  uDmConexao.cdsEndereco.Close;
//  uDmConexao.cdsEndereco.ParamByName('ID').AsInteger :=
//  uDmConexao.cdsListarFuncionarioCodigo.AsInteger;
//  uDmConexao.cdsEndereco.Open;


end;

procedure TuDmConexao.GravarFuncionario;
begin
    if (cdsFuncionario.State in [dsEdit, dsInsert]) then
   begin
       //No AfterPost o State tem que estar em Browse, tratamento para
       // não dar Access Violation.
      cdsFuncionario.Cancel;
   end;

   //Verifica se o CDS não esta Inativo, (dsBrowse).
   // Se passar na Validação ele persiste do Post para o Banco (ApplyUpdates);
   if not (cdsFuncionario.State in [dsInactive]) then
      cdsFuncionario.ApplyUpdates(-1);
end;

procedure TuDmConexao.ListarFuncionario;
begin
  uDmConexao.cdsListarFuncionario.Close;
  uDmConexao.cdsListarFuncionario.ParamByName('ID').AsInteger := 0;
  uDmConexao.cdsListarFuncionario.Open;
end;

procedure TuDmConexao.NovoFuncionario;
begin
   cdsFuncionario.Close;
   cdsFuncionario.ParamByName('ID').AsInteger := -1;
   cdsFuncionario.Open;
   //Novo Registro - -1 Não vai retornar nenhum registro
   cdsFuncionario.Append;
   //Append digo pro CDS que estou Criando um registro.

   {
      SELECT * FROM
      FUNCIONARIOS
      WHERE
      (CODIGO = :ID OR :ID = 0);
   }

end;

end.
