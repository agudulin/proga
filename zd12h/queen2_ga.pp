{ Файл: queen1_ga.pp      Гудулин А.О.  март 2012 г. }

{ Задача о восьми ферзях                             }
{ На шахматной доске размером n на n (n<=20),        }
{ расставить n ферзей так, чтобы они                 }
{ не били друг друга, то есть, каждая                }
{ горизонталь, вертикаль и любая диагональ           }
{ шахматной доски должна содержать ровно             }
{ одного ферзя.                                      }

uses crt;

var N: integer;

procedure solveQueenProblem(N:integer);
    type TIBoard = array [1..20, 1..20] of integer;
    var board: TIBoard;
        solutionCount: int64;

    // @brief
    //  вывод на экран текущего состояния 
    //  шахматной доски
    procedure printBoard;
    var x,y: integer;
    begin
        solutionCount := solutionCount + 1;

        writeln('#', solutionCount, ' ');
        for x:=1 to N*2+1 do
            write('-');
        writeln;
        
        for x:=1 to N do begin
            for y:=1 to N do begin
                if -1 = board[x, y] then
                    write(' x')
                else
                    write(' .');
            end;
            writeln;
        end;
        writeln;
        writeln('>> Enter (показать еще решение), Esc (прекратить)');
    end;

    // @brief:
    //  функция ожидает нажатие любой клавиши пользователя
    function pausePrinting: boolean;
    var c: char;
    begin
        c := ReadKey;
        if c = #0 then c := ReadKey;
        if c = #27 then pausePrinting := false
        else pausePrinting := true;
    end;

    // @brief
    //  устанавливаем ферзя в клетку (i, j), поместим туда -1;
    //  в остальных по диагоналям, вертикали
    //  и горизонтали увеличим значения
    procedure setQueen(i,j:integer);
    var k, diag: integer;
    begin
        for k:=1 to N do begin
            inc(board[k, j]); { | }
            inc(board[i, k]); { -- }

            diag := j - i + k; { \ }
            if (diag <= N) and (diag > 0) then
                inc(board[k, diag]);

            diag := j + i - k; { / }
            if (diag <= N) and (diag > 0) then
                inc(board[k, diag]);
        end;
        board[i, j] := -1; // установим ферзя
    end;{setQueen}

    // @brief
    //  убираем ферзя из клетки (i, j)
    //  значения в диагоналях, вертикалях и горизонталях
    //  делаем прежними
    procedure resetQueen(i,j:integer);
    var k, diag: integer;
    begin
        for k:=1 to N do begin
            dec(board[k, j]); { | }
            dec(board[i, k]); { -- }

            diag := j - i + k; { \ }
            if (diag <= N) and (diag > 0) then
                dec(board[k, diag]);

            diag := j + i - k; { / }
            if (diag <= N) and (diag > 0) then
                dec(board[k, diag]);
        end;
        board[i, j] := 0; // убираем ферзя
    end;{resetQueen}

    // @brief
    //  пробуем установить ферзя на j-ое место
    //  i-ого столбца
    function tryToSetQueen(i:integer): boolean;
    var j: integer;
        result: boolean;
    begin
        result := false;
        for j:=1 to N do begin
            if 0 = board[i, j] then begin
                setQueen(i, j);
                if i < N then
                    result := tryToSetQueen(i+1)
                else begin
                    result := true;
                    printBoard;
                    if false = pausePrinting then exit;
                end;
                resetQueen(i, j);
            end;
        end;

        tryToSetQueen := result;
    end;{tryToSetQueen}

    // @brief
    //  заполнение нулями элементов N*N 
    //  шахматной доски
    procedure cleanBoard;
    var x,y: integer;
    begin
        for x:=1 to N do begin
            for y:=1 to N do begin
                board[x, y] := 0;
            end;
        end;
    end;

begin
    cleanBoard;
    solutionCount := 0;
    tryToSetQueen(1);

    if 0 = solutionCount then
        writeln('>> На доске [', N, '*', N, '] ',
                'невозможно расставить ферзей.');
    //writeln('DEBUG: ', solutionCount);

end;{solveQueenProblem}

begin
    writeln;
    writeln('*** queen2_ga.pp    Гудулин А.О. март 2012 г.  *');
    writeln('***           Задача о восьми ферзях]          *');
    writeln('*** На шахматной доске размером NxN (0<N<=20), *');
    writeln('*** расставить N ферзей так, чтобы они         *');
    writeln('*** не били друг друга.                        *');
    writeln('*** Если найдено более одной расстановки       *');
    writeln('*** по запросу пользователя они выводятся на   *');
    writeln('*** экран                                      *');
    writeln;

    writeln('>> Введите N - размерность доски (0 - выход): ');
    readln(N);

    while N <> 0 do begin
        if (N < 0) or (N > 20) then
            writeln('!! Ошибка. Допустимые значения N: 1..20')
        else
            solveQueenProblem(N);
        writeln;

        writeln('>> Введите N - размерность доски (0 - выход): ');
        readln(N);
    end;
    writeln('Работа с программой закончена! Нажмите Enter!');
    readln;
end.