import { ChildProcess, exec } from 'child_process'
import { existsSync } from 'fs'
import { createServer, Server, Socket } from 'net'
import { Browser, launch, Page } from 'puppeteer'
// @ts-ignore
import { port } from '../webpack.port'

const HOST: string = 'localhost'

const PUPPETEER_TIMEOUT: number = 100000
jasmine.DEFAULT_TIMEOUT_INTERVAL = 10000

let browser: Browser
let page: Page

const isPortInUse: (portUnderCheck: number) => Promise<boolean> =
    async (portUnderCheck: number): Promise<boolean> =>
        new Promise((resolve: (result: boolean) => void): void => {
            const portChecker: Server = createServer((socket: Socket) => {
                socket.pipe(socket)
            })

            portChecker.listen(portUnderCheck, HOST)
            portChecker.on('error', () => {
                resolve(true)
            })
            portChecker.on('listening', () => {
                portChecker.close()
                resolve(false)
            })
        })

const startServerIfNecessary: () => Promise<void> =
    async (): Promise<void> => {
        if (await isPortInUse(port)) {
            return
        }

        return new Promise((resolve: VoidFunction): void => {
            const server: ChildProcess = exec('make start open=false')
            server.stdout.on('data', (data: string) => {
                if (data.includes('Compiled successfully.')) {
                    resolve()
                }
            })
        })
    }

if (existsSync('src/start.ts')) {
    beforeAll(
        async (done: DoneFn) => {
            try {
                const t0: number = performance.now()
                await startServerIfNecessary()
                const t1: number = performance.now()
                console.log(`Starting the server took ${Math.round(t1 - t0) / 1000} seconds.`)

                const t2: number = performance.now()
                browser = await launch({ headless: !process.env.headful, timeout: PUPPETEER_TIMEOUT })
                page = await browser.newPage()
                await page.goto(`http://${HOST}:${port}`, { timeout: PUPPETEER_TIMEOUT })
                const t3: number = performance.now()
                console.log(`Starting puppeteer took ${Math.round(t3 - t2) / 1000} seconds.`)
            }
            catch (e) {
                console.log('Error in setup: ', e)
            }

            done()
        },
        PUPPETEER_TIMEOUT,
    )

    afterAll(
        async (done: DoneFn) => {
            try {
                await browser.close()
            }
            catch (e) {
                console.log('Error in setdown: ', e)
            }

            done()
        },
        PUPPETEER_TIMEOUT,
    )
}

export {
    page,
}
