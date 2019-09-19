-- The main function is the first function called from Iguana.

function main()
      local conn = db.connect{   
      api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security
      use_unicode = true,
      live = true
   }
Sql = [[INSERT INTO PRODUCT1 VALUES('2','DFDA','28')]] 
  conn:execute{sql=Sql,live=true}
   conn:execute{sql='SELECT * FROM PRODUCT1', live=true}
end




