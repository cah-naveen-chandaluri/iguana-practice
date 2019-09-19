function main(Data)
   -- Parse the JSON message
   local Msg = xml.parse(Data)  
   local Conn = db.connect{
         api=db.SQL_SERVER,
         name='sql servr',       
      user='',
         password='',
      use_unicode=true,
         live=true
         }
for i=1,2 do
 local SqlInsert =
   [[
   INSERT INTO patient
   (
   Id,
   LastName,
   GivenName,
   Ssn
   )
   VALUES
   (
   ]]..
   "'"..Msg.patients:child("patient", i).id.."',"..
   "'"..Msg.patients:child("patient", i)["first-name"]:nodeText().."',"..
   "'"..Msg.patients:child("patient", i)["last-name"]:nodeText().."',"..
   "'"..Msg.patients:child("patient", i)["social-security-no"]:nodeText().."'"..
   ')'  

   Conn:execute{sql=SqlInsert, live=true}
      end
  
   Conn:query('SELECT * FROM patient')
   
   Conn:query('SELECT patient.Id,patient.LastName,patient.GivenName,patient.Ssn FROM   dbo.patient,dbo.patient1 WHERE patient1.Id = patient.Id AND patient1.LastName = patient.LastName AND patient.GivenName = patient1.GivenName AND patient.Ssn = patient1.Ssn ')

  
end