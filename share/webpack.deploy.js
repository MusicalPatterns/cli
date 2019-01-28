let common
try {
    common = require('./webpack.self')
}
catch (e) {
    common = require('./webpack.common')
}
const prod = require('./webpack.prod')
const browser = require('./webpack.browser')
const merge = require('webpack-merge')

module.exports = merge(common, prod, browser)
