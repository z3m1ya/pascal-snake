

uses crt;

var a:integer;

begin
  gotoxy(3,3);
  textcolor(7);
  write('▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀');
  textcolor(10);
  repeat
    delay(random(800)+200);
    a:=a+1;
    gotoxy(a+2,3);
    write('▀');
  until a=30
end.