unit Compra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tcesta = class(TForm)
    txt_naranjas_cantidad: TEdit;
    txt_manzanas_cantidad: TEdit;
    txt_resultado: TEdit;
    txt_naranjas_importe: TEdit;
    txt_manzanas_importe: TEdit;
    btn_reiniciar: TButton;
    btn_salir: TSpeedButton;
    btn_jugar: TSpeedButton;
    img_importe: TImage;
    img_cantidad: TImage;
    img_supermercado: TImage;
    img_naranjas: TImage;
    img_manzanas: TImage;
    btn_pagar: TSpeedButton;
    lbl_pagar: TLabel;
    img_fresas: TImage;
    txt_fresas_importe: TEdit;
    txt_fresas_cantidad: TEdit;
    btn_tramitar: TSpeedButton;
    procedure btn_reiniciarClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure btn_jugarClick(Sender: TObject);
    procedure btn_pagarClick(Sender: TObject);
    procedure btn_tramitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function datos_introducidos(s1 : String; s2 : String; s3 : String): Boolean ;
    function resultado_correcto(i1 : Integer; c1 : Integer;
                                i2 : Integer; c2 : Integer;
                                i3 : Integer; c3 : Integer;
                                resul : Integer) : Boolean ;
  end;

var
  cesta: Tcesta;

implementation

{$R *.dfm}

uses Introducir, Resultado_Correcto, Resultado_Incorrecto;

// Función que comprueba si se han introducido datos en todos los campos de cantidad.
function Tcesta.datos_introducidos(s1 : String; s2 : String; s3 : String): Boolean ;
begin
  Result := false ;
  if (s1 <> '') and (s2 <> '')and (s3 <> '')then
    Result := true ;
end;

// Función que comprueba si el importe introducido coincide con la cantidad de cada
// producto.
function Tcesta.resultado_correcto(i1 : Integer; c1 : Integer;
                                   i2 : Integer; c2 : Integer;
                                   i3 : Integer; c3 : Integer;
                                   resul : Integer) : Boolean ;
var
  // Variable que se utilizara para guardar el calculo del importe de la fruta 1.
  iTotal_1 : Integer ;
  // Variable que se utilizara para guardar el calculo del importe de la fruta 2.
  iTotal_2 : Integer ;
  // Variable que se utilizara para guardar el calculo del importe de la fruta 3
  iTotal_3 : Integer ;
begin
  // Se inicializa a False el resultado de la función. De esta manera solo modificamos
  // a True en los casos que el calculo sea OK.
  Result := False ;

  // Calculo del total de la fruta 1.
  iTotal_1 := i1 * c1 ;
  // Calculo del total de la fruta 2.
  iTotal_2 := i2 * c2 ;
  // Calculo del total de la fruta 3.
  iTotal_3 := i3 * c3 ;

  // Se compara la suma de las tres frutas.
  if (iTotal_1 + iTotal_2 + iTotal_3 = resul) then
    Result := True ;
end;

// Con el botón de salir se cierra la aplicación.
procedure Tcesta.btn_salirClick(Sender: TObject);
begin
 application.Terminate;
end;

// Una vez comprobado que el importe total es correcto, accedemos al siguiente formulario
// donde se debe indicar el número de bolsas a utilizar.
procedure Tcesta.btn_tramitarClick(Sender: TObject);
begin
  frm_introducir_bolsa.iCantidad_productos := strtoint(txt_naranjas_cantidad.Text) + strtoint(txt_manzanas_cantidad.Text) + strtoint(txt_fresas_cantidad.Text) ;
  frm_introducir_bolsa.txt_cantidad_productos.Text := frm_introducir_bolsa.iCantidad_productos.ToString ;
  frm_introducir_bolsa.txt_productos_por_bolsa.Text := (Random(5) + 1).tostring;
  frm_introducir_bolsa.ShowModal ;

end;

// Botón para iniciar el juego. Se ponen visibles todos los campos necesarios para la
// primera parte del calculo del importe.
procedure Tcesta.btn_jugarClick(Sender: TObject);
begin
  img_naranjas.Visible := true ;
  img_manzanas.Visible := true ;
  img_fresas.Visible := true ;
  img_cantidad.Visible := true ;
  img_importe.Visible := true ;
  lbl_pagar.Visible := true ;
  txt_naranjas_importe.Visible := true ;
  txt_naranjas_cantidad.Visible := true ;
  txt_manzanas_importe.Visible := true ;
  txt_manzanas_cantidad.Visible := true ;
  txt_fresas_importe.Visible := true ;
  txt_fresas_cantidad.Visible := true ;
  txt_resultado.Visible := true ;
  btn_pagar.Visible := true ;
  btn_reiniciar.Visible := true ;

  txt_naranjas_importe.Text := (Random(5) + 1).tostring;
  txt_manzanas_importe.Text := (Random(5) +1).tostring;
  txt_fresas_importe.Text := (Random(5) +1).tostring;

  btn_jugar.Visible := false ;
  img_supermercado.Visible := false ;
  
