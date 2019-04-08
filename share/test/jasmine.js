module.exports = {
    spec_files: [
        'test/**/*.test.ts',
        'test/**/*.test.js',
        'test/**/*.test.tsx',
        'test/**/*.test.jsx',
    ],
    helpers: [
        'test/customMatchers.ts',
        'test/mockDom.ts',
        'test/setup.ts',
        'test/reporter.ts',
        'test/noFailureOnNonEmptySuite.ts',
    ],
    oneFailurePerSpec: false,
    random: false,
}
