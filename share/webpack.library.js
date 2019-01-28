module.exports = {
    entry: './src/index.ts',
    output: {
        filename: 'index.js',
        globalObject: 'this',
        libraryTarget: 'umd',
    },
    externals: [
        '@musical-patterns/cli',
        '@musical-patterns/compiler',
        '@musical-patterns/pattern',
        '@musical-patterns/performer',
        '@musical-patterns/playroom',
        '@musical-patterns/snapshot',
        '@musical-patterns/utilities',
    ],
}