end;

procedure Tcesta.btn_pagarClick(Sender: TObject);
  var
  // Variable donde se guardara la cantidad de naranjas.
  iNaranjas : integer ;
  // Variable donde se guardara la cantidad de manzanas.
  iManzanas : integer ;
  // Variable donde se guardara la cantidad de fresas.
  ifresas : integer ;
  // Variable donde se guardara el valor del resultado introducido por el usuario.
  iResultado : integer ;
  // Variable donde se guardara el precio multiplicado por la cantidad de naranjas.
  iTotalNaranjas : integer ;
  // Variable donde se guardara el precio multiplicado por la cantidad de manzanas.
  iTotalManzanas : integer ;
  // Variable donde se guardara el precio multiplicado por la cantidad de fresas.
  iTotalFresas : integer ;
  // Variable donde se guarda el precio de las naranjas proporcionado por la aplicación.
  iPrecioNaranjas : integer ;
  // Variable donde se guarda el precio de las manzanas proporcionado por la aplicación.
  iPrecioManzanas : integer ;
  // Variable donde se guarda el precio de las fresas proporcionado por la aplicación.
  iPrecioFresas : integer ;
begin
  // Se chequea que se hayan introducido las cantidades para las tres frutas.
  if datos_introducidos(txt_manzanas_cantidad.Text, txt_naranjas_cantidad.Text, txt_fresas_cantidad.Text) then
  begin
    // Se convierte a integer cada cantidad para poder utilizarlo mas adelante.
    iNaranjas := strtoint(txt_naranjas_cantidad.Text) ;
    iManzanas := strtoint(txt_manzanas_cantidad.Text) ;
    iFresas := strtoint(txt_fresas_cantidad.Text) ;
  end
  else
  begin
    // En caso de que no se hayan introducido las tres cantidades se muestra un aviso.
    showmessage('Hay que indicar numeros en todos los campos');
    exit ;
  end;

  // Se convierte a integer cada importe para poder utilizarlo mas adelante.
  iPrecioNaranjas := strtoint(txt_naranjas_importe.Text) ;
  iPrecioManzanas := strtoint(txt_manzanas_importe.Text) ;
  iPrecioFresas := strtoint(txt_fresas_importe.Text) ;

  // Se convierte a integer el resultado introducido
  iResultado := strtoint(txt_resultado.Text) ;

  // Se llama a la función que realiza el calculo del resultado para ver si es correcto.
  // Es imprescindible que el precio y la cantidad se pase en pareja, mientras que el orden
  // de frutas no altera el resultado.
  if (resultado_correcto(iPrecioNaranjas, iNaranjas,
                         iPrecioManzanas, iManzanas,
                         iPrecioFresas, iFresas,
                         iResultado)) then
  begin
    // Si el resultado es correcto se visualiza un aviso informando de ello y se hace
    // visible el botón con el que podemos pasar a fase del calculo del número de bolsas
    // a utilizar.
    frm_Resultado_Correcto.ShowModal ;
    btn_tramitar.Visible := true ;
  end
  else
  begin
    // Si el resultado ha sido incorrecto, se muestra un aviso informando y se borra el
    // importe para obligar a tener que introducir de nuevo.
    frm_Resultado_Incorrecto.ShowModal ;
    txt_resultado.Text := '';
  end;
end;

// El botoón de reiniciar será utilizado en caso de que el usuario no pueda realizar
// el calculo porque el random de los precios de las frutas ha dado números demasiado
// complejos.
procedure Tcesta.btn_reiniciarClick(Sender: TObject);
begin
  txt_naranjas_cantidad.Text := '';
  txt_manzanas_cantidad.Text := '';
  txt_fresas_cantidad.Text := '';
  txt_resultado.Text := '';
  txt_naranjas_importe.Text := (Random(5) + 1).tostring;
  txt_manzanas_importe.Text := (Random(5) +1).tostring;
  txt_fresas_importe.Text := (Random(5) +1).tostring;
  btn_tramitar.Visible := False ;
end;

end.
