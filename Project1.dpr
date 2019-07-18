program Project1;

uses
  Vcl.Forms,
  Compra in 'Compra.pas' {cesta},
  Introducir in 'Introducir.pas' {frm_introducir_bolsa},
  Resultado_Correcto in 'Resultado_Correcto.pas' {frm_Resultado_Correcto},
  Resultado_Incorrecto in 'Resultado_Incorrecto.pas' {frm_Resultado_Incorrecto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tcesta, cesta);
  Application.CreateForm(Tfrm_introducir_bolsa, frm_introducir_bolsa);
  Application.CreateForm(Tfrm_Resultado_Correcto, frm_Resultado_Correcto);
  Application.CreateForm(Tfrm_Resultado_Incorrecto, frm_Resultado_Incorrecto);
  Application.Run;
end.
