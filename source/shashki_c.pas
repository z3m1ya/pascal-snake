program shashki;
uses crt;
var
  e:string;
  b,c,i,t,m,h:integer;
  n:array[0..7] of integer;
begin
  e:='Возможно';
  write('Чилсо цветов(не больше 7): ');
  read(c);
  repeat
    t:=0;
    for i:=1 to c do begin
      textcolor(i+8);
      write('Число шашек цвета ',i,': ');
      readln(n[i]);
    end;
    textcolor(7);
    for i:=1 to 7 do t:=t+n[i];
    if t>80 then writeln('Слишком много шашек(не больше 80), попробуйте ещё раз:')
  until t<81;
  for i:=1 to 7 do if (t-n[i])-n[i]+1<0 then e:='Невозможно';
  writeln('Ответ: ',e);
  if e='Возможно' then begin
    write('Например:');
    repeat
      for i:=1 to 7 do if n[m]<n[i] then m:=i;
      t:=0;
      if n[m]>0 then write('-');
      textcolor(m+8);
      if n[m]>0 then write(m);
      textcolor(7);
      if n[m]>0 then n[m]:=n[m]-1;
      h:=0;
      for i:=1 to 7 do begin
        if (i<>m) and (h=0) and (n[i]>0) then begin
          write('-');
          textcolor(i+8);
          write(i);
          textcolor(7);
          h:=1;
          n[i]:=n[i]-1;
        end;
      end;
      for i:=1 to 7 do t:=t+n[i];
    until t=0;
    writeln('-');
  end;
  writeln('Программа завершена, нажмите любую клавишу...');
  readkey;
end.