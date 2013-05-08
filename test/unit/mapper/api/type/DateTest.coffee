DateMapper = require 'src/mapper/api/type/Date'

dates = [
  new Date 2013, 1, 1
  new Date 2012, 3, 5
  new Date 2014, 11, 30
  new Date 2013, 1, 31
  new Date 2013, 1, 31, 23, 10, 1
  new Date 2013, 5, 6, 13, 14, 51
]

timestamps = [
  1359676800000
  1333580400000
  1419897600000
  1362268800000
  1362352201000
  1370520891000
  -342792000000
]
describe 'api/DateMapper', ->

  describe 'marshall', ->

    describe 'failures', ->
      call() for call in [undefined, null, false, NaN, 1.1, [], {}, new Object, ()->].map (invalid) ->
        () ->
          it "shoudl not accept #{invalid} as date", ->
            (-> DateMapper.marshall invalid).should.throw 'Invalid date'

    describe 'success', ->
      it 'should marshall (Date -> timestamp)', ->
        for date, index in dates
          timestamp = DateMapper.marshall date
          timestamp.should.equal timestamps[index]

      it 'should marshall unmarshall all around', ->
        for date, index in dates
          date.should.eql DateMapper.unmarshall DateMapper.marshall date

      it 'should marshall sample timestamps', ->
        for ts in timestamps
          ts.should.eql DateMapper.marshall DateMapper.unmarshall ts

  describe 'unmarshall', ->

    describe 'failures', ->
      call() for call in [undefined, null, false, NaN, [], {}, new Date, new Object, ()->].map (invalid) ->
        () ->
          it "should not accept #{invalid} as timestamp", ->
            (-> DateMapper.unmarshall invalid).should.throw 'Invalid timestamp'

    describe 'success', ->
      it 'should unmarshall (timestamp -> Date)', ->
        for date, index in dates
          d = DateMapper.unmarshall timestamps[index]
          d.should.be.instanceof Date
          d.getTime().should.equal date.getTime()
          d.should.eql date