{
   Автор:  Гудулин Александр Олегович
   Группа: 141
   Дата:   30.11.2011

   Задача ставится на тему "Ходы КОНЯ".
   После запуска программы на форме, на квадратном элементе Image1,
   появляется шахматная доска размера 8x8.
   Щелчком мыши по какому-то из полей доски мы показываем место,
   откуда КОНЬ должен начать свой путь. На этом поле должно появиться
   число "1". Вслед за тем должны появиться числа "2", "3", ... , "64".
   Это номера полей, посещаемых КОНЁМ при обходе всей доски.
}
unit Chessboard;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }
  TForm1 = class(TForm)
    Image1: TImage;

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject;
                              Shift: TShiftState;
                              X, Y: Integer);
    procedure Image1Paint(Sender: TObject);
    function Solution(x, y, step: Integer): Boolean;

  private
    { private declarations }
    Cursor_x, Cursor_y: Integer;
  public
    { public declarations }
  end;

  TMultimap = array [1..64] of array [1..2] of Integer;

const
  s: array[1..8, 1..2] of Integer =
     ((-2,1),(-1,2),(1,2),(2,1),(2,-1),(1,-2),(-1,-2),(-2,-1));

{ Возможные ходы коня:
     .2.3.
     1...4
     ..К..
     8...5
     .7.6.
}
var
  Form1: TForm1;
  Visit:  array [1..8] of array [1..8] of Boolean;
  Answer: array [1..8] of array [1..8] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1Paint(Sender: TObject);
var i, j, w, h: Integer;
    arect : TRect;
begin
  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, 400, 400);

  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Font.Color := clRed;

  arect := rect(0, 0, 400, 400);

  w := Image1.Width div 8;
  h := Image1.Height div 8;

  Image1.Canvas.Font.Size := h div 2;

  for i:=0 to 7 do
      for j:=0 to 7 do begin
          if j mod 2 = 0 then begin
             Image1.Canvas.FillRect(j*w+(i mod 2)*w,
                                    i*h,
                                    (j+1)*w+(i mod 2)*w,
                                    (i+1)*h);
          end;
          if Answer[i+1][j+1] > 0 then
             Image1.Canvas.TextRect(arect, j*w+1, i*h+1,
                                    IntToStr(Answer[i+1][j+1]));
      end;
end;

{Сортировочка для оптимизации}
procedure quicksort(var arr: TMultimap; l, r: Integer);
var
  i, j, pivot, tmp: Integer;
begin
  i := l;
  j := r;
  pivot := arr[(l + r) div 2][1];
  repeat
    while (i < r) and (arr[i][1] < pivot) do
          i := i + 1;
    while (j > l) and (pivot < arr[j][1]) do
          j := j - 1;
    if i <= j then
    begin
      if i < j then
      begin
        tmp := arr[i][1];
        arr[i][1] := arr[j][1];
        arr[j][1] := tmp;
        tmp := arr[i][2];
        arr[i][2] := arr[j][2];
        arr[j][2] := tmp;
      end;
      if i < r then
         i := i + 1;
      if j > l then
         j := j - 1
    end
  until i > j;
  if j > l then
     quicksort(arr, l, j);
  if i < r then
     quicksort(arr, i, r)
end;


function TForm1.Solution(x, y, step: integer): Boolean;
var d, i, j, x0, y0, x1, y1, count, seqc: Integer;
    exit: Boolean;
    seq: TMultimap;
begin
  Visit[x,y]  := true; // устанавливаем коня в {x,y}
  Answer[x,y] := step; // step - номер шага

  exit := false;
  seqc := 1;

  if step = 64 then
     Solution := true
  else begin
       {Оптимизируем - считаем ходы}
       for i:=1 to 8 do begin
           x0 := x + s[i, 1];
           y0 := y + s[i, 2];
           count := 0; // количество ходов
           for j:=1 to 8 do begin
               x1 := x0 + s[j, 1];
               y1 := y0 + s[j, 2];
               if (x1 in [1..8]) and
                  (y1 in [1..8]) and
                  not(Visit[x1, y1]) then
                                     inc(count);
           end;
           seq[seqc][1] := count;
           seq[seqc][2] := i;
           inc(seqc);
       end;
       dec(seqc);
       quicksort(seq, 1, seqc);
       {---------------------------}
       for d := 1 to seqc do begin
           i := x + s[seq[d, 2], 1];
           j := y + s[seq[d, 2], 2];

           // проверяем выход за границы и стоит ли конь на доске
           // и идем в рекурсию для {i,j}
           if (i in [1..8]) and
              (j in [1..8]) and
              not(Visit[i, j]) and
              Solution(i, j, step+1) then begin
                                     Solution := true;
                                     exit := true;
                                     break;
              end;
       end;

       if not exit then begin
            Visit[x, y]  := false;
            Answer[x, y] := 0;
            Solution := false;
       end;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
var i, j: integer;
begin
  fillchar(Visit, sizeof(Visit), false);
  i := Cursor_y div (Image1.Height div 8) + 1;
  j := Cursor_x div (Image1.Width div 8) + 1;
  Solution(i, j, 1);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Cursor_x := X;
  Cursor_y := Y;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Image1Paint(Sender);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Halt;
end;

end.
