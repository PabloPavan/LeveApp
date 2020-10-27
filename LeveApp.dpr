program LeveApp;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  mainU in 'mainU.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, MainForm);
  Application.Run;
end.
