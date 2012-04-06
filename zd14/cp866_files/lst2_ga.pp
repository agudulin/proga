// lst1_ga.pp       ��㫨� �.�. ��५� 2012�.
// ����� � �吝� ᯨ᪮�
// ��楤��� ���������� ������� � ����� �
// �뢮� �� ��࠭ ������⢠ ᫮� �� ᯨ᪠

type TPItemList = ^TItemList;
     TInfo = string;
     TItemList = record
         info: TInfo;      {���ଠ樮���� ����}
         nxt:  TPItemList  {�����⥫� �� ᫥�. ��-�}
     end;
     TList = TPItemList;


var  Lst1: TList;
     w: TInfo;

procedure outputLst(lst: TList);
begin
    while lst <> nil do begin
        write(lst^.info, ' ');
        lst := lst^.nxt;
    end;
    writeln;
end;

procedure add2endLst(var lst: TList; x: TInfo);
var pNew, p: TPItemList;
begin
    new(pNew);
    pNew^.info := x;
    pNew^.nxt := nil;
    if nil = lst then
        lst := pNew
    else begin
        p := lst;
        while p^.nxt <> nil do
            p := p^.nxt;
        p^.nxt := pNew;
    end;
end;


begin
    writeln('*** lst1_ga.pp       ��㫨� �.�. ��५� 2012�.');
    writeln('*** ����� � �吝� ᯨ᪮�');
    writeln('***   ��楤��� ���������� ������� � ����� �');
    writeln('***   �뢮� �� ��࠭ ������⢠ ᫮� �� ᯨ᪠');
    Lst1 := nil;
    writeln;
    write('������ ᫮�� (Enter -�����): ');
    readln(w);
    while Length(w) <> 0 do begin
        add2endLst(Lst1, w);
        writeln('   ��⠢�� � ����� ᯨ᪠:');
        write('���᮪ 1: ');
        outputLst(Lst1);
        writeln;
        write('������ ᫮�� (Enter -�����): ');
        readln(w)
    end;
    writeln('�믮������ �ணࠬ�� �����祭�! ������ Enter!');
    readln
end.