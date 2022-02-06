﻿program pc_boot;

uses crt;

var y,cpu_mhz,p_y,p_m,p_d,n_b:integer;
    cpu_name,key_2_n:string;
    key_2:string[2];

procedure mem_test;
var j,n_max,n_tick,n,m:integer;
begin
  delay(300);
  randomize;
  n_max:=(random(1600)+512)*256;
  n_tick:=n_max div 128;
  m:=random(120)*16;
  write('  Memory Test : ',n,'K OK+  ',m,'K shared memory');
  delay(600);
  for j:=0 to 128 do begin
    clearline;
    write('  Memory Test : ',n,'K OK+  ',m,'K shared memory');
    n:=n+n_tick;
    delay(6);
  end;
end;

procedure detect_sec_slave;
var j,m:integer;
    key:string[2];
    key_n:string;
begin
  write('  Detecting Secondary Slave ... [Press ');
  textcolor(15);
  write('F4');
  textcolor(7);
  write(' to skip]');
  repeat
    j:=j+1;
    delay(50);
    if keypressed=true then begin
      key:=readkey;
      key:=key+readkey;
      str(ord(key[2]),key_n);
    end;
    if keypressed=true then write(key);
    if key_n='115' then m:=1;
    if key_n='115' then j:=220;
  until j=220;
  clearline;
  write('  Detecting Secondary Slave ... ');
  if m=1 then writeln('Skiped')
  else writeln('None');
end;

procedure bsod;
var r,n:integer;
    key:string[2];
    key_n:string;
begin
  textbackground(1);
  r:=random(4);
  if r=0 then textbackground(4);
  clrscr;
  writeln;
  textcolor(15);
  writeln('  A problem has been detected and Windows has been shut dowsn to prevent damage to your coputer.');
  writeln;
  writeln('  The problem seems to be cuased by the following file: SPCMDCON.SYS');
  writeln;
  writeln('  PAGE_FAULT_IN_NONPAGED_AREA');
  writeln;
  writeln('  If this is the first time you ve seen this stop error screen, restart your computer. If this screen appears again,    follow these steps:');
  writeln;
  writeln('  Check to make sure any new hardware or software is properly installed. If this is a new installation, ask your        hardware or software manufacturer for any windows updates you might need.');
  writeln;
  writeln('  If problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such    as caching or shadowing. If you need to use Safe mode to remove or disable components, restart your computer, press   F8 to select Advanced Startup options, and then select safe Mode.');
  writeln;
  writeln;
  writeln;
  writeln('  Technical information:');
  writeln;
  writeln('  *** STOP 0x00000050 (0xFD3094C2,0x00000001, 0x0FBFE7617, 0x00000000)');
  writeln;
  writeln;
  writeln('  ***  SPCMDCON.SYS - Address FBFE 7617 base at FBFE5000, DateStamp 3d6dd67c');
  system.console.beep(120,70);
  system.console.beep(240,70);
  system.console.beep(920,80);
  system.console.beep(240,70);
  delay(30);
  system.console.beep(120,70);
  system.console.beep(240,70);
  system.console.beep(920,4220);
  n:=16;
  repeat;
    gotoxy(1,39);
    n:=n-1;
    clearline;
    writeln('  Press F1 to EXIT from this programm, Press Double F to RESPECT (Automatic EXIT after ',n,' seconds)');
    if keypressed=true then begin
      key:=readkey;
      key:=key+readkey;
      str(ord(key[2]),key_n);
    end;
    if key_n='112' then n:=0;
    if key_n='102' then gotoxy(1,27);;
    if key_n='102' then writeln(' (∙_∙)> ');
    delay(1000);
  until n=0;
  system.console.beep(2100,360);
  y:=0; 
end;

procedure windows;
var e,r:integer;
    key:string[2];
    key_n:string;
