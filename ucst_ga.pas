// ucst_ga.pas			12.02.2012 	Гудулин А.О.
// Модуль, реализующий представление стека ОБЪЕКТОМ TCStack
// с соответствующими операциями работы со стеком

unit ucst_ga;

interface
	type
		TCStack = Object
			len: integer;
			val: array[1..50] of char;
			procedure init;
			function push(c:char): boolean;
			function pop(var c:char): boolean;
			function top(var c:char): boolean;
			function error_handler(count:integer): boolean;
		end;

implementation
	procedure TCStack.init;
		var
			i: integer;
		begin
			for i:=1 to 50 do
				val[i] := 'a';
			len := 0;
		end;

	function TCStack.push(c:char): boolean;
		begin
			if error_handler(len+1) then begin
				inc(len);
				val[len] := c;
				push := true;
			end
			else
				push := false;
		end;
	
	function TCStack.pop(var c:char): boolean;
		begin
			if error_handler(len) then begin
				c := val[len];
				dec(len);
				pop := true;
			end
			else
				pop := false;
		end;

	function TCStack.top(var c:char): boolean;
		begin
			if error_handler(len) then begin
				c := val[len];
				top := true;
			end
			else
				top := false;
		end;
	
	function TCStack.error_handler(count:integer): boolean;
		var
			error: byte;
		begin
			if (count > 50) then
				error := 1
			else if (count < 1) then
				error := 2
			else
				error := 0;

			case (error) of
				0: error_handler := true;
				1: begin
						writeln('Ошибка! Переполнение стека.');
						error_handler := false;
					end;
				2: begin
						writeln('Ошибка! В стеке нет элементов.');
						error_handler := false;
					end;
			end;
		end;
end.