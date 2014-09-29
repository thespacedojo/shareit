Template.shareit_twitter.rendered = ->
  return unless @data
  $('meta[property^="twitter:"]').remove()

  if @data.thumbnail
    img = @data.thumbnail()
    if img
      if not /^http(s?):\/\/+/.test(img)
        img = location.origin + img

  #
  # Twitter cards
  #

  $('<meta>', { property: 'twitter:card', content: 'summary' }).appendTo 'head'
  # What should go here?
  #$('<meta>', { property: 'twitter:site', content: '' }).appendTo 'head'

  if @data.author
    author = @data.author()
  if author and author.profile and author.profile.twitter
    $('<meta>', { property: 'twitter:creator', content: author.profile.twitter }).appendTo 'head'

  $('<meta>', { property: 'twitter:url', content: location.origin + location.pathname }).appendTo 'head'
  $('<meta>', { property: 'twitter:title', content: "#{@data.title}" }).appendTo 'head'
  $('<meta>', { property: 'twitter:description', content: @data.excerpt }).appendTo 'head'
  $('<meta>', { property: 'twitter:image:src', content: img }).appendTo 'head'

  #
  # Twitter share button
  #

  preferred_url = @data.url || location.origin + location.pathname
  url = encodeURIComponent preferred_url

  base = "https://twitter.com/intent/tweet"
  text = encodeURIComponent @data.title
  href = base + "?url=" + url + "&text=" + text

  if author and author.profile and author.profile.twitter
    href += "&via=" + author.profile.twitter

  @$(".tw-share").attr "href", href
