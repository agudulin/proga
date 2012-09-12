{  Контрольная работа 1.                       Гудулин А.О.   }
{  Чтение из файла строк из слов, разделенных пробелами и       }
{    построение из этих слов связного списка этих слов          }
{    в той последовательности, в которой они следуют в файле.   }
{    Процедурой putlist эти слова выводятся на экран с предшед- }
{    ствующим номером слова в этом списке.                      }

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
{ Добавить слово w в конец списка list }
procedure addWord2EndLst(w:string; var list: TList);
  var p: ^TList;
  begin p:=@list;
    while p^<>nil do p:=@p^^.nxt;
    new(p^); p^^.inf:=w; p^^.nxt:=nil;
  end;

{-----------------------------------------------}
{ Добавить в список list последовательность слов из строки s }
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
{ Построить список list из строк файла FileName }
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

{-----------------------------------------------}
{ Вывести список на экран с нумерацией слов }
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
    writeln('И вот тут надо начать писать процедуру, но я не успел');
    writeln;
    writeln;
  end;

{-----------------------------------------------}
{ Здесь д.б. комментарий с фамилией, датой;     }
{    nn в имени -ваш суффикс                    }
procedure PutRes_nn;
  begin {Это заглушка, на место которой Вы должны
         поставить реализованную Вами процедуру
         вывода списка в виде текста !
         (см. комментарий в kr1_1.docx!)
        }
  end;


procedure dialog_ga;
  var s,num,word: string; i,j,n:integer; words: TSArr;
  begin
    writeln('** Гудулин А.О.  20.04.2012');
    writeln('** Номер задания: 5');
    writeln('**   Вставить последовательность указанных слов');
    writeln('**   после i-ого');

    while true do begin
        writeln;
        writeln('Введите строку [!i word1 word2 word3] (пусто-конец): ');
        readln(s);
        if length(s) = 0 then break;
        if s[1] <> '!' then begin
          writeln('>> Строка должна начинаться с !');
          continue;
        end;
        num := '';
        for i:=2 to length(s) do begin
            if s[i] = ' ' then break;
            num := num + s[i];
        end;
        if num = '' then begin
            writeln('>> Вы не ввели номер слова');
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
  writeln('*** Контрольная работа N 1: обработка списка слов    ***');
  writeln('***   согласно заданию: ???????????????????????      ***');
  writeln('*** Список построен из слов текста файла из текущего ***');
  writeln('***  каталога. Имя файла задается пользователем.     ***');
  writeln('***                                                  ***');
  writeln('*** Выход из программы: ввод пустого имени файла.    ***');
  writeln('***              Гудулин А.О.  20.04.2012            ***');
  writeln;
  while true do begin writeln;
    write('Введите имя файла (пустая строка -конец): ');
    readln(s);
    if length(s) = 0 then break;
    if getListFromFile(l, s) then begin
      writeln;
      writeln('Получили список:');
      putlist(l);
      dialog_ga;
      PutRes_nn
    end
  end
end.
