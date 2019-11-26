URL='https://spselitestg.cardinalhealth.net/stage_841/ws/DmsWebService'
net.http.respond{body="hello"}
function main()
properties = require("properties")
    Validation = require("Validation")
    constants = require("Constants")

    properties.directory_path()
    properties.db_conn()
    constants.csos_order_header_size()
    constants.csos_order_details_size()
    constants.log_statements()
    constants.query_constants()
    constants.frequently_constants()
   
    newFile = io.open( "C:\\3PL_WO\\SOAP\\soapdata.txt", "w+" )
    --local R =net.http.post{url=URL,live=true}
 --  F=io.open("C:\\3PL_WO\\SOAP\\soaprequest.txt","r")
 --         Data =  F:read('*a')
  --       F:close()
    --local R = net.http.post{response_headers_format='raw',body='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="wsclient.dms.tecsys.com"><soapenv:Header/><soapenv:Body><wsc:update><arg0><userName>tecuser</userName><password>supt2013</password><sessionId>0</sessionId><transactions><action>update</action><data><DmsOrd-Update-OrderHoldWebordering><Organization>EP</Organization><Division>01</Division><Order>141302</Order><Customer>EP10023</Customer><DmsOrdHoldWebordering><Line><OrderId>52135534</OrderId><HoldSequence>1</HoldSequence><HoldCode>CSWB</HoldCode><OnHold>N</OnHold><DateAndTimeOrderReleasedFromHold>2019-11-15</DateAndTimeOrderReleasedFromHold><ReleaseComment>validated</ReleaseComment></Line></DmsOrdHoldWebordering></DmsOrd-Update-OrderHoldWebordering></data></transactions></arg0></wsc:update></soapenv:Body></soapenv:Envelope>',url=URL,live=true}
   --R = net.http.post{response_headers_format='raw',body=Data,url=URL,live=true}
   read_order_file='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="wsclient.dms.tecsys.com"><soapenv:Header/><soapenv:Body><wsc:update><arg0><userName>tecuser</userName><password>supt2013</password><sessionId>0</sessionId><transactions><action>update</action><data><DmsOrd-Update-OrderHoldWebordering><Organization>EP</Organization><Division>01</Division><Order>141302</Order><Customer>EP10023</Customer><DmsOrdHoldWebordering><Line><OrderId>52135534</OrderId><HoldSequence>1</HoldSequence><HoldCode>CSWB</HoldCode><OnHold>N</OnHold><DateAndTimeOrderReleasedFromHold>2019-11-15</DateAndTimeOrderReleasedFromHold><ReleaseComment>validated</ReleaseComment></Line></DmsOrdHoldWebordering></DmsOrd-Update-OrderHoldWebordering></data></transactions></arg0></wsc:update></soapenv:Body></soapenv:Envelope>'

 --[[  X =xml.parse{data=read_order_file}
   print(X)
print(type(X))

   username=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.userName:nodeText())
   password=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.password:nodeText())
   organization=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.transactions.data["DmsOrd-Update-OrderHoldWebordering"].Organization:nodeText())
  order=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.transactions.data["DmsOrd-Update-OrderHoldWebordering"].Order:nodeText())
  customer=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.transactions.data["DmsOrd-Update-OrderHoldWebordering"].Customer:nodeText()) 
  order_Id=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.transactions.data["DmsOrd-Update-OrderHoldWebordering"].DmsOrdHoldWebordering.Line.OrderId:nodeText()) 
   date_and_time=tostring(X["soapenv:Envelope"]["soapenv:Body"]["wsc:update"].arg0.transactions.data["DmsOrd-Update-OrderHoldWebordering"].DmsOrdHoldWebordering.Line.DateAndTimeOrderReleasedFromHold:nodeText())
   print(type(username))
 
]]--
      a= string.gsub(read_order_file ,'tecuser','tecuser')
      b=string.gsub(a,'supt2013','supt2013')
      c=string.gsub(b,'EP','EP')
      d=string.gsub(c,'141302','141304')
      e=string.gsub(d,'EP10023','EP10024')
      f=string.gsub(e,'52135534','52135536')
      g=string.gsub(f,'2019-11-15','2019-11-25')
     
 
 print(g)
     Response = net.http.post{response_headers_format='raw',body=g,url=URL,live=true}
   print(R)
   after_parsing =xml.parse{data=Response}
   print(after_parsing)
     result=net.http.respond{headers='',body=after_parsing["soap:Envelope"]["soap:Body"]["ns2:updateResponse"]["return"].transactions.data["DmsOrd-Update-OrderHoldWebordering"].DmsOrdHoldWebordering.Line.OnHold:nodeText(),persist=false,code=5}
    print(result)

    newFile:write(result)

    newFile:close()



    function remove( filename, starting_line, num_lines )

         fp = io.open( filename, "r" )
        if fp == nil then
            return nil
        end
        content = {}
        i = 1;
        for line in fp:lines() do
            if i < starting_line or i >= starting_line + num_lines then
                content[#content+1] = line
            end
            i = i + 1
        end
        --print(content)
        if i > starting_line and i < starting_line + num_lines then
            print( "Warning: Tried to remove lines after EOF." )
        end
        fp:close()


        fp = io.open("C:\\3PL_WO\\SOAP\\soapdataresult.txt", "w+" )
        for i = 1, #content do
            fp:write( string.format( "%s\n", content[i] ) )
        end
        fp:close()

    end

    remove('C:\\3PL_WO\\SOAP\\soapdata.txt',1,10)



    fp = io.open("C:\\3PL_WO\\SOAP\\soapdataresult.txt", "r+" )
     final_result=  fp:read('*a')
    print(final_result)
   
   
   
   
   
function DBConn()
   conn:check()
end
   
   if pcall(DBConn) then 
   
 CURSOR=conn_dev:query{sql='SELECT PROD_NUM FROM 3pl_sps_ordering.order_detail', live=true};
      print(CURSOR,CURSOR[1].PROD_NUM,#CURSOR)
      
      CURSOR1=conn_dev:query{sql='SELECT * FROM 3pl_sps_ordering.csos_order_header', live=true};
type(CURSOR1)
 
      print(CURSOR1,#CURSOR1,type(CURSOR1[1].PO_NUMBER),CURSOR1[1].PO_DATE,CURSOR1[1].ACTIVE_FLG)
      


         CURSOR3=conn_dev:query{sql='select * from order_header where PO_NUM=53', live=true};
        print(CURSOR3)
 

       else
            log_file:write("Database connection  is not exist on : "..os.date('%x').." at :"..os.date('%X'),"\n")
                                end
end
