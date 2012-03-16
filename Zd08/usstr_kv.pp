{ usstr_kv.pp   Кузьменко ВГ, 15-11-2008 г.}
{                                          }
{ Модуль политерного сканирования входной  }
{  строки in_str.                          }
{                                          }

unit usstr_kv;

INTERFACE

const      EOS=#01; {признак конца сканируемой входной строки}
     arrowDown=#25; {символ - стрелочка вниз для указания места ошибки}

var     
    curc: char; {текущая лмтера входной строки}
  iss,ls: byte; {индекс выбранной литеры из входной строки и длина входной строки}
  wasErr: boolean; {флаг -была обнаружена ошибка}
  in_str: string;  {входная сканируемая строка}
  
{---- инициализация сканирования входной строки --}
procedure initScanStr;

{-- получение новой литеры входной строки --------}
function nxtc:char;

{--- вывод сообщения об ошибке с указанием стрелкой места ошибки --}
procedure PutMsgErr(msg: string);

IMPLEMENTATION

{---- инициализация сканирования входной строки --}
procedure initScanStr;
  begin iss:=0; ls:=length(in_str); wasErr:=false end;

{-- получение новой литеры входной строки --------}
function nxtc:char;
  begin
    if iss<ls then begin inc(iss); curc:=in_str[iss] end
    else curc:=EOS;
    nxtc:=curc
  end;

{--- вывод сообщения об ошибке с указанием стрелкой места ошибки --}
procedure PutMsgErr(msg: string);
  begin wasErr:=true;
    writeln('*** ОШИБКА: ',msg);
    writeln(' ': iss, arrowDown ); writeln(' '+in_str)
  end;

begin
  iss:=0;
  ls:=0;
  in_str:='';
end.

