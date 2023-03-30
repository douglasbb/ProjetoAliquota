object Principal: TPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Sistema - Al'#237'quota IBPT + Consulta de valores dos produtos'
  ClientHeight = 712
  ClientWidth = 1095
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1095
    Height = 712
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1043
    object cxgProduto: TcxGrid
      Left = 23
      Top = 157
      Width = 1049
      Height = 532
      TabOrder = 4
      object cxgridProdutos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsProdutos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Appending = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Header = cxStyle1
        object cxgridProdutosnmc: TcxGridDBColumn
          Caption = 'NMC'
          DataBinding.FieldName = 'nmc'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 62
        end
        object cxgridProdutosdescricao: TcxGridDBColumn
          Caption = 'Produto'
          DataBinding.FieldName = 'descricao'
          Options.Editing = False
          Width = 274
        end
        object cxgridProdutosEstado: TcxGridDBColumn
          Caption = 'Estado'
          DataBinding.FieldName = 'estado'
          Width = 106
        end
        object cxgridProdutosMunicipio: TcxGridDBColumn
          Caption = 'Munic'#237'pio'
          DataBinding.FieldName = 'municipio'
          Width = 109
        end
        object cxgridProdutosvalor_produto: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.OnValidate = cxgridProdutosvalor_produtoPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Styles.Header = cxStyle2
          Width = 63
        end
        object cxgImpostoNacional: TcxGridDBColumn
          Caption = 'Imp. Nacional'
          DataBinding.FieldName = 'imposto_nacional'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '0.00 %;'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 96
        end
        object cxgImpostoEstadual: TcxGridDBColumn
          Caption = 'Imp. Estadual'
          DataBinding.FieldName = 'imposto_estadual'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '0.00 %;'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 113
        end
        object cxgImpostoMunicipal: TcxGridDBColumn
          Caption = 'Imp. Municipal'
          DataBinding.FieldName = 'imposto_municipal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '0.00 %;'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 122
        end
        object cxgridProdutosvalor_final: TcxGridDBColumn
          Caption = 'Valor Final'
          DataBinding.FieldName = 'valor_final'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
      end
      object cxgProdutoLevel1: TcxGridLevel
        GridView = cxgridProdutos
      end
    end
    object cxButton1: TcxButton
      Left = 254
      Top = 31
      Width = 194
      Height = 25
      Caption = 'Buscar Arquivo Importa'#231#227'o'
      Enabled = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000002A744558745469746C65004865616465723B4164642047726F757020
        4865616465723B4865616465723B47726F7570C7BAD3710000020E4944415478
        5E6D904B4855511486BF7DBD1605358BA0913409891E8330ACE8711B54143510
        036BD44012A14142761B5793A041051909054184103D90F262758D027B586820
        040DEC0181482074D5D473CEFA83DD3E878BF9C3E25F6CF6DEEB5BBF0372DD3D
        C32F5CCEED064020EF42A43D34ED5BC7A337E7F8363E8C120670564078D55CBE
        F55EA92C2DCB2A53F1E6767D9EE856E78D6D1A183BCD99EB8DE40192444870A9
        F41D2F11244EEC58C3FD7207633F3F221C5F27DF12CD273CEE1D14A6721E7049
        920020339043291B62F9921ABEFC18A2ADA595D1F12754E626D8BA6B15896206
        FB7F15FE11980051998A90EF0DC96118BF6722EA563770E576171234EC5DC6BB
        67332090540A048604C5436BC10991CA91CF394E355F25E71CAD1737333D3F49
        1CD7B2B130EB469ED7A61918027A9E8E2284094F6226847CDFBCBF9EFABA4686
        FA5E638AFB3FF4E501514D40D381F5380108E1BCE31DF2358E8EE35D4C4DCFB3
        72C5D2239200AA0824EEF57E422624300914680495A93F9C3DB993F3D75E512D
        4F606185A30737E000044A01704802877733236055130819DC7D38924D94E41D
        2910CC506CDFEDEF2EFCC0C56618A2E5F026C065D3B30C0281492466FFAD8085
        10EF3C18091385009977907C06C5F63D248BAD60264CA2EDD816C2FD4CAAA230
        095B84C0A2B9D972E78552217B983655410626A268F6251013E442D5A679B040
        0BCE141E47920CE02FD20E7A0B1EB5A8120000000049454E44AE426082}
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
    end
    object ckbListaProdutos: TcxCheckComboBox
      Left = 447
      Top = 96
      Enabled = False
      Properties.EmptySelectionText = 'Selecione'
      Properties.Items = <>
      Properties.OnChange = ckbListaProdutosPropertiesChange
      Style.HotTrack = False
      TabOrder = 3
      Width = 314
    end
    object ckbImpostos: TcxCheckComboBox
      Left = 127
      Top = 96
      Properties.EmptySelectionText = 'Selecione'
      Properties.Items = <
        item
          Description = 'Imposto Nacional'
        end
        item
          Description = 'Imposto Estadual'
        end
        item
          Description = 'Imposto Municipal'
        end>
      Properties.OnChange = cxCheckComboBox1PropertiesChange
      Style.HotTrack = False
      TabOrder = 2
      Width = 226
    end
    object cmbTipoImposto: TcxComboBox
      Left = 127
      Top = 33
      Properties.Items.Strings = (
        'Nacional'
        'Estadual'
        'Municipal')
      Properties.OnChange = cmbTipoImpostoPropertiesChange
      Style.HotTrack = False
      TabOrder = 0
      Text = 'Selecione'
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 2
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      Control = cxgProduto
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object libtnBuscarArquivoImportacao: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Importa'#231#227'o Arquivo Impostos'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 194
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Importa'#231#227'o Planilha Impostos'
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Alignment = gbaLeft
      ButtonOptions.Buttons = <
        item
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000B744558745469746C6500496E666F3B6D122D860000032C49444154
            785E4D926B4C53671CC65F8480DB4CF8E632FCE6BE4D3F98F905E5BE95A86194
            A8518988554C87868240E45269D3721F728B054A3AA84E8358150D1034DC4B68
            579CAB502EA514B454B122975204BC06F3EC7D4F4EB79DE477F2CF7B9EDF7B9E
            F3E610F5ED6152DFEC6584D0CB87B285E24BF1E3F1E5D77CEA755C96F3D84C54
            379E10001C4C8C3F2B0D2CD70C6455698DF7AFDE1C7232AAB486D6324D5F767C
            92349065BCF91AEA928A06A357F6CD2B6D092FFFDD30F3506FC7D4F325ACAE7D
            6070335B2BD71866A4C57722F8463E958D7F12525AA7E7E49CE2BB87ABB5C64D
            BB6309CB6B9FD06D594049CB144AEED9E8BC08F7C667D8E946D58DC6CD9C22DD
            11E694AA0708F7CD27CF2983F2ABBB3C73AF3D30D83DC869B6A1E2FE24E6573E
            61E323206F9A40E60D2BFA27DC6099FCEA6ECF71916C077F5EC42F5D7E4BF1E0
            D1286CAE0D4875D348D38EA1CDE4C2FA7B6090BEFD42AD19928631CA38C69D6F
            C1B217654D4AFE804940865C6776BC58465DA713997F58697014A7AE982094F5
            214EDE8FC4F2C710D78C405C3B8CDF5AA6E178B98C74D9EDA7D4DD4A215FA5E4
            36BBD769D76C5A3345338AA4AB6654DC99C4E3C915B85781B2662B4E96999058
            F117CEAB9E826525B94D6EEA7E4DD84D9C71DDBDB6FE0189A543385162C2B142
            2334ED3358A4F2024579CD42DB0C40983780E30A03589639D4FD866B90905C37
            6A7F368F4BEA611CCCD24390D10B615637E6DDE0C8559B1199DA899FD37B9046
            DBB12C73BC0DFC63E30B8A1B6EEAF170E81504E9BD884AEDC2B1CBBD985B0487
            B2D18290E40E44A474A1DD380796159EC82F612EF7F7EDFAF1979D474595AB36
            BB0BD9EABF1172BE03AD86377052D9390F0C59D7117CAE0D97544FC032474F57
            AEFEB0E7D0F7CCF5FEFBFEA1D1A9A2845F555FCC16071EE86791543488B0E436
            8489DB70A6408F96FE59B0670962D597D0688988399C7BE070917793AD7B43CE
            C408840A67555D0746C666B1F1EE23839BD99A204EE1DCBB5F14C7CE8D39078E
            50F7A7582501F06F936F8376070547490A43A3B33A236364AEC8983C179D7BF6
            454A0AB77FB76B87F7CD00A8AB2024FC908C841FFC0FFEBB0228DB28813CDBF8
            B52DFFCF47D0F91F6B8D1EEDA0C90E830000000049454E44AE426082}
          OnClick = dxLayoutGroup1Button0Click
        end>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object liListadeProdutos: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Lista de Produtos'
      Control = ckbListaProdutos
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 314
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'Calcular Aliquotas Produtos'
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Alignment = gbaLeft
      ButtonOptions.Buttons = <
        item
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000B744558745469746C6500496E666F3B6D122D860000032C49444154
            785E4D926B4C53671CC65F8480DB4CF8E632FCE6BE4D3F98F905E5BE95A86194
            A8518988554C87868240E45269D3721F728B054A3AA84E8358150D1034DC4B68
            579CAB502EA514B454B122975204BC06F3EC7D4F4EB79DE477F2CF7B9EDF7B9E
            F3E610F5ED6152DFEC6584D0CB87B285E24BF1E3F1E5D77CEA755C96F3D84C54
            379E10001C4C8C3F2B0D2CD70C6455698DF7AFDE1C7232AAB486D6324D5F767C
            92349065BCF91AEA928A06A357F6CD2B6D092FFFDD30F3506FC7D4F325ACAE7D
            6070335B2BD71866A4C57722F8463E958D7F12525AA7E7E49CE2BB87ABB5C64D
            BB6309CB6B9FD06D594049CB144AEED9E8BC08F7C667D8E946D58DC6CD9C22DD
            11E694AA0708F7CD27CF2983F2ABBB3C73AF3D30D83DC869B6A1E2FE24E6573E
            61E323206F9A40E60D2BFA27DC6099FCEA6ECF71916C077F5EC42F5D7E4BF1E0
            D1286CAE0D4875D348D38EA1CDE4C2FA7B6090BEFD42AD19928631CA38C69D6F
            C1B217654D4AFE804940865C6776BC58465DA713997F58697014A7AE982094F5
            214EDE8FC4F2C710D78C405C3B8CDF5AA6E178B98C74D9EDA7D4DD4A215FA5E4
            36BBD769D76C5A3345338AA4AB6654DC99C4E3C915B85781B2662B4E96999058
            F117CEAB9E826525B94D6EEA7E4DD84D9C71DDBDB6FE0189A543385162C2B142
            2334ED3358A4F2024579CD42DB0C40983780E30A03589639D4FD866B90905C37
            6A7F368F4BEA611CCCD24390D10B615637E6DDE0C8559B1199DA899FD37B9046
            DBB12C73BC0DFC63E30B8A1B6EEAF170E81504E9BD884AEDC2B1CBBD985B0487
            B2D18290E40E44A474A1DD380796159EC82F612EF7F7EDFAF1979D474595AB36
            BB0BD9EABF1172BE03AD86377052D9390F0C59D7117CAE0D97544FC032474F57
            AEFEB0E7D0F7CCF5FEFBFEA1D1A9A2845F555FCC16071EE86791543488B0E436
            8489DB70A6408F96FE59B0670962D597D0688988399C7BE070917793AD7B43CE
            C408840A67555D0746C666B1F1EE23839BD99A204EE1DCBB5F14C7CE8D39078E
            50F7A7582501F06F936F8376070547490A43A3B33A236364AEC8983C179D7BF6
            454A0AB77FB76B87F7CD00A8AB2024FC908C841FFC0FFEBB0228DB28813CDBF8
            B52DFFCF47D0F91F6B8D1EEDA0C90E830000000049454E44AE426082}
          OnClick = dxLayoutGroup2Button0Click
        end>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = 'Considerar Impostos'
      Control = ckbImpostos
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 226
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avCenter
      CaptionOptions.Text = 'Tipo Imposto'
      Control = cmbTipoImposto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Lista de Produtos para c'#225'lculo de valor final'
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Alignment = gbaLeft
      ButtonOptions.Buttons = <
        item
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001F744558745469746C65004578706F72743B58736C743B4578706F72
            74546F58736C743B13D67B9B000001F649444154785E8593BF6E134110C6BF39
            1CA0404282868E07A046E048C84854202544A60D20022555CE261D0552003BA9
            5324B1808ACAC6E10122A1C4162F410D8248E18F80F87237C3ECDC8E74920BD6
            77FE8DB5F37DB3EBD9251101E900507DE19C8E0DA2C84547CD133A5B1F77134A
            1A361B3E52AA58EC1B12284A10F2FC68EFE9E3EB37001CBB4102A146FAE8B2FB
            C383E99FC0EAC6F89AE244D5807261134EB222C05600A39B90E94F9F24143997
            4501B801152A54A2080217C7BFC4BC49A231212F2C97AA06EA5A9844A2811059
            2C65AAC766D6B87211AB5EF9D4F3077D65139610ABBB90A3997069CC45499091
            048324887FB636ADCC8F74CB4A1CB6B65D8C27F5391CA43D1CB47A1024F8DA7A
            6D865FD2574A69D6AC2E07476F550266C4AD08DAB3F338DF5D321158C26354B1
            691212C28BF10EBEA7DB46963C6EA54CEA8C76F04D5714F2048CF5D1109FDB6F
            B03E1EDAAA93E0B2529FC7D9B525AC5C9D03845C6CECECBF4377F45E97DCB3B9
            E5D9DBB8D0BD87E5FA82CDD71013513E251961CF2A1EA2AD892C82B550D18D41
            9100CD3C5BEC43A8E9158D16B209C0DE7F73F69E228E815FA633F7D3FEAFCD97
            0B9864EC77C1FB1E638E04F6C69F70E7D6A573AA3DF48394677FFF7C78D81E34
            5880241E9C101359972AA753904D7EEF03C8AA27317BBB71F7A672E6FF57DAAC
            8E95474AFC03299E64332F8635120000000049454E44AE426082}
          Hint = 'Exportar Excel'
          OnClick = dxLayoutGroup3Button0Click
        end>
      Index = 2
    end
  end
  object dsListaProdutos: TDataSource
    DataSet = Conexao.FDQListaProdutos
    Left = 240
    Top = 176
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 136
    Top = 128
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'Tahoma'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.UseDefaultFont = False
      ItemOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      ItemOptions.CaptionOptions.Font.Color = clWindowText
      ItemOptions.CaptionOptions.Font.Height = -11
      ItemOptions.CaptionOptions.Font.Name = 'Tahoma'
      ItemOptions.CaptionOptions.Font.Style = []
      ItemOptions.CaptionOptions.UseDefaultFont = False
      PixelsPerInch = 96
    end
  end
  object OpenDialog: TOpenDialog
    Left = 272
    Top = 112
  end
  object dsProdutos: TDataSource
    Left = 208
    Top = 240
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 832
    Top = 16
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 10081021
    end
  end
  object sdExportarExcel: TSaveDialog
    Left = 512
    Top = 360
  end
end
