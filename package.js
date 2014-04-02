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
