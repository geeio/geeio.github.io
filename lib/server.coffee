feathers = require 'feathers'
trebuchet = require("trebuchet")(process.env.POSTMARK_KEY)
harp = require "harp"

class Contact
  create: (data, params, cb) ->
    console.log JSON.stringify(data)
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
      cb(null, data)


module.exports = feathers()
  .use('/api/contact', new Contact())
  .use(harp.mount(__dirname + "/../public"))
  .listen(process.env.port || 9999)
