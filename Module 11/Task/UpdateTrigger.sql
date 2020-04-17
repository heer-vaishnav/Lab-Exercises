Alter Trigger trUpdateView on vDetails  
instead of update  
as  
Begin   
 if(Update(DeptName))   
 Begin  
  Declare @DeptId int  
  
  Select @DeptId = DeptId  
  from Departments  
  join inserted  
  on inserted.DeptName = Departments.DeptName  
    
  Update Employees set DepartmentId = @DeptId  
  from inserted  
  join Employees  
  on Employees.Id = inserted.id  
 End  
   
 if(Update(Name))  
 Begin  
  Update Employees set Name = inserted.Name  
  from inserted  
  join Employees  
  on Employees.Id = inserted.id  
 End  
End 

Update vDetails   
set DeptName = 'Book'  
where Id = 1

Select * from vDetails
