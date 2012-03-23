{ Файл: queen1_ga.pp      Гудулин А.О.  март 2012 г. }

{ Задача о восьми ферзях                             }
{ На шахматной доске размером n на n (n<=20),        }
{ расставить n ферзей так, чтобы они                 }
{ не били друг друга, то есть, каждая                }
{ горизонталь, вертикаль и любая диагональ           }
{ шахматной доски должна содержать ровно             }
{ одного ферзя.                                      }

type TIBoard = array [1..20, 1..20] of integer;
var N: integer;

procedure solveQueenProblem(N:integer);
var board: TIBoard;

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
    var result: boolean;
        j: integer;
    begin
        result := false;
        for j:=1 to N do begin
            if 0 = board[i, j] then begin
                setQueen(i, j);
                // еси последний столбец - ОК, выходим
                if i = N then
                    result := true
                // иначе пробуем поставить ферзя в следующем столбце
                else begin
                    result := tryToSetQueen(i+1);
                    if false = result then
                        resetQueen(i, j);
                end;
            end;
            if true = result then
                break;
        end;

        tryToSetQueen := result;
    end;{tryToSetQueen}

// @brief
//  вывод на экран текущего состояния 
//  шахматной доски
procedure printBoard;
var x,y: integer;
begin
    for x:=1 to N do begin
        for y:=1 to N do begin
            if -1 = board[x, y] then
                write(' x')
            else
                write(' .');
        end;
        writeln;
    end;
end;

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
    if false = tryToSetQueen(1) then
        writeln('>> На доске [', N, '*', N, '] ',
                'невозможно расставить ферзей.')
    else printBoard;

end;{solveQueenProblem}

begin
    writeln;
    writeln('*** queen1_ga.pp    Гудулин А.О. март 2012 г.   *');
    writeln('***           Задача о восьми ферзях            *');
    writeln('*** На шахматной доске размером NxN (0<N<=20),  *');
    writeln('*** расставить N ферзей так, чтобы они          *');
    writeln('*** не били друг друга                          *');
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