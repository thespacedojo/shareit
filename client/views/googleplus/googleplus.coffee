Template.shareit_googleplus.rendered = () ->
    return unless @data

    @autorun ->
        template = Template.instance()
        data = Template.currentData()
        noMeta=data.url && (data.url!=(location.origin + location.pathname))

        if not noMeta 
            $('meta[itemscope]').remove()
        
        #
        # Schema tags
        #
        description = data.googleplus?.description || data.excerpt || data.description || data.summary
        url = data.url || location.origin + location.pathname
        title = data.title
        itemtype = data.googleplus?.itemtype || 'Article'
        if not noMeta 
            $('html').attr('itemscope', '').attr('itemtype', "http://schema.org/#{itemtype}")
        if not noMeta
            $('<meta>', { itemprop: 'name', content: location.hostname }).appendTo 'head'
        if not noMeta 
            $('<meta>', { itemprop: 'url', content: url }).appendTo 'head'
        if not noMeta 
            $('<meta>', { itemprop: 'description', content: description }).appendTo 'head'
        
        if data.thumbnail
            if typeof data.thumbnail == "function"
                img = data.thumbnail()
            else
                img = data.thumbnail
        if img
            if not /^http(s?):\/\/+/.test(img)
                img = location.origin + img
                
        if not noMeta 
            $('<meta>', { itemprop: 'image', content: img }).appendTo 'head'
        #
        # Google share button
        #
      
        href = "https://plus.google.com/share?url=#{url}"
        template.$(".googleplus-share").attr "href", href

Template.shareit_googleplus.helpers(ShareIt.helpers)
