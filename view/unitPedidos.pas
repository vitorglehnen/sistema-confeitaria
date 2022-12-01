unit unitPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, StrUtils, Vcl.Mask, Vcl.WinXPickers,
  Vcl.Buttons;

type
  TformPedidos = class(TForm)
    gridHistoricoPedidos: TDBGrid;
    cbTipoPesquisa: TComboBox;
    Label1: TLabel;
    lblFiltroPesquisa: TLabel;
    editLabelPesquisa: TMaskEdit;
    gridHistoricoProdutos: TDBGrid;
    btImprimirPedido: TButton;
    lblDadosDosPedidos: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    procedure cbTipoPesquisaChange(Sender: TObject);
    procedure editLabelPesquisaChange(Sender: TObject);
    procedure validaFiltros(nomeDoFiltro, pNomeColunaDB : String);
    procedure gridHistoricoPedidosCellClick(Column: TColumn);
    procedure gridRelacionamento;
    procedure btImprimirPedidoClick(Sender: TObject);
    procedure contaLinhasPedidos;
    procedure contaNumeroDeProdutos;
    procedure somaValoresDosProdutos;
    procedure criaRelatorioDoPedido;
    procedure gridHistoricoPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridHistoricoProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridHistoricoPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridHistoricoProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPedidos: TformPedidos;
  item_selecionado: String;
  numero_linhas : integer;
  numero_produtos : integer;
  valor_total : string;

implementation

{$R *.dfm}

uses unitDM;

procedure TformPedidos.btImprimirPedidoClick(Sender: TObject);
begin
  contaLinhasPedidos();
  if numero_linhas > 0 then
    begin
    contaNumeroDeProdutos;
    somaValoresDosProdutos;
    criaRelatorioDoPedido;
    end;
end;

procedure TformPedidos.cbTipoPesquisaChange(Sender: TObject);
begin
  editLabelPesquisa.Enabled := True;
  case cbTipoPesquisa.ItemIndex of
  0: lblFiltroPesquisa.Caption := 'ID';
  1: lblFiltroPesquisa.Caption := 'Nome';
  2: lblFiltroPesquisa.Caption := 'Telefone';
  3: lblFiltroPesquisa.Caption := 'Endereço';
  4: begin
     lblFiltroPesquisa.Caption := '';
     editLabelPesquisa.Enabled := False;
  end;
  end;
end;

procedure TformPedidos.contaLinhasPedidos;
begin
  with dm.qDadosParaRel do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM pedidos WHERE id = :pIdCliente');
    ParamByName('pIdCliente').AsString := item_selecionado;
    open;
    Fetchall;
    numero_linhas := RecordCount;
  end;
end;

procedure TformPedidos.contaNumeroDeProdutos;
begin
  with dm.qTabelaProdutos do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM cadastro_produtos WHERE id_cliente = :pIdCliente');
    ParamByName('pIdCliente').AsString := item_selecionado;
    open;
    Fetchall;
    numero_produtos := RecordCount;
  end;
end;

procedure TformPedidos.criaRelatorioDoPedido;
var caminho : string;
begin
  caminho := ExtractFilePath(Application.ExeName);
    if dm.relqTabelaProdutos.LoadFromFile(caminho + 'rel_pedido_final.fr3') then
      begin
      dm.relqTabelaProdutos.Variables['vValor_total'] := QuotedStr(valor_total);
      dm.relqTabelaProdutos.Variables['vTotal_produtos'] :=
                                           QuotedStr(inttostr(numero_produtos));
      dm.relqTabelaProdutos.ShowReport;
      dm.relqTabelaProdutos.clear;
      dm.relqTabelaProdutos.LoadFromFile(ExtractFilePath(application.ExeName) +
         'rel_pedido_final.fr3');
      dm.relqTabelaProdutos.PrepareReport(true);
      end
    else
      begin
        ShowMessage('Selecione um pedido na primeira tabela para imprimir!');
      end;
end;

procedure TformPedidos.editLabelPesquisaChange(Sender: TObject);
begin
  case cbTipoPesquisa.ItemIndex of
  0: validaFiltros(cbTipoPesquisa.Text, 'id');
  1: validaFiltros(cbTipoPesquisa.Text, 'nome');
  3: validaFiltros(cbTipoPesquisa.Text, 'telefone');
  4: validaFiltros(cbTipoPesquisa.Text, 'endereco');
  end;
end;

procedure TformPedidos.FormShow(Sender: TObject);
begin
  with dm.qHistoricoPedidos do
  begin
  SQL.clear;
  SQL.add('SELECT * FROM pedidos');
  open;
  FetchAll;
  if RecordCount = 0 then
    gridHistoricoPedidos.Enabled := False;
  end;
end;

procedure TformPedidos.gridHistoricoPedidosCellClick(Column: TColumn);
begin
  gridRelacionamento();
end;

procedure TformPedidos.gridHistoricoPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(gridHistoricoPedidos.handle, SB_HORZ, FALSE);
end;

procedure TformPedidos.gridHistoricoPedidosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_DELETE then
    dm.qHistoricoPedidos.Delete;
end;

procedure TformPedidos.gridHistoricoProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(gridHistoricoProdutos.handle, SB_HORZ, FALSE);
end;

procedure TformPedidos.gridHistoricoProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_DELETE then
    dm.qHistoricoProdutos.Delete;
end;

procedure TformPedidos.gridRelacionamento;
  begin
    with dm.qHistoricoProdutos do
    begin
      item_selecionado := gridHistoricoPedidos.Columns[0].Field.Value;
      SQL.clear;
      SQL.add('SELECT * FROM cadastro_produtos WHERE id_cliente = :pIdCliente');
      ParamByName('pIdCliente').AsString := item_selecionado;
      open;
      FetchAll;
      if RecordCount = 0 then
        gridHistoricoProdutos.Enabled := False
      else
        begin
          gridHistoricoProdutos.Enabled := True;
          gridHistoricoProdutos.DataSource := dm.dsHistoricoProdutos;
        end;

    end;
  end;


procedure TformPedidos.somaValoresDosProdutos;
var soma_dos_valores : integer;
begin
  with dm.qCalculaSomaValores do
    begin
      sql.clear;
      sql.add('select valor from cadastro_produtos where'
      + ' id_cliente = :pIdCliente');
      ParamByName('pIdCliente').AsString := item_selecionado;
      open;
      first;
      while not dm.qCalculaSomaValores.Eof do
      begin
        soma_dos_valores := soma_dos_valores + dm.qCalculaSomaValores['valor'];
        dm.qCalculaSomaValores.Next;
      end;
      valor_total := 'R$ '+floattostr(soma_dos_valores)+',00';
    end;
end;

procedure TformPedidos.validaFiltros(nomeDoFiltro, pNomeColunaDB : String);
begin
  with dm.qHistoricoPedidos do
  begin
    SQL.clear;
    SQL.add('SELECT * FROM pedidos WHERE '+ pNomeColunaDB +' LIKE :pNomeParam');
    ParamByName('pNomeParam').AsString := '%' + editLabelPesquisa.Text + '%';
    open;
    gridHistoricoPedidos.DataSource := dm.dsHistoricoPedidos;
  end;

end;

end.
