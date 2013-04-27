describe 'testing should replacement', ->

  describe 'exist', ->
    it 'should exist', ->
      x = 1
      should.exist x

    it 'should not exist', ->
      x = null
      should.not.exist x

  describe 'object', ->
    it 'should work with object', ->

      x = 10
      x.should.equal 10

    it 'should work with eql', ->

      [].should.eql []

    it 'should work with not eql', ->

      {x:1}.should.not.eql {x:2}

  describe 'throw', ->
    it 'should throw', ->

      (-> throw new Error '').should.throw()

    it 'should not throw', ->

      (-> ).should.not.throw()