// ucque_ga.pas         12.02.2012  Гудулин А.О.
// Модуль, реализующий представление очереди ОБЪЕКТОМ TIQueue
// с соответствующими операциями работы с очередью

unit ucque_ga;

interface
    type
        TIQueue = Object
            len: integer;
            val: array[1..50] of char;
            procedure init;
            function push(c:char): boolean;
            function pop(var c:char): boolean;
            function top(var c:char): boolean;
            function error_handler(count:integer): boolean;
        end;

implementation
    procedure TIQueue.init;
        var
            i: integer;
        begin
            for i:=1 to 50 do
                val[i] := 'a';
            len := 0;
        end;

    function TIQueue.push(c:char): boolean;
        begin
            
            if error_handler(len+1) then begin
                inc(len);
                val[len] := c;
                push := true;
            end
            else
                push := false;
        end;
    
    function TIQueue.pop(var c:char): boolean;
        var
            i: integer;
        begin
            if error_handler(len) then begin
                c := val[1];
                dec(len);
                for i:=1 to len do
                    val[i] := val[i+1];
                pop := true;
            end
            else
                pop := false;
        end;

    function TIQueue.top(var c:char): boolean;
        begin
            if error_handler(len) then begin
                c := val[1];
                top := true;
            end
            else
                top := false;
        end;
    
    function TIQueue.error_handler(count:integer): boolean;
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
                0: error_handler := true;
                1: begin
                        writeln('Ошибка! Переполнение очереди.');
                        error_handler := false;
                    end;
                2: begin
                        writeln('Ошибка! В очереди нет элементов.');
                        error_handler := false;
                    end;
            end;
        end;
end.