// zd02_2_ga.pas            12.02.2012  Гудулин А.О.
// Программа тестирования модуля uique_ga

uses uique_ga;
var
    queue: TIQueue;
    inputStr: string;
    i: integer;

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
    queue.init;
    writeln('*** zd02_2_ga.pas          12.02.2012  Гудулин А.О.');
    writeln('*** Программа тестирования функций работы с очередью');
    writeln('***   push, pop, top');
    inputStr := '';
    writeln;
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
                if queue.push(i) then begin
                    writeln('** Значение помещено в очередь');
                    queue.show;
                end;
                writeln;
            end
            else if inputStr = 
            'pop' then begin
                if queue.pop(i) then begin
                    write('** Значение, извлеченное из очереди: ');
                    writeln(i);
                    if queue.len > 0 then queue.show;
                end;
                writeln;
            end
            else if inputStr = 
            'top' then begin
                if queue.top(i) then begin
                    write('** Значение, извлеченное из очереди: ');
                    writeln(i);
                    queue.show;
                end;
                writeln;
            end
            else if inputStr = 
            'show' then begin
                queue.show;
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