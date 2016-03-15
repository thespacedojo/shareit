Template.shareit_pinterest.rendered = function() {
  if (!this.data) {
    return;
  }
  return this.autorun(function() {
    var data, description, href, preferred_url, ref, template, url;
    template = Template.instance();
    data = Template.currentData();
    preferred_url = data.url || location.origin + location.pathname;
    url = encodeURIComponent(preferred_url);
    description = encodeURIComponent(((ref = data.pinterest) != null ? ref.description : void 0) || data.description);
    href = "http://www.pinterest.com/pin/create/button/?url=" + url + "&media=" + data.media + "&description=" + description;
    return template.$('.pinterest-share').attr('href', href);
  });
};

Template.shareit_pinterest.events({
  'click a': function(event, template) {
    event.preventDefault();
    return window.open($(template.find('.pinterest-share')).attr('href'), 'pinterest_window', 'width=750, height=650');
  }
});

Template.shareit_pinterest.helpers(ShareIt.helpers);
