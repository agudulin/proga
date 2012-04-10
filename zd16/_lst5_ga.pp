// lst5_ga.pp       ��㫨� �.�. ��५� 2012�.
// ����� � �吝� ᯨ᪮�
// ��楤��� ���������� ����� � ����� �
// �뢮� �� �࠭ ������⢠ ᫮� �� ᯨ᪠

{$mode objfpc}
uses Sysutils;
 
type TPItemList = ^TItemList;
     TWord  = string;
     TCount = word;
     TItemList = record
         word:  TWord;      {data}
         count: TCount;     {words counter}
         next:  TPItemList  {next item pointer}
     end;
     TList = TPItemList;

const separators = [' ', ',', '.', ';', ':', '!', '?', '-', 
                    #34, #39, '(', ')', '[', ']', '{', '}'];

var filein_name: string;
    list: TList;
    c: char;


procedure printList(list: TList);
begin
    while list <> nil do begin
        write(list^.word);
        if list^.count > 1 then
            write('(', list^.count ,')');

        write(' ');
        list := list^.next;
    end;
    writeln;
end;

// @brief:
//  dispose memory list object has
procedure clearList(var list: TList);
var p: TPItemList;
begin
    while list <> nil do begin
        p := list;
        dispose(list);
        list := p^.next;
    end;
end;

// @brief:
//  add item to list lexicographically
//  and increment word count if duplicate
procedure addToList(var list: TList; val: TWord);
var pFirst, pSecond, pNew: TPItemList;
begin
    new(pNew);
    pNew^.word  := val;
    pNew^.count := 1;
    pNew^.next  := nil;

    if nil = list then begin
        pNew^.next := list;
        list := pNew;
    end
    else begin
        pFirst  := list;
        pSecond := list;
        while (pSecond <> nil) and (pSecond^.word <= val) do begin
            if val = pSecond^.word then begin
                inc(pSecond^.count);
                exit; // don't duplicate item
            end;
            pFirst  := pSecond;
            pSecond := pSecond^.next;
        end;
        // if end of list - add new item to the end of list
        if nil = pSecond then
            pFirst^.next := pNew
        else begin
            pNew^.next := pSecond;
            if pSecond = list then
                list := pNew
            else
                pFirst^.next := pNew;
        end;
    end;
end;

function lower_cp866(s: char): string;
begin
    if ord(s) in [128..143] then
        lower_cp866 := chr(ord(s)+32)
    else if ord(s) in [144..159] then
        lower_cp866 := chr(ord(s)+80)
    else lower_cp866 := lowercase(s);
end;

// @brief:
//  read data from file string by string,
//  get words separated by symbols from {separators}
//  and add every word to linked list lexicographically
procedure words_count(filein_name: string; var list: TList);
var filein: text;
    str:    string;
    tmp:    TWord;
    i:      integer;
begin
    assign(filein, filein_name);
    {$I+}
    try
        reset(filein);
    repeat
        readln(filein, str);
        str := str + ' ';
        tmp := '';
        for i:=1 to length(str) do begin
            if str[i] in separators then begin
                if tmp <> '' then begin
                    //writeln('D:> ', tmp);
                    addToList(list, tmp);
                    tmp := '';
                end
            end
            else
                tmp := tmp + lower_cp866(str[i]);
        end;
    until (EOF(filein));
        closefile(filein);
    except
        on E: EInOutError do begin
            writeln('�訡�� � ����� ��ࠡ�⪨ 䠩��. ��⠫�: ', E.ClassName, ': ', E.Message);
        end;    
    end;
end;

begin
    writeln('*** lst5_ga.pp       ��㫨� �.�. ��५� 2012�.  ***');
    writeln('*** ����஥��� �易����� 㯮�冷祭����         ***');
    writeln('***   ᯨ᪠ ᫮�                                ***');
    writeln('***   ⥪�� �� 䠩��, ����������� ���짮��⥫��.***');
    writeln('*** ��室 �� �ணࠬ��: ���� ���⮣� ����� 䠩��.***');
    writeln('*** �ᯮ��㥬� ࠧ����⥫� ᫮�:               ***');
    write  ('***'); for c in separators do write(c, ' ');
    writeln;
    writeln('������ ��� 䠩�� (Enter -�����): ');
    readln(filein_name);

    while length(filein_name) <> 0 do begin
        list := nil;
        words_count(filein_name, list);
        printList(list);
        clearList(list);

        writeln;
        writeln('������ ��� 䠩�� (Enter -�����): ');
        readln(filein_name);
    end;
    writeln('�믮������ �ணࠬ�� �����祭�! ������ Enter!');
    readln;
end.