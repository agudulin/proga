{  pathBFS_kvg.pp                                     }
{  ���� ��� ���� �� ���⭮��, ��������             }
{    ����楩 ���� �� 1 �� 99, �� ���⪨ (1,1) ��    }
{    ���⪨ (n,n); n<=10; ���� ���                  }
{    � �ᥤ��� �����, �᫨ ���� � ���             }
{    �� ����� ����� � ������ ���⪥.                }
{    ������ ���᪠ � ������ (BFS)!                  }
{                                                     }
{            ��쬥��� �.�., ��५� 2010 ����.        }


uses crt;

type TIMtr = array [0..11,0..11] of integer;
const dx: array [1..8] of integer = (1,1,0,1,-1,0,-1,-1);
      dy: array [1..8] of integer = (1,0,1,-1,1,-1,0,-1);

const nmax_queue=50;
            EOQ =101;
type TIQueueArr = array [1..nmax_queue] of integer;
     TIQueue    = record
                    q:TIQueueArr; {���ᨢ ����⮢ ��।�}
                    n:byte; {������⢮ ����⮢ � ��।�}
                    i:byte; {������ ����� ��। ��砫�� ��।�}
                    j:byte; {������ ����樨 ��� ᫥���饣� �-� � ��।�}
                  end;
   {��।� ����: i+1 = j;  ��९������� ��।�: i = j}

procedure InitIQueue(var a:TIQueue);
  var i:integer;
  begin a.i:=0; a.j:=1; a.n:=0;
    for i:=1 to nmax_queue do a.q[i]:=0;
  end;

procedure PutErr(s:string);
  begin
    writeln;
    writeln('!!! �訡��:',s);
    writeln
  end;

function push(var a:TIQueue;x:integer):boolean;
  begin push:=true;
    with a do begin
      if n<nmax_queue then begin
        q[j]:=x; inc(j); inc(n);
        if j>nmax_queue then j:=1
      end
      else begin
         PutErr('��९������� ��।�'); push:=false
      end
    end
  end;

function pop(var a:TIQueue):integer;
  begin
    with a do
      if n=0 then pop:=EOQ
      else begin
        inc(i);
        if i>nmax_queue then i:=1;
        pop:=q[i]; q[i]:=0;
        dec(n);
      end
  end;

var n: integer;
    a,b: TIMtr;
    que: TIQueue;

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
  end;

function pathBFS(x,y: integer): boolean;
  var x1,y1,i,j,axy: integer;
      ok:boolean;
  const newLevel=100;
  begin pathBFS:=true; i:=2; InitIQueue(que);
    ok:=false; pathBFS:=false; push(que,newLevel);
    while not ok do begin
      axy:=a[y,x];
      if (x=n) and (y=n) then pathBFS:=true;
      for j:=1 to 8 do begin
        x1:=x+dx[j]; y1:=y+dy[j];
        if (a[y1,x1] <= axy) and (b[y1,x1] = 0) then begin
          b[y1,x1]:=i;
          push(que,x1); push(que,y1);
        end
      end;
      x:=pop(que);
      if x=newLevel then begin
        putMtr(b,'����');
        push(que,newlevel);
        delay(1000);
        inc(i); x:=pop(que)
      end;
      y:=pop(que);
      ok:=y=EOQ
    end
  end {pathBFS};

var fa: text;

function get_a:boolean;
  var i,j: integer;
      fn:string;
      ok:boolean;
  begin ok:=false; //ClrScr;
    repeat
      window(1,23,79,25);
      gotoXY(1,1);
      write('������ ��� 䠩�� � ����楩 (Enter -��室!): ');
      readln(fn);
      if length(fn)=0 then break;
      assign(fa,fn);
      {$I-}
      reset(fa);
      {$I+}
      if IOResult <>0 then writeln('���� ',fn,' �� ������! ������! ')
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

procedure PutInvitation;
  begin
    window(36,1,79,9); ClrScr; gotoXY(1,1);
    TextBackground(Blue); TextColor(Yellow);
    writeln('  ���� ��� ���� �� ���⭮��, ��������');
    writeln('  ����楩 ���� �� 1 �� 99, �� ���⪨  ');
    writeln('(1,1) �� ���⪨ (n,n); n<=10; ���� ���');
    writeln('  � �ᥤ��� �����, �᫨ ���� � ���  ');
    writeln('  �� ����� ����� � ������ ���⪥.     ');
    writeln('  ������ ���᪠ � ������ (BFS)!       ');
    writeln('                                        ');
    writeln('      ��쬥��� �.�., ��५� 2010 ����. ');
  end;


begin
  PutInvitation;
  while get_a do begin
    initPath;
    b[1,1]:=1; clrScr;
    window(1,1,35,11); clrScr;
    putMtr(a,'�-�');
    window(1,12,35,25); clrScr;
    if pathBFS(1,1) then begin  putMtr(b,'way:'); write('���� ������! ') end
    else write('���� �� ������! ');
    writeln(' ������ Enter!');
    readln
  end;
  writeln('�ணࠬ�� �����祭�! ������ Enter!');
  readln
end.

