unit Resultado_Correcto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  Tfrm_Resultado_Correcto = class(TForm)
    lbl_correcto: TLabel;
    btn_aceptar: TSpeedButton;
    procedure btn_aceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Resultado_Correcto: Tfrm_Resultado_Correcto;

implementation

{$R *.dfm}

procedure Tfrm_Resultado_Correcto.btn_aceptarClick(Sender: TObject);
begin
  frm_Resultado_Correcto.Close ;
end;

end.
