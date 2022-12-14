object formEditarCardapio: TformEditarCardapio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar Card'#225'pio'
  ClientHeight = 771
  ClientWidth = 1294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 525
    Top = 8
    Width = 218
    Height = 21
    Caption = 'Qual c'#225'rdapio deseja alterar?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cbPrecos: TComboBox
    Left = 58
    Top = 149
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    TextHint = 'Pre'#231'os'
    OnChange = cbPrecosChange
    Items.Strings = (
      'Pre'#231'os tortas salgadas'
      'Pre'#231'os tortas doces'
      'Pre'#231'os sobremesas')
  end
  object gridEditarPrecos: TDBGrid
    Left = 58
    Top = 176
    Width = 407
    Height = 417
    DataSource = DM.dsEditarCardapioPrecos
    DrawingStyle = gdsGradient
    Enabled = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = gridEditarPrecosDrawColumnCell
    OnKeyDown = gridEditarPrecosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'tamanho'
        Title.Caption = 'Tamanho'
        Width = 224
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'preco'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o'
        Width = 149
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 58
    Top = 599
    Width = 404
    Height = 25
    DataSource = DM.dsEditarCardapioPrecos
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbRefresh]
    ConfirmDelete = False
    TabOrder = 2
  end
  object gridEditarSabores: TDBGrid
    Left = 815
    Top = 176
    Width = 408
    Height = 417
    DataSource = DM.dsEditarCardapioSabores
    DrawingStyle = gdsGradient
    Enabled = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = gridEditarSaboresDrawColumnCell
    OnKeyDown = gridEditarSaboresKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        ReadOnly = True
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Sabor'
        Width = 308
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 815
    Top = 599
    Width = 392
    Height = 25
    DataSource = DM.dsEditarCardapioSabores
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbRefresh]
    ConfirmDelete = False
    TabOrder = 5
  end
  object cbSabores: TComboBox
    Left = 815
    Top = 149
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    TextHint = 'Sabores'
    OnChange = cbSaboresChange
    Items.Strings = (
      'Tortas Doces'
      'Tortas Salgadas'
      'Sobremesas')
  end
end
