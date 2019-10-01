
-- http://help.interfaceware.com/v6/csv-parser

local parseCsv = require 'csv'

function main(Data)
   local Csv = parseCsv(Data)         -- comma separated (default)
   --local Csv = parseCsv(Data, '\t') -- tab separated (sample message 11)
   --local Csv = parseCsv(Data, '|')  -- bar separated (sample message 12)
   trace(Csv)
   trace('Count of rows = '..#Csv)
   
  --local newFile = io.open("C:\\Program Files\\iNTERFACEWARE\\Iguana\\season\\httptofiletodb\\parse.txt","w")
  c=table.concat(Csv[1])
      print(Csv[2][2])
  --newFile:write(c)
--newFile:close()
      
 local Conn = db.connect{
         api=db.SQL_SERVER,
         name='Sripad',       
      user='',
         password='',
      use_unicode=true,
         live=true
    }
   
  for i=2,#Csv do  
      print(#Csv)
   local SqlInsert =
   [[
   INSERT INTO Employee_Details
   (
   sno,
   fname,
   lname,
   salariess,
   company
   )
   VALUES
   (
   ]]..
   "'"..Csv[i][1].."',"..
   "\n   '"..Csv[i][2].."',"..
   "\n   '"..Csv[i][3].."',".. 
   "\n   '"..Csv[i][4].."',".. 
     "\n   '"..Csv[i][5].."'".. 
      '\n   )'
  Conn:execute{sql=SqlInsert, live=true}  
     
  end
end