object DM: TDM
  OldCreateOrder = False
  Height = 882
  Width = 1269
  object dsPedidos: TDataSource
    DataSet = qPedidos
    Left = 96
    Top = 112
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=sistemaangela'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object qNomeDoProduto: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from tortas_doces')
    Left = 172
    Top = 56
  end
  object qPedidos: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM pedidos')
    Left = 97
    Top = 56
  end
  object qTamanhoDoProduto: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM precos_tortas_doces')
    Left = 273
    Top = 56
  end
  object dsCadastroProdutos: TDataSource
    DataSet = qCadastroProdutos
    Left = 376
    Top = 112
  end
  object qCadastroProdutos: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from cadastro_produtos;')
    Left = 376
    Top = 56
  end
  object qTabelaProdutos: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from cadastro_produtos where nome = '#39#39';')
    Left = 592
    Top = 56
    object qTabelaProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qTabelaProdutosid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      Required = True
    end
    object qTabelaProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qTabelaProdutostamanho: TStringField
      FieldName = 'tamanho'
      Origin = 'tamanho'
      Required = True
      Size = 25
    end
    object qTabelaProdutosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
      Precision = 6
      Size = 2
    end
    object qTabelaProdutosobservacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Size = 100
    end
    object qTabelaProdutosnome_cliente: TStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Required = True
      Size = 30
    end
  end
  object dsTabelaProdutos: TDataSource
    DataSet = qTabelaProdutos
    Left = 592
    Top = 112
  end
  object qCalculaSomaValores: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from cadastro_produtos;')
    Left = 488
    Top = 56
  end
  object dsCalculaSomaValores: TDataSource
    DataSet = qCalculaSomaValores
    Left = 488
    Top = 112
  end
  object relqTabelaProdutos: TfrxReport
    Version = '2022.3.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44861.788578344900000000
    ReportOptions.LastChange = 44887.457923101850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 864
    Top = 504
    Datasets = <
      item
        DataSet = DataSet_qTabelaProdutos
        DataSetName = 'frxDB_pedidos'
      end
      item
        DataSet = DataSet_qDadosParaRel
        DataSetName = 'frxDB_dados_pedidos'
      end>
    Variables = <
      item
        Name = ' Minhas vari'#225'veis'
        Value = Null
      end
      item
        Name = 'vValor_total'
        Value = ''
      end
      item
        Name = 'vTotal_produtos'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object TituloReportPedido: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 130.031515590000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 430.866420000000000000
          Top = 0.897650000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 0.897650000000000000
          Width = 79.370130000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object frxDB_dados_pedidosid: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 491.338997637795300000
          Top = 62.102350000000000000
          Width = 151.181102362204700000
          Height = 18.897650000000000000
          DataSet = DataSet_qDadosParaRel
          DataSetName = 'frxDB_dados_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ID do pedido: [frxDB_dados_pedidos."id"]')
          ParentFont = False
        end
        object frxDB_dados_pedidosdata: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Top = -0.897650000000000000
          Width = 415.748031496063000000
          Height = 18.897650000000000000
          DataSet = DataSet_qDadosParaRel
          DataSetName = 'frxDB_dados_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do pedido: [frxDB_dados_pedidos."data"]')
          ParentFont = False
        end
        object frxDB_dados_pedidosdata_entrega: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Top = 21.102350000000000000
          Width = 415.748031496063000000
          Height = 18.897650000000000000
          DataSet = DataSet_qDadosParaRel
          DataSetName = 'frxDB_dados_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de entrega: [frxDB_dados_pedidos."data_entrega"]')
          ParentFont = False
        end
        object frxDB_dados_pedidosnome: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Top = 44.102350000000000000
          Width = 415.748031496063000000
          Height = 18.897650000000000000
          DataSet = DataSet_qDadosParaRel
          DataSetName = 'frxDB_dados_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome do cliente: [frxDB_dados_pedidos."nome"]')
          ParentFont = False
        end
        object frxDB_dados_pedidostelefone: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Top = 64.102350000000000000
          Width = 415.748031496063000000
          Height = 18.897650000000000000
          DataSet = DataSet_qDadosParaRel
          DataSetName = 'frxDB_dados_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone para contato: [frxDB_dados_pedidos."telefone"]')
          ParentFont = False
        end
        object frxDB_dados_pedidosendereco: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Top = 85.102350000000000000
          Width = 415.748031496063000000
          Height = 18.897650000000000000
          DataSet = DataSet_qDadosParaRel
          DataSetName = 'frxDB_dados_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o de entrega: [frxDB_dados_pedidos."endereco"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 24.968460000000000000
        Top = 170.078850000000000000
        Width = 642.520100000000000000
        object Memo13: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Width = 642.520100000000000000
          Height = 24.968460000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODUTOS')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 88.986658670000000000
        Top = 302.362400000000000000
        Width = 642.520100000000000000
        DataSet = DataSet_qTabelaProdutos
        DataSetName = 'frxDB_pedidos'
        RowCount = 0
        object frxDB_pedidosnome: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Width = 218.078740160000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = DataSet_qTabelaProdutos
          DataSetName = 'frxDB_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDB_pedidos."nome"]')
          ParentFont = False
        end
        object frxDB_pedidostamanho: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 218.078740160000000000
          Width = 68.409448818897600000
          Height = 18.897650000000000000
          DataField = 'tamanho'
          DataSet = DataSet_qTabelaProdutos
          DataSetName = 'frxDB_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDB_pedidos."tamanho"]')
          ParentFont = False
        end
        object frxDB_pedidosvalor: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 286.488188978897600000
          Width = 88.440944880000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = DataSet_qTabelaProdutos
          DataSetName = 'frxDB_pedidos'
          DisplayFormat.FormatStr = 'R$ ###'#39',00'#39
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDB_pedidos."valor"]')
          ParentFont = False
        end
        object frxDB_pedidosobservacoes: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 374.929133858897600000
          Width = 267.590966141102400000
          Height = 79.897650000000000000
          DataField = 'observacoes'
          DataSet = DataSet_qTabelaProdutos
          DataSetName = 'frxDB_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDB_pedidos."observacoes"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 23.677180000000000000
        Top = 257.008040000000000000
        Width = 642.520100000000000000
        object Memo4: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 218.010742170000000000
          Top = 3.716450000000000000
          Width = 68.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tamanho')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 3.716450000000000000
          Width = 218.010742170000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 286.294292170000000000
          Top = 3.716450000000000000
          Width = 88.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 374.782542170000000000
          Top = 3.787260000000000000
          Width = 267.737557830000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Observa'#231#245'es')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 642.520100000000000000
        object vValor_total: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Top = 0.615336360000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor total: [vValor_total]')
          ParentFont = False
        end
        object vTotal_produtos: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 491.338997640000000000
          Top = 0.615336360000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de produtos: [vTotal_produtos]')
          ParentFont = False
        end
      end
    end
  end
  object DataSet_qTabelaProdutos: TfrxDBDataset
    UserName = 'frxDB_pedidos'
    CloseDataSource = False
    DataSet = qTabelaProdutos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 864
    Top = 432
  end
  object qHistoricoPedidos: TFDQuery
    Active = True
    BeforeDelete = qHistoricoPedidosBeforeDelete
    Connection = Conexao
    SQL.Strings = (
      'select * from pedidos;')
    Left = 688
    Top = 56
    object qHistoricoPedidosid: TFDAutoIncField
      FieldName = 'id'
    end
    object qHistoricoPedidosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 30
    end
    object qHistoricoPedidosdata: TSQLTimeStampField
      FieldName = 'data'
    end
    object qHistoricoPedidosdata_entrega: TDateField
      FieldName = 'data_entrega'
      Required = True
    end
    object qHistoricoPedidoshora_entrega: TTimeField
      FieldName = 'hora_entrega'
      Required = True
    end
    object qHistoricoPedidostelefone: TStringField
      FieldName = 'telefone'
      Required = True
    end
    object qHistoricoPedidosendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
  end
  object dsHistoricoPedidos: TDataSource
    DataSet = qHistoricoPedidos
    Left = 688
    Top = 112
  end
  object qHistoricoProdutos: TFDQuery
    Active = True
    BeforeDelete = qHistoricoProdutosBeforeDelete
    Connection = Conexao
    SQL.Strings = (
      'select * from cadastro_produtos WHERE nome_cliente = '#39#39';')
    Left = 792
    Top = 56
    object qHistoricoProdutosid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      Required = True
    end
    object qHistoricoProdutosnome_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 30
    end
    object qHistoricoProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qHistoricoProdutostamanho: TStringField
      FieldName = 'tamanho'
      Origin = 'tamanho'
      Required = True
      Size = 25
    end
    object qHistoricoProdutosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
      Precision = 6
      Size = 2
    end
    object qHistoricoProdutosobservacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Size = 100
    end
  end
  object dsHistoricoProdutos: TDataSource
    DataSet = qHistoricoProdutos
    Left = 792
    Top = 112
  end
  object qDadosParaRel: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from pedidos')
    Left = 904
    Top = 56
    object qDadosParaRelid: TFDAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qDadosParaRelnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 30
    end
    object qDadosParaReldata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qDadosParaReldata_entrega: TDateTimeField
      FieldName = 'data_entrega'
      Required = True
    end
    object qDadosParaReltelefone: TStringField
      FieldName = 'telefone'
      Required = True
    end
    object qDadosParaRelendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
  end
  object dsDadosParaRel: TDataSource
    DataSet = qDadosParaRel
    Left = 904
    Top = 112
  end
  object DataSet_qDadosParaRel: TfrxDBDataset
    UserName = 'frxDB_dados_pedidos'
    CloseDataSource = False
    DataSet = qDadosParaRel
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1008
    Top = 432
  end
  object qBuscaPrecoProdutoCadastro: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from precos_sobremesa')
    Left = 96
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = qBuscaPrecoProdutoCadastro
    Left = 96
    Top = 264
  end
  object qEditarCardapioPrecos: TFDQuery
    Active = True
    BeforeDelete = qEditarCardapioPrecosBeforeDelete
    Connection = Conexao
    SQL.Strings = (
      'select * from precos_tortas_doces where preco = -1')
    Left = 1008
    Top = 56
    object qEditarCardapioPrecostamanho: TStringField
      FieldName = 'tamanho'
      Origin = 'tamanho'
      Required = True
    end
    object qEditarCardapioPrecospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Required = True
      currency = True
      Precision = 5
      Size = 2
    end
  end
  object dsEditarCardapioPrecos: TDataSource
    DataSet = qEditarCardapioPrecos
    Left = 1008
    Top = 112
  end
  object dsEditarCardapioSabores: TDataSource
    DataSet = qEditarCardapioSabores
    Left = 1136
    Top = 112
  end
  object qEditarCardapioSabores: TFDQuery
    Active = True
    BeforeDelete = qEditarCardapioSaboresBeforeDelete
    Connection = Conexao
    SQL.Strings = (
      'select * from tortas_doces where id = -1')
    Left = 1136
    Top = 56
  end
end
