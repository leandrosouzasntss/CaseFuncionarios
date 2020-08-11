unit classeFuncionario;

interface

uses System.SysUtils;

type
  TFuncionario = class
  private
    FFuncao: String;
    FDtAdmissao: TDate;
    FDtNasc: TDate;
    FSexo: String;
    FNome: String;
    procedure SetDtAdmissao(const Value: TDate);
    procedure SetDtNasc(const Value: TDate);
    procedure SetFuncao(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSexo(const Value: String);
  public
    constructor Create;
    property Nome: String read FNome write SetNome;
    property DtNasc: TDate read FDtNasc write SetDtNasc;
    property Sexo: String read FSexo write SetSexo;
    property DtAdmissao: TDate read FDtAdmissao write SetDtAdmissao;
    property Funcao: String read FFuncao write SetFuncao;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
var
  Funcionario: TFuncionario;
begin
  try
    Funcionario := Funcionario.Create;
  finally
    FreeAndNil(Funcionario);
  end;

end;

procedure TFuncionario.SetDtAdmissao(const Value: TDate);
begin
  FDtAdmissao := Value;
end;

procedure TFuncionario.SetDtNasc(const Value: TDate);
begin
  FDtNasc := Value;
end;

procedure TFuncionario.SetFuncao(const Value: String);
begin
  FFuncao := Value;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSexo(const Value: String);
begin
  FSexo := Value;
end;

end.
