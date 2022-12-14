unit unitEditarCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TformEditarCardapio = class(TForm)
    cbPrecos: TComboBox;
    Label1: TLabel;
    gridEditarPrecos: TDBGrid;
    DBNavigator1: TDBNavigator;
    gridEditarSabores: TDBGrid;
    cbSabores: TComboBox;
    DBNavigator2: TDBNavigator;
    procedure cbPrecosChange(Sender: TObject);
    procedure validaEditPreco(nomeTabela : string);
    procedure validaEditSabor(nomeTabela : string);
    procedure FormActivate(Sender: TObject);
    procedure cbSaboresChange(Sender: TObject);
    procedure gridEditarPrecosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridEditarSaboresDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridEditarPrecosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridEditarSaboresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEditarCardapio: TformEditarCardapio;

implementation

{$R *.dfm}

uses unitDM;

procedure TformEditarCardapio.cbPrecosChange(Sender: TObject);
begin
  gridEditarPrecos.Enabled := True;
  case cbPrecos.ItemIndex of
  0: validaEditPreco('precos_tortas_salgadas');
  1: validaEditPreco('precos_tortas_doces');
  2: validaEditPreco('precos_sobremesa');
  end;
end;

procedure TformEditarCardapio.cbSaboresChange(Sender: TObject);
begin
  gridEditarSabores.Enabled := True;

  case cbSabores.ItemIndex of
  0: validaEditSabor('tortas_doces');
  1: validaEditSabor('tortas_salgadas');
  2: validaEditSabor('sobremesas');
  end;
end;

procedure TformEditarCardapio.FormActivate(Sender: TObject);
begin
  ActiveControl := nil;
end;

procedure TformEditarCardapio.gridEditarPrecosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(gridEditarPrecos.Handle, SB_horz, FALSE);
end;

procedure TformEditarCardapio.gridEditarPrecosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_DELETE then
    dm.qEditarCardapioPrecos.Delete;
end;

procedure TformEditarCardapio.gridEditarSaboresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(gridEditarSabores.Handle, SB_horz, FALSE);
end;

procedure TformEditarCardapio.gridEditarSaboresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_DELETE then
    dm.qEditarCardapioSabores.Delete;
end;

procedure TformEditarCardapio.validaEditPreco(nomeTabela : String);
begin
  with dm.qEditarCardapioPrecos do
  begin
    SQL.clear;
    SQL.add('SELECT * FROM ' + nomeTabela);
    open;
    gridEditarPrecos.DataSource := dm.dsEditarCardapioPrecos;
  end;
end;

procedure TformEditarCardapio.validaEditSabor(nomeTabela: string);
begin
  with dm.qEditarCardapioSabores do
  begin
    SQL.clear;
    SQL.add('SELECT * FROM ' + nomeTabela);
    open;
    gridEditarSabores.DataSource := dm.dsEditarCardapioSabores;
  end;
end;

end.
