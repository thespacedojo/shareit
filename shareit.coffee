Handlebars.registerHelper "shareit", ->
  new Handlebars.SafeString(Template.shareit())

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

  # Listen for any 'Load More' clicks
  $('body').on 'click', '.load-more', (e) ->
    e.preventDefault()
    if Session.get 'postLimit'
      Session.set 'postLimit', Session.get('postLimit') + Blog.settings.pageSize
