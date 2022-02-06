program snake;

uses crt;

var map:array[0..25,0..25] of byte;
    lastmap:array[1..24,1..24] of byte;
    body:array[0..1,0..49] of byte;
    tail,direction,i,j,k,difficulty,level,eatx,eaty:byte;
    levelname:array[1..8] of string;
    score,time:integer;
    game:boolean;

procedure render;
var x,y:integer;
begin
  gotoxy(4,2); write('Счёт:',score,' Длина:',tail,' Сло-ть:',difficulty,' Карта:',level,' Время:',time);
  for y:=1 to 24 do for x:=1 to 24 do
  begin
    if (map[x,y]=0) and (lastmap[x,y]<>0) then begin gotoxy(x*2+2,y+2); write('  '); lastmap[x,y]:=map[x,y]; end;
    if (map[x,y]=1) and (lastmap[x,y]<>1) then begin gotoxy(x*2+2,y+2); write('██'); lastmap[x,y]:=map[x,y]; end; 
    if (map[x,y]=2) and (lastmap[x,y]<>2) then begin textcolor(4); gotoxy(x*2+2,y+2); write('██'); textcolor(0); lastmap[x,y]:=map[x,y]; end; 
    if (map[x,y]=3) and (lastmap[x,y]<>3) then begin 
      if (direction=1) or (direction=2) then begin gotoxy(x*2+2,y+2); write('█▄'); lastmap[x,y]:=map[x,y]; end;
      if direction=3 then begin gotoxy(x*2+2,y+2); write('▀█'); lastmap[x,y]:=map[x,y]; end;
      if direction=4 then begin gotoxy(x*2+2,y+2); write('▄█'); lastmap[x,y]:=map[x,y]; end;
    end;
  end;
  gotoxy(2,1);
end;

procedure levelgen;
var i,j:byte;
begin
  if level=2 then for i:=1 to 24 do begin map[12,i]:=1; map[13,25-i]:=1; if time=0 then begin render; delay(20); end; end;
  if level=3 then for i:=1 to 24 do begin map[12,i]:=1; map[13,i]:=1; map[i,12]:=1; map[i,13]:=1; if time=0 then begin render; delay(20); end; end;
  if level=4 then for i:=1 to 14 do begin map[5,5+i]:=1; map[19,5+i]:=1; if i<7 then begin map[4+i,5]:=1; map[20-i,5]:=1; end; map[5+i,19]:=1; if time=0 then begin render; delay(20); end; end;
  if level=5 then for i:=1 to 24 do begin map[1,i]:=1; map[24,25-i]:=1; map[i,1]:=1; map[25-i,24]:=1; if time=0 then begin render; delay(20); end; end;
  if level=6 then begin
    for i:=1 to 24 do begin map[i,10]:=1; map[25-i,15]:=1; if time=0 then begin render; delay(20); end; end;
    for i:=1 to 10 do begin map[2,i+6]:=1; map[6,i+7]:=1; map[10,10-i+9]:=1; map[14,i+7]:=1; map[18,10-i+7]:=1; map[22,10-i+8]:=1; if time=0 then begin render; delay(35); end; end;
    map[3,15]:=0; map[16,10]:=0; map[6,13]:=0; map[10,11]:=0; map[18,11]:=0; map[18,11]:=0; map[2,12]:=0; map[22,14]:=0; map[14,13]:=0;
  end;
end;

procedure eatgen;
var seteat:boolean;
    x,y:byte;
begin
  repeat
    x:=random(24)+1; y:=random(24)+1;
    if map[x,y]=0 then begin map[x,y]:=2; seteat:=true; eaty:=y; eatx:=x; end;
  until seteat=true
end;

procedure endcheck;
begin
  if (direction=1) and (map[body[0,1],body[1,1]-1]=1) then game:=false;
  if (direction=2) and (map[body[0,1]+1,body[1,1]]=1) then game:=false;
  if (direction=3) and (map[body[0,0],body[1,1]+1]=1) then game:=false;
  if (direction=4) and (map[body[0,1]-1,body[1,1]]=1) then game:=false;
  if tail=48 then game:=false;
end;

