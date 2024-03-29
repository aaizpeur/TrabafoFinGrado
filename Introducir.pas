unit Introducir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tfrm_introducir_bolsa = class(TForm)
    txt_cantidad_productos: TEdit;
    txt_cantidad_bolsas: TEdit;
    txt_productos_por_bolsa: TEdit;
    btn_validar_bolsas: TSpeedButton;
    img_cantidad_productos: TImage;
    lbl_cantidad_productos: TLabel;
    lbl_productos_por_bolsa: TLabel;
    img_productos_por_bolsa: TImage;
    img_cantidad_bolsas: TImage;
    lbl_cantidad_bolsas_2: TLabel;
    lbl_cantidad_bolsas_1: TLabel;
    btn_salir: TSpeedButton;
    btn_volver_a_jugar: TSpeedButton;
    procedure btn_validar_bolsasClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure btn_volver_a_jugarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iCantidad_productos : Integer ;
    function validar_numero_bolsas(ipb : Integer; icb : Integer; icp : Integer): Boolean ;
  end;

var
  frm_introducir_bolsa: Tfrm_introducir_bolsa;

implementation

{$R *.dfm}

uses Compra, Resultado_Correcto, Resultado_Incorrecto;

// Funci�n para comprar si es correcto el numero de bolsas introducido
function Tfrm_introducir_bolsa.validar_numero_bolsas(ipb : Integer; icb : Integer; icp : Integer): Boolean ;
begin
  Result := False ;

  // Si el resultado de la divisi�n coincide y el resto es 0
  if ((icp div ipb) = icb) and
     ((icp mod ipb) = 0) then
  begin
    Result := True ;
    exit ;
  end;

  // Si el resultado de la division tiene resto diferente a 0
  if (icp mod ipb <> 0) then
    if ((icp div ipb) + 1 = icb) then
    begin
      Result := True ;
      exit ;
    end;

end;

procedure Tfrm_introducir_bolsa.btn_salirClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrm_introducir_bolsa.btn_validar_bolsasClick(Sender: TObject);
var
  iProductos_por_bolsa, iCantidad_de_bolsas, iCantidad_de_productos : Integer ;
begin
  iProductos_por_bolsa := strtoint(txt_productos_por_bolsa.Text) ;
  iCantidad_de_bolsas := strtoint(txt_cantidad_bolsas.Text) ;
  iCantidad_de_productos := strtoint(txt_cantidad_productos.Text) ;

  if (validar_numero_bolsas(iProductos_por_bolsa, iCantidad_de_bolsas,
      iCantidad_de_productos)) then
  begin
    // Respuesta correcta
    frm_Resultado_Correcto.ShowModal ;
    btn_volver_a_jugar.Visible := True ;
    exit ;
  end
  else
  begin
    // Respuesta incorrecta
    frm_Resultado_Incorrecto.ShowModal ;
    txt_cantidad_bolsas.Text :='';
  end;

end;

procedure Tfrm_introducir_bolsa.btn_volver_a_jugarClick(Sender: TObject);
begin
  frm_introducir_bolsa.Close ;
  Cesta.txt_naranjas_cantidad.Text := '';
  Cesta.txt_manzanas_cantidad.Text := '';
  Cesta.txt_fresas_cantidad.Text := '';
  Cesta.txt_resultado.Text := '';
  Cesta.txt_naranjas_importe.Text := (Random(5) + 1).tostring;
  Cesta.txt_manzanas_importe.Text := (Random(5) +1).tostring;
  Cesta.txt_fresas_importe.Text := (Random(5) +1).tostring;
  Cesta.btn_tramitar.Visible := False ;
  txt_cantidad_bolsas.Text :='';
  btn_volver_a_jugar.Visible := False ;
end;

end.
