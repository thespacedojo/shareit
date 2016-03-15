Template.shareit_twitter.rendered = function() {
  if (!this.data) {
    return;
  }
  return this.autorun(function() {
    var base, data, description, href, img, preferred_url, ref, ref1, template, text, url;
    template = Template.instance();
    data = Template.currentData();
    $('meta[property^="twitter:"]').remove();
    if (data.thumbnail) {
      if (typeof data.thumbnail === "function") {
        img = data.thumbnail();
      } else {
        img = data.thumbnail;
      }
      if (img) {
        if (!/^http(s?):\/\/+/.test(img)) {
          img = location.origin + img;
        }
      }
    }
    $('<meta>', {
      property: 'twitter:card',
      content: 'summary'
    }).appendTo('head');
    if (data.author) {
      $('<meta>', {
        property: 'twitter:creator',
        content: data.author
      }).appendTo('head');
    }
    description = ((ref = data.twitter) != null ? ref.description : void 0) || data.excerpt || data.description || data.summary;
    $('<meta>', {
      property: 'twitter:url',
      content: location.origin + location.pathname
    }).appendTo('head');
    $('<meta>', {
      property: 'twitter:title',
      content: "" + data.title
    }).appendTo('head');
    $('<meta>', {
      property: 'twitter:description',
      content: description
    }).appendTo('head');
    $('<meta>', {
      property: 'twitter:image',
      content: img
    }).appendTo('head');
    preferred_url = data.url || location.origin + location.pathname;
    url = encodeURIComponent(preferred_url);
    base = "https://twitter.com/intent/tweet";
    text = encodeURIComponent(((ref1 = data.twitter) != null ? ref1.title : void 0) || data.title);
    href = base + "?url=" + url + "&text=" + text;
    if (data.author) {
      href += "&via=" + data.author;
    }
    return template.$(".tw-share").attr("href", href);
  });
};

Template.shareit_twitter.helpers(ShareIt.helpers);
