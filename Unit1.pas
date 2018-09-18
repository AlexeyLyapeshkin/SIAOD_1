unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GdipGraphic, ExtCtrls;

type
  TForm1 = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  x1 = 145;
  y1 = 125;
  x2 = 1655;
  y2 = 125;
  x3 = 145;
  y3 = 1072;
  x4 = 1655;
  y4 = 1072;
  Radius = 25;

var
  Form1: TForm1;
  x,y: integer;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure GoRight(var x: Integer);
var flag: Boolean;
begin

      if (((y < y1 - 2*Radius+10 ) or (y > y3  )) and (x < 1750)) or (((y > y1 ) or (y < y3 )) and ((x < x1 - 2*Radius ) or ((x> x2-10 ) and (x< 1750))))  then
        x:= x + 25;
end;

procedure GoLeft(var x: Integer);
var flag: Boolean;
begin

     if (((y < y1 ) or (y > y3 )) and (x > 0)) or (((y > y1 - Radius - 10 ) or (y < y3 )) and ((x > 0) and (x < x1 )) or ((x > x2))) then
      x:= x - 25;
end;

procedure GoUp(var y: Integer);
begin
    if not(((x > x1 ) and (x < x2-10 )) and ((y > y1  ) and (y < y3+Radius ))) and (y > 0) then
        y:= y - 25;
end;

procedure GoDown(var y: Integer);
begin
    if not(((x > x1 ) and (x < x2-10 )) and ((y > y1 - 2*Radius - Radius ) and (y < y3 ))) and (y < 1150) then
        y:= y + 25;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
    Refresh;
    Form1.Canvas.Ellipse(x,y,x+2*Radius,y+2*Radius);
    if getasynckeystate($27)<>0 then
      begin
        GoRight(x);

      end;
    if getasynckeystate($25)<>0 then
      begin
        GoLeft(x);
        //Form1.img1.Repaint;
      end;
    if getasynckeystate($26)<>0 then
      begin
        GoUp(y);
        //Form1.img1.Repaint;
      end;
    if getasynckeystate($28)<>0 then
      begin
        GoDown(y);
        //Form1.img1.Repaint;
      end;
    if getasynckeystate(VK_ESCAPE)<>0 then
      begin
        Application.CreateForm(TForm2, Form2);
        Form2.Visible:=True;
        Form1.Destroy;
      end;
    if (GetAsyncKeyState(VK_RETURN)<>0) and ((x > 1655) and (y > 145)) then
    begin
       Application.CreateForm(TForm3, Form3);
       Form3.visible := True;
       Form1.Destroy;
       //Application.Terminate;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.DoubleBuffered:=True;

    x:= 100;
    y:= 100;
end;

end.
