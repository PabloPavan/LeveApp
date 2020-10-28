unit VendasU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TVendas = class(TFrame)
    tbVendas: TTabControl;
    tiCadastrar: TTabItem;
    tiVisaoGeral: TTabItem;
    rctBackCadastrar: TRectangle;
    rctBackVisaoGeral: TRectangle;
    vsbCadastrar: TVertScrollBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
