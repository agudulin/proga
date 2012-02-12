// zd01_3_ga.pas            12.02.2012  Гудулин А.О.
// Программа тестирования модуля ucst_ga

uses ucst_ga;
var
    stack: TCStack;
    in_str: string;
    i: char;

procedure show_help;
    begin
        writeln('Список доступных команд:');
        writeln('push':8);
        writeln('pop':7);
        writeln('top':7);
        writeln('help':8);
        writeln('exit':8);
        writeln;
    end;

begin
    stack.init;
    writeln('*** zd01_3_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций работы со стеком');
    writeln('***                        push, pop, top');
    in_str := '';
    writeln;
    show_help;
    while(true) do begin
        writeln('Введите команду:');
        write('>>> ');
        readln(in_str);
        writeln;
        case(in_str) of
            'push': begin
                        writeln('** Введите новое значение (char):');
                        write('>>> ');
                        readln(i);
                        if stack.push(i) then
                            writeln('** Значение помещено в стек');
                        writeln;
                    end;
            'pop' : begin
                        if stack.pop(i) then begin
                            writeln('** Значение, извлеченное из стека:');
                            writeln(i);
                        end;
                        writeln;
                    end;
            'top' : begin
                        if stack.top(i) then begin
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