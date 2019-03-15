program proorgan;

type point=^plist;
plist=record
info:char;
next:point;
end;

var first,first1,first2:point;
    x:char;
    n:integer;
    
function CreateNode (x:char):point;//ф-ция создающая новый узел 
var newelem:point;
begin 
new(newelem);//выделяем память под новую переменнную типа указатель 
newelem^.info:=x;//присваиваем значение узлу
newelem^.next:=nil;
result:=newelem;//возвращение списка с новым элементом в программу
end;
 
procedure addAfter(Aft:point;ls:point);//добавление после заданного Nolis элемента с указателем lis
begin
    ls^.next := Aft^.next;
    Aft^.next := ls;
end;

procedure addNewElem(ls:point);//добавление элемента в конец  списка(если там нет элементов, то создание нового)
var
    p:point;
begin
    if first = nil then first:=ls
    else begin
        p:=first;
        while p^.next <> nil do 
            p:= p^.next;
        addAfter(p,ls);
    end;
end;

procedure PrintList(head: point);//печать списка
var
  p: point;
begin
  p := head;
  while p <> nil do
  begin
    write(p^.info, ' ');
    p := p^.next;
  end;
end;

procedure razbienieB;
var
  q, p: point;
begin
  q:= first;
  first1:= q;
  first2:= q^.next;
  while q <> nil do 
  begin
    p:= q;
    q:= q^.next;
    if p^.next <> nil then p^.next := p^.next^.next;
    end;
end;
//----------------------------------------------------
procedure razbienieV;
var
  b,q, p: point;
begin
 q:=first;
 while q<>nil do 
 begin
  if q^.next<>nil then
  p:=q^.next;
  if ord(q^.info)>64 then
  first1:=q else
  b:=q;
  first2:=b;
  q:=p;
 end;
end; 


//----------------------------------------------------
begin 
writeln('введите кол-во элементов в списке');
readln(n);
for i:integer:=1 to n do begin 
write('введите ',i, ' элемент: '); 
readln(x);
addNewElem(CreateNode(x));
end;
writeln('исходный список:');
PrintList(first);
razbienieV;
writeln;
writeln('полученный список №1:');
PrintList(first1);
writeln;
writeln('полученный список №2:');
PrintList(first2);
end.