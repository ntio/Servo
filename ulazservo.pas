unit ulazservo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
   MKnob,  LazSerial, LazSynaSer, LazSerialPort;

type

  { TForm1 }

  TForm1 = class(TForm)
    mkservo: TmKnob;
    LazSerial1: TLazSerial;
    btopen : TButton;
    procedure btopenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
   // procedure LazSerial1rxData(Sender: TObject);

    procedure mkservoChange(Sender: TObject; AValue: Longint);

  private

  public

  end;

var
  Form1: TForm1;


implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.btopenClick(Sender: TObject);
begin

 if btopen.Caption = 'OPEN' then
 begin
    LazSerial1.ShowSetupDialog;
    LazSerial1.Active:=True; // Connect;
    btopen.Caption := 'CLOSE';
 end
  else
  begin
    LazSerial1.Close; //Disconnect;
    btopen.Caption := 'OPEN';
  end;

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  LazSerial1.Close;
  LazSerial1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LazSerial1:=TLazSerial.Create(nil);
  LazSerial1.BaudRate:=br__9600;

 //LazSerial1.OnrxData:=@LazSerial1rxdata;
end;






procedure TForm1.mkservoChange(Sender: TObject; AValue: Longint);
begin
    if LazSerial1.Active then
    LazSerial1.SynSer.SendString(IntToStr(mkservo.Position) + '.');

end;



end.

