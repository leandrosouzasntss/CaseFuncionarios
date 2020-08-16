object uDmConexao: TuDmConexao
  OldCreateOrder = False
  Height = 435
  Width = 604
  object SQLConnection: TSQLConnection
    ConnectionName = 'cadfuncionario'
    DriverName = 'MySQL'
    LoadParamsOnConnect = True
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=cadfuncionario'
      'User_Name=root'
      'Password=drogaria'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Connected = True
    Left = 48
    Top = 112
  end
  object sqlFuncionario: TSQLDataSet
    CommandText = 'SELECT * FROM'#13#10'FUNCIONARIOS'#13#10'WHERE '#13#10'(CODIGO = :ID OR :ID = 0);'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 144
    Top = 80
    object sqlFuncionariocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object sqlFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object sqlFuncionariodtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object sqlFuncionariosexo: TStringField
      FieldName = 'sexo'
      Size = 45
    end
    object sqlFuncionariodtadmissao: TDateField
      FieldName = 'dtadmissao'
    end
    object sqlFuncionariofuncao: TStringField
      FieldName = 'funcao'
      Size = 45
    end
    object sqlFuncionariosalario: TFloatField
      FieldName = 'salario'
    end
  end
  object sqlEndereco: TSQLDataSet
    CommandText = 
      'select * from ENDFUNC'#13#10'WHERE '#13#10'(CODFUNC=:CODFUNC OR :CODFUNC = 0' +
      ')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODFUNC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODFUNC'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 144
    Top = 144
    object sqlEnderecoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlEnderecocodfunc: TIntegerField
      FieldName = 'codfunc'
      Required = True
    end
    object sqlEnderecoendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object sqlEnderecobairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object sqlEnderecocep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object sqlEnderecocidade: TStringField
      FieldName = 'cidade'
      Size = 45
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = sqlFuncionario
    Left = 257
    Top = 73
  end
  object dspEndereco: TDataSetProvider
    DataSet = sqlEndereco
    Left = 256
    Top = 136
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario'
    BeforePost = cdsFuncionarioBeforePost
    AfterPost = cdsFuncionarioAfterPost
    AfterDelete = cdsFuncionarioAfterDelete
    OnNewRecord = cdsFuncionarioNewRecord
    Left = 368
    Top = 73
    object cdsFuncionariocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object cdsFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object cdsFuncionariodtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object cdsFuncionariosexo: TStringField
      FieldName = 'sexo'
      Size = 45
    end
    object cdsFuncionariodtadmissao: TDateField
      FieldName = 'dtadmissao'
    end
    object cdsFuncionariofuncao: TStringField
      FieldName = 'funcao'
      Size = 45
    end
    object cdsFuncionariosalario: TFloatField
      FieldName = 'salario'
      DisplayFormat = '#,0.00'
    end
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODFUNC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODFUNC'
        ParamType = ptInput
      end>
    ProviderName = 'dspEndereco'
    BeforePost = cdsEnderecoBeforePost
    AfterPost = cdsEnderecoAfterPost
    AfterDelete = cdsEnderecoAfterDelete
    Left = 368
    Top = 136
    object cdsEnderecoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsEnderecocodfunc: TIntegerField
      FieldName = 'codfunc'
      Required = True
    end
    object cdsEnderecoendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object cdsEnderecobairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object cdsEnderecocep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object cdsEnderecocidade: TStringField
      FieldName = 'cidade'
      Size = 45
    end
  end
  object sqlListarFuncionario: TSQLDataSet
    CommandText = 'SELECT * FROM'#13#10'FUNCIONARIOS'#13#10'WHERE '#13#10'(CODIGO = :ID OR :ID = 0);'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 144
    Top = 16
    object sqlListarFuncionariocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object sqlListarFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object sqlListarFuncionariodtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object sqlListarFuncionariosexo: TStringField
      FieldName = 'sexo'
      Size = 45
    end
    object sqlListarFuncionariodtadmissao: TDateField
      FieldName = 'dtadmissao'
    end
    object sqlListarFuncionariofuncao: TStringField
      FieldName = 'funcao'
      Size = 45
    end
    object sqlListarFuncionariosalario: TFloatField
      FieldName = 'salario'
    end
  end
  object dspListarFuncionario: TDataSetProvider
    DataSet = sqlListarFuncionario
    Left = 257
    Top = 17
  end
  object cdsListarFuncionario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspListarFuncionario'
    AfterScroll = cdsListarFuncionarioAfterScroll
    Left = 368
    Top = 17
    object cdsListarFuncionariocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object cdsListarFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object cdsListarFuncionariodtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object cdsListarFuncionariosexo: TStringField
      FieldName = 'sexo'
      Size = 45
    end
    object cdsListarFuncionariodtadmissao: TDateField
      FieldName = 'dtadmissao'
    end
    object cdsListarFuncionariofuncao: TStringField
      FieldName = 'funcao'
      Size = 45
    end
    object cdsListarFuncionariosalario: TFloatField
      FieldName = 'salario'
    end
  end
end
