{  Str2RPN1_ga.pp                  ��㫨� �.�., ���� 2012 �.}
{    ������ ᨭ⠪��᪮� �ࠢ��쭮�� (४��ᨢ�� ���)   }
{                                                            }
{               E::=T [ [+|-] T]*                            }
{               T::=M [ [*|/] M]*                            }
{               M::=[ <�㪢�> | (E) ]                        }
{              <�㪢�>::= <����� �㪢� ��⨭᪮�� ��䠢��>  }
{                                                            }
{   �������: �ॢ��� ��� �ணࠬ�� � �ணࠬ�� ������� �  }
{     ��ॢ��� ��ப� � ��䬥��᪨� ��ࠦ����� � ��ப� � }
{     ���⭮� ����᪮� ������� �⮣� ��ࠦ����.             }
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
             PutMsgErr('���⥬��� �訡��: C��誮� ����讥 ��ࠦ���� - ��९������� �⥪� !');
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
           PutMsgErr('���⥬��� �訡��: C��誮� ����讥 ��ࠦ���� - ��९������� �⥪� !');
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
            PutMsgErr('C��誮� ����讥 ��ࠦ���� - ��९������� �⥪� !');
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
            PutMsgErr('��������� ")"')
       end
       else
          PutMsgErr('��������� �㪢� ��� "("');
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
        PutMsgErr('�� ������� "(" !');
        exit
      end;

    if curc <> EOS then
      PutMsgErr('��������� ������!');

    Analysis := not wasErr;
 end {Analysis};

 {-----------------------------------------------}


 begin
   writeln;
   writeln('*** Str2RPN1_ga      ��㫨� �.�. ���� 2012 �. ');
   writeln('*** �஢�ઠ ᨭ⠪��᪮� �ࠢ��쭮�� �����');
   writeln('*** ��䬥��᪮�� ᪮��筮�� ��ࠦ����. �����ᨢ�� ���!');
   writeln('*** ��䬥��᪮� ��ࠦ���� ��।������ ᫥���騬 ��ࠧ��:');
   writeln('***     E::=T [ [+|-] T]*  ');
   writeln('***     T::=M [ [*|/] M]*  ');
   writeln('***     M::=[ <�㪢�> | (E) ] ');
   writeln('***     <�㪢�>::= <����� �㪢� ��⨭᪮�� ��䠢��> ');
   writeln('*** �������: �ॢ��� ��� �ணࠬ�� �� �ணࠬ�� ');
   writeln('***   ������� ᨭ⠪��᪮� �ࠢ��쭮�� � �ணࠬ�� ');
   writeln('***   ������� � ��ॢ��� � ������ ������� ������ (RPN).');
   writeln;
   writeln('������ ��ࠦ���� � (Enter -��室 �� �ணࠬ��): ');
   readln(in_str);

   while in_str <> '' do begin
     if Analysis then begin
        writeln('���⠪��᪨ ��୮!');
        writeln('��� >> ', str_out);
        writeln;
     end;
     writeln('������ ��ࠦ���� � (Enter -��室 �� �ணࠬ��): ');
     readln(in_str)
   end;
   writeln('����� � �ணࠬ��� �����祭�! ������ Enter!');
   readln
 end.

