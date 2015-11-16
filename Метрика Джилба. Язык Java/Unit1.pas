unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FileName1: Text;
  Texts:array of char;
  OtherOperators:array of string;
  NumberSymbols,NumbersIf,NumberOtherOperators,CountOtherOperators:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
    begin
        Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
        Texts:=[];
        AssignFile(FileName1,OpenDialog1.FileName);
        Reset(FileName1);
        while not(eof(FileName1)) do
        begin
            inc(NumberSymbols);
            SetLength(Texts,NumberSymbols);
            Read(FileName1,Texts[NumberSymbols-1]);
        end;
        CloseFile(FileName1);
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
const
   Els=20;
var
  i,m,j,k,temps,temp,Nesting,MaxNesting,Brackets:integer;
  PresenceElse:integer;
  Comment:integer;
begin
    if not (OpenDialog1.FileName = '') then
    begin
    PresenceElse:=0;
    temps:=0;
    Nesting:=0;
    NumbersIf:=0;
    CountOtherOperators:=0;
    NumberOtherOperators:=0;
    temp:=0;
    Brackets:=0;
    MaxNesting:=0;
    AssignFile(FileName1,'operatory.txt');
    Reset(FileName1);
    Comment:=0;
    while not(eof(FileName1)) do
    begin
        inc(NumberOtherOperators);
        SetLength(OtherOperators,NumberOtherOperators);
        Readln(FileName1,OtherOperators[NumberOtherOperators-1]);
    end;
    CloseFile(FileName1);
    for I := 0 to NumberSymbols-1 do
    begin
       if (Comment=0) and (Texts[i]='/') and (Texts[i+1]='/') then
          Comment:=1;
       if (Comment=1) and (Texts[i]=#$A) then
          Comment:=0;
       if (Comment=0) and (Texts[i]='/') and (Texts[i+1]='*') then
          Comment:=2;
       if (Comment=2) and (Texts[i]='*') and (Texts[i+1]='/') then
          Comment:=0;
       if Comment=0 then
          if (Texts[i]='i') and (Texts[i+1]='f') and (((Texts[i+2]=' ') or (Texts[i+2]='('))) then
          begin
              inc(NumbersIf);
          end;
    end;

    for I := 0 to NumberOtherOperators-1 do
    begin
       for j := 0 to NumberSymbols-6 do
       begin
          temp:=0;
          temps:=0;
          for k := j to length(OtherOperators[i])+j-1 do
          begin
             if (Texts[k]=(OtherOperators[i])[temps+1]) then
                inc(temp);
             inc(temps);
          end;
          if (temp=length(OtherOperators[i])) and (Texts[k]=' ') then
             inc(CountOtherOperators);
       end;
    end;
    label1.Caption:='Сложность программного кода: '+FloatToStr(NumbersIf/CountOtherOperators*100)+'%';

    temp:=0;

    for i:= 0 to NumberSymbols-2 do
    begin
    if (Comment=0) and (Texts[i]='/') and (Texts[i+1]='/') then
       Comment:=1;
    if (Comment=1) and (Texts[i]=#$A) then
       Comment:=0;
    if (Comment=0) and (Texts[i]='/') and (Texts[i+1]='*') then
       Comment:=2;
    if (Comment=2) and (Texts[i]='*') and (Texts[i+1]='/') then
       Comment:=0;
    if Comment=0 then
    begin
       if (temp=2) and ((Texts[i]='i') and (Texts[i+1]='f') and (((Texts[i+2]=' ') or (Texts[i+2]='('))) or ((Texts[i]='e') and (Texts[i+1]='l') and (Texts[i+2]='s') and (Texts[i+3]='e') and (Texts[i+4]=' '))) then
          inc(Nesting);
       if (temp=0) and (Texts[i]='i') and (Texts[i+1]='f') and (((Texts[i+2]=' ') or (Texts[i+2]='('))) then
       begin
          Texts[i]:=' ';
          temp:=1;
       end;
       if (temp=1) and (Texts[i]=#$A) and (Texts[i+1]='{') then
          temp:=2
       else
          if (Texts[i]=#$A) and (temp=1) and not(((Texts[i+1]='i') and (Texts[i+2]='f')) or ((Texts[i+1]='e') and (Texts[i+2]='l') and (Texts[i+3]='s') and (Texts[i+4]='e'))) then
             temp:=0;
       if (temp=2) and (Texts[i+1]='{') then
          inc(Brackets);
       if (temp=2) and (Texts[i]='}') then
          dec(Brackets);
       if (Brackets=0) and (Texts[i+4]='e') and (Texts[i+5]='l') and (Texts[i+6]='s') and (Texts[i+7]='e') then
          temp:=1;
       if (temp=2) and (Brackets=0) then
       begin
          temp:=0;
          MaxNesting:=Nesting;
          Nesting:=0;
       end;
    end;
    label3.Caption:='Максимальная вложенность: '+IntToStr(MaxNesting);
    end;
    end;

end;

end.
