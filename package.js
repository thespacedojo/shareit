Package.describe({
  summary: 'A meteor package that makes social sharing easy',
  git: 'https://github.com/meteorclub/shareit',
  version: '0.4.0',
  name: "joshowens:shareit"
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@1.0");
  api.use(['coffeescript', 'less@2.5.0_1', 'templating', 'underscore', 'jquery'], 'client');
  api.use(['fortawesome:fontawesome@4.2.0'], 'client');

  api.imply('spiderable', ['client', 'server']);
  api.addFiles([
    'shareit.coffee',
    'client/views/social.html',
    'client/views/social.coffee',
    'client/views/social.less',
    'client/views/facebook/facebook.html',
    'client/views/facebook/facebook.coffee',
    'client/views/twitter/twitter.html',
    'client/views/twitter/twitter.coffee',
    'client/views/googleplus/googleplus.html',
    'client/views/googleplus/googleplus.coffee',
    'client/views/pinterest/pinterest.html',
    'client/views/pinterest/pinterest.coffee'
  ], 'client');

  api.export('ShareIt', 'client');
});

Package.onTest(function (api) {
  api.use(['tinytest',
    'test-helpers',
    'templating',
    'coffeescript'
    ])
    api.use('joshowens:shareit')

  api.addFiles([
    'tests/client.html',
    'tests/client.js'
    ], 'client')
})
