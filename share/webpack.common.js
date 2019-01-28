module.exports = {
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                loader: 'awesome-typescript-loader',
                exclude: /test\//,
            },
        ],
    },
    resolve: {
        extensions: [ '.ts' ],
    },
}
