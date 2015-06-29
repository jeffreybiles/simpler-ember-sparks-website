require('dotenv').load();

module.exports = {
  development: {
    buildEnv: 'development', // Override the environment passed to the ember asset build. Defaults to 'production'
    store: {
      type: 'redis', // the default store is 'redis'
      host: 'localhost',
      port: 6379
    }
    ,
    assets: {
      type: 's3', // default asset-adapter is 's3'
      gzip: false, // if undefined or set to true, files are gziped
      gzipExtensions: ['js', 'css', 'svg'], // if undefined, js, css & svg files are gziped
      exclude: ['.DS_Store', '*-test.js'], // defaults to empty array
      accessKeyId: 'AKIAIO7ZEGCZRPVCG2PQ',
      secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
      bucket: 'spark-casts'
    }
  },

  staging: {
    buildEnv: 'staging', // Override the environment passed to the ember asset build. Defaults to 'production'
    store: {
      host: 'redis',
      port: 6379
    },
    assets: {
       accessKeyId: 'AKIAIO7ZEGCZRPVCG2PQ',
      secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
      bucket: 'spark-casts'
    }
  },
 
  //  production: {
  //   store: {
  //     host: 'production-redis.example.com',
  //     port: 6379,
  //     password: '<your-redis-secret>'
  //   },
  //   assets: {
  //     accessKeyId: '<your-access-key-goes-here>',
  //     secretAccessKey: process.env['AWS_ACCESS_KEY'],
  //     bucket: '<your-bucket-name>'
  //   }
  // }
};