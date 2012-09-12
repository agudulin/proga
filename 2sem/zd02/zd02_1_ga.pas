// zd02_1_ga.pas        Гудулин А.О.    12.02.2012
// Программа тестирования функций работы с очередью

type
    TQueue = array[-2..10] of integer;

const
    errorMessage:string = '';

var
    inputStr: string;
    queue: TQueue;
    i: integer;

procedure init(var queue:TQueue);
    {var
        i: integer;}
    begin
        for i:=1 to 10 do
            queue[i] := 0;
        queue[0] := 0; // Количество элементов
        queue[-1]:= 1; // Позиция первого элемента
        queue[-2]:= 1; // Позиция последнего элемента
    end;

function errorHandler(count:integer): boolean;
    var
        error: byte;
    begin
        //if (count <> 0) and (endPos = startPos) then
        if count > 10 then
            error := 1
        else if count < 0 then
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

procedure incMod(var n: integer);
    begin
        if n >= 10 then n := 1 else inc(n);
    end;

function push(var queue:TQueue; val:integer): boolean;
    begin    
        if errorHandler(queue[0]+1) then begin
            inc(queue[0]); // увеличиваем count
            queue[queue[-2]] := val; // помещаем значение в конец очереди
            incMod(queue[-2]); // увеличиваем endPos
            push := true;
        end
        else
            push := false;
    end;

function pop(var queue:TQueue; var val:integer): boolean;
    begin
        if errorHandler(queue[0]-1) then begin
            dec(queue[0]);
            val := queue[queue[-1]]; // значение в startPos
            incMod(queue[-1]); // двигаем startPos
            pop := true;
        end
        else
            pop := false;
    end;

function top(var queue:TQueue; var val:integer): boolean;
    begin
        if errorHandler(queue[0]-1) then begin
            val := queue[queue[-1]]; // значение в startPos
            top := true;
        end
        else
            top := false;
    end;

procedure show(var queue:TQueue);
    var
        i, count, startPos, endPos: integer;
    begin
        count := queue[0];
        startPos := queue[-1];
        endPos := queue[-2];
        {writeln(startPos, ' ', endPos, ' ', count);}
        write('Состояние очереди: [');
        if count = 0 then writeln(']')
        else if errorHandler(count) then begin
            for i:=startPos to startPos+count-2 do begin
                if i > 10 then 
                    write(queue[i mod 10], ', ')
                else write(queue[i], ', ');
            end;
            if endPos = 1 then endPos := 11;
            writeln(queue[endPos-1], ']');
        end;
    end;

procedure showHelp;
    begin
        writeln('Список доступных команд:');
        writeln('push':8);
        writeln('pop':7);
        writeln('top':7);
        writeln('show':8);
        writeln('help':8);
        writeln('exit':8);
    end;

begin
    init(queue);
    writeln('*** zd02_1_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций push, pop, top');
    writeln('***   работы с очередью ');
    inputStr := '';
    showHelp;
    while(true) do begin
        writeln('Введите команду:');
        write('>>> ');
        readln(inputStr);
        writeln;
        if inputStr = 
            'push' then begin
                        writeln('** Введите новое значение (int):');
                        write('>>> ');
                        readln(i);
                        if push(queue, i) then begin
                            writeln('** Значение помещено в очередь');
                            show(queue);
                        end
                        else
                            writeln(errorMessage);
                        writeln;
                    end
            else if inputStr = 
            'pop' then begin
                        if pop(queue, i) then begin
                            write('** Значение, извлеченное из очереди: ');
                            writeln(i);
                            show(queue);
                        end
                        else
                            writeln(errorMessage);
                        writeln;
                    end
            else if inputStr = 
            'top' then begin
                        if top(queue, i) then begin
                            write('** Значение, извлеченное из очереди: ');
                            writeln(i);
                            show(queue);
                        end
                        else
                            writeln(errorMessage);
                        writeln;
                    end
            else if inputStr = 
            'show' then begin
                        show(queue);
                        writeln;
                    end
            else if inputStr = 
            'help' then showHelp
            else if inputStr = 
            'exit' then exit
            else
                showHelp;
        //end;
    end;
end.