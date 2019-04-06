module.exports = {
    entry: './src/index.ts',
    output: {
        filename: 'index.js',
        globalObject: 'this',
        libraryTarget: 'umd',
    },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                loader: 'ts-loader',
                exclude: /test\//,
            },
        ],
    },
    externals: [
        '@musical-patterns/cli',
        '@musical-patterns/compiler',
        '@musical-patterns/pattern',
        '@musical-patterns/performer',
        '@musical-patterns/playroom',
        '@musical-patterns/snapshot',
        '@musical-patterns/utilities',
        '@musical-patterns/id',
        '@musical-patterns/spec',
        '@musical-patterns/metadata',
        '@musical-patterns/material',
    ],
}
