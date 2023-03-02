with Ada.Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

Procedure Main Is
   Num_Threads : Integer;
   can_stop : boolean := false;
   pragma Atomic(can_stop);

   task type My_Breaker;
   task body My_Breaker is
   begin
      delay 5.0;
      can_stop := true;
   end My_Breaker;

   task type My_Task;
   task body My_Task is
      sum : Long_Long_Integer := 0;
      count: Long_Long_Integer := 0;
   begin
      loop 
         sum := sum + 6;
         count := count + 1;
         exit when can_stop;
      end loop;

      Put_Line("sum:" & sum'Img & ", count:" & count'Img);
   end My_Task;

   a: My_Breaker;

begin
   Put("Enter number of threads: ");
   Get(Num_Threads);
   declare
      Task_Ids : array(1 .. Num_Threads) of My_Task;
   begin
      null;
   end;
end Main;
