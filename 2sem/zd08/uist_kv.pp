{ uist_kv.pp                                 }
{  �������� ��ਠ�� ॠ����樨 ࠡ��� �    }
{  �⥪��                                    }
{ � ���� ����� � ᮮ⢥�����騬 ��ꥪ⮬!  }
{                                            }
{  ���������� �������䨧�� ��楤�� �      }
{  �㭪権 Free Pascal � ᮮ⢥�����饩 ��  }
{  ��ॣ�㧪��!                              }
{                                            }
{           ��쬥��� �.�.  ��५�, 2009 �.  }
{                                            }

unit uist_kv;

INTERFACE

const nmax_stack=50;
            EOSt=maxInt;
{-------------------------------------------------------}
type TIStack    = object
                   private
                    st:array [1..nmax_stack] of integer;
                    ist:byte;
                   public
                    constructor Init;
                    function push(x:integer):boolean;
                    function pop:integer;
                    function top:integer;
                    procedure print;
                  end;
{=======================================================}

IMPLEMENTATION

constructor TIStack.Init;
  var i:byte;
  begin
    ist:=0;
    for i:=1 to nmax_stack do st[i]:=EOSt;
  end;
{---------------------------------------------}
function TIStack.top:integer;
  begin if ist<>0 then top:=st[ist] else top:=EOSt end;
{---------------------------------------------}
function TIStack.push(x:integer):boolean;
  begin push:=true;
    if ist<nmax_stack then begin inc(ist); st[ist]:=x end
    else begin
      push:=false
    end
  end;
{---------------------------------------------}
function TIStack.pop:integer;
  begin
    if ist<>0 then begin
      pop:=st[ist]; st[ist]:=EOst; dec(ist)
    end
    else pop:=EOSt
  end;
{---------------------------------------------}
procedure TIStack.print;
  var i:byte;
  begin
    writeln('���ᨢ, ᮤ�ঠ騩 �⥪:');
    for i:=1 to nmax_stack do write(i:3);
    writeln;
    for i:=1 to nmax_stack do
      if st[i]=EOSt then write(' --')
      else write(st[i]:3);
    writeln;
    writeln;
    write('�⥪: ');
    for i:=1 to ist do write(st[i],' ');
    writeln;
  end;

 end.
