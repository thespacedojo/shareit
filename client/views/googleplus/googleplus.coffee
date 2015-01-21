Template.shareit_googleplus.rendered = () ->
  return unless @data

  #
  # Google share button
  #

  preferred_url = @data.url || location.origin + location.pathname
  href = "https://plus.google.com/share?url=#{preferred_url}"
  @$(".googleplus-share").attr "href", href

Template.shareit_googleplus.helpers(ShareIt.helpers)
