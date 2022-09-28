let logMessageToConsole: (...message: string[]) => void
try {
    // tslint:disable-next-line no-require-imports no-var-requires
    const { logMessageToConsole: logMessageToConsoleFromUtilities } = require('@musical-patterns/utilities')
    logMessageToConsole = logMessageToConsoleFromUtilities
}
catch (e) {
    // tslint:disable-next-line no-empty
    logMessageToConsole = (): void => {}
}

import { ChildProcess, exec } from 'child_process'
import { existsSync } from 'fs'
import { Browser, launch, Page } from 'puppeteer'
// @ts-ignore
import { port } from '../bin/port'

const HOST: string = 'localhost'

const PUPPETEER_TIMEOUT: number = 100000
jasmine.DEFAULT_TIMEOUT_INTERVAL = 10000

let browser: Browser
let page: Page

const startServer: () => Promise<void> =
    async (): Promise<void> => {
        return new Promise((resolve: VoidFunction, reject: (message: string) => void): void => {
            const server: ChildProcess = exec('make start open=false')

            server.stdout!.on('data', (data: string): void => {
                if (data.includes('compiled')) { // as of webpack 5, this seems to be the way to know it succeeded
                    resolve()
                }
                if (data.includes('Failed to compile.')) {
                    reject('Webpack failed to compile.')
                }
            })
        })
    }

if (existsSync('test/integration')) {
    beforeAll(
        async (): Promise<void> => {
            try {
                const t0: number = performance.now()
                await startServer()
                const t1: number = performance.now()
                logMessageToConsole(`Starting the server took ${Math.round(t1 - t0) / 1000} seconds.`)

                const t2: number = performance.now()
                browser = await launch({ headless: !process.env.headful, timeout: PUPPETEER_TIMEOUT })
                page = await browser.newPage()
                await page.goto(`http://${HOST}:${port}`, { timeout: PUPPETEER_TIMEOUT })
                const t3: number = performance.now()
                logMessageToConsole(`Starting puppeteer took ${Math.round(t3 - t2) / 1000} seconds.`)
            }
            catch (e: any) {
                logMessageToConsole('Error in setup: ', e)
            }
        },
        PUPPETEER_TIMEOUT,
    )

    afterAll(
        async (): Promise<void> => {
            try {
                await browser.close()
            }
            catch (e: any) {
                logMessageToConsole('Error in setdown: ', e)
            }
        },
        PUPPETEER_TIMEOUT,
    )
}

export {
    page,
}
