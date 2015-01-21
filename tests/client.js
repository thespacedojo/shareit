dataContext = {title: 'Test title', author: 'My Uncle', thumbnail: 'TestPath'};


Tinytest.add("ShareIt - {{> shareit}} template renders", function(test) {
  div = renderToDiv(Template.test_helper_shareit)
  html = canonicalizeHtml(div.innerHTML)
  test.include(html, "Share on Facebook")
  test.include(html, "Share on Twitter")
});

Tinytest.add("ShareIt - {{> shareit}} template doesn't throw an exception from the rendered function", function(test) {
  try {
    Template.shareit_facebook.rendered()
  } catch (e) {
    console.log(e)
    test.fail(e)
  }
});


Tinytest.addAsync("ShareIt - {{> shareit}} template renders valid share links", function(test, done) {
  ShareIt.settings.sites.push('facebook');
  div = renderToDiv(Template.test_helper_shareit, dataContext)
  // This feels like a punt, should investigate more
  Meteor.setTimeout(function() {
    html = div.innerHTML
    test.include(html, 'https://www.facebook.com/sharer/sharer.php?s=100&amp;p[url]=http%3A%2F%2Flocalhost%3A10015%2Flocal&amp;p[title]=Test%20title&amp;p[summary]=undefined')
    test.include(html, 'https://twitter.com/intent/tweet?url=http%3A%2F%2Flocalhost%3A10015%2Flocal&amp;text=Test%20title')
    // This is important for Async tests.
    done()
  }, 200);
});
