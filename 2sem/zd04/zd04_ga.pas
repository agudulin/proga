//zd04_ga.pas       Гудулин А.О февраль 2012
// Проверка синтаксической правильности и вывод на экран
//  символов, заключенных во внутренние скобки

uses usstr_kv, ucst_ga;
const
    outputStr: string = '';
var
    opStack: TCStack;

procedure mov2outputStr(c:char);
begin
    outputStr := c + outputStr;
end;

function stringAnalyzer(inputStr:string): boolean;
var c: char;
    isOpen1, isOpen2, isOpen3: boolean;
    bkt1, bkt2, bkt3: integer;
begin
    initScanStr;
    opStack.init;
    isOpen1 := false; isOpen2 := false; isOpen3 := false;
    bkt1 := 0; bkt2 := 0; bkt3 := 0;
    while nxtc <> EOS do begin
        //write('output: ', outputStr, '  '); //DEBUG
        //opStack.show; //DEBUG
        if errorMessage <> '' then begin
            PutMsgErr(errorMessage);
            break;
        end;
        case curc of
            '(': begin
                isOpen1 := true;
                isOpen2 := false;
                isOpen3 := false;
                opStack.push(curc);
                inc(bkt1);
            end;
            '[': begin
                isOpen1 := false;
                isOpen2 := true;
                isOpen3 := false;
                opStack.push(curc);
                inc(bkt2);
            end;
            '{': begin
                isOpen1 := false;
                isOpen2 := false;
                isOpen3 := true;
                opStack.push(curc);
                inc(bkt3);
            end;
            
            ')': begin
                    dec(bkt1);
                    while opStack.pop(c) and isOpen1 do begin
                        if c = '(' then begin 
                            isOpen1 := false;
                            mov2outputStr(' ');
                            break;
                        end;
                        mov2outputStr(c);
                    end;
                end;
            ']': begin
                    dec(bkt2);
                    while opStack.pop(c) and isOpen2 do begin
                        if c = '[' then begin 
                            isOpen2 := false;
                            mov2outputStr(' ');
                            break;
                        end;
                        mov2outputStr(c);
                    end;
                end;
            '}': begin
                    dec(bkt3);
                    while opStack.pop(c) and isOpen3 do begin
                        if c = '{' then begin 
                            isOpen3 := false;
                            mov2outputStr(' ');
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
    
    //writeln(bkt1, ': ', bkt2, ': ', bkt3); //DEBUG

    if (bkt1 <> 0) or (bkt2 <> 0) or (bkt3 <> 0) then
        PutMsgErr('неравное количество открывающихся и закрывающихся скобок');

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
        outputStr := '';
        if stringAnalyzer(inputStr) then begin
            writeln('Результат:', outputStr);
            writeln;
        end;
        writeln('Введите выражение (Enter - выход): ');
        write('>>> ');
        readln(inputStr);
    end;
end.