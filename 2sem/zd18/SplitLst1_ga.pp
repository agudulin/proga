{  SplitLst1_ga.pp                                                    }
{  Использование указателя на указатель.                              }
{                                       апрель  2012 г.  Гудулин А.О. }
{ Построение лексикоупорядоченного списка слов текста из файла, имя   }
{   которого вводится пользователем. Для каждого слова подсчитывается }
{   количество его вхождений в текст.                                 }
{   Ввод "пустого" имени файла - выход из программы.                  }
{                                                                     }
{  Задание:                                                           }
{    1) Внимательно изучите используемые здесь процедуры и функции и  }
{         определите их назначение; после неясных или непонятных строк}
{         алгоритма поставьте в комментарии ???????!                  }
{    2) Выполните следующую модификацию этой программы или            }
{       соответствующей своей программы (если Вами  выполнено         }
{       задание Zd16).                                               }
{      (см. процедуру SplitList, представленную здесь заглушкой):     }
{         Реализуйте возможность разбиения созданного списка слов     }
{         на два списка слов. В первый список выделяются слова, начи- }
{         нающиеся с буквы, введенной пользователем. При этом:        }
{           а) эти слова исключаются из исходного списка слов;        }
{           б) никакие новые элементы с использованием оператора new  }
{              не создаются;                                          }
{           в) указанная операция должна быть реализована процедурой с}
{              использованием переменной типа ^TPItemList;            }
{         Во втором списке должны остаться слова исходного списка без }
{         слов из первого списка.                                     }
{    3) Результат: SplitLst1_nn.pp и SplitLst1_nn.exe,                }
{       где nn -ваш суффикс, запаковать в zip-файл Zd18_nn.zip и      }
{       отправить по почте на kvg@star.math.spbu.ru                   }

const UpABC: string[33]='АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
     LowABC: string[33]='абвгдеёжзийклмнопрстуфхцчшщъыьэюя';

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
      writeln('   Файл ',FileName, ' не найден !!!')
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
// @brief:
//  вырезаем из исходного списка 
//  список слов с указанной буквы
procedure SplitList(var lst1,lst2: TList; c: char);
  var ppointer1, ppointer2: ^TPItemList;
  begin
    ppointer1 := @lst1;
    ppointer2 := nil;
    lst2 := nil;
    while (nil <> ppointer1^) and (ppointer1^^.inf.s[1] <> c) do
      ppointer1 := @ppointer1^^.nxt;

    if ppointer1^ <> nil then begin
      lst2 := ppointer1^;
      ppointer2 := @lst2;

      while (nil <> ppointer2^) and (ppointer2^^.inf.s[1] = c) do
        ppointer2 := @ppointer2^^.nxt;

      ppointer1^ := ppointer2^;
      ppointer2^ := nil;
    end
    else exit;
  end;

var s: TStr; l,l1: TList; ch: char;

begin   l:=nil;   writeln; writeln;
  writeln('***    Построение связанного упорядоченного          ***');
  writeln('***      списка слов (указатель на указатель!)       ***');
  writeln('***      текста из файла, задаваемого пользователем. ***');
  writeln('***    Выход из программы: ввод пустого имени файла. ***');
  writeln('***  РЕАЛИЗАЦИЯ: разделение получающегося списка     ***');
  writeln('***   слов на 2 списка:                              ***');   
  writeln('***   1) список слов, начинающихся с указанной буквы;***');
  writeln('***   2) список оставшихся слов.                     ***');     
  writeln('***              Гудулин А.О., апрель 2012           ***');
  writeln;
  while true do begin writeln;
    write('Введите имя файла (пустая строка -конец): ');
    readln(s);
    if length(s) = 0 then break;
    if getListFromFile(l,s) then begin writeln;
      writeln('Получили список:');
      putlist(l);
      writeln;
      writeln('Нажмите букву для выделения слов, начинающихся');
      write('  с этой буквы в отдельный список (* -конец): ');
      readln(ch);
      while ch <> '*' do begin SplitList(l,l1,ch); writeln;
        writeln(' Получилось 2 списка:');
        write('   Список 1: '); putlist(l1); writeln;
        write('   Список 2: '); putlist(l); writeln;
        writeln('Нажмите букву для выделения слов, начинающихся');
        write('  с этой буквы в отдельный список (* -конец): ');
        readln(ch)
      end
    end
  end
end.