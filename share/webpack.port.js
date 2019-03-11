const path = require('path')

const repo = __dirname.split(path.sep).pop()

const servicePorts = {
    performer: 8081,
    playroom: 8082,
    lab: 8083,
}

const port = servicePorts[ repo ] || 8080

module.exports = {
    port,
}
