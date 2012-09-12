Program queue;

Uses
    crt;

Type
    nodepointer=^nodetype;
    nodetype=record
                   component:string;
                   link:nodepointer;
             End;

Var
   list,current,newnode,previous:nodepointer;
   option:integer;

Begin

     New(list);
     list^.component:='';
     current:=list;
     previous:=nil;

     New(newnode);
     newnode^.component:='ZZZZZ';
     list^.link:=newnode;
     newnode^.link:=nil;

     Repeat

           Writeln('Queue Menu');
           Writeln;
           Writeln('       1. Push');
           Writeln('       2. Pop');
           Writeln('       3. Print the queue');
           Writeln('       4. End the program');
           Writeln;
           Write('Please enter your option: ');
           Readln(option);

           clrscr;

           If option=1 then

                Begin
                     current:=list;
                     previous:=nil;

                     New(newnode);
                     Write('Please enter an item to add to the queue: ');
                     Readln(newnode^.component);
                     Writeln;

                     While current^.link^.component<>'ZZZZZ' do
                           current:=current^.link;

                     newnode^.link:=current^.link;
                     current^.link:=newnode;

                End

           Else if option=2 then
                Begin
                      current:=list;
                      previous:=nil;

                      If list^.link^.component<>'ZZZZZ' then
                          Begin

                               previous:=list^.link;
                               list^.link:=list^.link^.link;
                               dispose(previous);

                               Write('The item has been deleted from the queue');

                          End

                      Else
                          Write('The queue is empty');

                      Readln;
                End

           Else if option=3 then
                Begin

                     If (list^.link^.component<>'ZZZZZ') then
                         Begin
                              Writeln('Top');
                              writeln;

                              current:=list^.link;

                              Repeat
                                    Writeln(current^.component);
                                    current:=current^.link;
                              Until current^.link=nil;

                              Writeln;
                              Write('Bottom');

                         End

                     Else
                         Write('There are no items in your queue');

                     Readln
                End

           Else if option<>4 then
                Begin
                     Writeln;
                     Writeln;
                     Writeln;
                     Write('       Invalid option');
                     Readln;
                End;

           clrscr;
     Until option=4

End.