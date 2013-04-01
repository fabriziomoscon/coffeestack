#> Create user success
path: '/user'
method: 'POST'
headers:
  'Accept': 'application/json'
  'Content-Type': 'application/json'
body:
  first_name: 'Fabrizio'
  last_name: 'Moscon'
  email: "fab+#{Date.now()}@coffeestack.com"
  password: 'mySecretPass'


#? Status: 201 created
response.statusCode.should.equal 201

#? Response.body should equal ''
response.body.should.equal ''

#? Should set a cookie
response.should.have.header 'Set-Cookie'