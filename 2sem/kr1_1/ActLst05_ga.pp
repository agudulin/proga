{  Контрольная работа 1.                       Гудулин А.О.   }
{  Чтение из файла строк из слов, разделенных пробелами и       }
{    построение из этих слов связного списка этих слов          }
{    в той последовательности, в которой они следуют в файле.   }
{    Процедурой putlist эти слова выводятся на экран с предшед- }
{    ствующим номером слова в этом списке.                      }
{$mode objfpc}
uses sysutils;

type TStr = string[30];

type TPItemList = ^TItemList;
     TInf = string;
     TItemList= record
       inf: TInf;
       nxt: TPItemList
     end;
     TList = TPItemList;
type TSArr = array[0..100] of string;

{-----------------------------------------------}
{ Добавить слово w в конец списка list }
procedure addWord2EndLst(w: string; var list: TList);
  var p: ^TList;
  begin
    p := @list;
    while p^ <> nil do
      p := @p^^.nxt;
    new(p^);
    p^^.inf := w;
    p^^.nxt := nil;
  end;

{-----------------------------------------------}
{ Добавить в список list последовательность слов из строки s }
procedure addStr2Lst(s: string; var list: TList; add_diez: boolean);
  var i,ls: integer;
      s1  : string;
      c   : char;
      flag: boolean;
  begin
    ls := length(s);
    s1 := '';
    flag := false;
    for i:=1 to ls do begin
      c := s[i];
      if c <> ' ' then begin
        flag := true;
        s1 := s1 + c;
      end
      else
      if flag then begin
        addWord2EndLst(s1, list);
        s1 := '';
        flag := false;
      end;
    end;
    if flag then addWord2EndLst(s1,list);
    if add_diez then addWord2EndLst('#', list);
  end {addStr2Lst};

{-----------------------------------------------}
{ Построить список list из строк файла FileName }
function getListFromFile(var list: TList; FileName: TStr):boolean;
  var flist: text;
      s    : string;
  begin
   list := nil;
   getListFromFile := false;
   assign(flist, FileName);
   {$I-} reset(flist); {$I+}
    if IOResult <> 0 then
      writeln('   Файл ', FileName, ' не найден !!!')
    else begin
      getListFromFile := true;
      while not eof(flist) do begin
        readln(flist, s);
        addStr2Lst(s, list, true)
      end;
      close(flist)
    end
  end {getListFromFile};

{-----------------------------------------------}
{ Вывести список на экран с нумерацией слов }
procedure putlist(list: TList);
  var p    : TList;
      i, j : word;
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

{---------------------------------------------------------}
{ Добавление последовательности слов в список после n-ого }
{ Описание реализации процедуры:                          
  1. Пройтись по списку до n-ого слова
  2. Разбить список на два, правую половину сохранить
  3. Переместить указатель конца левого списка в nil
  4. Вызвать процедуру addStr2Lst для левого списка
  5. Добавить к левому списку второй сохраненный
}
// @params:
//  n: номер слова, после которого вставляется цепочка слов
//  s: строка слов, разделенных пробелом
//  list: исходный список слов
procedure ActList_ga(n: integer; s: string; var list: TList; var res_file: TextFile);
  var i: integer;
      tmp_left_p: TList;
      left_p, right_p: ^TPItemList;
      is_added: boolean;
  begin
    left_p := @list;
    i := 0; // words counter
    is_added := false;
    while left_p^ <> nil do begin
      inc(i);
      if i = n then begin
        writeln('>> Добавление списка слов "', s, '" в исходный список после "', n , '-ого"');
        writeln;
        right_p := @left_p^^.nxt;
        tmp_left_p := right_p^;
        left_p^^.nxt := nil;
        addStr2Lst(s, left_p^, false);
        while nil <> left_p^ do
          left_p := @left_p^^.nxt;

        left_p^ := tmp_left_p;
        is_added := true;
        // putlist(list);
        append(res_file);
        write  (res_file, '  - После ', n, '-ого слова вставляется последовательность слов ');
        writeln(res_file, '"', s, '"');
        close(res_file);
        break;
      end
      else
        left_p := @left_p^^.nxt;
    end;
    if not is_added then
      writeln('>> Ошибка! Указан некорректный номер слова.')
  end;

{-----------------------------------------------}
{         Гудулин А.О.  04.05.2012              }
{ Процедура записывает получившийся после       }
{ преобразований текст в выходной файл с        }
{ именем res05_ga.res по строкам согласно       }
{ индикаторам конца строк, оставляя между       }
{ словами в каждой строке по одному пробелу     }
procedure PutRes_ga(var list: TList);
var
 res_file : TextFile;
 p        : TList;
begin
  p := list;
  assign(res_file, 'res05_ga.res');
  rewrite(res_file);
  while p <> nil do begin
      if p^.inf = '#' then
        writeln(res_file)
      else
        write(res_file, p^.inf, ' ');
      p := p^.nxt;
  end;
  close(res_file);
end;

function is_c_digit(c: char): boolean;
begin
  if c in ['0','1','2','3','4','5','6','7','8','9'] then
    is_c_digit := true
  else
    is_c_digit := false;
end;

procedure dialog_ga(var list: TList; source: string);
  var s, num, words        : string;
      i, j, words_count, n : integer;
      is_correct_num       : boolean;
      res_file             : TextFile;
  begin
    writeln('** Гудулин А.О.  20.04.2012');
    writeln('** Номер задания: 5');
    writeln('**   Вставить последовательность указанных слов');
    writeln('**   после i-ого');

    assign(res_file, 'res05_ga.txt');
    rewrite(res_file);
    writeln(res_file, 'Исходный файл: ', source);
    writeln(res_file, 'Последовательность примененных к нему операций:');
    close(res_file);

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
        is_correct_num := true;
        for j:=1 to length(num) do begin
          if not is_c_digit(num[j]) then begin
            is_correct_num := false;
            break;
          end;
        end;
        if not is_correct_num then begin
          writeln('>> После ! должен идти номер слова [1-9][0-9]*');
          continue;
        end;
        n := strToInt(num);
        words := '';
        for i:=i+1 to length(s) do
          words := words + s[i];

        // words := words + ' ';
        ActList_ga(n, words, list, res_file);
    end;
  end;

{===============================================}
var l: TList;
    s: TStr;

begin
  l:=nil;
  writeln; writeln;
  writeln('*** Контрольная работа N 1: обработка списка слов    ***');
  writeln('***   согласно заданию: вставить последовательность  ***');
  writeln('***                 указанных новых слов после i-го  ***');
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
      dialog_ga(l, s);
      PutRes_ga(l);
    end;
  end;
end.
