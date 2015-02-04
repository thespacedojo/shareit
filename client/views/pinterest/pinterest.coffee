Template.shareit_pinterest.rendered = ->
    return unless @data

    @autorun ->
        template = Template.instance()
        data = Template.currentData()
        
        preferred_url = data.url || location.origin + location.pathname
        url = encodeURIComponent preferred_url
        description = encodeURIComponent data.pinterest?.description || data.description
    
        href = "http://www.pinterest.com/pin/create/button/?url=#{url}&media=#{data.media}&description=#{description}"
        
        template.$('.pinterest-share').attr 'href', href
    
Template.shareit_pinterest.events
    'click a': (event, template) ->
        event.preventDefault()
        window.open $(template.find('.pinterest-share')).attr('href'), 'pinterest_window', 'width=750, height=650'

Template.shareit_pinterest.helpers(ShareIt.helpers)