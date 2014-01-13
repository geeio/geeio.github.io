feathers = require 'feathers'
trebuchet = require("trebuchet")("847f5188-9138-4a38-9690-adb2491870ef")

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
