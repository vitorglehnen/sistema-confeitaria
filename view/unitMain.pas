unit unitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TformPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btCadastrarNovoPedido: TButton;
    btPedidos: TButton;
    btEditarCardapio: TButton;
    Panel3: TPanel;
    Image1: TImage;
    procedure btCadastrarNovoPedidoClick(Sender: TObject);
    procedure btPedidosClick(Sender: TObject);
    procedure btEditarCardapioClick(Sender: TObject);
    procedure abreFormCadastrarNovoPedido();
    procedure abreFormPedidos();
    procedure abreFormEditarCardapio();
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses unitCadastrarNovoPedido, unitEditarCardapio, unitPedidos;

procedure TformPrincipal.abreFormCadastrarNovoPedido;
begin
  formCadastrarNovoPedido := TformCadastrarNovoPedido.Create(self);

  with unitCadastrarNovoPedido.formCadastrarNovoPedido do
    begin
    PageControl.ActivePage := Cadastro;
    end;

  formCadastrarNovoPedido.ShowModal();
end;

procedure TformPrincipal.abreFormEditarCardapio;
begin
  formEditarCardapio := TformEditarCardapio.Create(self);
  formEditarCardapio.ShowModal();
end;

procedure TformPrincipal.abreFormPedidos;
begin
  formPedidos := TformPedidos.Create(self);
  formPedidos.ShowModal();
end;

procedure TformPrincipal.btCadastrarNovoPedidoClick(Sender: TObject);
begin
  abreFormCadastrarNovoPedido();
end;

procedure TformPrincipal.btEditarCardapioClick(Sender: TObject);
begin
  abreFormEditarCardapio();
end;

procedure TformPrincipal.btPedidosClick(Sender: TObject);
begin
  abreFormPedidos();
end;


procedure TformPrincipal.FormActivate(Sender: TObject);
begin
  ActiveControl := nil;
end;

end.
