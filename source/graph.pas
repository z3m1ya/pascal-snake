program graph;

uses crt;

var a,b,c,c1,d,x,y,yx,yx1,xy1,xy2,de:real; 

procedure render;
begin
  var i1,i2:integer;
  y:=25;
  textcolor(14);
  writeln('                                                                          Y');
  for i1:=1 to 50 do begin
    x:=-26;
    for i2:=1 to 50 do begin
      x:=x+1;
      xy1:=0;
      xy2:=0;
      if (i2 mod 41)=1 then delay(3);
      c1:=c-y;
      yx:=a*x*x+b*x+c;
      yx1:=a*(x+1)*(x+1)+b*(x+1)+c;
      de:=b*b -(4*a*c1);
      if de>0 then xy1:=(-b+sqrt(de))/(2*a);
      if de>0 then xy2:=(-b-sqrt(de))/(2*a);
      if yx=y then textcolor(12) else if (x=0) or (y=0) then textcolor(14) else textcolor(7);
      if ((yx=y) and (yx1=y)) or ((yx>y) and (yx<y+1)) then write('###') else if yx=y then write('## ') else if (yx>y) and (yx<y+1) then write('###') else if ((xy1>x) and (xy1<x+1)) or ((xy2>x) and (xy2<x+1)) then write('  #') else 
      if (x=0) and (y>-10) then write(y:2:0,' ') else if (x=0) and (y<=-10) then write(y:3:0) else
      if (y=0) and (x>-10) then write(x:2:0,' ') else if (y=0) and (x<=-10) then write(x:3:0) else write(' . ');
    end;
    y:=y-1;
    delay(122);
    if y=-1 then write('  X');
    writeln;
  end;
end;

begin
  writeln('y=ax^2+bx+c');
  write('a=');
  readln(a);
  write('b=');
  readln(b);
  write('c=');
  readln(c);
  clrscr;
  writeln('y=',a,'x^2+',b,'x+',c);
  render;
  writeln('Я всё');
  readln;
end.
