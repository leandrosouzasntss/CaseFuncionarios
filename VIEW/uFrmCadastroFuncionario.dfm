object frmCadastroFuncionario: TfrmCadastroFuncionario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 817
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 250
    Width = 601
    Height = 317
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    Ctl3D = True
    DoubleBuffered = False
    ParentColor = True
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 2
    ExplicitLeft = -5
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
      Left = 136
      Top = 144
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
      Top = 144
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
      Left = 280
      Top = 140
      Width = 106
      Height = 14
      Caption = 'DATA ADMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 8
      Top = 76
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
      Left = 408
      Top = 135
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
      Top = 200
      Width = 75
      Height = 41
      Caption = 'NOVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object cbSexo: TDBComboBox
      Left = 8
      Top = 164
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
      Left = 280
      Top = 160
      Width = 106
      Height = 21
      Date = 44053.000000000000000000
      Time = 0.684107604167365900
      TabOrder = 2
    end
    object dtpDtNasc: TDateTimePicker
      Left = 136
      Top = 160
      Width = 122
      Height = 21
      Date = 44053.000000000000000000
      Time = 0.684107604167365900
      TabOrder = 3
    end
    object btnSalvar: TButton
      Left = 519
      Top = 201
      Width = 75
      Height = 41
      Caption = 'SALVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 438
      Top = 200
      Width = 75
      Height = 41
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnExcluirClick
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 96
      Width = 121
      Height = 21
      DataField = 'nome'
      DataSource = dsFuncionarios
      TabOrder = 6
    end
    object edtFuncao: TDBEdit
      Left = 408
      Top = 155
      Width = 121
      Height = 21
      DataField = 'funcao'
      DataSource = dsFuncionarios
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 250
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    Ctl3D = True
    DoubleBuffered = False
    ParentColor = True
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 0
    ExplicitLeft = -5
    object grdFuncionarios: TDBGrid
      Left = 8
      Top = 63
      Width = 586
      Height = 120
      DataSource = dsListarFuncionarios
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtnasc'
          Title.Caption = 'dtNasc'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sexo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtadmissao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'funcao'
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
      TabOrder = 1
    end
    object sbLocalizar: TSearchBox
      Left = 8
      Top = 28
      Width = 250
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 567
    Width = 601
    Height = 250
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel2'
    Ctl3D = True
    DoubleBuffered = False
    ParentColor = True
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object btnExcluirEndereco: TButton
      Left = 8
      Top = 168
      Width = 36
      Height = 28
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnNovoEndereco: TButton
      Left = 8
      Top = 137
      Width = 36
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object grdEndFunc: TDBGrid
      Left = 50
      Top = 130
      Width = 544
      Height = 120
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object lblEndereco: TStaticText
      Left = 8
      Top = 106
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
    Left = 440
    Top = 128
  end
  object dsEnderecos: TDataSource
    DataSet = uDmConexao.cdsEndereco
    Left = 520
    Top = 128
  end
  object dsFuncionarios: TDataSource
    DataSet = uDmConexao.cdsFuncionario
    OnDataChange = dsFuncionariosDataChange
    Left = 424
    Top = 192
  end
end
