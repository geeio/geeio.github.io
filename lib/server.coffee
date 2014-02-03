feathers = require 'feathers'
trebuchet = require("trebuchet")(process.env.POSTMARK_KEY)

class Contact
  create: (data, params, cb) ->
    trebuchet.fling
      params:
        from: 'contact@gee.io'
        to: data.email
        cc: 'contact@gee.io'
        subject: 'Hire gee.io'
      html: __dirname + '/../public/email/contact.html'
      text: __dirname + '/../public/email/contact.txt'
      css: __dirname + '/../public/email/ink.css'
      data: data
    , (e, s) ->
      cb(null, params)

module.exports = feathers()
  .use('contact', new Contact())
  .listen(process.env.port || 9999)
