// ucst_ga.pas          12.02.2012  Гудулин А.О.
// Модуль, реализующий представление стека ОБЪЕКТОМ TCStack
// с соответствующими операциями работы со стеком

unit ucst_ga;

interface
    type
        TCStack = Object
            len: integer;
            val: array[1..50] of char;
            constructor init;
            function push(c:char): boolean;
            function pop(var c:char): boolean;
            function top(var c:char): boolean;
            procedure show;
            function errorHandler(count:integer): boolean;
        end;
    const
        errorMessage:string = '';

implementation
    constructor TCStack.init;
        {var
            i: integer;}
        begin
            {for i:=1 to 50 do
                val[i] := 'a';}
            len := 0;
        end;

    function TCStack.push(c:char): boolean;
        begin
            if errorHandler(len+1) then begin
                inc(len);
                val[len] := c;
                push := true;
            end
            else
                push := false;
        end;
    
    function TCStack.pop(var c:char): boolean;
        begin
            if errorHandler(len) then begin
                c := val[len];
                dec(len);
                pop := true;
            end
            else
                pop := false;
        end;

    function TCStack.top(var c:char): boolean;
        begin
            if errorHandler(len) then begin
                c := val[len];
                top := true;
            end
            else
                top := false;
        end;

    procedure TCStack.show;
        var
            i: integer;
        begin
            if errorHandler(len) then begin
                write('Состояние стека: [');
                for i:=1 to len-1 do begin
                    write(val[i], ', ');
                end;
                writeln(val[len], ']');
            end;
        end;
    
    function TCStack.errorHandler(count:integer): boolean;
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
                        errorMessage := 'Ошибка! Переполнение стека.';
                        errorHandler := false;
                    end;
                2: begin
                        errorMessage := 'Ошибка! В стеке нет элементов.';
                        errorHandler := false;
                    end;
            end;
        end;
end.