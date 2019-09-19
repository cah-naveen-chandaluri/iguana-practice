-- The main function is the first function called from Iguana.
function main()
   local conn1 = db.connect{
      api=db.SQL_SERVER,
      name='SERVER',
	   user = ' ',
      password='',
      use_unicode = true,
      live = true
   }
     
  --[[(3) conn1.execute{
      api=db.SQL_SERVER,
      name='SQL SERVER',
       user = ' ',
       password='',
      sql= "INSERT INTO STUDENT  VALUES('98199','YO','9999','ASDF@GMAIL.COM')",
      live =true
   }]]--
      
  local R = conn1.execute{
      api=db.SQL_SERVER,
      name='SQL SERVER',
       user = ' ',
       password='',
     -- (3)sql= 'select * from student ' , 
      --(4)sql= 'select * from student order by id desc' , 
      sql = "UPDATE STUDENT SET ID+=2 WHERE ID>=1000",
      sql= 'select * from student ' ,
      live =true
   }
   queue.push(R)
   
      
end