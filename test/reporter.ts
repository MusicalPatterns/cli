// tslint:disable:no-implicit-dependencies
import { DisplayProcessor, SpecReporter } from 'jasmine-spec-reporter'
import { CustomReporterResult } from 'jasmine-spec-reporter/built/spec-reporter'

class ExperimentalProcessor extends DisplayProcessor {
    // tslint:disable-next-line:class-methods-use-this
    public displaySuite(suite: CustomReporterResult, log: string): string {
        return `is this thing on? ${log}`
    }
}

jasmine.getEnv()
    .clearReporters()
jasmine.getEnv()
    .addReporter(new SpecReporter({
        customProcessors: [ ExperimentalProcessor ],
    }))
