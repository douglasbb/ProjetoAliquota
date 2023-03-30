object Conexao: TConexao
  OldCreateOrder = False
  Height = 384
  Width = 509
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Douglas\Delphi\ProjetoAliquota\BaseSQlite\produto_al' +
        'iquota.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 56
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 136
  end
  object FDQListaProdutos: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from produto order by descricao')
    Left = 40
    Top = 216
  end
  object FDQImportarImpostoNacional: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from produto_imposto_nacional where 1=0')
    Left = 192
    Top = 24
  end
  object FDQBuscarProdutos: TFDQuery
    AutoCalcFields = False
    Connection = FDConexao
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvRefreshDelete, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.RefreshDelete = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select distinct'
      '    produto.nmc,'
      '    produto.descricao, '
      '    0 as valor_produto,'
      '    estado.descricao as estado,'
      '    produto_imposto_nacional.imposto_nacional,'
      '    produto_imposto_estadual.imposto_estadual,'
      '    produto_imposto_municipal.imposto_municipal,'
      '    0 as valor_final'
      'from '
      '    produto'
      
        '    left join produto_imposto_nacional on produto_imposto_nacion' +
        'al.nmc_codigo = produto.nmc'
      
        '    left join produto_imposto_estadual on produto_imposto_estadu' +
        'al.nmc_codigo = produto.nmc'
      
        '    left join produto_imposto_municipal on produto_imposto_munic' +
        'ipal.nmc_codigo = produto.nmc'
      
        '    left join estado on estado.codigo = produto_imposto_estadual' +
        '.codigo_estado and'
      '      produto.nmc = produto_imposto_estadual.nmc_codigo'
      'where'
      '    produto.codigo in  ')
    Left = 56
    Top = 288
  end
  object FDQExcluirImpostoNacional: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'delete from produto_imposto_nacional')
    Left = 208
    Top = 80
  end
  object FDQImportarImpostoEstadual: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from produto_imposto_estadual where 1=0')
    Left = 232
    Top = 136
  end
  object FDQExcluirImpostoEstadual: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'delete from produto_imposto_estadual')
    Left = 248
    Top = 192
  end
  object FDQImportarImpostoMunicipal: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from produto_imposto_municipal where 1=0')
    Left = 280
    Top = 248
  end
  object FDQExcluirImpostoMunicipal: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'delete from produto_imposto_municipal')
    Left = 296
    Top = 304
  end
end
