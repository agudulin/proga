type
    TNodeValue = integer;

    TBinTree = ^TNode;
    TNode = record
        value: TNodeValue;
        left, right: TBinTree;
    end;

var
    tree : TBinTree;

// @brief:
//  ᮧ����� � ���樠������ 㧫�
procedure createNode(var p: TBinTree; val: TNodeValue);
begin
    new(p);
    p^.value := val;
    p^.left  := nil;
    p^.right := nil;
end;

// @brief:
//  ��⠢�� 㧫� � ��ॢ� � ����ᨬ��� �� ���祭�� 㧫�
procedure insert(var root: TBinTree; val: TNodeValue);
begin
    if root = nil then
        createNode(root, val)
    else begin
        // ������塞 㧥� �ࠢ�
        if val > root^.value then
            insert(root^.right, val)
        // ������塞 㧥� ᫥��
        else if val < root^.value then
            insert(root^.left, val)
        //�᫨ ����� 㦥 ��������� � ��ॢ� - �����
        else ;
    end;
end;

// @brief:
//  �뢮� �� �࠭ ��ॢ� __ᨬ������__ ��宦������
procedure printTreeSym(var tree: TBinTree);
begin
    if tree = nil then exit;

    printTreeSym(tree^.left);
    write(tree^.value, ' ');//-> ');
    printTreeSym(tree^.right);
end;

// @brief:
//  �뢮� �� �࠭ ��ॢ� ��宦������ __ᢥ��� ����__
procedure printTreeTopToBottom(var tree: TBinTree);
begin
    if tree = nil then exit;
    
    write(tree^.value, ' ');//-> ');
    printTreeTopToBottom(tree^.left);
    printTreeTopToBottom(tree^.right);
end;

// @brief:
//  �뢮� �� �࠭ ��ॢ� ��宦������ __᭨�� �����__
procedure printTreeBottomToTop(var tree: TBinTree);
begin
    if tree = nil then exit;

    printTreeBottomToTop(tree^.left);
    printTreeBottomToTop(tree^.right);
    write(tree^.value, ' ');//-> ');
end;

// @brief:
//  �㭪�� �����頥� ����� ��ॢ�

// procedure getTreeHeight(var tree: TBinTree; var height: integer);
// begin
//     if tree <> nil then begin
//         getTreeHeight(tree^.left, height);
//         if (tree^.left = nil) and (tree^.right = nil) then inc(height);
//         getTreeHeight(tree^.right, height);
//     end;
// end;

function getTreeHeight(var tree: TBinTree): integer;
var h1, h2: integer;
begin
    if tree = nil then getTreeHeight := 0
    else begin
        h1 := getTreeHeight(tree^.left);
        h2 := getTreeHeight(tree^.right);
        if h2 > h1 then h1 := h2;
        getTreeHeight := h1 + 1;
    end;
end;

// @brief:
//  ������ � ���짮��⥫��
//  1 - �������� � ������ � ����������� ����⮢ � ��ॢ�
//  0 - ��� �� �ணࠬ��
procedure dialogTreeOutput(var tree: TBinTree);
var input_val: byte;
begin
    writeln;
    while true do begin
        writeln; write('���� ��ॢ�:        ', getTreeHeight(tree));
        writeln; write('���諨 ᫥�� ���ࠢ�: '); printTreeSym(tree);
        writeln; write('���諨 ᢥ��� ����:   '); printTreeTopToBottom(tree); 
        writeln; write('���諨 ᭨�� �����:   '); printTreeBottomToTop(tree);

        writeln; writeln;
        write('>> (0 - ��������, 1 - �த������ ��������� 㧫� � ��ॢ�): ');
        readln(input_val);
        if input_val = 0 then begin
            writeln;
            writeln('�ᥣ� ���ண�! ���� ENTER ��� ��室� �� �ணࠬ��.');
            readln;
            halt;
        end
        else if input_val = 1 then exit;
    end;
end;

// @brief:
//  ������ � ���짮��⥫�� - ������� �� ���짮��⥫� ���祭��,
//  �������� � ��ॢ�
procedure dialog(var tree: TBinTree);
var input_val: TNodeValue;
begin
    write('������ ���祭�� ������ 㧫� (0 - �����): ');
    readln(input_val);
    while true do begin
        if input_val = 0 then begin
            dialogTreeOutput(tree);
        end
        else insert(tree, input_val);
        // TODO: �뢮� ��ॢ� �� �࠭

        write('������ ���祭�� ������ 㧫� (0 - �����): ');
        readln(input_val);
    end;
end;

begin
    writeln('*** zd19_ga_1.pp    ��㫨� �.�. ��� 2012�.  ***');
    writeln('*** �������� ��ॢ� ���᪠                   ***');
    writeln('***   ��᫥����⥫쭮 ����頥� � ����        ***');
    writeln('***   ������� 楤� ���祭�� (�⫨�� �� 0)***');
    writeln;
    dialog(tree);
end.