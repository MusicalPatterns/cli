export {}

// tslint:disable

try {
    // @ts-ignore
    require('browser-env')()
}
catch (e) {
    // @ts-ignore
    require('../node_modules/@musical-patterns/cli/node_modules/browser-env')()
}

// @ts-ignore
global.requestAnimationFrame = (callback: any) => {
    setTimeout(callback, 0)
}

// @ts-ignore
global.cancelAnimationFrame = (id: number) => {
    clearTimeout(id)
}

const mockOscillator: any = {
    connect: () => {},
    start: () => {},
}

const mockGain: any = {
    connect: () => {},
    gain: {},
}

const mockAudioContext: any = {
    createOscillator: () => mockOscillator,
    createGain: () => mockGain,
    createPeriodicWave: () => {},
}

// @ts-ignore
global.AudioContext = () => mockAudioContext
// @ts-ignore
global.webkitAudioContext = () => mockAudioContext
