exports.config =

  # The address of a running selenium server.
  sauceUser: "geeio"
  sauceKey: process.env.SAUCE_KEY

  # Capabilities to be passed to the webdriver instance.
  capabilities:
    browserName: "chrome"


  # Spec patterns are relative to the current working directly when
  # protractor is called.
  specs: ["example_spec.coffee"]

  # Options to be passed to Jasmine-node.
  jasmineNodeOpts:
    showColors: true
    defaultTimeoutInterval: 1000000

  allScriptsTimeout: 1000000

  baseUrl: "http://gee.io"

  onPrepare: ->
    global.bi = global.by
