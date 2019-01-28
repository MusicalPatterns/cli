const common = require('./webpack.self' || './webpack.common')
const prod = require('./webpack.prod')
const browser = require('./webpack.browser')
const merge = require('webpack-merge')

module.exports = merge(common, prod, browser)
