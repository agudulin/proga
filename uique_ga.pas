// uique_ga.pas         12.02.2012  Гудулин А.О.
// Модуль, реализующий представление очереди ОБЪЕКТОМ TIQueue
// с соответствующими операциями работы с очередью

unit uique_ga;

interface
    type
        TIQueue = Object
            len: integer;
            startPos: integer;
            endPos: integer;
            val: array[1..10] of integer;
            constructor init;
            function push(n:integer): boolean;
            function pop(var n:integer): boolean;
            function top(var n:integer): boolean;
            procedure show;
            function errorHandler(count:integer): boolean;
        end;
    
    procedure incMod(var n: integer);

implementation
    constructor TIQueue.init;
        begin
            len := 0;
            startPos := 1;
            endPos := 1;
        end;

    procedure incMod(var n: integer);
        begin
            if n >= 10 then n := 1 else inc(n);
        end;

    function TIQueue.push(n:integer): boolean;
        begin
            if errorHandler(len+1) then begin
                inc(len); // увеличиваем count
                val[endPos] := n; // помещаем значение в конец
                incMod(endPos); // увеличиваем endPos
                push := true;
            end
            else
                push := false;
        end;
    
    function TIQueue.pop(var n:integer): boolean;
        begin
            if errorHandler(len-1) then begin
                dec(len);
                n := val[startPos]; // значение в startPos
                incMod(startPos); // двигаем startPos
                pop := true;
            end
            else
                pop := false;
        end;

    function TIQueue.top(var n:integer): boolean;
        begin
            if errorHandler(len-1) then begin
                n := val[startPos]; // значение в startPos
                top := true;
            end
            else
                top := false;
        end;

    procedure TIQueue.show;
    var
        i: integer;
    begin
        write('Состояние очереди: [');
        if len = 0 then writeln(']')
        else if errorHandler(len) then begin
            for i:=startPos to startPos+len-2 do begin
                if i > 10 then 
                    write(val[i mod 10], ', ')
                else write(val[i], ', ');
            end;

            if endPos <> 1 then
                writeln(val[endPos-1], ']')
            else
                writeln(val[10], ']')
        end;
    end;
    
    function TIQueue.errorHandler(count:integer): boolean;
        var
            error: byte;
        begin
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
end.