unit unitCadastrarNovoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPickers, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TformCadastrarNovoPedido = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    PageControl: TPageControl;
    Cadastro: TTabSheet;
    Image1: TImage;
    Produtos: TTabSheet;
    lblTipoDoProduto: TLabel;
    lblNomeDoProduto: TLabel;
    lblTamanhoDoProduto: TLabel;
    comboTiposDeProduto: TComboBox;
    comboNomeDoProduto: TComboBox;
    comboTamanhoDoProduto: TComboBox;
    btAdicionarProduto: TButton;
    btFinalizarPedido: TButton;
    gridCadastroProdutos: TDBGrid;
    btCancelarPedido: TButton;
    editObservacoes: TEdit;
    panelImagemEmpresa: TPanel;
    panelTiposDeProduto: TPanel;
    panelAreaDadosCliente: TPanel;
    lblNomeCliente: TLabel;
    lblDataHoraEntrega: TLabel;
    lblTelefoneCliente: TLabel;
    editNomeCliente: TEdit;
    dataEntrega: TDateTimePicker;
    horaEntrega: TTimePicker;
    editTelefoneCliente: TMaskEdit;
    rdbtClienteRetira: TRadioGroup;
    btConfirmar: TButton;
    btEditarCadastro: TButton;
    panelPageProdutos: TPanel;
    panelGridProdutos: TPanel;
    panelPageCadastro: TPanel;
    editEnderecoCliente: TLabeledEdit;
    panelDadosCliente: TPanel;
    procedure rdbtClienteRetiraClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure comboTiposDeProdutoClick(Sender: TObject);
    procedure alteraNomeDoProduto(tipo_do_produto, tabela,
                                  tabela_tamanho: string);
    procedure insereDadosPageCadastro;
    procedure btAdicionarProdutoClick(Sender: TObject);
    procedure btFinalizarPedidoClick(Sender: TObject);
    procedure descobreIdCliente;
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure btEditarCadastroClick(Sender: TObject);
    procedure deletaPedidoIncompleto;
    procedure CadastroShow(Sender: TObject);
    function buscaPrecoProdutoCadastrado : real;
    procedure insereProdutoCadastradoDB;
    procedure dadosGridCadastroProdutos;
    procedure tipoProdutoComboBox;
    procedure renovaCamposPageProdutos;
    procedure renovaCamposPageCadastro;
    procedure validaCbTiposDeProdutoVazia;
    procedure editTelefoneClienteClick(Sender: TObject);
    procedure ProdutosShow(Sender: TObject);
    procedure finalizaPedido;
    procedure ativaDesativaEditarCadastro(boolean : boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
formCadastrarNovoPedido: TformCadastrarNovoPedido;
id_cliente : integer;
valor_produto : real;


implementation

{$R *.dfm}

uses unitDM;


procedure TformCadastrarNovoPedido.alteraNomeDoProduto(tipo_do_produto, tabela,
                          tabela_tamanho: string);
begin
  if comboTiposDeProduto.text = tipo_do_produto then
    begin
    with dm.qNomeDoProduto do
      begin
        Close;
        sql.Clear;
        sql.add('select nome from ' + tabela);
        open;
        dm.qNomeDoProduto.First;

        while not dm.qNomeDoProduto.Eof do
        begin
          comboNomeDoProduto.items.Add(dm.qNomeDoProduto['nome']);
          dm.qNomeDoProduto.Next;
        end;
      end;

    with dm.qTamanhoDoProduto do
      begin
        Close;
        sql.clear;
        sql.add('select tamanho from ' + tabela_tamanho + ' ORDER BY preco');
        open;
        dm.qTamanhoDoProduto.First;

        while not dm.qTamanhoDoProduto.Eof do
        begin
          comboTamanhoDoProduto.Items.Add(dm.qTamanhoDoProduto['tamanho']);
          dm.qTamanhoDoProduto.Next;
        end;

      end;
    end;

end;

procedure TformCadastrarNovoPedido.ativaDesativaEditarCadastro(boolean : boolean);
begin
  panelDadosCliente.Enabled := boolean;
  btEditarCadastro.Enabled := not boolean;
end;

procedure TformCadastrarNovoPedido.btAdicionarProdutoClick(Sender: TObject);
begin
  validaCbTiposDeProdutoVazia();
  buscaPrecoProdutoCadastrado();
  descobreIdCliente();
  insereProdutoCadastradoDB();
  dadosGridCadastroProdutos();
  renovaCamposPageProdutos();
end;

procedure TformCadastrarNovoPedido.btCancelarPedidoClick(Sender: TObject);
begin
  deletaPedidoIncompleto();
  PageControl.ActivePage := Cadastro;
  panelPageProdutos.Enabled := False;
  ativaDesativaEditarCadastro(true);
  dm.qTabelaProdutos.EmptyDataSet;
  renovaCamposPageProdutos;
end;

procedure TformCadastrarNovoPedido.btConfirmarClick(Sender: TObject);
begin
  if Length(editNomeCliente.Text) = 0 then
    begin
      Application.MessageBox('Digite seu nome!', 'Erro', MB_OK);
      abort;
    end
  else
    begin
      ativaDesativaEditarCadastro(false);
      insereDadosPageCadastro();
      panelPageProdutos.Enabled := True;
      Pagecontrol.ActivePage := Produtos;
    end;
end;

procedure TformCadastrarNovoPedido.btEditarCadastroClick(Sender: TObject);
begin
  deletaPedidoIncompleto();
  PageControl.ActivePage := Cadastro;
  ativaDesativaEditarCadastro(true);
  panelPageProdutos.Enabled := False;
end;

procedure TformCadastrarNovoPedido.btFinalizarPedidoClick(Sender: TObject);
begin
  finalizaPedido();
  renovaCamposPageCadastro();
end;

function TformCadastrarNovoPedido.buscaPrecoProdutoCadastrado : real;
var
  nome_tabela : string;
begin
  case comboTiposDeProduto.ItemIndex of
    0 : nome_tabela := 'precos_sobremesa';
    1 : nome_tabela := 'precos_tortas_doces';
    2 : nome_tabela := 'precos_tortas_salgadas';
  end;

  with dm.qBuscaPrecoProdutoCadastro do
  begin
    sql.clear;
    sql.add('select preco from ' + nome_tabela
          + ' where tamanho = :pTamanhoProduto');
    ParamByName('pTamanhoProduto').AsString := comboTamanhoDoProduto.text;
    open;
    valor_produto := dm.qBuscaPrecoProdutoCadastro['preco'];
    result := valor_produto;
  end;
end;

procedure TformCadastrarNovoPedido.CadastroShow(Sender: TObject);
begin
  dataEntrega.Date:= date();
end;

procedure TformCadastrarNovoPedido.insereProdutoCadastradoDB;
begin
  with dm.qCadastroProdutos do
    begin
    sql.clear;
    sql.ADD('INSERT INTO cadastro_produtos(id_cliente, nome_cliente, nome,'
    + ' tamanho, valor, observacoes) values(:pIdCliente, :pNomeCliente,'
    + ' :pNomeProduto, :pTamanhoProduto, :pValorProduto, :pObsProduto)');

    ParamByName('pIdCliente').AsInteger := id_cliente;
    ParamByName('pNomeCliente').AsString := editNomeCliente.Text;
    ParamByName('pNomeProduto').AsString := '(' + comboTiposDeProduto.Text
                                         + ')' + ' ' + comboNomeDoProduto.Text;

    ParamByName('pTamanhoProduto').AsString := comboTamanhoDoProduto.Text;
    ParamByName('pValorProduto').AsFloat := valor_produto;
    ParamByName('pObsProduto').AsString := editObservacoes.text;
    execsql;
    end;
end;

procedure TformCadastrarNovoPedido.comboTiposDeProdutoClick(Sender: TObject);
begin
  comboNomeDoProduto.Items.Clear;
  comboTamanhoDoProduto.Items.Clear;

  alteraNomeDoProduto('Torta doce', 'tortas_doces', 'precos_tortas_doces');
  alteraNomeDoProduto('Torta salgada', 'tortas_salgadas',
                      'precos_tortas_salgadas');
  alteraNomeDoProduto('Sobremesa', 'sobremesas', 'precos_sobremesa');
end;

procedure TformCadastrarNovoPedido.dadosGridCadastroProdutos;
begin
  with dm.qTabelaProdutos do
  begin
    sql.clear;
    sql.add('select * from cadastro_produtos where id_cliente = :pIdCliente');
    ParamByName('pIdCliente').Asinteger := id_cliente;
    open;
    gridCadastroProdutos.DataSource := dm.dsTabelaProdutos;
  end;
end;

procedure TformCadastrarNovoPedido.deletaPedidoIncompleto;
begin
  if Application.MessageBox('Deseja cancelar este pedido?', 'Cancelar pedido',
  + MB_ICONQUESTION + MB_YESNO) = MrYes then
    with dm.qCadastroProdutos do
    begin
      descobreIdCliente();
      sql.Clear;
      sql.Add('DELETE FROM pedidos where id = :pIdCliente');
      ParamByName('pIdCliente').AsInteger := id_cliente;
      ExecSQL;
    end;
end;

procedure TformCadastrarNovoPedido.descobreIdCliente;
begin
  with dm.qCadastroProdutos do
  begin
    Sql.clear;
    Sql.add('select id from pedidos where nome = :pNomeCliente');
    ParamByName('pNomeCliente').AsString := editNomeCliente.text;
    Open;
    Last;
    id_cliente := dm.qCadastroProdutos['id'];
  end;
end;

procedure TformCadastrarNovoPedido.editTelefoneClienteClick(Sender: TObject);
begin
  editTelefoneCliente.EditMask :=  '(99) 99999-9999;1;_';
end;

procedure TformCadastrarNovoPedido.finalizaPedido;
begin
  if Application.MessageBox('Deseja concluir seu pedido?', 'Concluir pedido',
    + MB_ICONQUESTION + MB_YESNO) = MrYes then
    begin
      PageControl.ActivePage := Cadastro;
      panelPageProdutos.Enabled := False;
      ativaDesativaEditarCadastro(true);
      dm.qTabelaProdutos.EmptyDataSet;
      renovaCamposPageProdutos;
    end;
end;

procedure TformCadastrarNovoPedido.ProdutosShow(Sender: TObject);
begin
  if panelPageProdutos.Enabled = False then
    ShowMessage('Primeiramente cadastre o cliente')
  else
    tipoProdutoComboBox();
end;

procedure TformCadastrarNovoPedido.insereDadosPageCadastro;
var
  datahora : String;
begin
  with dm.qPedidos do
  begin
    sql.Clear;
    sql.ADD('insert into pedidos(nome, data_entrega, telefone, endereco)values(:pNomeCliente, :pDataEntrega, :pTelefoneCliente, :pEndereco)');
    ParamByName('pNomeCliente').AsString := editNomeCliente.Text;
    datahora := DateToStr(dataEntrega.Date) + TimeToStr(horaEntrega.Time);
    ParamByName('pDataEntrega').AsDateTime := StrToDateTime(datahora);
    ParamByName('pTelefoneCliente').AsString := editTelefoneCliente.Text;
    ParamByName('pEndereco').AsString := editEnderecoCliente.Text;
    ExecSQL;
  end;

end;

procedure TformCadastrarNovoPedido.rdbtClienteRetiraClick(Sender: TObject);
begin
  case rdbtClienteRetira.ItemIndex of
  0: editEnderecoCliente.Enabled := False;
  1: editEnderecoCliente.Enabled := True;
  end;
end;

procedure TformCadastrarNovoPedido.renovaCamposPageCadastro;
var i : integer;
begin
  for i := 0 to pred(self.ComponentCount) do
  begin
    if (self.Components[i] is Tedit) then
      (self.Components[i] as Tedit).clear;

    if (self.Components[i] is TMaskEdit) then
      (self.Components[i] as TMaskEdit).clear;

    if (self.Components[i] is TLabeledEdit) then
      (self.Components[i] as TLabeledEdit).clear;

    dataEntrega.Date := date();
    rdbtClienteRetira.ItemIndex := 0;
  end;
end;

procedure TformCadastrarNovoPedido.renovaCamposPageProdutos;
var i : integer;
begin
  for i := 0 to pred(self.ComponentCount) do
  begin
    if (self.Components[i] is TComboBox) then
      (self.Components[i] as TComboBox).clear;

    editObservacoes.Text := '';
  end;

  tipoProdutoComboBox();
end;

procedure TformCadastrarNovoPedido.tipoProdutoComboBox;
begin
  with dm.qPedidos do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tipos_de_produto';
    Open;
    dm.qPedidos.First;

    while not dm.qPedidos.Eof do
    begin
      comboTiposDeProduto.Items.add(dm.qPedidos['tipo']);
      dm.qPedidos.Next;
    end;
  end;
end;

procedure TformCadastrarNovoPedido.validaCbTiposDeProdutoVazia;
begin
  if (comboNomeDoProduto.Text = '') or (comboTiposDeProduto.Text = '') or
                (comboTamanhoDoProduto.Text = '') then
    begin
      Application.MessageBox('Preencha todos os dados!', 'Dados incompletos',
                     MB_ICONEXCLAMATION + MB_OK);
      abort;
    end;
end;

end.
