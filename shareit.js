ShareIt = {
  settings: {
    autoInit: true,
    buttons: 'responsive',
    sites: {
      'facebook': {
        'appId': null,
        'version': 'v2.1',
        'description': '',
        'use': true
      },
      'twitter': {
        'description': '',
        'use': true
      },
      'googleplus': {
        'description': '',
        'use': true
      },
      'pinterest': {
        'description': '',
        'use': true
      },
      'instagram': {
        'description': '',
        'use': true
      }
    },
    siteOrder: ['facebook', 'twitter', 'pinterest', 'googleplus', 'instagram'],
    classes: "large btn",
    iconOnly: false,
    faSize: '',
    faClass: '',
    applyColors: true
  },
  configure: function(hash) {
    return this.settings = $.extend(true, this.settings, hash);
  },
  helpers: {
    classes: function() {
      return ShareIt.settings.classes;
    },
    showText: function() {
      return !ShareIt.settings.iconOnly;
    },
    applyColors: function() {
      return ShareIt.settings.applyColors;
    },
    faSize: function() {
      return ShareIt.settings.faSize;
    },
    faClass: function() {
      if (!!ShareIt.settings.faClass) {
        return '-' + ShareIt.settings.faClass;
      } else {
        return '';
      }
    }
  }
};

ShareIt.init = function(hash) {
  this.settings = $.extend(true, this.settings, hash);
  window.twttr = (function(d, s, id) {
    var fjs, js, t;
    t = void 0;
    js = void 0;
    fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {
      return;
    }
    js = d.createElement(s);
    js.id = id;
    js.src = "https://platform.twitter.com/widgets.js";
    fjs.parentNode.insertBefore(js, fjs);
    return window.twttr || (t = {
      _e: [],
      ready: function(f) {
        return t._e.push(f);
      }
    });
  })(document, 'script', 'twitter-wjs');
  $('<div id="fb-root"></div>').appendTo('body');
  if (ShareIt.settings.autoInit) {
    window.fbAsyncInit = function() {
      return FB.init({appId: ShareIt.settings.sites.facebook.appId, version: 'v2.4'});
    };
  }
  return (function(d, s, id) {
    var fjs, js;
    js = void 0;
    fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {
      return;
    }
    js = d.createElement(s);
    js.id = id;
    js.src = '//connect.facebook.net/en_US/sdk.js';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'facebook-jssdk');
};

ShareIt.facebookMeta = function(description, url, title, img) {
  $('meta[property^="og:"]').remove();
  $('<meta>', {
    property: 'og:type',
    content: 'article'
  }).appendTo('head');
  $('<meta>', {
    property: 'og:site_name',
    content: location.hostname
  }).appendTo('head');
  $('<meta>', {
    property: 'og:url',
    content: url
  }).appendTo('head');
  $('<meta>', {
    property: 'og:title',
    content: title
  }).appendTo('head');
  $('<meta>', {
    property: 'og:description',
    content: description
  }).appendTo('head');
  $('<meta>', {
    property: 'og:image',
    content: img
  }).appendTo('head');
};

ShareIt.twitterMeta=function(author,title,description,img){
  $('meta[property^="twitter:"]').remove();
  $('<meta>', {
    property: 'twitter:card',
    content: 'summary'
  }).appendTo('head');
  if (author) {
    $('<meta>', {
      property: 'twitter:creator',
      content: author
    }).appendTo('head');
  }

  $('<meta>', {
    property: 'twitter:url',
    content: location.origin + location.pathname
  }).appendTo('head');
  $('<meta>', {
    property: 'twitter:title',
    content: "" + title
  }).appendTo('head');

  $('<meta>', {
    property: 'twitter:description',
    content: description
  }).appendTo('head');
  $('<meta>', {
    property: 'twitter:image',
    content: img
  }).appendTo('head');
};