// zd01_2_ga.pas            12.02.2012  Гудулин А.О.
// Программа тестирования модуля uist_ga

uses uist_ga;
var
    stack: TIStack;
    in_str: string;
    i: integer;

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
    stack.init;
    writeln('*** zd01_2_ga.pas          12.02.2012  Гудулин А.О.');
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
                        writeln('** Введите новое значение (int):');
                        write('>>> ');
                        readln(i);
                        stack.push(i);
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