Template.shareit.rendered = ->
  return unless @data
  $('meta[property^="og:"]').remove()
  $('meta[property^="twitter:"]').remove()

  #
  # OpenGraph tags
  #

  $('<meta>', { property: 'og:type', content: 'article' }).appendTo 'head'
  $('<meta>', { property: 'og:site_name', content: location.hostname }).appendTo 'head'
  $('<meta>', { property: 'og:url', content: location.origin + location.pathname }).appendTo 'head'
  $('<meta>', { property: 'og:title', content: "#{@data.title}" }).appendTo 'head'
  $('<meta>', { property: 'og:description', content: @data.excerpt }).appendTo 'head'

  if @data.thumbnail
    img = @data.thumbnail()
    if img
      if not /^http(s?):\/\/+/.test(img)
        img = location.origin + img
      $('<meta>', { property: 'og:image', content: img }).appendTo 'head'

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

  #
  # Facebook share button
  #

  base = "https://www.facebook.com/sharer/sharer.php"
  title = encodeURIComponent @data.title
  summary = encodeURIComponent @data.excerpt
  href = base + "?s=100&p[url]=" + url + "&p[title]=" + title + "&p[summary]=" + summary

  if img
    href += "&p[images][0]=" + encodeURIComponent img

  @$(".fb-share").attr "href", href
