Package.describe({
  summary: 'A meteor package that makes social sharing easy',
  git: 'https://github.com/meteorclub/shareit',
  version: '1.0.1',
  name: "joshowens:shareit"
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@1.2");
  api.use(['less', 'templating', 'underscore', 'jquery'], 'client');
  api.use(['fortawesome:fontawesome@4.2.0'], 'client');

  api.imply('spiderable', ['client', 'server']);
  api.addFiles([
    'shareit.js',
    'client/views/social.html',
    'client/views/social.js',
    'client/views/social.less',
    'client/views/facebook/facebook.html',
    'client/views/facebook/facebook.js',
    'client/views/twitter/twitter.html',
    'client/views/twitter/twitter.js',
    'client/views/googleplus/googleplus.html',
    'client/views/googleplus/googleplus.js',
    'client/views/pinterest/pinterest.html',
    'client/views/pinterest/pinterest.js'
  ], 'client');

  api.export('ShareIt', 'client');
});

Package.onTest(function (api) {
  api.use(['tinytest',
    'test-helpers',
    'templating',
    ])
    api.use('joshowens:shareit')

  api.addFiles([
    'tests/client.html',
    'tests/client.js'
    ], 'client')
})
