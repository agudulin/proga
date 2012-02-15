uses usstr_kv, ucst;
const
	outputStr: string = '';
var
	opStack: TCStack;

function prior(c:char):byte;
begin
	case c of
		'(': prior := 1;
		'+','-': prior := 2;
		'*','/': prior := 3;
		else prior := 0;
	end;
end;

procedure mov2outputStr(c:char);
begin
	outputStr := outputStr + c;
end;

function stringAnalyzer(inputStr:string): boolean;
var top, c: char;
begin
	initScanStr;
	opStack.init;
	while nxtc <> EOS do begin
		//write('output: ', outputStr, '  ');
		//opStack.show;
		case curc of
			'(': opStack.push(curc);
			')': begin
					c := opStack.pop;
					while (c <> '(') and (c <> #0) do begin
						mov2outputStr(c);
						c := opStack.pop;
					end;
				end;
			'+','-','*','/': begin
				while prior(curc) <= prior(opStack.top) do
					mov2outputStr(opStack.pop);
				if prior(curc) > prior(opStack.top) then
					opStack.push(curc);
			end;
			else begin
				mov2outputStr(curc);
			end;
		end;
	end;
	//opStack.show;
	c := opStack.pop;
	while c <> #0 do begin
		mov2outputStr(c);
		c := opStack.pop;
	end;
	stringAnalyzer := true;
end;

begin
	writeln('Введите выражение (Enter - выход): ');
	write('>>> ');
	readln(inputStr);
	writeln;
	while length(inputStr) <> 0 do begin
		if stringAnalyzer(inputStr) then begin
			writeln('Результат: ', outputStr);
			writeln;
		end;
		writeln('Введите выражение (Enter - выход): ');
		write('>>> ');
		readln(inputStr);
	end;
end.