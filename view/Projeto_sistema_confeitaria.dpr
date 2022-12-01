program Projeto_sistema_confeitaria;

uses
  Vcl.Forms,
  unitMain in 'unitMain.pas' {formPrincipal},
  unitPedidos in 'unitPedidos.pas' {formPedidos},
  unitEditarCardapio in 'unitEditarCardapio.pas' {formEditarCardapio},
  unitCadastrarNovoPedido in 'unitCadastrarNovoPedido.pas' {formCadastrarNovoPedido},
  unitDM in 'unitDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
