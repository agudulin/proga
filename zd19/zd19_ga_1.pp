uses SysUtils, math;

type
    // TSLines = array[1..100] of string;

    TNodeValue = integer;

    TBinTree = ^TNode;
    TNode = record
        value: TNodeValue;
        left, right: TBinTree;
    end;

    // TQueueNodeType = TBinTree;
    // TQueue = ^TQueueType;
    // TQueueType = record
    //     value: TQueueNodeType;
    //     next : TQueue;
    // end;

var
    tree : TBinTree;
    // queue: TQueue;

// { ----- QUEUE PROCEDURES ----------}
// procedure init_q(var queue: TQueue);
// begin
//     new(queue);
//     queue := nil;
// end;

// procedure push_q(var queue: TQueue; val: TQueueNodeType);
// var q, node: TQueue;
// begin
//     new(node);
//     node^.value := val;
//     node^.next := nil;
//     if queue = nil then
//         queue := node
//     else begin
//         q := queue;
//         while q^.next <> nil do begin
//             q := q^.next;
//         end;
//         q^.next := node;
//     end;
// end;

// function pop_q(var queue: TQueue; var return_value: TQueueNodeType): boolean;
// var q: TQueue;
// begin
//     q := queue;
//     if q = nil then begin
//         pop_q := false;
//     end
//     else begin
//         return_value := q^.value;
//         queue := queue^.next;
//         dispose(q);
//         pop_q := true;
//     end;
// end;

// procedure print_q(var queue: TQueue);
// var q: TQueue;
// begin
//     q := queue;
//     while q <> nil do begin
//         write(q^.value^.value, ' ');
//         q := q^.next;
//     end;
//     writeln;
// end;
// { ----- // QUEUE PROCEDURES ----------}

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
procedure insert_node(var root: TBinTree; val: TNodeValue);
begin
    if root = nil then
        createNode(root, val)
    else begin
        // добавляем узел справа
        if val > root^.value then
            insert_node(root^.right, val)
        // добавляем узел слева
        else if val < root^.value then
            insert_node(root^.left, val)
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

function repeatString(const s: string; count: integer): string;
var i: integer;
    res: string;
begin
    res := '';
    for i := 1 to count do
        res := res + s;
    repeatString := res;
end;

// procedure printTree(var tree: TBinTree; var q: TQueue);
// var traverse: TQueueNodeType;
//     nodes_in_current_level, nodes_in_next_level: integer;
//     line: string;
//     lines_count: integer;
//     lines_collection: TSLines;
//     max_element_length: integer;
//     tabs_count, i, j: integer;
// begin
//     if tree = nil then exit;

//     traverse := nil;
//     line := '';
//     lines_count := 1;
//     max_element_length := 0;
//     nodes_in_current_level := 1;
//     nodes_in_next_level := 0;
//     push_q(q, tree);
    
//     while q <> nil do begin
//         pop_q(q, traverse);
//         dec(nodes_in_current_level);

//         if traverse <> nil then begin
//             line := line + 'x' + intToStr(traverse^.value) + 'x';
//             if length(intToStr(traverse^.value)) > max_element_length then
//                 max_element_length := length(intToStr(traverse^.value));

//             push_q(q, traverse^.left);
//             push_q(q, traverse^.right);
//             nodes_in_next_level := nodes_in_next_level + 2;
//         end;

//         if nodes_in_current_level = 0 then begin
//             lines_collection[lines_count] := line;
//             inc(lines_count);
//             line := '';

//             nodes_in_current_level := nodes_in_next_level;
//             nodes_in_next_level := 0;
//         end;
//     end;

