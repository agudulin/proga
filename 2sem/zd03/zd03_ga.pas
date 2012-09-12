uses usstr_kv, ucst_ga;
const
    outputStr: string = '';
var
    opStack: TCStack;

function prior(c:char):byte;
begin
    case c of
        '(': prior := 1;
        '+','-': prior := 2;
        '*','/': prior := 3;
        else prior := 0;
    end;
end;

procedure mov2outputStr(c:char);
begin
    outputStr := outputStr + c;
end;

function stringAnalyzer(inputStr:string): boolean;
var top, c: char;
    leftOp: integer;
begin
    initScanStr;
    opStack.init;
    leftOp := 0;
    while nxtc <> EOS do begin
        //write('output: ', outputStr, '  ');
        //opStack.show;
        if errorMessage <> '' then begin
            PutMsgErr(errorMessage);
            break;
        end;
        case curc of
            '(': begin
                    inc(leftOp);
                    opStack.push(curc);
                end;
            ')': begin
                    if leftOp <> 0 then begin
                        dec(leftOp);
                        while opStack.pop(c) and (c <> '(') do
                            mov2outputStr(c);
                    end
                    else begin
                        PutMsgErr('некорректно поставлена скобка');
                        break;
                    end;
                end;
            '+','-','*','/': begin
                while opStack.top(c) and (prior(curc) <= prior(c)) do begin
                    opStack.pop(c);
                    mov2outputStr(c);
                end;
                
                opStack.top(c);
                if prior(curc) > prior(c) then
                    opStack.push(curc);
            end;
            'a'..'z','A'..'Z','0'..'9':
                mov2outputStr(curc);
            else begin
                PutMsgErr('недопустимый символ');
                break;
            end;
        end;
    end;
    //opStack.show;
    while opStack.pop(c) do begin
        mov2outputStr(c);
    end;

    if wasErr then stringAnalyzer := false
    else stringAnalyzer := true;
end;

begin
    writeln('*** zd03_ga.pas            Гудулин А.О. февраль 2012 г. ***');
    writeln('*** Проверка синтаксической правильности выражения      ***');
    writeln('***     и вывод на экран обратной польской записи       ***');
    writeln;
    writeln('Введите выражение (Enter - выход): ');
    write('>>> ');
    readln(inputStr);
    
    while length(inputStr) <> 0 do begin
        outputStr := '';
        writeln;
        if stringAnalyzer(inputStr) then begin
            writeln('Результат: ', outputStr);
            writeln;
        end;
        writeln('Введите выражение (Enter - выход): ');
        write('>>> ');
        readln(inputStr);
    end;
end.