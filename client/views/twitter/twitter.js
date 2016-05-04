Template.shareit_twitter.rendered = function() {
  if (!this.data) {
    return;
  }
  return this.autorun(function() {
    var base, data, description, href, img, preferred_url, ref, ref1, template, text, url;
    template = Template.instance();
    data = Template.currentData();
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
    description = ((ref = data.twitter) != null ? ref.description : void 0) || data.excerpt || data.description || data.summary;
    ShareIt.twitterMeta(data.author,data.title,description,img);
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
