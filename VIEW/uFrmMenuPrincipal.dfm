object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerenciador de Funcion'#225'rios'
  ClientHeight = 299
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = imMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object imMenu: TMainMenu
    Left = 96
    Top = 64
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object CadastrodeClientes: TMenuItem
        Action = ACT_ABRICADASTRO
      end
    end
  end
  object AC_LIST: TActionList
    Left = 152
    Top = 72
    object ACT_ABRICADASTRO: TAction
      Caption = 'Funcion'#225'rios'
      OnExecute = ACT_ABRICADASTROExecute
    end
  end
end
