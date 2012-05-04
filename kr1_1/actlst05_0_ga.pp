{  ����஫쭠� ࠡ�� 1.                       ��㫨� �.�.   }
{  �⥭�� �� 䠩�� ��ப �� ᫮�, ࠧ�������� �஡����� �       }
{    ����஥��� �� ��� ᫮� �吝��� ᯨ᪠ ��� ᫮�          }
{    � ⮩ ��᫥����⥫쭮��, � ���ன ��� ᫥���� � 䠩��.   }
{    ��楤�ன putlist �� ᫮�� �뢮����� �� �࠭ � �।襤- }
{    ����騬 ����஬ ᫮�� � �⮬ ᯨ᪥.                      }

uses sysutils;

type TStr = string[30];

type TPItemList=^TItemList;
     TInf=string;
     TItemList= record
       inf: TInf;
       nxt:  TPItemList
     end;
     TList=TPItemList;
type TSArr = array[0..100] of string;

{-----------------------------------------------}
{ �������� ᫮�� w � ����� ᯨ᪠ list }
procedure addWord2EndLst(w:string; var list: TList);
  var p: ^TList;
  begin p:=@list;
    while p^<>nil do p:=@p^^.nxt;
    new(p^); p^^.inf:=w; p^^.nxt:=nil;
  end;

{-----------------------------------------------}
{ �������� � ᯨ᮪ list ��᫥����⥫쭮��� ᫮� �� ��ப� s }
procedure addStr2Lst(s:string; var list: TList);
  var i,ls: integer;
      s1  : string;
      c   : char;
      flag: boolean;
  begin ls:=length(s); s1:=''; flag:=false;
    for i:=1 to ls do begin c:=s[i];
      if c<>' ' then begin flag:=true; s1:=s1+c end
      else
      if flag then begin
        addWord2EndLst(s1,list); s1:=''; flag:=false
      end
    end;
    if flag then addWord2EndLst(s1,list);
    addWord2EndLst('#', list);
  end {addStr2Lst};

{-----------------------------------------------}
{ ����ந�� ᯨ᮪ list �� ��ப 䠩�� FileName }
function getListFromFile(var list: TList; FileName: TStr):boolean;
  var flist: text;
      s    : string;
  begin list:=nil; getListFromFile:=false;
   assign(flist,FileName);
   {$I-} reset(flist); {$I+}
    if IOResult <> 0 then
      writeln('   ���� ',FileName, ' �� ������ !!!')
    else begin getListFromFile:=true;
      while not eof(flist) do begin
        readln(flist,s);
        addStr2Lst(s,list)
      end;
      close(flist)
    end
  end {getListFromFile};

{-----------------------------------------------}
{ �뢥�� ᯨ᮪ �� �࠭ � �㬥�樥� ᫮� }
procedure putlist(list: TList);
  var p: TList; i,j: word; was_diez: boolean;
  begin
    p := list;
    i := 0;
    j := 1;
    write(j, ') ');
    while p <> nil do begin
        inc(i);
        if p^.inf = '#' then begin
          inc(j);
          writeln(i:5, '. ', p^.inf:8);
          if p^.nxt <> nil then write(j, ') ');
        end
        else write(i:5, '. ', p^.inf:8);
        p := p^.nxt;
    end;
    writeln;
  end;

procedure ActList_ga(n: integer; words: TSArr; j:integer);
  begin
    writeln;
    writeln;
    writeln('� ��� ��� ���� ����� ����� ��楤���, �� � �� �ᯥ�');
    writeln;
    writeln;
  end;

{-----------------------------------------------}
{ ����� �.�. �������਩ � 䠬�����, ��⮩;     }
{    nn � ����� -��� ���䨪�                    }
procedure PutRes_nn;
  begin {�� �����誠, �� ���� ���ன �� ������
         ���⠢��� ॠ���������� ���� ��楤���
         �뢮�� ᯨ᪠ � ���� ⥪�� !
         (�. �������਩ � kr1_1.docx!)
        }
  end;


procedure dialog_ga;
  var s,num,word: string; i,j,n:integer; words: TSArr;
  begin
    writeln('** ��㫨� �.�.  20.04.2012');
    writeln('** ����� �������: 5');
    writeln('**   ��⠢��� ��᫥����⥫쭮��� 㪠������ ᫮�');
    writeln('**   ��᫥ i-���');

    while true do begin
        writeln;
        writeln('������ ��ப� [!i word1 word2 word3] (����-�����): ');
        readln(s);
        if length(s) = 0 then break;
        if s[1] <> '!' then begin
          writeln('>> ��ப� ������ ��稭����� � !');
          continue;
        end;
        num := '';
        for i:=2 to length(s) do begin
            if s[i] = ' ' then break;
            num := num + s[i];
        end;
        if num = '' then begin
            writeln('>> �� �� ����� ����� ᫮��');
            continue;
        end;
        n := strToInt(num);
        word := '';
        j := 0;
        s := s + ' ';

        for i:=i+1 to length(s) do begin
            if s[i] = ' ' then begin
                if word <> '' then begin
                  words[j] := word;
                  inc(j);
                  word := '';
                end;
            end;
            word := word + s[i];
        end;
        {for i:=0 to j do begin
            write(words[i], ' ');
            writeln;
        end;}
        ActList_ga(n, words, j);
    end;
  end;

{===============================================}
var l: TList;
    s: TStr;

begin
  l:=nil;
  writeln; writeln;
  writeln('*** ����஫쭠� ࠡ�� N 1: ��ࠡ�⪠ ᯨ᪠ ᫮�    ***');
  writeln('***   ᮣ��᭮ �������: ???????????????????????      ***');
  writeln('*** ���᮪ ����஥� �� ᫮� ⥪�� 䠩�� �� ⥪�饣� ***');
  writeln('***  ��⠫���. ��� 䠩�� �������� ���짮��⥫��.     ***');
  writeln('***                                                  ***');
  writeln('*** ��室 �� �ணࠬ��: ���� ���⮣� ����� 䠩��.    ***');
  writeln('***              ��㫨� �.�.  20.04.2012            ***');
  writeln;
  while true do begin writeln;
    write('������ ��� 䠩�� (����� ��ப� -�����): ');
    readln(s);
    if length(s) = 0 then break;
    if getListFromFile(l, s) then begin
      writeln;
      writeln('����稫� ᯨ᮪:');
      putlist(l);
      dialog_ga;
      PutRes_nn
    end
  end
end.
