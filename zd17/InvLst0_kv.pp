{ InvLst0_kv.pp                 12.11.1996 г.  Кузьменко В.Г. }
{             модифицировано    24.03.2008 г.                 }
{ Построение лексикоупорядоченного списка слов, вводимых  в   }
{   произвольном порядке с клавиатуры. После ввода каждого    }
{   слова выводится получившийся список.                      }
{ Инвертирование (переворачивание) получившегося списка в     }
{   данной программе представлено заглушкой.                  }
{ ЗАДАНИЕ:                                                    }
{ 1)Реализуйте алгоритм переворачивания(инвертирования)списка.}
{   При этом инвертированный список образуется из элементов   }
{   исходного списка, т.е. оператор new не используется!!!    }
{ 2) Результат: invLst1_nn.pp и invLst1_nn.exe,               }
{    где nn -ваш суффикс, запаковать в zip-файл Zd06_nn.zip и }
{    отправить по почте на kvg@star.math.spbu.ru              }

type TPItemList=^TItemList;
     TInfo=string;
     TItemList= record
       info: TInfo;
       nxt:  TPItemList
     end;
     TList=TPItemList;


procedure addItem2List1(var list: TList; s: TInfo);
   var ppItemList: ^TPItemList;
       p:           TPItemList;
   begin ppItemList:=@list;
     while ppItemList^ <> nil do begin
       if   s<=ppItemList^^.info then break
       else ppItemList:=@(ppItemList^^.nxt)
     end;
     if (ppItemList^ = nil) or (s<>ppItemList^^.info) then begin
       new(p); p^.info:=s; p^.nxt:=ppItemList^; ppItemList^:=p
     end
   end;

procedure putlist(list: TList);
  begin
    if list=nil then write('Список пуст!')
    else
      while list<>nil do begin write(list^.info,' '); list:=list^.nxt end;
    writeln
  end;

procedure getlist(var lst: TList);
  var s: TInfo; again: boolean;
  begin   lst:=nil;
    repeat
      again:=false;
      write('  Введите слово (пустая строка - конец!): ');
      readln(s);
      if length(s)<>0 then begin writeln;
        addItem2List1(lst,s); write('Список: ');
        putlist(lst); writeln; again:=true
      end
    until not again;
    writeln
  end;

procedure invertList(var lst: TList);
  begin {Заглушка}
  end;

var l: TList;
   ok: byte;

begin   l:=nil; writeln; writeln;
  writeln('*** Построение связанного упорядоченного   ***');
  writeln('***   списка слов  и его инвертирование.   ***');
  writeln('*** Задание: реализовать инвертирование    ***');
  writeln('***          списка процедурой invertList, ***');
  writeln('***          представленной в этой програм-***');
  writeln('***          ме заглушкой!                 ***');
  writeln('***               Кузьменко В.Г., 12.11.96 ***');
  writeln;
  repeat
    writeln('Строим список слов:'); writeln;
    getlist(l);
    write('Имеем список:        '); putlist(l);
    write('Перевернутый список: ');
    invertList(l);
    putlist(l); writeln;
    write('Строим новый список слов? (1 -да, 0 -нет): ');
    readln(ok);
  until ok=0
end.
