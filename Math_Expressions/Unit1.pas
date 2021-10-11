unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UExpressions, ExtCtrls,UOperateur;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Bevel1: TBevel;
    procedure Memo1Change(Sender: TObject);
    procedure Memo3Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Memo1Change(Sender: TObject);
var
 i:integer;
 s,expr,cst:string;
 expression:texpression;
begin
 //RAZ des constantes (pi est automatique)
 memo2.Clear;

 expression:=texpression.create;
 // pour chaque ligne, on evalue l'expression
 for i:=0 to memo1.Lines.Count-1 do
  begin
   s:=memo1.Lines[i];
   // si il y a un =, c'est une affectation
   if pos('=',s)<>0 then
    begin
     // on coupe en deux autour du =
     cst:=trim(copy(s,1,pos('=',s)-1));
     expr:=copy(s,pos('=',s)+1,length(s));
     // tous les noms ne sont pas valide, ATTENTION!!!!
     if not ValidConstanteName(cst) then
      begin
       memo2.Lines.add('Nom de constante invalide');
       exit;
      end;
    end
   else
    //sinon, c'est une simple expression à calculer
    begin
     cst:='';
     expr:=s;
    end;
   expression.DefineExpression(expr);
   // on évalue l'expression
   expression.Eval;
   // si il y a une erreur, on l'affiche et on stop le traitement
   if LastExprError<>0 then
    begin
     memo2.Lines.add(GetExprErrorString(LastExprError));
     exit;
    end;
   // si c'est une affectation
   if cst<>'' then
    begin
     // on affiche le résultat et un stock le résultat
     memo2.Lines.Add(cst+'='+floattostr(expression.Resultat));
     expression.constantes.SetValue(cst,expression.Resultat);
    end
   else
   // sinon, on affiche juste le résultat
     memo2.Lines.Add(floattostr(expression.Resultat));
  end;
 expression.Free;
end;

procedure TForm1.Memo3Change(Sender: TObject);
var
 r,i,j:integer;
 expression:texpression;
begin
 //efface l'image
 image1.Canvas.Rectangle(image1.ClientRect);
 //trace le repère
 image1.canvas.Pen.Color:=clgray;
 image1.Canvas.MoveTo(0,150); image1.Canvas.LineTo(400,150);
 image1.Canvas.MoveTo(200,0); image1.Canvas.LineTo(200,300);
 image1.canvas.Pen.Color:=clblack;
 expression:=texpression.create;

 for j:=0 to memo3.Lines.Count-1 do
  begin
   expression.DefineExpression(memo3.lines[j]);

   // trace de -20.0 à 20 avec un pas de 0.1
   for i:=-200 to 200 do
    begin
     // définie la valeur de x
     expression.constantes.SetValue('x',i/10);
     // calcul l'expression
     r:=round(expression.eval*10);
     // si il y a pas d'erreur, on dessine un point, sinon, en fonction, on arrête
     if LastExprError=0 then
      image1.Canvas.Pixels[i+200,150-r]:=0
     else
     // si erreur<100, c'est une erreur de syntaxe
     if LastExprError<100 then
      begin
       image1.Canvas.TextOut(0,0,'Erreur de syntaxe');
       image1.Canvas.TextOut(0,16,GetExprErrorString(LastExprError));
       exit;
      end;
     //si erreur>=100, erreur de calcul comme "div par 0", on continue sans dessiner
    end;
  end;
  expression.Free;
end;

end.




