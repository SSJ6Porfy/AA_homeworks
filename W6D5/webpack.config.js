var path = require('path');

module.exports = {
  entry: "./frontend/my_app.jsx",
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  output: {
      path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
      filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /(node-modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  }
  ...
};
