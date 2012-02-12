// zd01_1_ga.pas        Гудулин А.О.    12.02.2012
// Программа тестирования функций работы со стеком

type
    TStack = array[0..10] of integer;

var
    in_str: string;
    stack: TStack;
    i: integer;

procedure init(var stack:TStack);
    var
        i: integer;
    begin
        for i:=1 to 10 do
            stack[i] := 0;
        stack[0] := 0;
    end;

function error_handler(count:integer): boolean;
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
            0: error_handler := true;
            1: begin
                    writeln('Ошибка! Переполнение стека.');
                    error_handler := false;
                end;
            2: begin
                    writeln('Ошибка! В стеке нет элементов.');
                    error_handler := false;
                end;
        end;
    end;

function push(var stack:TStack; val:integer): boolean;
    var
        count: integer;
    begin
        count := stack[0];
        if error_handler(count+1) then begin
            inc(count);
            stack[0] := count;
            stack[count] := val;
            push := true;
            {writeln('###> DEBUG ', stack[0]);}
        end
        else
            push := false;
    end;

function pop(var stack:TStack; var val:integer): boolean;
    var
        count: integer;
    begin
        count := stack[0];
        if error_handler(count) then begin
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
        if error_handler(count) then begin
            val := stack[count];
            top := true;
        end
        else
            top := false;
    end;

procedure show_help;
    begin
        writeln('Список доступных команд:');
        writeln('push':8);
        writeln('pop':7);
        writeln('top':7);
        writeln('help':8);
        writeln('exit':8);
    end;

begin
    init(stack);
    writeln('*** zd01_1_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций push, pop, top');
    writeln('***                        работы со стеком ');
    in_str := '';
    show_help;
    while(true) do begin
        writeln('Введите команду:');
        write('>>> ');
        readln(in_str);
        writeln;
        case(in_str) of
            'push': begin
                        writeln('** Введите новое значение (int):');
                        write('>>> ');
                        readln(i);
                        if push(stack, i) then
                            writeln('** Значение помещено в стек');
                        writeln;
                    end;
            'pop' : begin
                        if pop(stack, i) then begin
                            writeln('** Значение, извлеченное из стека:');
                            writeln(i);
                        end;
                        writeln;
                    end;
            'top' : begin
                        if top(stack, i) then begin
                            writeln('** Значение, извлеченное из стека:');
                            writeln(i);
                        end;
                        writeln;
                    end;
            'help': show_help;
            'exit': exit;
            else
                show_help;
        end;
    end;
end.