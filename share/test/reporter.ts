import { SpecReporter, StacktraceOption } from 'jasmine-spec-reporter'

Error.stackTraceLimit = Infinity

jasmine.getEnv()
    .clearReporters()
jasmine.getEnv()
    .addReporter(new SpecReporter({ spec: { displayStacktrace: StacktraceOption.PRETTY } }))
