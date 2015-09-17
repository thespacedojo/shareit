Template.shareit_twitter.rendered = ->
    return unless @data

    @autorun ->
        template = Template.instance()
        data = Template.currentData()
        noMeta=data.url && (data.url!=(location.origin + location.pathname))

        if not noMeta 
            $('meta[property^="twitter:"]').remove()
      
        if data.thumbnail
          if typeof data.thumbnail == "function"
            img = data.thumbnail()
          else
            img = data.thumbnail
          if img
            if not /^http(s?):\/\/+/.test(img)
              img = location.origin + img
      
        #
        # Twitter cards
        #
      
        if not noMeta 
            $('<meta>', { property: 'twitter:card', content: 'summary' }).appendTo 'head'
        # What should go here?
        #$('<meta>', { property: 'twitter:site', content: '' }).appendTo 'head'
      
        if data.author
          if not noMeta 
              $('<meta>', { property: 'twitter:creator', content: data.author }).appendTo 'head'
      
        description = data.twitter?.description || data.excerpt || data.description || data.summary
        if not noMeta 
            $('<meta>', { property: 'twitter:url', content: location.origin + location.pathname }).appendTo 'head'
        if not noMeta 
            $('<meta>', { property: 'twitter:title', content: "#{data.title}" }).appendTo 'head'
        if not noMeta 
            $('<meta>', { property: 'twitter:description', content: description }).appendTo 'head'
        if not noMeta 
            $('<meta>', { property: 'twitter:image', content: img }).appendTo 'head'
      
        #
        # Twitter share button
        #
      
        preferred_url = data.url || location.origin + location.pathname
        url = encodeURIComponent preferred_url
      
        base = "https://twitter.com/intent/tweet"
        text = encodeURIComponent data.twitter?.title || data.title
        href = base + "?url=" + url + "&text=" + text
      
        if data.author
          href += "&via=" + data.author
      
        template.$(".tw-share").attr "href", href


Template.shareit_twitter.helpers(ShareIt.helpers)
