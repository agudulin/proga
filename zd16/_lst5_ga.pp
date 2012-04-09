// lst5_ga.pp       Гудулин А.О. апрель 2012г.
// Работа со связным списком
// процедуры добавления элемента в конец и
// вывод на экран множества слов из списка

{$mode objfpc}
uses Sysutils;
 
type TPItemList = ^TItemList;
     TWord  = string;
     TCount = word;
     TItemList = record
         word:  TWord;      {Информационное поле}
         count: TCount;     {Счетчик слов в тексте}
         next:  TPItemList  {Указатель на следующий элемент}
     end;
     TList = TPItemList;

const separators = [' ', ',', '.', ';', ':', '!', '?', '-', 
                    #34, #39, '(', ')', '[', ']', '{', '}'];

var filein_name: string;
    list: TList;
    c: char;


procedure printList(list: TList);
begin
    while list <> nil do begin
        write(list^.word);
        if list^.count > 1 then
            write('(', list^.count ,')');

        write(' ');
        list := list^.next;
    end;
    writeln;
end;

procedure addToEndOfList(var list: TList; val: TWord);
var pNew, p: TPItemList;
begin
    new(pNew);
    pNew^.word := val;
    pNew^.next := nil;
    if nil = list then
        list := pNew
    else begin
        p := list;
        while p^.next <> nil do
            p := p^.next;
        p^.next := pNew;
    end;
end;

procedure addToBeginOfList(var list: TList; val: TWord);
var pNew: TPItemList;
begin
    new(pNew);
    pNew^.word := val;
    pNew^.next := list;
    list := pNew;
end;

// @brief:
//  add item to list lexicographically
procedure addToList(var list: TList; val: TWord);
var pFirst, pSecond, pNew: TPItemList;
begin
    new(pNew);
    pNew^.word  := val;
    pNew^.count := 1;
    pNew^.next  := nil;

    if nil = list then begin
        pNew^.next := list;
        list := pNew;
    end
    else begin
        pFirst  := list;
        pSecond := list;
        while (pSecond <> nil) and (pSecond^.word <= val) do begin
            if val = pSecond^.word then begin
                inc(pSecond^.count);
                exit; // don't duplicate item
            end;
            pFirst  := pSecond;
            pSecond := pSecond^.next;
        end;
        // if end of list - add new item to the end of list
        if nil = pSecond then
            pFirst^.next := pNew
        else begin
            pNew^.next := pSecond;
            if pSecond = list then
                list := pNew
            else
                pFirst^.next := pNew;
        end;
    end;
end;

function lower_cp866(s: char): string;
begin
    if ord(s) in [128..143] then
        lower_cp866 := chr(ord(s)+32)
    else if ord(s) in [144..159] then
        lower_cp866 := chr(ord(s)+80)
    else lower_cp866 := lowercase(s);
end;


procedure words_count(filein_name: string; var list: TList);
var filein: text;
    str:    string;
    tmp:    TWord;
    i:      integer;
begin
    list := nil;
    assign(filein, filein_name);
    {$I+}
    try
        reset(filein);
    repeat
        readln(filein, str);
        str := str + ' ';
        tmp := '';
        for i:=1 to length(str) do begin
            if str[i] in separators then begin
                if tmp <> '' then begin
                    //writeln('D:> ', tmp);
                    addToList(list, tmp);
                    tmp := '';
                end
            end
            else
                tmp := tmp + lower_cp866(str[i]);
        end;
    until (EOF(filein));
        closefile(filein);
    except
        on E: EInOutError do begin
            writeln('Ошибка в процессе обработки файла. Детали: ', E.ClassName, ': ', E.Message);
        end;    
    end;
end;

begin
    list := nil;
    writeln('*** lst5_ga.pp       Гудулин А.О. апрель 2012г.  ***');
    writeln('*** Построение связанного упорядоченного         ***');
    writeln('***   списка слов                                ***');
    writeln('***   текста из файла, задаваемого пользователем.***');
    writeln('*** Выход из программы: ввод пустого имени файла.***');
    writeln('*** Используемые разделители слов:               ***');
    write('***'); for c in separators do write(c, ' ');
    writeln;
    writeln('Введите имя файла (Enter -конец): ');
    readln(filein_name);

    while length(filein_name) <> 0 do begin
        
        words_count(filein_name, list);
        
        printList(list);
        writeln;
        writeln('Введите имя файла (Enter -конец): ');
        readln(filein_name);
    end;
    writeln('Выполнение программы закончено! Нажмите Enter!');
    readln;
end.