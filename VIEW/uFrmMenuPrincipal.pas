unit uFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TfrmMenuPrincipal = class(TForm)
    imMenu: TMainMenu;
    AC_LIST: TActionList;
    Cadastros1: TMenuItem;
    CadastrodeClientes: TMenuItem;
    ACT_ABRICADASTRO: TAction;
    procedure ACT_ABRICADASTROExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

uses uFrmCadastroFuncionario;

  //Action QUE VAI ABRIR MEU FORMULÁRIO DENTRO DO MENU PRINCIPAL
procedure TfrmMenuPrincipal.ACT_ABRICADASTROExecute(Sender: TObject);
begin
   Application.CreateForm(TfrmCadastroFuncionario, frmCadastroFuncionario);
   try
      frmCadastroFuncionario.ShowModal;
   finally
      frmCadastroFuncionario.Free;
   end;
end;

end.
