{  SplitLst0_kv.pp                                                    }
{  �ᯮ�짮����� 㪠��⥫� �� 㪠��⥫�.                              }
{                                       12.11.1996 �.  ��쬥��� �.�. }
{                         ������஢���: 24.03.2008 �.               }
{ ����஥��� ���ᨪ�㯮�冷祭���� ᯨ᪠ ᫮� ⥪�� �� 䠩��, ���   }
{   ���ண� �������� ���짮��⥫��. ��� ������� ᫮�� ������뢠���� }
{   ������⢮ ��� �宦����� � ⥪��.                                 }
{   ���� "���⮣�" ����� 䠩�� - ��室 �� �ணࠬ��.                  }
{                                                                     }
{  �������:                                                           }
{    1) �����⥫쭮 ����� �ᯮ��㥬� ����� ��楤��� � �㭪樨 �  }
{         ��।���� �� �����祭��; ��᫥ ������ ��� ��������� ��ப}
{         �����⬠ ���⠢�� � �������ਨ ???????!                  }
{    2) �믮���� ᫥������ ����䨪��� �⮩ �ணࠬ�� ���            }
{       ᮮ⢥�����饩 ᢮�� �ணࠬ�� (�᫨ ����  �믮�����         }
{       ������� Zd16).                                               }
{      (�. ��楤��� SplitList, �।�⠢������ ����� �����誮�):     }
{         �������� ����������� ࠧ������ ᮧ������� ᯨ᪠ ᫮�     }
{         �� ��� ᯨ᪠ ᫮�. � ���� ᯨ᮪ �뤥������ ᫮��, ���- }
{         ���騥�� � �㪢�, ��������� ���짮��⥫��. �� �⮬:        }
{           �) �� ᫮�� �᪫������ �� ��室���� ᯨ᪠ ᫮�;        }
{           �) ������� ���� ������ � �ᯮ�짮������ ������ new  }
{              �� ᮧ������;                                          }
{           �) 㪠������ ������ ������ ���� ॠ�������� ��楤�ன �}
{              �ᯮ�짮������ ��६����� ⨯� ^TPItemList;            }
{         �� ��஬ ᯨ᪥ ������ ������� ᫮�� ��室���� ᯨ᪠ ��� }
{         ᫮� �� ��ࢮ�� ᯨ᪠.                                     }
{    3) �������: SplitLst1_nn.pp � SplitLst1_nn.exe,                }
{       ��� nn -��� ���䨪�, ���������� � zip-䠩� Zd18_nn.zip �      }
{       ��ࠢ��� �� ���� �� kvg@star.math.spbu.ru                   }

const UpABC: string[33]='���������������������������������';
     LowABC: string[33]='������񦧨�����������������������';

function LowCase(c:char):char;
  var k: integer;
  begin
    k:=Pos(c,UpABC);
    if k <> 0 then
       LowCase:=LowABC[k]
    else LowCase:=c
  end;

type TStr = string[30];

     TPItemList = ^TItemList;

     TInf = record
       s: TStr;
       n: word
     end;

     TItemList = record
       inf: TInf;
       nxt:  TPItemList
     end;

     TList=TPItemList;


procedure addWord2Lst(var lst: TList; s: TStr);
   var ppItemList: ^TPItemList;
       p:           TPItemList;
   begin ppItemList := @lst;
     while ppItemList^ <> nil do begin
       if s < ppItemList^^.inf.s then break
       else
       if s = ppItemList^^.inf.s then begin inc(ppItemList^^.inf.n); exit end
       else ppItemList:=@(ppItemList^^.nxt)
     end;
     new(p); p^.inf.s:=s; p^.inf.n:=1; p^.nxt:=ppItemList^; ppItemList^:=p;
   end;

procedure addStr2Lst(s:string; var lst: TList);
  var i,ls: integer;
      s1  : string;
      c   : char;
      flag: boolean;
  begin ls:=length(s); s1:=''; flag:=false;
    for i:=1 to ls do begin c:=LowCase(s[i]);
      if not (c in [' ','.',',','!','?',';',':','"','-','(',')']) then begin
        flag:=true; s1:=s1+c
      end
      else
      if flag then begin
        addWord2Lst(lst,s1); s1:=''; flag:=false
      end
    end;
    if flag then addWord2Lst(lst,s1)
  end {addStr2Lst};

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

procedure putlist(lst: TList);
  var p: TList;
  begin  p:=lst;
    while p<>nil do begin write(p^.inf.s);
      if p^.inf.n <> 1 then write('(',p^.inf.n,')');
      write(' ');
      p:=p^.nxt
    end;
    writeln
  end;

{$B-}
procedure SplitList(var lst1,lst2: TList; c: char);
  begin {�����誠}
  end;


var s: TStr; l,l1: TList; ch: char;

begin   l:=nil;   writeln; writeln;
  writeln('***    ����஥��� �易����� 㯮�冷祭����          ***');
  writeln('***      ᯨ᪠ ᫮� (㪠��⥫� �� 㪠��⥫�!)       ***');
  writeln('***      ⥪�� �� 䠩��, ����������� ���짮��⥫��. ***');
  writeln('***    ��室 �� �ணࠬ��: ���� ���⮣� ����� 䠩��. ***');
  writeln('***  �������: ॠ�������� ࠧ������� ������饣���   ***');
  writeln('***   ᯨ᪠ ᫮� �� 2 ᯨ᪠:                       ***');   
  writeln('***   1) ᯨ᮪ ᫮�, ��稭������ � 㪠������ �㪢�;***');
  writeln('***   2) ᯨ᮪ ��⠢���� ᫮�.                     ***');     
  writeln('***               ��쬥��� �.�., 12.11.96, 24.03.08 ***');
  writeln;
  while true do begin writeln;
    write('������ ��� 䠩�� (����� ��ப� -�����): ');
    readln(s);
    if length(s) = 0 then break;
    if getListFromFile(l,s) then begin writeln;
      writeln('����稫� ᯨ᮪:');
      putlist(l);
      writeln;
      writeln('������ �㪢� ��� �뤥����� ᫮�, ��稭������');
      write('  � �⮩ �㪢� � �⤥��� ᯨ᮪ (* -�����): ');
      readln(ch);
      while ch <> '*' do begin SplitList(l,l1,ch); writeln;
        writeln(' ����稫��� 2 ᯨ᪠:');
        write('   ���᮪ 1: '); putlist(l1); writeln;
        write('   ���᮪ 2: '); putlist(l); writeln;
        writeln('������ �㪢� ��� �뤥����� ᫮�, ��稭������');
        write('  � �⮩ �㪢� � �⤥��� ᯨ᮪ (* -�����): ');
        readln(ch)
      end
    end
  end
end.


