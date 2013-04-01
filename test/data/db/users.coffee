deepClone = require 'src/lib/utils/deepClone'

ObjectID = require('mongodb').ObjectID

date = 
  sixOfJune1983: new Date 1983, 5, 6
  firstFebruary: new Date 2012, 1, 1
  sevenDecember: new Date 2012, 11, 7

ids = 
  validIdString1: '50b896ddc814556766000001'
  validIdString2: '50b896ddc814556766000002'
  validIdString3: '50b896ddc814556766000003'
  validIdString4: '50b896ddc814556766000004'
  validIdString5: '50b896ddc814556766000005'
  validIdString6: '50b896ddc814556766000006'

data =

  validUser1:
    _id: new ObjectID( ids.validIdString1 )
    first_name: 'alister'
    last_name: 'smith'
    email: 'alister@coffeestack.com'
    password: 'qwerty'
    created_at: date.firstFebruary

  validUser2:
    _id: new ObjectID( ids.validIdString2 )
    first_name: 'bob'
    last_name: 'peterson'    
    email: 'bob@coffestack.com'
    password: 'qwerty'
    created_at: date.sevenDecember

module.exports.getData = -> deepClone data