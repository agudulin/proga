{  patDFS_kvg.pp                                      }
{  Поиск пути воды на местности, заданной             }
{    матрицей высот от 1 до 99, от клетки (1,1) до    }
{    клетки (n,n); n<=10; Вода течет                  }
{    в соседнюю клетку, если высота в ней             }
{    не больше высоты в данной клетке.                }
{    Алгоритм поиска В ГЛУБИНУ (DFS)!                 }
{                                                     }
{                Кузьменко В.Г., апрель 2010 года.    }

uses crt;

type TIMtr = array [0..11,0..11] of integer;
const dx: array [1..8] of integer = (1,1,0,1,-1,0,-1,-1);
      dy: array [1..8] of integer = (1,0,1,-1,1,-1,0,-1);

var n: integer;
    a,b: TIMtr;

function path(i,x,y: integer): boolean;
  var x1,y1,j,axy: integer;
  begin path:=true; axy:=a[y,x];
    if (x=n) and (y=n) then begin b[n+1,n+1]:=i+1; exit end;
    for j:=1 to 8 do begin
      x1:=x+dx[j]; y1:=y+dy[j];
      if (a[y1,x1] <= axy) and (b[y1,x1] = 0) then begin
        b[y1,x1]:=i+1;
        if path(i+1,x1,y1) then exit
        else b[y1,x1]:=0
      end
    end;
    path:=false
  end {path};

var fa: text;

function get_a:boolean;
  var i,j: integer;
      fn:string;
      ok:boolean;
  begin ok:=false;
    repeat
      window(1,23,79,25);
      gotoXY(1,1);
      write('Введите имя файла с матрицей (Enter -выход!): ');
      readln(fn);
      if length(fn)=0 then break;
      assign(fa,fn);
      {$I-}
      reset(fa);
      {$I+}
      if IOResult <>0 then writeln('Файл ',fn,' не найден! Повторите! ')
      else begin ok:=true;
        readln(fa,n);
        for i:=1 to n do
        for j:=1 to n do read(fa,a[i,j]);
        close(fa)
      end;
    until ok;
    get_a:=ok;
  end;

procedure initPath;
  var i,j: integer;
  begin
    for i:=0 to n+1 do begin
      a[0,i]:=100; a[n+1,i]:=100;
      a[i,0]:=100; a[i,n+1]:=100;
      for j:=0 to n+1 do b[i,j]:=0
    end
  end;

procedure putMtr(a: TIMtr;what:string[4]);
  var i,j: integer;
  begin gotoXY(1,1); TextBackground(Black); TextColor(White);
    write(what);
    for j:=1 to n do write(j:3); writeln;
    write('    ');
    for j:=1 to n do write('---'); writeln;
    for i:=1 to n do begin
      write(i:2,'| ');
      for j:=1 to n do begin
        if (a[i,j]<>0) and (a[i,j]<>100) then
          TextBackground(Green)
        else TextBackground(Black);
        write(a[i,j]:3);
      end;
      TextBackground(Black);
      writeln;
    end;
    //writeln
  end;

procedure PutInvitation;
  begin
    window(36,1,79,9); ClrScr; gotoXY(1,1);
    TextBackground(Blue); TextColor(Yellow);
    writeln('  Поиск пути воды на местности, заданной');
    writeln('  матрицей высот от 1 до 99, от клетки  ');
    writeln('(1,1) до клетки (n,n); n<=10; Вода течет');
    writeln('   в соседнюю клетку, если высота в ней ');
    writeln('   не больше высоты в данной клетке.    ');
    writeln('  Алгоритм поиска В ГЛУБИНУ (DFS)!      ');
    writeln('                                        ');
    writeln('      Кузьменко В.Г., апрель 2010 года. ');
  end;

begin ClrScr;
  PutInvitation;
  while get_a do begin
    initPath;
    b[1,1]:=1; clrScr;
    window(1,1,35,11); clrScr;
    putMtr(a,'м-ца');
    window(1,12,35,25); clrScr;
    if path(1,1,1) then begin  putMtr(b,'way:'); write('Путь найден! ') end
    else write('Путь не найден! ');
    writeln(' Нажмите Enter!');
    readln
  end;
  writeln('Программа закончена! Нажмите Enter!');
  readln
end.

