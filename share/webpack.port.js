const path = require('path')

const repo = __dirname.split(path.sep).pop()

module.exports = {
    port: repo === 'performer' ? 8081 : process.env.NODE_ENV === 'test' ? 8082 : 8080,
}
