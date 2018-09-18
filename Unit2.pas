unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, GdipGraphic, GIFImage, ExtCtrls, MPlayer;

type
  TForm2 = class(TForm)
    img2: TImage;
    btn1: TSpeedButton;
    tmr1: TTimer;
    btn2: TSpeedButton;
    mp1: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var GIF : TGifImage;
begin

   Form2.DoubleBuffered:=True;
   GIF := TGIFImage.Create;
   GIF.LoadFromFile('img/delphi.gif');
   GIF.Animate := True;

   img2.Picture.Assign(GIF);
   //mp1.Open;
    mp1.Play;


end;

procedure TForm2.btn1Click(Sender: TObject);
begin
    Application.CreateForm(TForm1, Form1);
   // mp1.Pause;
    Form2.Destroy;
    Form1.Visible:=True;

end;

procedure TForm2.btn2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
