const path = require('path')

const repo = __dirname.split(path.sep).pop()

const testPorts = {
    performer: 8081,
    playroom: 8082,
    lab: 8083,
}

const port = process.env.NODE_ENV === 'test' ? testPorts[ repo ] : 8080

module.exports = {
    port,
}
