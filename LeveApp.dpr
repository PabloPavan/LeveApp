program LeveApp;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  mainU in 'mainU.pas' {Main},
  VendasU in 'source\VendasU.pas' {Vendas: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, MainForm);
  Application.Run;
end.
