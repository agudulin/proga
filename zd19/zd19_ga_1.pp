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
//  создание и инициализация узла
procedure createNode(var p: TBinTree; val: TNodeValue);
begin
    new(p);
    p^.value := val;
    p^.left  := nil;
    p^.right := nil;
end;

// @brief:
//  вставка узла в дерево в зависимости от значения узла
procedure insert(var root: TBinTree; val: TNodeValue);
begin
    if root = nil then
        createNode(root, val)
    else begin
        // добавляем узел справа
        if val > root^.value then
            insert(root^.right, val)
        // добавляем узел слева
        else if val < root^.value then
            insert(root^.left, val)
        //если элемент уже присутствует в дереве - игнор
        else ;
    end;
end;

// @brief:
//  вывод на экран дерева __симметричным__ прохождением
procedure printTreeSym(var tree: TBinTree);
begin
    if tree = nil then exit;

    printTreeSym(tree^.left);
    write(tree^.value, ' ');//-> ');
    printTreeSym(tree^.right);
end;

// @brief:
//  вывод на экран дерева прохождением __сверху вниз__
procedure printTreeTopToBottom(var tree: TBinTree);
begin
    if tree = nil then exit;
    
    write(tree^.value, ' ');//-> ');
    printTreeTopToBottom(tree^.left);
    printTreeTopToBottom(tree^.right);
end;

// @brief:
//  вывод на экран дерева прохождением __снизу вверх__
procedure printTreeBottomToTop(var tree: TBinTree);
begin
    if tree = nil then exit;

    printTreeBottomToTop(tree^.left);
    printTreeBottomToTop(tree^.right);
    write(tree^.value, ' ');//-> ');
end;

// @brief:
//  функция возвращает высоту дерева

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
//  диалог с пользователем
//  1 - вернуться в диалог с добавлением элементов в дерево
//  0 - выйти из программы
procedure dialogTreeOutput(var tree: TBinTree);
var input_val: byte;
begin
    writeln;
    while true do begin
        writeln; write('Высота дерева:        ', getTreeHeight(tree));
        writeln; write('Обошли слева направо: '); printTreeSym(tree);
        writeln; write('Обошли сверху вниз:   '); printTreeTopToBottom(tree); 
        writeln; write('Обошли снизу вверх:   '); printTreeBottomToTop(tree);

        writeln; writeln;
        write('>> (0 - закончить, 1 - продолжить добавлять узлы в дерево): ');
        readln(input_val);
        if input_val = 0 then begin
            writeln;
            writeln('Всего доброго! Жмите ENTER для выхода из программы.');
            readln;
            halt;
        end
        else if input_val = 1 then exit;
    end;
end;

// @brief:
//  диалог с пользователем - получить от пользователя значение,
//  добавить в дерево
procedure dialog(var tree: TBinTree);
var input_val: TNodeValue;
begin
    write('Введите значение нового узла (0 - конец): ');
    readln(input_val);
    while true do begin
        if input_val = 0 then begin
            dialogTreeOutput(tree);
        end
        else insert(tree, input_val);
        // TODO: вывод дерева на экран

        write('Введите значение нового узла (0 - конец): ');
        readln(input_val);
    end;
end;

begin
    writeln('*** zd19_ga_1.pp    Гудулин А.О. май 2012г.  ***');
    writeln('*** Создание дерева поиска                   ***');
    writeln('***   последовательно помещаем в него        ***');
    writeln('***   вводимые цедые значение (отличные от 0)***');
    writeln;
    dialog(tree);
end.