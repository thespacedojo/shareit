Package.describe({
  summary: "A meteorite package that makes social sharing easy"
});

Package.on_use(function(api) {
  api.use(['coffeescript', 'less', 'templating', 'underscore'], 'client');


  api.imply('spiderable', ['client', 'server']);
  api.add_files([
    'shareit.coffee',
    'client/views/social.html',
    'client/views/social.coffee',
    'client/views/social.less'
  ], 'client');

  //api.export('Shareit', 'client');
});

Package.on_test(function (api) {
  api.use(['tinytest',
    'handlebars',
    'test-helpers',
    'templating',
    'coffeescript'
    ])
    api.use('shareit')

  api.add_files([
    'tests/client.html',
    'tests/client.js'
    ], 'client')
})