//     for i:=1 to lines_count do begin
//         tabs_count := trunc(power(2, (lines_count - i)));
//         lines_collection[i] := stringReplace(lines_collection[i], 'x',
//                                              repeatString('x',tabs_count),
//                                              [rfReplaceAll]);
//     end;
//     for i:=1 to lines_count do begin
//         for j:=2 to length(lines_collection[i]) do begin
//             if (lines_collection[i][j-1] <> 'x') and (lines_collection[i][j-1] <> 'y') and (lines_collection[i][j] = 'x') then begin
//                 // roll back for counting _element_length_
//                 lines_collection[i][j] := 'y';
//             end;
//         end;
//         stringReplace(lines_collection[i], 'y', ' ', [rfReplaceAll]);
//         for j:=2 to length(lines_collection[i]) do begin
//             if (lines_collection[i][1] = 'x') or
//                (lines_collection[i][j] = 'x') and (lines_collection[i][j-1] = 'x') then begin
//                 delete(lines_collection[i], j-1, 2);
//                 insert(repeatString(' ', max_element_length+1), lines_collection[i], j-1);
//             end;
//         end;
//         // lines_collection[i] := stringReplace(lines_collection[i], '#9',
//         //                                      repeatString(' ', max_element_length),
//         //                                      [rfReplaceAll]);
//         writeln(lines_collection[i]);
//     end;
    
//     // Clean queue:
//     while q <> nil do pop_q(q, traverse);
// end; 

// @brief:
//  функция возвращает высоту дерева
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
// procedure dialog(var tree: TBinTree; var queue: TQueue);
procedure dialog(var tree: TBinTree);
var input_val: TNodeValue;
begin
    write('Введите значение нового узла (0 - конец): ');
    readln(input_val);
    while true do begin
        if input_val = 0 then begin
            dialogTreeOutput(tree);
        end
        else insert_node(tree, input_val);
        // printTree(tree, queue);
        // TODO: вывод дерева на экран

        write('Введите значение нового узла (0 - конец): ');
        readln(input_val);
    end;
end;

// procedure PrintTreeGraph(root: TBinTree);
// { Заменить при необходимости }
//     function Convert(X: TNodeValue): string;
//     begin
//         Convert := X;
//     end;
// var
//     start_x, start_y: integer;
// const
//     delx = 30;
//     dely = 20;
//     circle_r = 10;
//     btw = circle_r div 2;

//     procedure print_node(root: TBinTree; level: integer; L, C, R: integer);
//         function min(a, b: Integer): Integer;
//         begin
//             min := a;
//             if b < a then min := b
//         end;
            
//         function center(a, b: integer): integer;
//         begin
//             Center := min(a, b) + abs(a - b) div 2;
//         end;

//     var pos_y: integer;
//     begin
//         pos_y := start_y + pred(level) * dely;
            
//         if root^.right <> nil then begin
//             line(C, pos_y, center(C, R), pos_y + dely);
//             { вот тут мы предотвращаем наложение (уходим чуть вправо) }
//             print_node(root^.right, level+1, C+btw, center(C+btw, R-btw), R-btw);
//         end;
        
//         if root^.Left <> nil then begin
//             line(C, pos_y, Center(L, C), pos_y + dely);
//             { и вот тут тоже (уходим левее) }
//             print_node(Root^.Left, Level + 1, L+btw, Center(L+btw, C-btw), C-btw);
//         end;
        
//         SetColor(Black);
//         SetFillStyle(SolidFill, Black);
//         PieSlice(C, pos_y, 0, 359, circle_r);
//         SetColor(White);
//         Circle(C, pos_y, circle_r);
//         SetTextJustify(CenterText, CenterText);
//         OutTextXY(C, pos_y, Convert(Root^.value));
//     end;

// begin
//     start_x := GetMaxX div 2;
//     start_y := 10;
//     print_node(root, 1, 0, GetMaxX div 2, GetMaxX);
// end;

begin
    // init_q(queue);
    writeln('*** zd19_ga_1.pp    Гудулин А.О. май 2012г.  ***');
    writeln('*** Создание дерева поиска                   ***');
    writeln('***   последовательно помещаем в него        ***');
    writeln('***   вводимые цедые значение (отличные от 0)***');
    writeln;
    dialog(tree);
end.