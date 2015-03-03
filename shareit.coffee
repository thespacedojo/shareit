ShareIt = {
  settings:
    autoInit: true
    buttons: 'responsive'
    sites:
      'facebook':
        'appId': null
        'version': 'v2.1'
        'description': ''
      'twitter':
        'description': ''
      'googleplus':
        'description': ''
      'pinterest':
        'description': ''
      'instagram':
        'description': ''
    siteOrder: ['facebook', 'twitter', 'pinterest', 'googleplus', 'instagram']
    classes: "large btn"
    iconOnly: false
    faSize: ''
    faClass: ''
    applyColors: true

  configure: (hash) ->
    @settings = $.extend(true, @settings, hash)

  defaultDataContext: () ->
    {
      url: location.origin + location.pathname,
      title: document.title
    }

  helpers: {
    classes: () ->
      ShareIt.settings.classes
    showText: () ->
      !ShareIt.settings.iconOnly
    applyColors: () ->
      ShareIt.settings.applyColors
    faSize: () ->
      ShareIt.settings.faSize
    faClass: () ->
      if !!ShareIt.settings.faClass
      then '-' + ShareIt.settings.faClass
      else
        ''
  }
}

@ShareIt = ShareIt

ShareIt.init = (hash) ->
  @settings = $.extend(true, @settings, hash)

  # Twitter
  window.twttr = do (d = document, s = 'script', id = 'twitter-wjs') ->
    t = undefined
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "https://platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs
    window.twttr or (t =
      _e: []
      ready: (f) ->
        t._e.push f
    )

  # Facebook
  # silence that annoying complaint
  $('<div id="fb-root"></div>').appendTo 'body'
  if ShareIt.settings.autoInit
    window.fbAsyncInit = ->
      FB.init(ShareIt.settings.sites.facebook)

  ((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    if d.getElementById(id)
      return
    js = d.createElement(s)
    js.id = id
    js.src = '//connect.facebook.net/en_US/sdk.js'
    fjs.parentNode.insertBefore js, fjs
    return
  ) document, 'script', 'facebook-jssdk'
