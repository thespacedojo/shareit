Package.describe({
  summary: 'A meteorite package that makes social sharing easy',
  git: 'https://github.com/Differential/shareit',
  version: '0.1.0'
});

Package.onUse(function(api) {
  api.use(['coffeescript', 'less', 'templating', 'underscore'], 'client');


  api.imply('spiderable', ['client', 'server']);
  api.addFiles([
    'shareit.coffee',
    'client/views/social.html',
    'client/views/social.coffee',
    'client/views/social.less'
  ], 'client');

  //api.export('Shareit', 'client');
});

Package.onTest(function (api) {
  api.use(['tinytest',
    'test-helpers',
    'templating',
    'coffeescript'
    ])
    api.use('shareit')

  api.addFiles([
    'tests/client.html',
    'tests/client.js'
    ], 'client')
})
