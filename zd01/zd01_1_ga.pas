// zd01_1_ga.pas        Гудулин А.О.    12.02.2012
// Программа тестирования функций работы со стеком

type
    TStack = array[0..10] of integer;

const
    errorMessage:string = '';

var
    stack: TStack;
    inputStr: string;
    i: integer;

procedure init(var stack:TStack);
    {var
        i: integer;}
    begin
        {for i:=1 to 10 do
            stack[i] := 0;}
        stack[0] := 0;
    end;

function errorHandler(count:integer): boolean;
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

function push(var stack:TStack; val:integer): boolean;
    var
        count: integer;
    begin
        count := stack[0];
        if errorHandler(count+1) then begin
            inc(count);
            stack[0] := count;
            stack[count] := val;
            push := true;
        end
        else
            push := false;
    end;

function pop(var stack:TStack; var val:integer): boolean;
    var
        count: integer;
    begin
        count := stack[0];
        if errorHandler(count) then begin
            val := stack[count];
            stack[0] := count-1;
            pop := true;
        end
        else
            pop := false;
    end;

function top(var stack:TStack; var val:integer): boolean;
    var
        count: integer;
    begin
        count := stack[0];
        if errorHandler(count) then begin
            val := stack[count];
            top := true;
        end
        else
            top := false;
    end;

procedure show(var stack:TStack);
    var
        i, count: integer;
    begin
        count := stack[0];
        if errorHandler(count) then begin
            write('Состояние стека: [');
            for i:=1 to count-1 do begin
                write(stack[i], ', ');
            end;
            writeln(stack[count], ']');
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
    init(stack);
    writeln('*** zd01_1_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций push, pop, top');
    writeln('***   работы со стеком ');
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
                if push(stack, i) then begin
                    writeln('** Значение помещено в стек');
                    show(stack);
                end
                else
                    writeln(errorMessage);
                writeln;
            end
            else if inputStr = 
            'pop' then begin
                if pop(stack, i) then begin
                    write('** Значение, извлеченное из стека: ');
                    writeln(i);
                    if stack[0] > 0 then show(stack);
                end
                else
                    writeln(errorMessage);
                writeln;
            end
            else if inputStr = 
            'top' then begin
                if top(stack, i) then begin
                    write('** Значение, извлеченное из стека: ');
                    writeln(i);
                end
                else
                    writeln(errorMessage);
                writeln;
            end
            else if inputStr =
            'show' then begin 
                show(stack);
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