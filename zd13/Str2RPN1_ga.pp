{  Str2RPN1_ga.pp                  Гудулин А.О., март 2012 г.}
{    Анализ синтаксической правильности (рекурсивнй спуск)   }
{                                                            }
{               E::=T [ [+|-] T]*                            }
{               T::=M [ [*|/] M]*                            }
{               M::=[ <буква> | (E) ]                        }
{              <буква>::= <малая буква латинского алфавита>  }
{                                                            }
{   Задание: Превратите эту программу в программу анализа и  }
{     перевода строки с арифметическим выражением в строку с }
{     обратной польской записью этого выражения.             }
{                                                            }

uses usstr_kv, ucst_kv;

{$B-}

var str_out:string;

procedure mov2strout(c:char);
  begin str_out := str_out + c end;


function Analysis: boolean;
   var c:char;
       op_stack: TCStack;

   procedure T; forward;
   procedure M; forward;
  {--------------------------}
   procedure E;
     begin  T;
       while (curc='+') or (curc='-') do begin
         if (op_stack.top <> '(') and (op_stack.top <> EOSt) then begin
           mov2strout(op_stack.pop);
         end;
         if not op_stack.push(curc) then begin
             PutMsgErr('Системная ошибка: Cлишком большое выражение - переполнение стека !');
             exit
         end;
         NxtC;
         T;
       end
     end {E};
  {--------------------------}
   procedure T;
     begin  M;
       while (curc='*') or (curc='/') do begin
         if (op_stack.top <> EOSt) and (op_stack.top <> '(') then
           mov2strout(op_stack.pop);
         if not op_stack.push(curc)then begin
           PutMsgErr('Системная ошибка: Cлишком большое выражение - переполнение стека !');
           exit
         end;
         NxtC;
         M;
       end
     end {M};
  {--------------------------}
   procedure M;
     begin
       if curc in ['a'..'z'] then begin
          mov2strout(curc);
          NxtC;
       end
       else
       if curc = '(' then begin
         if not op_stack.push(curc) then begin
            PutMsgErr('Cлишком большое выражение - переполнение стека !');
            exit;
         end;
         NxtC;
         E;
         if curc = ')' then begin
            c := op_stack.pop;
            while (c <> '(') and (c <> EOSt) do begin
              mov2strout(c);
              c := op_stack.pop;
            end;
            NxtC;
         end
         else
            PutMsgErr('Ожидалась ")"')
       end
       else
          PutMsgErr('Ожидалась буква или "("');
     end {M};
  {--------------------------}
 begin
    op_stack.Init;
    str_out := '';
    initScanStr;
    NxtC;
    E;

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

    if curc <> EOS then
      PutMsgErr('Ожидалась операция!');

    Analysis := not wasErr;
 end {Analysis};

 {-----------------------------------------------}


 begin
   writeln;
   writeln('*** Str2RPN1_ga      Гудулин А.О. март 2012 г. ');
   writeln('*** Проверка синтаксической правильности записи');
   writeln('*** арифметического скобочного выражения. Рекурсивный спуск!');
   writeln('*** Арифметическое выражение определяется следующим образом:');
   writeln('***     E::=T [ [+|-] T]*  ');
   writeln('***     T::=M [ [*|/] M]*  ');
   writeln('***     M::=[ <буква> | (E) ] ');
   writeln('***     <буква>::= <малая буква латинского алфавита> ');
   writeln('*** Задание: Превратите эту программу из программы ');
   writeln('***   анализа синтаксической правильности в программу ');
   writeln('***   анализа и перевода в обратную польскую запись (RPN).');
   writeln;
   writeln('Введите выражение Е (Enter -выход из программы): ');
   readln(in_str);

   while in_str <> '' do begin
     if Analysis then begin
        writeln('Синтаксически верно!');
        writeln('ОПЗ >> ', str_out);
        writeln;
     end;
     writeln('Введите выражение Е (Enter -выход из программы): ');
     readln(in_str)
   end;
   writeln('Работа с программой закончена! Нажмите Enter!');
   readln
 end.

