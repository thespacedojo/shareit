Template.shareit_pinterest.rendered = ->
    return unless @data

    preferred_url = @data.url || location.origin + location.pathname
    url = encodeURIComponent preferred_url

    href = "http://www.pinterest.com/pin/create/button/?url=#{url}&media=#{@data.media}&description=#{@data.description}"
    
    @$('.pinterest-share').attr 'href', href
    
Template.shareit_pinterest.events
    'click a': (event, template) ->
        event.preventDefault()
        window.open $(template.find('.pinterest-share')).attr('href'), 'pinterest_window', 'width=750, height=320'

Template.shareit_pinterest.helpers(ShareIt.helpers)