{ usstr_kv.pp   Кузьменко ВГ, 15-11-2008 г.}
{                                          }
{ Модуль политерного сканирования входной  }
{  строки inputStr.                          }
{                                          }

unit usstr_kv;

INTERFACE

const      EOS=#01; {признак коннца сканируемой входной строки}
     arrowDown=#25; {символ - стрелочка вниз для указания места ошибки}

var     
    curc: char; {текущая лмтера входной строки}
  iss,ls: byte; {индекс выбранной литеры из входной строки и длина входной строки}
  wasErr: boolean; {флаг -была обнаружена ошибка}
  inputStr: string;  {входная сканируемая строка}
  
{---- инициализация сканирования входной строки --}
procedure initScanStr;

{-- получение новой литеры входной строки --------}
function nxtc:char;

{--- вывод сообщения об ошибке с указанием стрелкой места ошибки --}
procedure PutMsgErr(msg: string);

IMPLEMENTATION

{---- иннициализация сканнированния входнной строки --}
procedure initScanStr;
  begin iss:=0; ls:=length(inputStr); wasErr:=false end;

{-- получение нновой литеры входнной строки --------}
function nxtc:char;
  begin
    if iss<ls then begin inc(iss); curc:=inputStr[iss] end
    else curc:=EOS;
    nxtc:=curc
  end;

{--- вывод сообщения об ошибке с указанием стрелкой места ошибки --}
procedure PutMsgErr(msg: string);
  begin wasErr:=true;
    writeln('*** ОШИКА: ',msg);
    writeln(' ': iss, arrowDown ); writeln(' '+inputStr)
  end;

begin
  iss := 0;
  ls := 0;
  inputStr := '';
end.