begin
  delay(600);
  clrscr;
  gotoxy(1,40);
  write('   (C) Корпорация Майкрософт                                                                             MICROSOFT');
  gotoxy(1,14);
  textcolor(12);
  write('                                                       ▄█████▄');
  textcolor(10);
  writeln(' ▄     ▄');
  textcolor(12);
  write('                                                      ▐██████▌');
  textcolor(10);
  writeln('▐██████▌');
  textcolor(12);
  write('                                                      ▐██████▌');
  textcolor(10);
  writeln('▐██████▌');
  textcolor(12);
  write('                                                      █▀▀▀▀▀█');
  textcolor(10);
  writeln(' ███████');
  textcolor(9);
  write('                                                      ▄█████▄');
  textcolor(14);
  write(' ▄');
  textcolor(10);
  write(' ▀▀▀ ');
  textcolor(14);
  writeln('▄');
  textcolor(9);
  write('                                                     ▐██████▌');
  textcolor(14);
  writeln('▐██████▌');
  textcolor(9);
  write('                                                     ▐██████▌');
  textcolor(14);
  writeln('▐██████▌');
  textcolor(7);
  write('                                        Microsoft(R) ');
  textcolor(9);
  write('█▀▀▀▀▀█');
  textcolor(14);
  write(' ███████');
  textcolor(8);
  writeln(' TM');
  textcolor(15);
  write('                                       \      /.    |         _');
  textcolor(14);
  write('▀▀▀');
  textcolor(12);
  writeln('\/[]');
  textcolor(15);
  write('                                        \    / |┌┐┌-┤/\\    /(   ');
  textcolor(12);
  writeln(' /\|');
  textcolor(15);
  writeln('                                         \/\/  |||└-┤\/ \/\/ _)');
  textcolor(7);
  writeln('                                           PROFESSIONAL');
  writeln;
  writeln;
  delay(300);
  textcolor(8);
  writeln;
  writeln('                                              ┌----------------------┐');
  writeln;
  writeln('                                              └----------------------┘');
  r:=random(500)+150;
  for e:=0 to r do begin
    gotoxy(1,30);
    clearline;
    write('                                              |');
    textcolor(9);
    if e mod 57=0 then write('                      ');
    if e mod 57=1 then write('▌                     ');
    if e mod 57=2 then write('█                     ');
    if e mod 57=3 then write('▐▌                    ');
    if e mod 57=4 then write(' █                    ');
    if e mod 57=5 then write('▌▐▌                   ');
    if e mod 57=6 then write('█ █                   ');
    if e mod 57=7 then write('▐▌▐▌                  ');
    if e mod 57=8 then write(' █ █                  ');
    if e mod 57=9 then write('▌▐▌▐▌                 ');
    if e mod 57=10 then write('█ █ █                 ');
    if e mod 57=11 then write('▐▌▐▌▐▌                ');
    if e mod 57=12 then write(' █ █ █                ');
    if e mod 57=13 then write(' ▐▌▐▌▐▌               ');
    if e mod 57=14 then write('  █ █ █               ');
    if e mod 57=15 then write('  ▐▌▐▌▐▌              ');
    if e mod 57=16 then write('   █ █ █              ');
    if e mod 57=17 then write('   ▐▌▐▌▐▌             ');
    if e mod 57=18 then write('    █ █ █             ');
    if e mod 57=19 then write('    ▐▌▐▌▐▌            ');
    if e mod 57=20 then write('     █ █ █            ');
    if e mod 57=21 then write('     ▐▌▐▌▐▌           ');
    if e mod 57=22 then write('      █ █ █           ');
    if e mod 57=23 then write('      ▐▌▐▌▐▌          ');
    if e mod 57=24 then write('       █ █ █          ');
    if e mod 57=25 then write('       ▐▌▐▌▐▌         ');
    if e mod 57=26 then write('        █ █ █         ');
    if e mod 57=27 then write('        ▐▌▐▌▐▌        ');
    if e mod 57=28 then write('         █ █ █        ');
    if e mod 57=29 then write('         ▐▌▐▌▐▌       ');
    if e mod 57=30 then write('          █ █ █       ');
    if e mod 57=31 then write('          ▐▌▐▌▐▌      ');
    if e mod 57=32 then write('           █ █ █      ');
    if e mod 57=33 then write('           ▐▌▐▌▐▌     ');
    if e mod 57=34 then write('            █ █ █     ');
    if e mod 57=35 then write('            ▐▌▐▌▐▌    ');
    if e mod 57=36 then write('             █ █ █    ');
    if e mod 57=37 then write('             ▐▌▐▌▐▌   ');
    if e mod 57=38 then write('              █ █ █   ');
    if e mod 57=39 then write('              ▐▌▐▌▐▌  ');
    if e mod 57=40 then write('               █ █ █  ');
    if e mod 57=41 then write('               ▐▌▐▌▐▌ ');
    if e mod 57=42 then write('                █ █ █ ');
    if e mod 57=43 then write('                ▐▌▐▌▐▌');
    if e mod 57=44 then write('                 █ █ █');
    if e mod 57=45 then write('                 ▐▌▐▌▐');
    if e mod 57=46 then write('                  █ █ ');
    if e mod 57=47 then write('                  ▐▌▐▌');
    if e mod 57=48 then write('                   █ █');
    if e mod 57=49 then write('                   ▐▌▐');
    if e mod 57=50 then write('                    █ ');
    if e mod 57=51 then write('                    ▐▌');
    if e mod 57=52 then write('                     █');
    if e mod 57=53 then write('                     ▐');
    if e mod 57=54 then write('                      ');
    if e mod 57=55 then write('                      ');
    if e mod 57=56 then write('                      ');
    textcolor(8);
    write('|');
    delay(30);
  end;
  delay(700);
  clrscr;
  delay(1200);
  textbackground(9);
  clrscr;
  gotoxy(1,1);
  textbackground(1);
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  textcolor(15);
  write('▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄');
  gotoxy(1,35);
  write('▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                      ');
  write('                                                                                                                     '); 
  delay(2000);
  gotoxy(52,21);
  textbackground(9);
  write('Приветствие');
  textbackground(0);
  r:=random(6000)+1000;
  delay(r);
  system.console.beep(120,70);
  system.console.beep(240,70);
  system.console.beep(920,80);
  system.console.beep(240,70);
  delay(30);
  bsod;
