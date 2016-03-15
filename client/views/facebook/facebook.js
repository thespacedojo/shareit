Template.shareit_facebook.onRendered(function() {
  if (!this.data) {
    return;
  }
  this.autorun(function() {
    var base, data, description, href, ref, summary, img, template, title, url;
    template = Template.instance();
    data = Template.currentData();
    description = ((ref = data.facebook) != null ? ref.description : void 0) || data.excerpt || data.description || data.summary;
    url = data.url || location.origin + location.pathname;
    title = data.title;
    if (data.thumbnail) {
      if (typeof data.thumbnail === "function") {
        img = data.thumbnail();
      } else {
        img = data.thumbnail;
      }
    }
    if (data.image) {
      if (typeof data.image === "function") {
        img = data.image();
      } else {
        img = data.image;
      }
    }
    if (img) {
      if (!/^http(s?):\/\/+/.test(img)) {
        img = location.origin + img;
      }
    }
    ShareIt.facebookMeta(description, url, title, img);
    appId = ShareIt.settings.sites.facebook.appId;
    if (ShareIt.settings.sites.facebook.popup != null) {
      return template.$('.fb-share').click(function(e) {
        e.preventDefault();
        return FB.ui({
          method: 'feed',
          display: 'popup',
          app_id: appId,
          link: url,
          name: title,
          description: summary,
          picture: img,
          redirect_uri: url
        }, function(response) {});
      });
    } else {
      url = encodeURIComponent(url);
      base = "https://www.facebook.com/dialog/feed";
      title = encodeURIComponent(title);
      summary = encodeURIComponent(description);
      href = base + "?app_id=" + appId + "&link=" + url + "&name=" + title + "&description=" + summary + "&redirect_uri=" + url;
      if (img)
        href = href + "&picture=" + img;
      return template.$(".fb-share").attr("href", href);
    }
  });
});

Template.shareit_facebook.helpers(ShareIt.helpers);
