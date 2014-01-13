nock = require 'nock'

guid = ->
  s4 = ->
    Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)
  s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()


PostmarkMock =
  start: ->
    @messages = []

    nock('https://api.postmarkapp.com')
      .post('/email')
      .reply 200, (uri, body) ->
        req = JSON.parse(body)
        PostmarkMock.messages.push req

        JSON.stringify
          ErrorCode: 0
          Message: 'OK'
          MessageID: guid()
          SubmittedAt: (new Date()).toISOString()
          To: req.to


module.exports = PostmarkMock