end;

procedure screen_2;
var e,r:integer;
begin
 writeln;
 r:=random(20)+3;
 repeat
    clearline; 
    e:=e+1;
    write('  Booting Windows XP');
    if e mod 4 = 0 then write(' |');
    if e mod 4 = 1 then write(' /');
    if e mod 4 = 2 then write(' -');
    if e mod 4 = 3 then write(' \');
    delay(180);       
  until e=r;
  windows;
end;

begin
  delay(2000);
  system.console.beep(2500,360);
  gotoxy(1,39);
  textcolor(7);
  write('  Press ');
  textcolor(15);
  write('F1');
  textcolor(7);
  write(' to continue, ');
  textcolor(15);
  write('DEL');
  textcolor(7);
  writeln(' to enter SETUP');
  randomize;
  y:=random(7)+1990;
  p_y:=y+random(20);
  p_m:=random(12)+1;
  p_d:=random(29);
    if p_d>9 then write('  ',p_d,'/')
    else write('  0',p_d,'/');
    if p_m>9 then write(p_m,'/',p_y)
    else write('0',p_m,'/',p_y);
  n_b:=1000+random(9000);
  write('-',n_b,'-686A-6A4LMTA9C-4A');
  gotoxy(1,1);
  writeln;
  textcolor(9);
  write('    (█)');
  textcolor(7);
  write(' Award Medallion BIOS v0.3, An Energy Star Ally');
  textcolor(14);
  writeln('                                           __┌-------┐__');
  textcolor(9);
  write('   ■█▀▌');
  textcolor(7);
  randomize;
  write(' Copyright (C) 1984-',y,', Award Software, Inc.');
  textcolor(14);
  writeln('                                        _┌-┘             └-┐_');
  writeln('                                                                                           ┌┘┌-┐┌┐[]┌~~[]\/ __/\__└┐');
  textcolor(7);
  write('  ANUS CISI-M ACPI BIOS Reision 1007');
  textcolor(14);
  writeln('                                                       └-┼-┘||└-┘ --┘/  \    /');
  writeln('                                                                                             └--┘           /_/\_\');
  textcolor(7);
  cpu_mhz:=random(325)*8+1000;
  y:=random(7);
    if y=0 then cpu_name:='Core(TM) i3 ';
    if y=1 then cpu_name:='Core(TM) i5 ';
    if y=2 then cpu_name:='Core(TM) i7 ';
    if y=3 then cpu_name:='Celeron(TM) ';
    if y=4 then cpu_name:='Pentium(TM) 1 ';
    if y=5 then cpu_name:='Pentium(TM) 2 ';
    if y=6 then cpu_name:='Pentium(TM) 3 ';
  write('  Intel(R) ',cpu_name,cpu_mhz,' MHz Processor');
  textcolor(10);
  if y<4 then write('  ');
  writeln('                                               __________________________');
  textcolor(7);
  write('  RDRAM Clock : 440 MHz');
  textcolor(10);
  writeln('                                                                   EPA  POLLUTION  PREVENTIER');
  textcolor(7);
  system.console.beep(2500,360);
  system.console.beep(2500,960);
  mem_test;
  writeln;
  writeln;
  delay(300);
  writeln('  Award Plug and Play BIOS Extension v1.0A');
  delay(600);
  writeln('  Initilize Plug and Play Cards...');
  writeln('  PNP Init Completed');
  delay(2800);
  writeln;
  writeln('  Trend ChipAwayVirus(R) On Guand');
  writeln;
  delay(200);
  y:=random(5);
    if y=0 then writeln('  Detecting Primary Master  ... QUANTUM FIREBALLlct20 20')
    else if y=1 then writeln('  Detecting Primary Master  ... IBM-DTLA-307015 TX20A50C')
    else writeln('  Detecting Primary Master  ... None');
  delay(200);
  writeln('  Detecting Primary Slave   ... None');
  delay(200);
  writeln('  Detecting Secondary Master... None');
  delay(200);
  detect_sec_slave;
  system.console.beep(2100,360);
  writeln;
  writeln('  Floppy disk(s) fail (40)');
  y:=random(40);
  repeat
    if keypressed=true then begin
      key_2:=readkey;
      key_2:=key_2+readkey;
      str(ord(key_2[2]),key_2_n);
    end;
    if key_2_n='46' then y:=0;
    if key_2_n='112' then screen_2;
  until y=0;
  clrscr;
end.
