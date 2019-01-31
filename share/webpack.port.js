const path = require('path')

module.exports = {
    port: path.basename(path.dirname(__dirname)) === 'performer' ? 8081 : 8080,
}
