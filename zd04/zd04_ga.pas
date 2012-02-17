uses usstr_kv, ucst_ga;
const
    outputStr: string = '';
var
    opStack: TCStack;

procedure mov2outputStr(c:char);
begin
    outputStr := outputStr + c;
end;

function stringAnalyzer(inputStr:string): boolean;
var c: char;
    isOpen1, isOpen2, isOpen3: boolean;
begin
    initScanStr;
    opStack.init;
    isOpen1 := false; isOpen2 := false; isOpen3 := false;
    while nxtc <> EOS do begin
        //write('output: ', outputStr, '  ');
        opStack.show;
        case curc of
            '(': begin
                isOpen1 := true;
                isOpen2 := false;
                isOpen3 := false;
                opStack.push(curc);
            end;
            '[': begin
                isOpen1 := false;
                isOpen2 := true;
                isOpen3 := false;
                opStack.push(curc);
            end;
            '{': begin
                isOpen1 := false;
                isOpen2 := false;
                isOpen3 := true;
                opStack.push(curc);
            end;
            
            ')': begin
                    while opStack.pop(c) and isOpen1 do begin
                        if c = '(' then begin 
                            isOpen1 := false;
                            break;
                        end;
                        mov2outputStr(c);
                    end;
                end;
            ']': begin
                    while opStack.pop(c) and isOpen2 do begin
                        if c = '[' then begin 
                            isOpen2 := false;
                            break;
                        end;
                        mov2outputStr(c);
                    end;
                end;
            '}': begin
                    while opStack.pop(c) and isOpen3 do begin
                        if c = '{' then begin 
                            isOpen3 := false;
                            break;
                        end;
                        mov2outputStr(c);
                    end;
                end;
            'a'..'z': opStack.push(curc);
            else begin
                PutMsgErr('недопустимый символ');
                break;
            end;
        end;
    end;
 
    if wasErr then stringAnalyzer := false
    else stringAnalyzer := true;
end;

begin
    writeln('zd04_ga.pas            Гудулин А.О. 17.02.2012');
    writeln('Проверка синтаксической правильности и вывод на экран');
    writeln('    символов, заключенных во внутренние скобки');
    writeln;
    writeln('Введите выражение (Enter - выход): ');
    write('>>> ');
    readln(inputStr);
    writeln;
    while length(inputStr) <> 0 do begin
        if stringAnalyzer(inputStr) then begin
            writeln('Результат: ', outputStr);
            writeln;
        end;
        writeln('Введите выражение (Enter - выход): ');
        write('>>> ');
        readln(inputStr);
    end;
end.