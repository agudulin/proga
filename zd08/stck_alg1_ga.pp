{ stck_alg1_ga.pp    Гудулин А.О., март 2012г.  }
{                                               }
{ Пример реализации стекового алгоритма перевода}
{   арифметического выражения в скобочной запи- }
{   си в обратную польскую запись.              }
{ И подсчет выражения, учитывая входные данные  }
{                                               }
{                                               }

uses uist_kv, ucst_kv, usstr_kv;

type TIVal = array ['a'..'z'] of integer;

var chars, str_out:string;
    val: TIVal;
    isValCorrect: boolean;
    result: integer;

function prior(c:char):byte;
  begin
    prior := 0;
    
    if c = '(' then prior := 1
    else
    if (c = '+') or (c = '-') then prior := 2
    else
    if (c = '*') or (c = '/') then prior := 3;
  end;

procedure mov2strout(c:char);
  begin str_out := str_out + c end;

function opz:boolean;
  var c:char; wasOprnd,wasOp:boolean;
      op_stack: TCStack;
  begin 
    op_stack.Init; 
    str_out := ''; 
    opz := false;
    initScanStr;
    wasOprnd := false; 
    wasOp := false;
    nxtc;

    while curc <> EOS do begin
      if curc in ['a'..'z'] then begin
        if wasOprnd then begin 
          PutMsgErr('Ожидалась операция!'); 
          exit
        end;
        mov2strout(curc); 
        wasOprnd := true; 
        wasOp := false
      end
      else
        if (curc = '(') and not wasOprnd then
          if not op_stack.push(curc)then begin
            PutMsgErr('Cлишком большое выражение - переполнение стека !'); exit
          end else
        else
          if curc = ')' then begin c := op_stack.pop;
            while (c <> '(') and (c <> EOSt) do begin
              mov2strout(c); 
              c := op_stack.pop
            end;
            if c = EOSt then begin
              PutMsgErr('Недопустимая литера в выражении. Для ")" нет "(" !');
              exit
            end
          end
          else
            if wasOprnd then begin 
              wasOprnd := false;
              if not wasOp and (prior(curc) > 1) then begin 
                wasOp := true;
                while prior(curc) <= prior(op_stack.top) do
                  mov2strout(op_stack.pop);
                if not op_stack.push(curc)then begin
                  PutMsgErr('Системная ошибка: Cлишком большое выражение - переполнение стека !');
                  exit
                end
                else wasOp := true
              end
              else begin PutMsgErr('Ожидалась операция!'); exit end;
            end
            else begin PutMsgErr('Ожидался операнд!'); exit end;
      nxtc
    end;
    if not wasOprnd then begin 
      PutMsgErr('Ожидался операнд!');
      exit
    end;

    c := op_stack.pop;

    while c <> EOSt do
      if c <> '(' then begin
        mov2strout(c);
        c := op_stack.pop
      end
      else begin 
        PutMsgErr('Не закрытая "(" !'); 
        exit
      end;

    opz := true
  end;

// @brief:
//  Выполнение арифметической операции над двумя числами.
//  Деление целочисленное, т.к. стек целочисленный
//  Результат возвращается функцией
function do_operation(op1,op2:integer; c: char): integer;
  begin
    if c = '+' then do_operation := op1 + op2
    else if c = '-' then do_operation := op1 - op2
    else if c = '*' then do_operation := op1 * op2
    else if c = '/' then do_operation := op1 div op2
    else begin
      PutMsgErr('Неизвестный оператор!');
      exit;
    end;
  end;

// @brief:
//  Разбор строки вида [L=[[+|-]D+];]+
//  Результат заносится в массив val[]
procedure get_val(var val:TIVal; var isValCorrect:boolean);
  var wasLit, wasEqual, wasInt, wasMinus: boolean;
      c: char;
      i: integer;
  begin
    wasLit := false;
    wasEqual := false;
    wasInt := false;
    wasMinus := false;
    initScanStr;
    nxtc;

    while curc <> EOS do begin
      if curc in ['a'..'z'] then begin
        c := curc;
        wasLit := true;
        wasEqual := false;
        nxtc;
        continue;
      end;

      if wasLit = true then begin
        if curc = '=' then begin
          wasEqual := true;
          wasLit := false;
          nxtc;
          continue;
        end
        else begin
          PutMsgErr('Ожидался знак равенства!');
          exit;
        end;
      end;

      if wasEqual = true then begin
        if curc = '-' then begin
          wasMinus := true;
          nxtc;
        end
        else if curc = '+' then begin
          wasMinus := false;
          nxtc;
        end;
        if curc in ['0'..'9'] then begin
          i := ord(curc) - 48;
          while nxtc in ['0'..'9'] do begin
            i := i * 10 + ord(curc) - 48;
          end;
          if wasMinus = true then
            i := -i;
          wasEqual := false;
          wasInt := true;
          wasMinus := false;
        end
        else begin
          PutMsgErr('Ожидалось число!');
          exit;
        end;
      end;

      if wasInt = true then begin
        if curc = ';' then begin
          val[c] := i;
          nxtc;
          continue;
        end
        else begin
          PutMsgErr('Ожидался знак ; !');
          exit;
        end;
      end
      
      else begin
        PutMsgErr('Неизвестный символ!');
        exit;
      end;
    end;

    isValCorrect := true;
  end;

// @brief:
//  Подсчет значения выражения в ОПЗ
//  Результат возвращается функцией
function calculate_opz(val: TIVal): integer;
  var op1, op2: integer;
      stack: TIStack;
  begin
    stack.Init;
    initScanStr;
    nxtc;

    while curc <> EOS do begin
      if curc in ['a'..'z'] then begin
        stack.push( val[curc] );
      end
      else begin
        op2 := stack.pop;
        op1 := stack.pop;
        stack.push( do_operation(op1, op2, curc) );
      end;
      nxtc;
    end;

    calculate_opz := stack.pop;  
  end;


begin
  writeln;
  writeln('*** Stck_alg1_ga.pp      Гудулин А.О., март 2012 г.');
  writeln('***  Перевод в ОПЗ (стековый алгоритм) арифметического');
  writeln('***   выражения со скобками:');
  writeln('***     E::= T[[+|-]T]* ');
  writeln('***     T::= M[[*|/]M]*');
  writeln('***     M::= [L|(E)]');
  writeln('***     L::=<маленькая буква латинского алфавита>');
  writeln('***  И подсчет выражения, учитывая входные данные:');
  writeln('***     [L=[[+|-]D+];]+');
  writeln('');
  writeln('>> Введите строку с арифметическим выражением (Enter-конец):');
  readln(in_str);

  while length(in_str) <> 0 do begin
    if opz then begin
      writeln('ОПЗ: ', str_out);
      writeln;

      writeln('>> Введите значения (Enter - новое арифм. выр.): ');
      readln(in_str);

      while length(in_str) <> 0 do begin
        isValCorrect := false;
        get_val(val, isValCorrect);

        if isValCorrect then begin
          in_str := str_out; // opz
          result := calculate_opz(val);
          writeln;
          writeln('Результат: ', result);
        end;
        writeln('>> Введите значения (Enter - новое арифм. выр.): ');
        readln(in_str);
      end;
    end;

    writeln('>> Введите строку с арифметическим выражением (Enter-конец):');
    readln(in_str);
  end;
  writeln('>> Пока!!! Нажмите Enter!');
  readln
end.
