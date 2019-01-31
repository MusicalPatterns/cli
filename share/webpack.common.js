const { DefinePlugin } = require('webpack')

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
        extensions: [ '.ts', '.tsx', '.js', '.json' ],
    },
    plugins: [
        new DefinePlugin({
            'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV),
        }),
    ],
}
