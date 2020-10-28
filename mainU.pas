unit mainU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects, FMX.Ani, FMX.Objects,
  FMX.ImgList, System.ImageList, VendasU;

type
  TMain = class(TForm)
    lytBackGround: TLayout;
    lytMenuEsquerdo: TLayout;
    recMenuEsquerdo: TRectangle;
    lytMenuEsqTop: TLayout;
    rctMenuEsqTop: TRectangle;
    ImageList1: TImageList;
    rctBtnMenu: TRectangle;
    Glyph1: TGlyph;
    rctVenda: TRectangle;
    Glyph2: TGlyph;
    lblVenda: TLabel;
    rctPagar: TRectangle;
    Glyph3: TGlyph;
    lblPagar: TLabel;
    rctCadastrar: TRectangle;
    Glyph4: TGlyph;
    lblCadastrar: TLabel;
    lytContent: TLayout;
    lytDireito: TLayout;
    rctBackgroundDireto: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure rctBtnMenuClick(Sender: TObject);
    procedure rctVendaClick(Sender: TObject);
    procedure rctPagarClick(Sender: TObject);
    procedure rctCadastrarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    m_IsExpand    : Boolean;
    m_VendasFrame : TVendas;
    { Private declarations }
    procedure ResetTheme;
    procedure ExpandMenu;
    procedure AdjustPosition;
    procedure ResetButtonsColor;
  public
    { Public declarations }
    constructor Create();
    Destructor  Destroy; override;
  end;

var
  MainForm: TMain;

implementation


Const
  c_nBackgroundWidthDefault = 200;
  c_nBackgroundWidthMin     = 50;

{$R *.fmx}

{ TMain }

//******************************************************************************
//
//       Nome: FormCreate
//  Descrição: Construtor do Form
//
//******************************************************************************
procedure TMain.FormCreate(Sender: TObject);
begin

  m_VendasFrame :=  TVendas.Create(Self);
  m_VendasFrame.Parent  := lytContent;
  m_VendasFrame.Visible := False;
  m_VendasFrame.Align   := TAlignLayout.Client;

  m_IsExpand            := True;
  lytMenuEsquerdo.Width := c_nBackgroundWidthDefault;
  ResetTheme;
  AdjustPosition;
end;

//******************************************************************************
//
//       Nome: FormResize
//  Descrição: Evento de resize do form
//
//******************************************************************************
procedure TMain.FormResize(Sender: TObject);
begin
  AdjustPosition;
end;

//******************************************************************************
//
//       Nome: Create
//  Descrição: Construtor da classe
//
//******************************************************************************
constructor TMain.Create;
begin
end;

//******************************************************************************
//
//       Nome: Destroy
//  Descrição: Destrutor da classe
//
//******************************************************************************
destructor TMain.Destroy;
begin
  inherited;
end;

//******************************************************************************
//
//       Nome: ExpandMenu
//  Descrição: Expande o menu esquerdo
//
//******************************************************************************
procedure TMain.ExpandMenu;
begin
  if m_IsExpand then
    begin
      lytMenuEsquerdo.Width := c_nBackgroundWidthDefault;
      lblVenda.Visible      := True;
      lblPagar.Visible      := True;
      lblCadastrar.Visible  := True;
    end
  else
    begin
     lytMenuEsquerdo.Width := c_nBackgroundWidthMin;
     lblVenda.Visible      := False;
     lblPagar.Visible      := False;
     lblCadastrar.Visible  := False;
    end;

  AdjustPosition;
end;

//******************************************************************************
//
//       Nome: ResetTheme
//  Descrição: Ajusta as cores do tema
//
//******************************************************************************
procedure TMain.ResetTheme;
begin

end;

//******************************************************************************
//
//       Nome: ResetTheme
//  Descrição: Ajusta as cores do tema
//
//******************************************************************************
procedure TMain.AdjustPosition;
var
  sRealWidth : Single;
begin

  sRealWidth          := Width - lytMenuEsquerdo.Width;
  lytContent.Width    := sRealWidth - lytDireito.Width - 20;


  if sRealWidth > 1500 then
    begin
      lytDireito.Visible       := True;
    end
  else
    begin
      lytDireito.Visible         := False;
      lytContent.Width           := sRealWidth - 20;
    end;


  rctVenda.Position.X := 0;
  rctVenda.Position.Y := 30;
  lblVenda.Position.X := 55;

  rctPagar.Position.X := 0;
  rctPagar.Position.Y := rctVenda.Position.Y + rctVenda.Height + 30;
  lblPagar.Position.X := 55;

  rctCadastrar.Position.X := 0;
  rctCadastrar.Position.Y := rctPagar.Position.Y + rctPagar.Height + 30;
  lblCadastrar.Position.X := 55;
end;
//******************************************************************************
//
//       Nome: rctBtnMenuClick
//  Descrição: Evento de Clique
//
//******************************************************************************
procedure TMain.rctBtnMenuClick(Sender: TObject);
begin
  m_IsExpand := not m_IsExpand;
  ExpandMenu;
end;

//******************************************************************************
//
//       Nome: rctCadastrarClick
//  Descrição: Evento de Clique
//
//******************************************************************************
procedure TMain.rctCadastrarClick(Sender: TObject);
begin
  ResetButtonsColor;
  rctCadastrar.Fill.Color     := TAlphaColors.DarkGray;
  rctCadastrar.Fill.Kind      := TBrushKind.Solid;
end;

//******************************************************************************
//
//       Nome: rctPagarClick
//  Descrição: Evento de Clique
//
//******************************************************************************
procedure TMain.rctPagarClick(Sender: TObject);
begin
  ResetButtonsColor;
  rctPagar.Fill.Color     := TAlphaColors.DarkGray;
  rctPagar.Fill.Kind      := TBrushKind.Solid;
end;

//******************************************************************************
//
//       Nome: rctVendaClick
//  Descrição: Evento de Clique
//
//******************************************************************************
procedure TMain.rctVendaClick(Sender: TObject);
begin
  ResetButtonsColor;
  rctVenda.Fill.Color     := TAlphaColors.DarkGray;
  rctVenda.Fill.Kind      := TBrushKind.Solid;
  m_VendasFrame.Visible := True;
end;

//******************************************************************************
//
//       Nome: ResetButtonsColor
//  Descrição: Ajusta as cores do tema
//
//******************************************************************************
procedure TMain.ResetButtonsColor;
begin
  rctVenda.Fill.Kind      := TBrushKind.None;
  rctPagar.Fill.Kind      := TBrushKind.None;
  rctCadastrar.Fill.Kind  := TBrushKind.None;
end;

end.
