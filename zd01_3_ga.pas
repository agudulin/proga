// zd01_3_ga.pas            12.02.2012  Гудулин А.О.
// Программа тестирования модуля ucst_ga

uses ucst_ga;
var
    stack: TCStack;
    inputStr: string;
    i: char;

procedure showHelp;
    begin
        writeln('Список доступных команд:');
        writeln('push':8);
        writeln('pop':7);
        writeln('top':7);
        writeln('help':8);
        writeln('show':8);
        writeln('exit':8);
        writeln;
    end;

begin
    stack.init;
    writeln('*** zd01_3_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций работы со стеком');
    writeln('***   push, pop, top');
    inputStr := '';
    writeln;
    showHelp;
    while(true) do begin
        writeln('Введите команду:');
        write('>>> ');
        readln(inputStr);
        writeln;
        case(inputStr) of
            'push': begin
                        writeln('** Введите новое значение (char):');
                        write('>>> ');
                        readln(i);
                        if stack.push(i) then begin
                            writeln('** Значение помещено в стек');
                            stack.show;
                        end;
                        writeln;
                    end;
            'pop' : begin
                        if stack.pop(i) then begin
                            write('** Значение, извлеченное из стека: ');
                            writeln(i);
                            if stack.len > 0 then stack.show;
                        end;
                        writeln;
                    end;
            'top' : begin
                        if stack.top(i) then begin
                            write('** Значение, извлеченное из стека: ');
                            writeln(i);
                            stack.show;
                        end;
                        writeln;
                    end;
            'show': begin
                        stack.show;
                        writeln;
                    end;
            'help': showHelp;
            'exit': exit;
            else
                showHelp;
        end;
    end;
end.