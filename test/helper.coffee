chai = require('chai')
chai.should()

nock = require 'nock'
nock.disableNetConnect()
nock.enableNetConnect('127.0.0.1')

global.app = require('../lib/server')
