// lst1_ga.pp       Гудулин А.О. апрель 2012г.
// Работа со связным списком
// процедуры добавления элемента в начало и
// вывод на экран множества слов из списка

type TPItemList = ^TItemList;
     TInfo = string;
     TItemList = record
         info: TInfo;      {Информационное поле}
         nxt:  TPItemList  {Указатель на след. эл-т}
     end;
     TList = TPItemList;


var  Lst1: TList;
     w: TInfo;

procedure outputLst(lst: TList);
begin
    while lst <> nil do begin
        write(lst^.info, ' ');
        lst := lst^.nxt;
    end;
    writeln;
end;

procedure add2begLst(var lst: TList; x: TInfo);
var pNew: TPItemList;
begin
    new(pNew);
    pNew^.info := x;
    pNew^.nxt := lst;
    lst := pNew;
end;

begin
    writeln('*** lst1_ga.pp       Гудулин А.О. апрель 2012г.');
    writeln('*** Работа со связным списком');
    writeln('***   процедуры добавления элемента в начало и');
    writeln('***   вывод на экран множества слов из списка');
    Lst1 := nil;
    writeln;
    write('Введите слово (Enter -конец): ');
    readln(w);
    while Length(w) <> 0 do begin
        add2begLst(Lst1, w);
        writeln('   Вставка в начало списка:');
        write('Список 1: ');
        outputLst(Lst1);
        writeln;
        write('Введите слово (Enter -конец): ');
        readln(w)
    end;
    writeln('Выполнение программы закончено! Нажмите Enter!');
    readln
end.