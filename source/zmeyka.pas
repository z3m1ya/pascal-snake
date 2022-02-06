uses crt;

var
 md:array[1..16,1..32] of char;
 m:array[1..32,1..32] of integer;
 zmeyax,zmeyay:array [1..16] of integer;
 shir,score,i,j,pas,sp,nx,ny,lim,ex,ey:integer; 
 nap,t:byte; death:boolean; key:char;
 
function chn(x:integer; y:integer):boolean;
var
 r:boolean; i:integer;
begin
  r:=true;
  for i:=1 to shir do
  begin 
   if (x=zmeyax[i]) and (y=zmeyay[i]) then
      r:=false;
  end;
  if r then begin if (x<=1) or (y<=1) or (x>=32) or (y>=32) then r:=false; end;
  chn:=r;
end;

procedure render; var ri,rj:byte;
begin
  if t<>0 then begin textcolor(random(15)+1) end;
  gotoxy(2,2);
  write(score,'   ',shir,'   ',zmeyax[1],'/',zmeyay[1],'     ',zmeyax[shir],'/',zmeyay[shir]);
  for ri:=1 to 16 do begin
    for rj:=1 to 32 do begin
      if (m[ri*2-1,rj]=0) and (m[ri*2,rj]=0) and (md[ri,rj]<>' ') then begin md[ri,rj]:=' '; gotoxy(rj+1,ri+2); write(' '); end;
      if (m[ri*2-1,rj]>0) and (m[ri*2,rj]=0) then if md[ri,rj]<>'▀' then begin md[ri,rj]:='▀'; gotoxy(rj+1,ri+2); write('▀'); end;
      if (m[ri*2-1,rj]=0) and (m[ri*2,rj]>0) then if md[ri,rj]<>'▄' then begin md[ri,rj]:='▄'; gotoxy(rj+1,ri+2); write('▄'); end;
      if (m[ri*2-1,rj]>0) and (m[ri*2,rj]>0) then if md[ri,rj]<>'█' then begin md[ri,rj]:='█'; gotoxy(rj+1,ri+2); write('█'); end;
      if (m[ri*2-1,rj]=-1) and (m[ri*2,rj]=0) then if md[ri,rj]<>'1' then begin md[ri,rj]:='1'; gotoxy(rj+1,ri+2); begin textcolor(12); write('▀'); textcolor(0); end; end;
      if (m[ri*2-1,rj]=0) and (m[ri*2,rj]=-1) then if md[ri,rj]<>'2' then begin md[ri,rj]:='2'; gotoxy(rj+1,ri+2); begin textcolor(12); write('▄'); textcolor(0); end; end;
      if (m[ri*2-1,rj]=-1) and (m[ri*2,rj]>0) then if md[ri,rj]<>'3' then begin md[ri,rj]:='3'; gotoxy(rj+1,ri+2); begin textcolor(12); textbackground(0); write('▀'); textcolor(0); textbackground(15) end; end;
      if (m[ri*2-1,rj]>0) and (m[ri*2,rj]=-1) then if md[ri,rj]<>'4' then begin md[ri,rj]:='4'; gotoxy(rj+1,ri+2); begin textcolor(12); textbackground(0); write('▄'); textcolor(0); textbackground(15) end; end;
    end;
  end;
  gotoxy(129,2);
end;

procedure ms(x,y:integer);
var
  i:integer;
begin
  for i:=1 to shir do
  begin
    zmeyax[i]:=zmeyax[i+1];
    zmeyay[i]:=zmeyay[i+1];
  end;
 zmeyax[shir]:=x;
 zmeyay[shir]:=y;
 if (x=ex) and (y=ey) then
 begin
  shir:=shir+4;
  zmeyax[shir-3]:=x;
  zmeyay[shir-3]:=y;
  zmeyax[shir-2]:=x;
  zmeyay[shir-2]:=y;
  zmeyax[shir-1]:=x;
  zmeyay[shir-1]:=y;
  zmeyax[shir]:=x;
  zmeyay[shir]:=y;
  ex:=random(32)+2;
  ey:=random(32)+2;
while (not chn(ex,ey)) do
  begin
    ex:=random(32)+2;
    ey:=random(32)+2;
  end;
 end;
end;
 
