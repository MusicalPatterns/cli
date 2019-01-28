let common
try {
    common = require('./webpack.self')
}
catch (e) {
    common = require('./webpack.common')
}
const dev = require('./webpack.dev')
const browser = require('./webpack.browser')
const merge = require('webpack-merge')

module.exports = merge(common, dev, browser)
