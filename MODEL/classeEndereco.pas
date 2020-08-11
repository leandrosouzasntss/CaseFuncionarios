unit classeEndereco;

interface

uses System.SysUtils;
type
  TEndereco = class
    private
    FBairro: String;
    FUf: String;
    FLogadouro: String;
    FCep: String;
    FCidade: String;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetLogadouro(const Value: String);
    procedure SetUf(const Value: String);
    public
    constructor Create;
    property Logadouro : String read FLogadouro write SetLogadouro;
    property Bairro : String read FBairro write SetBairro;
    property Cep : String read FCep write SetCep;
    property Cidade : String read FCidade write SetCidade;
    property Uf : String read FUf write SetUf;

  end;
implementation

{ TEndereco }

constructor TEndereco.Create;
var
  Endereco : TEndereco;
begin
  try
    Endereco := TEndereco.Create;
  finally
    FreeAndNil(Endereco);
  end;

end;

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEndereco.SetLogadouro(const Value: String);
begin
  FLogadouro := Value;
end;

procedure TEndereco.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
