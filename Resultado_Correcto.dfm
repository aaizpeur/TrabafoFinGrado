object frm_Resultado_Correcto: Tfrm_Resultado_Correcto
  Left = 0
  Top = 0
  Caption = 'frm_Resultado_Correcto'
  ClientHeight = 306
  ClientWidth = 593
  Color = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_correcto: TLabel
    Left = 40
    Top = 88
    Width = 529
    Height = 33
    Caption = 'FELICIDADES RESULTADO CORRECTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_aceptar: TSpeedButton
    Left = 224
    Top = 176
    Width = 136
    Height = 49
    Caption = 'ACEPTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn_aceptarClick
  end
end
