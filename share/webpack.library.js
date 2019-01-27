module.exports = {
    entry: './src/index.ts',
    output: {
        filename: 'index.js',
        globalObject: 'this',
        libraryTarget: 'umd',
    },
    externals: [
        '@musical-patterns/compiler',
        '@musical-patterns/pattern',
        '@musical-patterns/utilities',
    ],
}
