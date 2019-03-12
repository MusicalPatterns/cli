const { sep } = require('path')
const { readFileSync } = require('fs')

const pathParts = __dirname.split(sep)
const STEP_UP_OUT_OF_BIN_INTO_ROOT_OF_REPO_I_AM_COPIED_INTO = 1
const currentRepo = pathParts[ pathParts.length - 1 - STEP_UP_OUT_OF_BIN_INTO_ROOT_OF_REPO_I_AM_COPIED_INTO]

let port
readFileSync('ports.txt', 'utf-8').split(/\r?\n/).forEach(line => {
    const [ repo, potentialPort ] = line.split(':')
    if (!port && (currentRepo === repo || repo === 'default')) {
        port = potentialPort
    }
})

module.exports = {
    port,
}
