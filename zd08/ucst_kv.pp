{ ucst_kv.pp                                 }
{  Возможный вариант реализации работы со    }
{  стеком                                    }
{ в виде модуля с соответствующим объектом!  }
{                                            }
{  Демонстрация полиморфизма процедур и      }
{  функций Free Pascal с соответствующей их  }
{  перегрузкой!                              }
{                                            }
{           Кузьменко В.Г.  апрель, 2009 г.  }
{                                            }

unit ucst_kv;

INTERFACE

const nmax_stack=50;
            EOSt=#02;
{-------------------------------------------------------}
type TCStack    = object
                   private
                    st:array [1..nmax_stack] of char;
                    ist:byte;
                   public
                    constructor Init;
                    function push(x:char):boolean;
                    function pop:char;
                    function top:char;
                    procedure print;
                  end;
{=======================================================}

IMPLEMENTATION

constructor TCStack.Init;
  var i:byte;
  begin
    ist:=0;
    for i:=1 to nmax_stack do st[i]:=EOSt;
  end;
{---------------------------------------------}
function TCStack.top:char;
  begin if ist<>0 then top:=st[ist] else top:=EOSt end;
{---------------------------------------------}
function TCStack.push(x:char):boolean;
  begin push:=true;
    if ist<nmax_stack then begin inc(ist); st[ist]:=x end
    else begin
      push:=false
    end
  end;
{---------------------------------------------}
function TCStack.pop:char;
  begin
    if ist<>0 then begin
      pop:=st[ist]; st[ist]:=EOst; dec(ist)
    end
    else pop:=EOSt
  end;
{---------------------------------------------}
procedure TCStack.print;
  var i:byte;
  begin
    writeln('массив, содержащий стек:');
    for i:=1 to nmax_stack do write(i:3);
    writeln;
    for i:=1 to nmax_stack do
      if st[i]=EOSt then write(' --')
      else write(st[i]:3);
    writeln;
    writeln;
    write('Стек: ');
    for i:=1 to ist do write(st[i],' ');
    writeln;
  end;

 end.
