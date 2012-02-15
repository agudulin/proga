// uique_ga.pas         12.02.2012  Гудулин А.О.
// Модуль, реализующий представление очереди ОБЪЕКТОМ TIQueue
// с соответствующими операциями работы с очередью

unit uique_ga;

interface
    type
        TIQueue = Object
            len: integer;
            val: array[1..10] of integer;
            constructor init;
            function push(n:integer): boolean;
            function pop(var n:integer): boolean;
            function top(var n:integer): boolean;
            procedure show;
            function errorHandler(count:integer): boolean;
        end;

implementation
    constructor TIQueue.init;
        {var
            i: integer;}
        begin
            {for i:=1 to 10 do
                val[i] := 0;}
            len := 0;
        end;

    function TIQueue.push(n:integer): boolean;
        begin
            
            if errorHandler(len+1) then begin
                inc(len);
                val[len] := n;
                push := true;
            end
            else
                push := false;
        end;
    
    function TIQueue.pop(var n:integer): boolean;
        var
            i: integer;
        begin
            if errorHandler(len) then begin
                n := val[1];
                dec(len);
                for i:=1 to len do
                    val[i] := val[i+1];
                pop := true;
            end
            else
                pop := false;
        end;

    function TIQueue.top(var n:integer): boolean;
        begin
            if errorHandler(len) then begin
                n := val[1];
                top := true;
            end
            else
                top := false;
        end;

    procedure TIQueue.show;
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
    
    function TIQueue.errorHandler(count:integer): boolean;
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
end.