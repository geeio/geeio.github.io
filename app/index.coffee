feathers = require 'feathers'
harp = require 'harp'


feathers()
  .use(feathers.static("./public"))
  .use(harp.mount("./public"))
  .listen(process.env.port || 9999)
