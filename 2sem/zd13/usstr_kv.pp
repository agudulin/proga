{ usstr_kv.pp   ��쬥��� ��, 15-11-2008 �.}
{                                          }
{ ����� �����୮�� ᪠��஢���� �室���  }
{  ��ப� in_str.                          }
{                                          }

unit usstr_kv;

INTERFACE

const      EOS=#01; {�ਧ��� ���� ᪠���㥬�� �室��� ��ப�}
     arrowDown=#25; {ᨬ��� - ��५�窠 ���� ��� 㪠����� ���� �訡��}

var     
    curc: char; {⥪��� ���� �室��� ��ப�}
  iss,ls: byte; {������ ��࠭��� ����� �� �室��� ��ப� � ����� �室��� ��ப�}
  wasErr: boolean; {䫠� -�뫠 �����㦥�� �訡��}
  in_str: string;  {�室��� ᪠���㥬�� ��ப�}
  
{---- ���樠������ ᪠��஢���� �室��� ��ப� --}
procedure initScanStr;

{-- ����祭�� ����� ����� �室��� ��ப� --------}
function nxtc:char;

{--- �뢮� ᮮ�饭�� �� �訡�� � 㪠������ ��५��� ���� �訡�� --}
procedure PutMsgErr(msg: string);

IMPLEMENTATION

{---- ���樠������ ᪠��஢���� �室��� ��ப� --}
procedure initScanStr;
  begin iss:=0; ls:=length(in_str); wasErr:=false end;

{-- ����祭�� ����� ����� �室��� ��ப� --------}
function nxtc:char;
  begin
    if iss<ls then begin inc(iss); curc:=in_str[iss] end
    else curc:=EOS;
    nxtc:=curc
  end;

{--- �뢮� ᮮ�饭�� �� �訡�� � 㪠������ ��५��� ���� �訡�� --}
procedure PutMsgErr(msg: string);
  begin wasErr:=true;
    writeln('*** ������: ',msg);
    writeln(' ': iss, arrowDown ); writeln(' '+in_str)
  end;

begin
  iss:=0;
  ls:=0;
  in_str:='';
end.

