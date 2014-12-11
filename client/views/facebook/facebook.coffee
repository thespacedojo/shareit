Template.shareit_fb.rendered = ->
  return unless @data
  $('meta[property^="og:"]').remove()

  #
  # OpenGraph tags
  #

  description = @data.excerpt || @data.description || @data.summary

  $('<meta>', { property: 'og:type', content: 'article' }).appendTo 'head'
  $('<meta>', { property: 'og:site_name', content: location.hostname }).appendTo 'head'
  $('<meta>', { property: 'og:url', content: location.origin + location.pathname }).appendTo 'head'
  $('<meta>', { property: 'og:title', content: "#{@data.title}" }).appendTo 'head'
  $('<meta>', { property: 'og:description', content: description }).appendTo 'head'

  if @data.thumbnail
    img = @data.thumbnail()
    if img
      if not /^http(s?):\/\/+/.test(img)
        img = location.origin + img
      $('<meta>', { property: 'og:image', content: img }).appendTo 'head'


  #
  # Facebook share button
  #

  preferred_url = @data.url || location.origin + location.pathname
  url = encodeURIComponent preferred_url

  base = "https://www.facebook.com/sharer/sharer.php"
  title = encodeURIComponent @data.title
  summary = encodeURIComponent description
  href = base + "?s=100&p[url]=" + url + "&p[title]=" + title + "&p[summary]=" + summary

  if img
    href += "&p[images][0]=" + encodeURIComponent img

  @$(".fb-share").attr "href", href

Template.shareit_fb.helpers(ShareIt.helpers)
