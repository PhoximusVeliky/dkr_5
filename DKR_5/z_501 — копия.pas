program z501;
var arr: array of Integer;
    z,a, i, j, n,max, maxi,flag : integer;
    input,output: TextFile;
    
procedure selcomparetor1(var max, maxi : integer; i : integer);
begin
if arr[i] > max then // Зависит от знака
              begin
                max := arr[i];
                maxi := i
              end;
end;
    
procedure selcomparetor2(var max, maxi : integer;  i : integer);
begin
if arr[i] < max then // Зависит от знака
              begin
                max := arr[i];
                maxi := i
              end;
end;

procedure Quickcomparetor1(var i,j: integer; x:integer);
begin
    while (arr[i] < x) do i+=1;
    while (x < arr[j-1]) do j-=1;
end;

procedure Quickcomparetor2(var i,j: integer; x:integer);
begin
    while (arr[i] > x) do i+=1;
    while (x > arr[j-1]) do j-=1;
end;

procedure selection_sort(var arr: array of Integer);
var i,j, max, maxi,flag : integer;
begin
    j := Length(arr);
    writeln('компоратор');
    read(z);
    case z of 
        1:flag:=1;
        2:flag:=2;
    end;
    while j > 0 do 
      begin
        max := arr[0];
        maxi := 0;
        for i := 1 to j-1 do if flag = 1 then selcomparetor1(max,maxi,i)
                                         else selcomparetor2(max,maxi,i);
        arr[maxi] := arr[j-1];
        arr[j-1] := max;
        j := j - 1;
        //writeln(max:4,maxi:4);
       // writeln(arr);
      end;
end;

procedure QuickSort( L, R,flag : Integer ); { Быстрая сортировка массива A[] }
var i,j,x,y : integer;
begin

  i := l;
  j := r;
  x := arr[(l+r) div 2];
   //writeln(arr, x);
  repeat
    if flag = 1 then Quickcomparetor1(i,j,x)
                else Quickcomparetor2(i,j,x);
    if i <= j-1 then
    begin
      y:=arr[i];
      arr[i]:=arr[j-1];
      arr[j-1]:=y;
      i+=1;
      j-=1;
    end;
  until i > j-1;
   //writeln(arr, x);
  if l < j-1 then QuickSort(l,j,flag);
  if i < r then QuickSort(i,r, flag);
end;

begin
  AssignFile(input, 'test.txt');
  Reset(input);
  while not Eof(input) do
  begin
    ReadLn(input, a);
    SetLength(arr, Length(arr) + 1);
    arr[High(arr)] := a;
  end;
  CloseFile(input);
  
  writeln('метод');
  read(z);
  case z of 
      1:selection_sort(arr);
      2:begin
          writeln('компоратор');
          read(z);
        case z of 
             1:flag:=1;
             2:flag:=2;
        end;
        QuickSort(0,Length(arr),flag);
        end;
      
      
  end;
   
  AssignFile(input,'output.txt');
  Rewrite(input);
  for i := Low(arr) to High(arr) do
    WriteLn(input, arr[i]);
  CloseFile(input);
end.