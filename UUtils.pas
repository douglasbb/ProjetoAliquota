unit UUtils;

interface

uses
  System.SysUtils, System.Variants, FireDAC.Comp.Client,
  System.Win.ComObj, Vcl.Dialogs, Vcl.Forms, Vcl.Controls, Winapi.Windows ;

type

  TCursor = class
    class procedure IniciarProcessamento;
    class procedure FinalizarProcessamento;
  end;

  TUtils = class
    class function IIF<T>(ACondition: Boolean; ResultTrue, ResultFalse: T): T;
    class function fValorFinalProduto(AValorProduto, AValorImpostos: Double): Double;
  end;
implementation

{ TCursor }

class procedure TCursor.FinalizarProcessamento;
begin
  Screen.Cursor := crDefault;
end;

class procedure TCursor.IniciarProcessamento;
begin
  Screen.Cursor := crHourglass;
end;

{ TUtils }

class function TUtils.fValorFinalProduto(AValorProduto,
  AValorImpostos: Double): Double;
begin
  Result:= AValorProduto - AValorImpostos;
end;

class function TUtils.IIF<T>(ACondition: Boolean; ResultTrue,
  ResultFalse: T): T;
begin
  if ACondition then
    Result := ResultTrue
  else
    Result := ResultFalse;
end;

end.