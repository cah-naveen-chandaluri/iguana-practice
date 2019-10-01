function main()
R = net.http.get{url='team-scale.com/TestData/ng_text_v15/api', live=true}

   X = json.parse{data=R}
   print(X[1].city)
 Conn = db.connect{
         api=db.SQL_SERVER,
         name='Sripad',       
      user='',
         password='',
      use_unicode=true,
         live=true
    }
   n=10
   for i=1,n do
    SqlInsert =
   [[
   INSERT INTO api3
  (id,name,status,city,mainPhotoUrl,ratePerHour,currency,lat,
  lon,maxParticipants,distance) Values(
   ]].."'"..X[i].id.."',".. 
     "\n   '"..X[i].name.."',"..
     "\n  '"..X[i].status.."',"..
     --"\n   '"..X[i].countryFullName.."',"..
     "\n   '"..X[i].city.."',"..
     "\n   '"..X[i].mainPhotoUrl.."',"..
    "\n   '"..X[i].ratePerHour.."',"..
    "\n   '"..X[i].currency.."',"..
    "\n   '"..X[i].lat.."',"..
    "\n   '"..X[i].lon.."',"..
    "\n   '"..X[i].maxParticipants.."',"..
   -- "   '"..X[1].ratingAvg.."'"..
    "\n   '"..X[i].distance.."'"..           
   '\n)'    
   Conn:execute{sql=SqlInsert, live=true}
   end
   Conn:query('SELECT * FROM api3') 
end