procedure eatcheck;
begin
  if direction=1 then if map[body[0,1],body[1,1]-1]=2 then begin body[0,tail+1]:=body[0,tail]; body[1,tail+1]:=body[1,tail]; tail:=tail+1; score:=score+25*difficulty; eatgen; end;
  if direction=2 then if map[body[0,1]+1,body[1,1]]=2 then begin body[0,tail+1]:=body[0,tail]; body[1,tail+1]:=body[1,tail]; tail:=tail+1; score:=score+25*difficulty; eatgen; end;
  if direction=3 then if map[body[0,0],body[1,1]+1]=2 then begin body[0,tail+1]:=body[0,tail]; body[1,tail+1]:=body[1,tail]; tail:=tail+1; score:=score+25*difficulty; eatgen; end;
  if direction=4 then if map[body[0,1]-1,body[1,1]]=2 then begin body[0,tail+1]:=body[0,tail]; body[1,tail+1]:=body[1,tail]; tail:=tail+1; score:=score+25*difficulty; eatgen; end;
end;

procedure nowallcheck;
var i,j:byte;
begin
  for i:=1 to 48 do begin 
    if body[0,i]=0 then body[0,i]:=24;
    if body[0,i]=25 then body[0,i]:=1;
    if body[1,i]=0 then body[1,i]:=24;
    if body[1,i]=25 then body[1,i]:=1;
  end;
end;

procedure control;
var key:char;
begin
  if keypressed then
  key:=readkey;
    case key of
        'w','W','ц','Ц': if direction<>3 then direction:=1;
        's','S','ы','Ы': if direction<>1 then direction:=3;
        'a','A','Ф','ф': if direction<>2 then direction:=4;
        'd','D','в','В': if direction<>4 then direction:=2;
    end;
end;

procedure move;
var i:integer;
begin
  nowallcheck;
  if time>15 then endcheck; if (time=15) or (time=20) then levelgen;
  eatcheck;
  if direction=1 then begin body[1,0]:=body[1,1]-1; body[0,0]:=body[0,1]; end;
  if direction=2 then begin body[0,0]:=body[0,1]+1; body[1,0]:=body[1,1]; end;
  if direction=3 then begin body[1,0]:=body[1,1]+1; body[0,0]:=body[0,1]; end;
  if direction=4 then begin body[0,0]:=body[0,1]-1; body[1,0]:=body[1,1]; end;
  for i:=tail+1 downto 1 do
  begin
    body[1,i]:=body[1,i-1];
    body[0,i]:=body[0,i-1];
  end;
  map[body[0,1],body[1,1]]:=3;
  map[body[0,2],body[1,2]]:=1;
  map[body[0,tail+1],body[1,tail+1]]:=0;
  map[eatx,eaty]:=2;
end;

procedure loadnames;
begin
  levelname[1]:='без границ';
  levelname[2]:='1/2';
  levelname[3]:='1/4';
  levelname[4]:='коробка';
  levelname[5]:='с границами';
  levelname[6]:='рельсы';
  level:=1;
end;

procedure menu;
var key:char;
begin 
  difficulty:=1;
  while key<>#13 do begin
    gotoxy(2,2); 
    if difficulty>5 then difficulty:=1; if difficulty<1 then difficulty:=5;
    writeln('Выберите сложность: ',difficulty);
    key:=readkey;
    case key of
        'w','W','ц','Ц': difficulty:=difficulty+1;
        's','S','ы','Ы': difficulty:=difficulty-1;
    end;
  end;
  loadnames; key:=' '; 
  while key<>#13 do begin
    gotoxy(2,4);
    if level>6 then level:=1; if level<1 then level:=6;
    writeln('Выберите карту: ',levelname[level],'                        ');
    key:=readkey;
    case key of
        'w','W','ц','Ц': level:=level+1;
        's','S','ы','Ы': level:=level-1;
    end;
  end; clrscr;
end;

begin
  menu; 
  gotoxy(1,1); 
  writeln('▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒'); 
  writeln('▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒');
  for k:=1 to 24 do begin 
    writeln('▒▒▒'); gotoxy(52,k+2); writeln('▒▒▒');
  end;
  writeln('▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒'); 
  writeln('▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒');
  game:=true;
  levelgen;
  direction:=random(4)+1;
  body[0,1]:=random(24)+1; body[1,1]:=random(24)+1;
  eatgen;
  tail:=2;
  render;
  repeat
    time:=time+1;
    if time mod 6-difficulty = 0 then score:=score+1;
    if time<10 then delay(50*(8-difficulty));
    if time<2500 then delay(25*((8-difficulty))-time div 100) else delay(25*((8-difficulty))-2500 div 50);
    control;
    move;
    render;
  until game=false;
  if tail <48 then map[body[0,1],body[1,1]]:=2;
  render;
  gotoxy(4,1);
  if tail>47 then writeln('Вы победили!') else writeln('Вы проиграли!');
  delay(2500); gotoxy(4,27);
end.