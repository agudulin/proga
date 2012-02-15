// zd02_1_ga.pas        Гудулин А.О.    12.02.2012
// Программа тестирования функций работы с очередью

type
    TQueue = array[0..10] of integer;

var
    inputStr: string;
    queue: TQueue;
    i: integer;

procedure init(var queue:TQueue);
    {var
        i: integer;}
    begin
        {for i:=1 to 10 do
            queue[i] := 0;}
        queue[0] := 0; // Количество элементов
        {queue[-1]:= 0; // Позиция первого элемента
        queue[-2]:= 0; // Позиция последнего элемента}
    end;

function errorHandler({startPos:integer; endPos:integer; }count:integer): boolean;
    var
        error: byte;
    begin
        if (count > 10) then
            error := 1
        else if (count < 1) then
            error := 2
        else
            error := 0;

        case (error) of
            0: errorHandler := true;
            1: begin
                    writeln('Ошибка! Переполнение очереди.');
                    errorHandler := false;
                end;
            2: begin
                    writeln('Ошибка! В очереди нет элементов.');
                    errorHandler := false;
                end;
        end;
    end;

function push(var queue:TQueue; val:integer): boolean;
    var
        count: integer;
    begin
        count := queue[0];
        if errorHandler(count+1) then begin
            inc(count);
            queue[0] := count;
            queue[count] := val;
            push := true;
        end
        else
            push := false;
    end;

function pop(var queue:TQueue; var val:integer): boolean;
    var
        count, i: integer;
    begin
        count := queue[0];
        if errorHandler(count) then begin
            val := queue[1];
            dec(count);
            for i:=1 to count do
                queue[i] := queue[i+1];
            queue[0] := count;
            pop := true;
        end
        else
            pop := false;
    end;

function top(var queue:TQueue; var val:integer): boolean;
    var
        count: integer;
    begin
        count := queue[0];
        if errorHandler(count) then begin
            val := queue[1];
            top := true;
        end
        else
            top := false;
    end;

procedure show(var queue:TQueue);
    var
        i, count: integer;
    begin
        count := queue[0];
        if errorHandler(count) then begin
            write('Состояние очереди: [');
            for i:=1 to count-1 do begin
                write(queue[i], ', ');
            end;
            writeln(queue[count], ']');
        end;
    end;

procedure showHelp;
    begin
        writeln('Список доступных команд:');
        writeln('push':8);
        writeln('pop':7);
        writeln('top':7);
        writeln('help':8);
        writeln('exit':8);
    end;

begin
    init(queue);
    writeln('*** zd02_1_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций push, pop, top');
    writeln('***                        работы с очередью ');
    inputStr := '';
    showHelp;
    while(true) do begin
        writeln('Введите команду:');
        write('>>> ');
        readln(inputStr);
        writeln;
        case(inputStr) of
            'push': begin
                        writeln('** Введите новое значение (int):');
                        write('>>> ');
                        readln(i);
                        if push(queue, i) then begin
                            writeln('** Значение помещено в очередь');
                            show(queue);
                        end;
                        writeln;
                    end;
            'pop' : begin
                        if pop(queue, i) then begin
                            write('** Значение, извлеченное из очереди: ');
                            writeln(i);
                            show(queue);
                        end;
                        writeln;
                    end;
            'top' : begin
                        if top(queue, i) then begin
                            write('** Значение, извлеченное из очереди: ');
                            writeln(i);
                            show(queue);
                        end;
                        writeln;
                    end;
            'show': begin
                        show(queue);
                        writeln;
                    end;
            'help': showHelp;
            'exit': exit;
            else
                showHelp;
        end;
    end;
end.