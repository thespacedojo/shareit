AvailableCssFrameworks = ['bootstrap', 'semantic']

ShareIt = {
  settings:
    buttons: 'responsive'
    useFB: true
    useTwitter: true
    useGoogle: true
    classes: 'large btn' # Ignored by cssFramework 'semantic'
    iconOnly: false
    applyColors: true # Ignored by cssFramework 'semantic'
    cssFramework: 'bootstrap'
  configure: (hash) ->
    @settings = $.extend(@settings, hash)
    cssFramework = ShareIt.settings.cssFramework
    if !_.contains(AvailableCssFrameworks, cssFramework)
      console.log("Error: '" + cssFramework + "' not supported. Available: " + AvailableCssFrameworks)
  helpers: {
    showText: () ->
      !ShareIt.settings.iconOnly
    applyColors: () ->
      ShareIt.settings.applyColors
    cssFramework: () ->
      return ShareIt.settings.cssFramework
    size: () ->
      return ShareIt.settings.size
    linkClasses: (socialNetwork) ->
      switch ShareIt.settings.cssFramework
        when 'bootstrap'
          if ShareIt.settings.applyColors
            return ShareIt.settings.classes + ' shareit-' + socialNetwork + '-colors'
          else
            return ShareIt.settings.classes
        when 'semantic'
          socialNetwork = socialNetwork + ' plus' if socialNetwork == 'google'
          if ShareIt.settings.iconOnly
            return 'ui circular small ' + socialNetwork + ' icon button'
          else
            return 'ui labeled tiny ' + socialNetwork + ' icon button'
        else
          # Not supported
          return ''
    iconClasses: (socialNetwork) ->
      switch ShareIt.settings.cssFramework
        when 'bootstrap'
          return 'fa fa-' + socialNetwork
        when 'semantic'
          socialNetwork = socialNetwork + ' plus' if socialNetwork == 'google'
          return socialNetwork + ' icon'
        else
          # Not supported
          return ''
  }
}

@ShareIt = ShareIt

Meteor.startup ->

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
  js = undefined
  id = "facebook-jssdk"
  ref = document.getElementsByTagName("script")[0]
  return  if document.getElementById(id)
  js = document.createElement("script")
  js.id = id
  js.async = true
  js.src = "//connect.facebook.net/en_US/all.js"
  ref.parentNode.insertBefore js, ref
