local Example=[[
<Persons>
<Person>
<FirstName>Fred</FirstName>
<LastName>mary</LastName>
</Person>
<Person>
<FirstName>Tracy</FirstName>
<LastName></LastName>
</Person>
</Persons>]]
 
function main()
   local X = xml.parse{data=Example}
   for i=1,2 do
   local FirstName=''
   if #X.Persons.Person.FirstName > 0 then
      FirstName = X.Persons:child("Person", i).FirstName:nodeText()
       else
     LastName="no child elements"
   end
   local LastName=''  
   if #X.Persons.Person.LastName > 0 then
      LastName =X.Persons:child("Person", i).LastName:nodeText()
      else
      LastName="no child elements"
   end
      queue.push{data=FirstName}
      queue.push{data=LastName}
      end
end