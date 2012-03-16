{ stck_alg1_ga.pp    ƒã¤ã«¨­ €.Ž., ¬ àâ 2012£.  }
{                                               }
{ à¨¬¥à à¥ «¨§ æ¨¨ áâ¥ª®¢®£®  «£®à¨â¬  ¯¥à¥¢®¤ }
{    à¨ä¬¥â¨ç¥áª®£® ¢ëà ¦¥­¨ï ¢ áª®¡®ç­®© § ¯¨- }
{   á¨ ¢ ®¡à â­ãî ¯®«ìáªãî § ¯¨áì.              }
{ ˆ ¯®¤áç¥â ¢ëà ¦¥­¨ï, ãç¨âë¢ ï ¢å®¤­ë¥ ¤ ­­ë¥  }
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
          PutMsgErr('Ž¦¨¤ « áì ®¯¥à æ¨ï!'); 
          exit
        end;
        mov2strout(curc); 
        wasOprnd := true; 
        wasOp := false
      end
      else
        if (curc = '(') and not wasOprnd then
          if not op_stack.push(curc)then begin
            PutMsgErr('C«¨èª®¬ ¡®«ìè®¥ ¢ëà ¦¥­¨¥ - ¯¥à¥¯®«­¥­¨¥ áâ¥ª  !'); exit
          end else
        else
          if curc = ')' then begin c := op_stack.pop;
            while (c <> '(') and (c <> EOSt) do begin
              mov2strout(c); 
              c := op_stack.pop
            end;
            if c = EOSt then begin
              PutMsgErr('¥¤®¯ãáâ¨¬ ï «¨â¥à  ¢ ¢ëà ¦¥­¨¨. „«ï ")" ­¥â "(" !');
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
                  PutMsgErr('‘¨áâ¥¬­ ï ®è¨¡ª : C«¨èª®¬ ¡®«ìè®¥ ¢ëà ¦¥­¨¥ - ¯¥à¥¯®«­¥­¨¥ áâ¥ª  !');
                  exit
                end
                else wasOp := true
              end
              else begin PutMsgErr('Ž¦¨¤ « áì ®¯¥à æ¨ï!'); exit end;
            end
            else begin PutMsgErr('Ž¦¨¤ «áï ®¯¥à ­¤!'); exit end;
      nxtc
    end;
    if not wasOprnd then begin 
      PutMsgErr('Ž¦¨¤ «áï ®¯¥à ­¤!');
      exit
    end;

    c := op_stack.pop;

    while c <> EOSt do
      if c <> '(' then begin
        mov2strout(c);
        c := op_stack.pop
      end
      else begin 
        PutMsgErr('¥ § ªàëâ ï "(" !'); 
        exit
      end;

    opz := true
  end;

// @brief:
//  ‚ë¯®«­¥­¨¥  à¨ä¬¥â¨ç¥áª®© ®¯¥à æ¨¨ ­ ¤ ¤¢ã¬ï ç¨á« ¬¨.
//  „¥«¥­¨¥ æ¥«®ç¨á«¥­­®¥, â.ª. áâ¥ª æ¥«®ç¨á«¥­­ë©
//  ¥§ã«ìâ â ¢®§¢à é ¥âáï äã­ªæ¨¥©
function do_operation(op1,op2:integer; c: char): integer;
  begin
    if c = '+' then do_operation := op1 + op2
    else if c = '-' then do_operation := op1 - op2
    else if c = '*' then do_operation := op1 * op2
    else if c = '/' then do_operation := op1 div op2
    else begin
      PutMsgErr('¥¨§¢¥áâ­ë© ®¯¥à â®à!');
      exit;
    end;
  end;

// @brief:
//   §¡®à áâà®ª¨ ¢¨¤  [L=[[+|-]D+];]+
//  ¥§ã«ìâ â § ­®á¨âáï ¢ ¬ áá¨¢ val[]
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
          PutMsgErr('Ž¦¨¤ «áï §­ ª à ¢¥­áâ¢ !');
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
          wasMinus := true;
        end
        else begin
          PutMsgErr('Ž¦¨¤ «®áì ç¨á«®!');
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
          PutMsgErr('Ž¦¨¤ «áï §­ ª ; !');
          exit;
        end;
      end
      
      else begin
        PutMsgErr('¥¨§¢¥áâ­ë© á¨¬¢®«!');
        exit;
      end;
    end;

    isValCorrect := true;
  end;

// @brief:
//  ®¤áç¥â §­ ç¥­¨ï ¢ëà ¦¥­¨ï ¢ Ž‡
//  ¥§ã«ìâ â ¢®§¢à é ¥âáï äã­ªæ¨¥©
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
  writeln('*** Stck_alg1_ga.pp      ƒã¤ã«¨­ €.Ž., ¬ àâ 2012 £.');
  writeln('***  ¥à¥¢®¤ ¢ Ž‡ (áâ¥ª®¢ë©  «£®à¨â¬)  à¨ä¬¥â¨ç¥áª®£®');
  writeln('***   ¢ëà ¦¥­¨ï á® áª®¡ª ¬¨:');
  writeln('***     E::= T[[+|-]T]* ');
  writeln('***     T::= M[[*|/]M]*');
  writeln('***     M::= [L|(E)]');
  writeln('***     L::=<¬ «¥­ìª ï ¡ãª¢  « â¨­áª®£®  «ä ¢¨â >');
  writeln('***  ˆ ¯®¤áç¥â ¢ëà ¦¥­¨ï, ãç¨âë¢ ï ¢å®¤­ë¥ ¤ ­­ë¥:');
  writeln('***     [L=[[+|-]D+];]+');
  writeln('');
  writeln('>> ‚¢¥¤¨â¥ áâà®ªã á  à¨ä¬¥â¨ç¥áª¨¬ ¢ëà ¦¥­¨¥¬ (Enter-ª®­¥æ):');
  readln(in_str);

  while length(in_str) <> 0 do begin
    if opz then begin
      writeln('Ž‡: ', str_out);
      writeln;

      writeln('>> ‚¢¥¤¨â¥ §­ ç¥­¨ï (Enter - ­®¢®¥  à¨ä¬. ¢ëà.): ');
      readln(in_str);

      while length(in_str) <> 0 do begin
        isValCorrect := false;
        get_val(val, isValCorrect);

        if isValCorrect then begin
          in_str := str_out; // opz
          result := calculate_opz(val);
          writeln;
          writeln('¥§ã«ìâ â: ', result);
        end;
        writeln('>> ‚¢¥¤¨â¥ §­ ç¥­¨ï (Enter - ­®¢®¥  à¨ä¬. ¢ëà.): ');
        readln(in_str);
      end;
    end;

    writeln('>> ‚¢¥¤¨â¥ áâà®ªã á  à¨ä¬¥â¨ç¥áª¨¬ ¢ëà ¦¥­¨¥¬ (Enter-ª®­¥æ):');
    readln(in_str);
  end;
  writeln('>> ®ª !!!  ¦¬¨â¥ Enter!');
  readln
end.
