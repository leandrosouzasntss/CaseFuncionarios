object frmCadastroFuncionario: TfrmCadastroFuncionario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 527
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlEditar: TPanel
    Left = 0
    Top = 185
    Width = 611
    Height = 186
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = True
    DoubleBuffered = False
    ParentColor = True
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 2
    object lblDescricao: TLabel
      Left = 8
      Top = 8
      Width = 576
      Height = 21
      Caption = 'INFORME OS DADOS DO FUNCION'#193'RIO QUE DESEJA CADASTTRAR:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDtNasc: TLabel
      Left = 125
      Top = 79
      Width = 122
      Height = 14
      Caption = 'DATA NASCIMENTO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSexo: TLabel
      Left = 8
      Top = 79
      Width = 36
      Height = 14
      Caption = 'SEXO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDtAdmissao: TLabel
      Left = 260
      Top = 79
      Width = 110
      Height = 14
      Caption = 'DATA ADMISS'#195'O:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 8
      Top = 33
      Width = 39
      Height = 14
      Caption = 'NOME:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFuncao: TLabel
      Left = 378
      Top = 79
      Width = 52
      Height = 14
      Caption = 'FUN'#199#195'O:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnNovo: TButton
      Left = 357
      Top = 134
      Width = 75
      Height = 41
      Action = ACT_NOVOFUNCIONARIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object cbSexo: TDBComboBox
      Left = 8
      Top = 99
      Width = 105
      Height = 21
      DataField = 'sexo'
      DataSource = dsFuncionarios
      Items.Strings = (
        'Masculino'
        'Feminino'
        'Outros')
      TabOrder = 1
    end
    object dtpDtAdmissao: TDateTimePicker
      Left = 260
      Top = 99
      Width = 106
      Height = 21
      Date = 44053.000000000000000000
      Time = 0.684107604167365900
      TabOrder = 3
    end
    object dtpDtNasc: TDateTimePicker
      Left = 125
      Top = 99
      Width = 122
      Height = 21
      Date = 44053.000000000000000000
      Time = 0.684107604167365900
      TabOrder = 2
    end
    object btnSalvar: TButton
      Left = 519
      Top = 135
      Width = 75
      Height = 41
      Caption = 'SALVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 438
      Top = 134
      Width = 75
      Height = 41
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnExcluirClick
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 53
      Width = 281
      Height = 21
      DataField = 'nome'
      DataSource = dsFuncionarios
      TabOrder = 0
    end
    object edtFuncao: TDBEdit
      Left = 378
      Top = 99
      Width = 214
      Height = 21
      DataField = 'funcao'
      DataSource = dsFuncionarios
      TabOrder = 4
    end
  end
  object pnlFuncionarios: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 185
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = True
    DoubleBuffered = False
    ParentColor = True
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object grdFuncionarios: TDBGrid
      Left = 8
      Top = 62
      Width = 586
      Height = 120
      DataSource = dsListarFuncionarios
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 435
          Visible = True
        end>
    end
    object lblLocalizarFuncionario: TStaticText
      Left = 8
      Top = 4
      Width = 166
      Height = 18
      Caption = 'LOCALIZAR FUNCION'#193'RIO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object sbLocalizar: TSearchBox
      Left = 8
      Top = 25
      Width = 358
      Height = 21
      TabOrder = 1
      OnChange = sbLocalizarChange
    end
  end
  object pnlEndereco: TPanel
    Left = 0
    Top = 371
    Width = 611
    Height = 156
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    DoubleBuffered = False
    Enabled = False
    ParentColor = True
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object btnExcluirEndereco: TButton
      Left = 8
      Top = 58
      Width = 36
      Height = 28
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnExcluirEnderecoClick
    end
    object btnNovoEndereco: TButton
      Left = 8
      Top = 27
      Width = 36
      Height = 25
      Action = ACT_NOVOENDERECO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object grdEndFunc: TDBGrid
      Left = 50
      Top = 27
      Width = 544
      Height = 120
      DataSource = dsEnderecos
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'endereco'
          Title.Caption = 'ENDERE'#199'O'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bairro'
          Title.Caption = 'BAIRRO'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cep'
          Title.Caption = 'CEP'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Title.Caption = 'CIDADE'
          Width = 100
          Visible = True
        end>
    end
    object lblEndereco: TStaticText
      Left = 8
      Top = 3
      Width = 72
      Height = 18
      Caption = 'ENDERECO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object dsListarFuncionarios: TDataSource
    DataSet = uDmConexao.cdsListarFuncionario
    Left = 376
    Top = 8
  end
  object dsEnderecos: TDataSource
    DataSet = uDmConexao.cdsEndereco
    Left = 440
    Top = 8
  end
  object dsFuncionarios: TDataSource
    DataSet = uDmConexao.cdsFuncionario
    OnDataChange = dsFuncionariosDataChange
    Left = 408
    Top = 8
  end
  object AC_LIST: TActionList
    Left = 464
    Top = 8
    object ACT_NOVOENDERECO: TAction
      Caption = '+'
      OnExecute = ACT_NOVOENDERECOExecute
    end
    object ACT_NOVOFUNCIONARIO: TAction
      Caption = 'NOVO'
      OnExecute = ACT_NOVOFUNCIONARIOExecute
    end
  end
end
