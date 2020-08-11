unit uFrmCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, DmConexao,
  Vcl.Mask;

type
  TfrmCadastroFuncionario = class(TForm)
    lblDescricao: TLabel;
    cbSexo: TDBComboBox;
    lblSexo: TLabel;
    dtpDtNasc: TDateTimePicker;
    lblDtNasc: TLabel;
    lblDtAdmissao: TLabel;
    dtpDtAdmissao: TDateTimePicker;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnNovoEndereco: TButton;
    btnExcluirEndereco: TButton;
    lblEndereco: TStaticText;
    grdEndFunc: TDBGrid;
    sbLocalizar: TSearchBox;
    lblLocalizarFuncionario: TStaticText;
    grdFuncionarios: TDBGrid;
    btnNovo: TButton;
    dsListarFuncionarios: TDataSource;
    dsEnderecos: TDataSource;
    pnlFuncionarios: TPanel;
    pnlEndereco: TPanel;
    pnlEditar: TPanel;
    edtNome: TDBEdit;
    edtFuncao: TDBEdit;
    lblNome: TLabel;
    lblFuncao: TLabel;
    dsFuncionarios: TDataSource;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsFuncionariosDataChange(Sender: TObject; Field: TField);
    procedure btnExcluirClick(Sender: TObject);
    procedure sbLocalizarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

{$R *.dfm}

procedure TfrmCadastroFuncionario.btnExcluirClick(Sender: TObject);
begin
  //Validar endereço (não permitir remover se o func não tiver endereço)
  if uDmConexao.cdsFuncionarioCodigo.AsInteger > 0 then
  begin
     If  MessageDlg('Você tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mryes
  then
     begin
       uDmConexao.cdsFuncionario.Delete;
       uDmConexao.ListarFuncionario;
     end;
  end;

end;

procedure TfrmCadastroFuncionario.btnNovoClick(Sender: TObject);
begin
  uDmConexao.NovoFuncionario;
end;

procedure TfrmCadastroFuncionario.btnSalvarClick(Sender: TObject);
begin
   if uDmConexao.cdsFuncionarioCodigo.AsInteger <= 0 then
   begin
      if not (uDmConexao.cdsFuncionario.State in [dsInsert]) then
         uDmConexao.NovoFuncionario;
   end;

   if not (uDmConexao.cdsFuncionario.State in [dsInsert,dsEdit]) then
      uDmConexao.cdsFuncionario.Edit;

   if uDmConexao.cdsFuncionario.State in [dsInsert,dsEdit] then
   begin
      uDmConexao.cdsFuncionariodtnasc.AsDateTime := dtpDtNasc.Date;
      uDmConexao.cdsFuncionariodtadmissao.AsDateTime := dtpDtAdmissao.Date;
      uDmConexao.cdsFuncionario.Post;
      uDmConexao.ListarFuncionario;
   end;
end;

procedure TfrmCadastroFuncionario.dsFuncionariosDataChange(Sender: TObject;
  Field: TField);
begin
  dtpDtNasc.Date := uDmConexao.cdsFuncionariodtnasc.AsDateTime;
  dtpDtAdmissao.Date := uDmConexao.cdsFuncionariodtadmissao.AsDateTime;
end;

procedure TfrmCadastroFuncionario.FormShow(Sender: TObject);
begin
  uDmConexao.ListarFuncionario;
end;

procedure TfrmCadastroFuncionario.sbLocalizarChange(Sender: TObject);
begin
    //Pesquisar
    if uDmConexao.cdsListarFuncionario.State = dsBrowse then
    begin
      if sbLocalizar.Text = '' then
      begin
         uDmConexao.cdsListarFuncionario.Filtered := False;
         uDmConexao.cdsListarFuncionario.Filter   := '';
         uDmConexao.cdsListarFuncionario.Filtered := True;
      end
      else
      begin
         uDmConexao.cdsListarFuncionario.Filtered := False;
         uDmConexao.cdsListarFuncionario.Filter   := 'NOME LIKE (%'+ sbLocalizar.Text +'%)'  ;
         uDmConexao.cdsListarFuncionario.Filtered := True;
      end;
    end;
end;

end.
