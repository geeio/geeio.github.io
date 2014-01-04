req = require 'supertest'

describe 'Contact', ->
  describe 'create', ->
    data = ->
      name: 'George Erickson'
      email: 'george55@mit.edu'
      phone: '19046543025'
      what: 'Stuff'
      budget: '1000'

    it 'should send stuff', (done) ->
      req(app)
        .post('/contact')
        .send(data())
        .expect('Content-Type', /json/)
        .expect(200, done)
