// uist_ga.pas          12.02.2012  Гудулин А.О.
// Модуль, реализующий представление стека ОБЪЕКТОМ TIStack
// с соответствующими операциями работы со стеком

unit uist_ga;

interface
    type
        TIStack = Object
            len: integer;
            val: array[1..10] of integer;
            constructor init;
            function push(n:integer): boolean;
            function pop(var n:integer): boolean;
            function top(var n:integer): boolean;
            procedure show;
            function errorHandler(count:integer): boolean;
        end;
    const
        errorMessage:string = '';

implementation
    constructor TIStack.init;
        {var
            i: integer;}
        begin
            {for i:=1 to 10 do
                val[i] := 0;}
            len := 0;
        end;

    function TIStack.push(n:integer): boolean;
        begin
            if errorHandler(len+1) then begin
                inc(len);
                val[len] := n;
                push := true;
            end
            else
                push := false;
        end;
    
    function TIStack.pop(var n:integer): boolean;
        begin
            if errorHandler(len) then begin
                n := val[len];
                dec(len);
                pop := true;
            end
            else
                pop := false;
        end;

    function TIStack.top(var n:integer): boolean;
        begin
            if errorHandler(len) then begin
                n := val[len];
                top := true;
            end
            else
                top := false;
        end;
    
    procedure TIStack.show;
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

    function TIStack.errorHandler(count:integer): boolean;
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