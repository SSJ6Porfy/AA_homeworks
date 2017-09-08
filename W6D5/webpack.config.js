var path = require('path');

module.exports = {
  entry: "./entry.jsx",
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  output: {
      path: path.resolve(__dirname),
      filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node-modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  }
};
