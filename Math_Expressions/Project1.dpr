program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UExpressions in 'UExpressions.pas',
  UPile in 'UPile.pas',
  UOperateur in 'UOperateur.pas';

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
