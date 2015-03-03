Template.shareit_twitter.rendered = ->
    @autorun ->
        template = Template.instance()
        data = Template.currentData() || ShareIt.defaultDataContext()
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

        $('<meta>', { property: 'twitter:card', content: 'summary' }).appendTo 'head'
        # What should go here?
        #$('<meta>', { property: 'twitter:site', content: '' }).appendTo 'head'

        if data.author
          $('<meta>', { property: 'twitter:creator', content: data.author }).appendTo 'head'

        description = data.twitter?.description || data.excerpt || data.description || data.summary
        $('<meta>', { property: 'twitter:url', content: location.origin + location.pathname }).appendTo 'head'
        $('<meta>', { property: 'twitter:title', content: "#{data.title}" }).appendTo 'head'
        $('<meta>', { property: 'twitter:description', content: description }).appendTo 'head'
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
