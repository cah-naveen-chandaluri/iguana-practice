-- The main function is the first function called from Iguana.
function main()
   local conn = db.connect{
      api = db.SQL_SERVER ,
      name = 'SQL SERVER',
      user = ' ',
      password = ' ',
      use_unicode = true,
      live = true
      }
   local R =conn.execute{
      api = db.SQL_SERVER,
      name = 'SQL SERVER',
      user = '',
      password = '',
	   use_unicode = true,
      sql = 'SELECT * FROM production',
      live = true
      }

   queue.push(R)
   
end