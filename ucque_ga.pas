// ucque_ga.pas         12.02.2012  Гудулин А.О.
// Модуль, реализующий представление очереди ОБЪЕКТОМ TCQueue
// с соответствующими операциями работы с очередью

unit ucque_ga;

interface
    type
        TCQueue = Object
            len: integer;
            val: array[1..50] of char;
            procedure init;
            function push(c:char): boolean;
            function pop(var c:char): boolean;
            function top(var c:char): boolean;
            procedure show;
            function errorHandler(count:integer): boolean;
        end;

implementation
    procedure TCQueue.init;
        var
            i: integer;
        begin
            for i:=1 to 50 do
                val[i] := 'a';
            len := 0;
        end;

    function TCQueue.push(c:char): boolean;
        begin
            
            if errorHandler(len+1) then begin
                inc(len);
                val[len] := c;
                push := true;
            end
            else
                push := false;
        end;
    
    function TCQueue.pop(var c:char): boolean;
        var
            i: integer;
        begin
            if errorHandler(len) then begin
                c := val[1];
                dec(len);
                for i:=1 to len do
                    val[i] := val[i+1];
                pop := true;
            end
            else
                pop := false;
        end;

    function TCQueue.top(var c:char): boolean;
        begin
            if errorHandler(len) then begin
                c := val[1];
                top := true;
            end
            else
                top := false;
        end;

    procedure TCQueue.show;
        var
            i: integer;
        begin
            if errorHandler(len) then begin
                write('Состояние очереди: [');
                for i:=1 to len-1 do begin
                    write(val[i], ', ');
                end;
                writeln(val[len], ']');
            end;
        end;
    
    function TCQueue.errorHandler(count:integer): boolean;
        var
            error: byte;
        begin
            if (count > 50) then
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
end.