begin
  sp:=1;
  lim:=16;
  death:=false;
  shir:=8;
  zmeyax[1]:=random(16)+20;zmeyay[1]:=random(16)+3;
  zmeyax[2]:=zmeyax[1]+1;zmeyay[2]:=zmeyay[1];
  zmeyax[3]:=zmeyax[1]+2;zmeyay[3]:=zmeyay[1];
  zmeyax[4]:=zmeyax[1]+3;zmeyay[4]:=zmeyay[1];
  zmeyax[5]:=zmeyax[1]+4;zmeyay[5]:=zmeyay[1];
  zmeyax[6]:=zmeyax[1]+5;zmeyay[6]:=zmeyay[1];
  zmeyax[7]:=zmeyax[1]+6;zmeyay[7]:=zmeyay[1];
  zmeyax[8]:=zmeyax[1]+7;zmeyay[8]:=zmeyay[1];
 // zmeyax[9]:=zmeyax[1]+8;zmeyay[9]:=zmeyay[1];
 // zmeyax[10]:=zmeyax[1]+9;zmeyay[10]:=zmeyay[1];
 // zmeyax[11]:=zmeyax[1]+10;zmeyay[11]:=zmeyay[1];
 // zmeyax[12]:=zmeyax[1]+11;zmeyay[12]:=zmeyay[1];
  for i:=1 to 32 do begin
    m[i,1]:=1;
    m[i,32]:=1;
    m[32,i]:=1;
    m[1,i]:=1;
  end;
  nap:=1;
  randomize;
  ex:=random(32)+2;
  ey:=random(32)+2;
  while (not chn(ex,ey)) do
  begin
    ex:=random(32)+2;
    ey:=random(32)+2;
  end;
  textcolor(0);
  textbackground(15);
  clrscr;
  writeln('3...');
  delay(500);
  clrscr;
  writeln('2...');
  delay(500);
  clrscr;
  writeln('1');
  delay(1000);
  gotoxy(1,1); writeln(' ');
  if t<>4 then while(shir < lim) do begin
    textcolor(0);
    textbackground(15);
    if keypressed then
    begin
      key:=readkey;
      case key of
        'w','W','ц','Ц': nap:=3;
        's','S','ы','Ы': nap:=4;
        'a','A','Ф','ф': nap:=2;
        'd','D','в','В': nap:=1;
        'r': begin for i:=1 to 31 do for j:=1 to 31 do m[i,j]:=-1;  end;
        'e': begin for i:=1 to 16 do for j:=1 to 32 do begin  m[i,j]:=1; md[i,j]:='z'; end;  end;
        'R': begin for i:=1 to 31 do for j:=1 to 31 do m[i,j]:=0;  end;
        'E': clrscr;
                      't': begin if t=0 then t:=2 else t:=0 end;
                      'T': begin if t=0 then t:=4 else t:=0 end;
        ' ': if sp=10 then sp:=1 else sp:=10;
        #27: repeat pas:=pas+1; gotoxy(2,2); write(pas); if keypressed then key:=readkey; gotoxy(32,32); delay(6); 
        case key of
        'w','W','ц','Ц': nap:=3;
        's','S','ы','Ы': nap:=4;
        'a','A','Ф','ф': nap:=2;
        'd','D','в','В': nap:=1;
        end;
        until key<>#27;
     end;
   end;
   case nap of
    1: begin nx:=zmeyax[shir]+1; ny:=zmeyay[shir]; end;
    2: begin nx:=zmeyax[shir]-1; ny:=zmeyay[shir]; end; 
    3: begin nx:=zmeyax[shir]; ny:=zmeyay[shir]-1; end;
    4: begin nx:=zmeyax[shir]; ny:=zmeyay[shir]+1; end; 
   end;
   if (not chn(nx,ny)) then
   begin
    death := true; break;
   end;
   ms(nx, ny);
   m[ey,ex]:=-1;
   for i:=1 to shir-1 do
    begin
      m[zmeyay[i],zmeyax[i]]:=1;
    end; 
   m[zmeyay[shir],zmeyax[shir]]:=2;
   render;
  for i:=1 to shir-1 do
    begin
      m[zmeyay[i],zmeyax[i]]:=0;
    end; 
  m[zmeyay[shir],zmeyax[shir]]:=0;
  //delay(60-shir * 4);
  if t=4 then begin
    key:=readkey;
    case key of
        'w','W','ц','Ц': nap:=3;
        's','S','ы','Ы': nap:=4;
        'a','A','Ф','ф': nap:=2;
        'd','D','в','В': nap:=1;
        'r': begin for i:=1 to 31 do for j:=1 to 31 do m[i,j]:=-1;  end;
        'e': begin for i:=1 to 16 do for j:=1 to 32 do begin  m[i,j]:=1; md[i,j]:='z'; end;  end;
        'R': begin for i:=1 to 31 do for j:=1 to 31 do m[i,j]:=0;  end;
        'E': clrscr;
                      't': begin if t=0 then t:=2 else t:=0 end;
                      
        ' ': if sp=10 then sp:=1 else sp:=10;
        #27: repeat pas:=pas+1; gotoxy(2,2); write(pas); if keypressed then key:=readkey; gotoxy(32,32); delay(6); 
        case key of
        'w','W','ц','Ц': nap:=3;
        's','S','ы','Ы': nap:=4;
        'a','A','Ф','ф': nap:=2;
        'd','D','в','В': nap:=1;
        end;
        until key<>#27;
     end;
  end
  else delay((65-shir) div sp);
 end;
 gotoxy(2,2);
 if (death) then
  write('Ты проиграл ',score,'  ',shir)
 else
  write('Ты выиграл ',score,'  ',shir);
end.