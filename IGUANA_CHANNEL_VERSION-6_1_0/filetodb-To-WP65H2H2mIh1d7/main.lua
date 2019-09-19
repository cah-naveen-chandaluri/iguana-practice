-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main(Data)
   
   local Msg = xml.parse(Data)  
   
   local Conn = db.connect{
      api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security 
      use_unicode = true,
      live = true
   }

    
   -- (2) create insert query string
   local SqlInsert =
   [[
   INSERT INTO patientnew
   (
   Id,
   LastName,
   GivenName,
   Ssn
   )
   VALUES
   (
   ]]..
   "'"..Msg.patients.patient.id.."',"..
   "\n   '"..Msg.patients.patient["first-name"][1].."',"..
   "\n   '"..Msg.patients.patient["last-name"][1].."',"..
   "\n   '"..Msg.patients.patient["social-security-no"][1].."'".. 
   '\n   )'
   
  
  
   Conn:execute{sql=SqlInsert, live=true}
end