Template.shareit.helpers
  siteTemplates: () ->
    templates = []
    for site in ShareIt.settings.sites
        templates.push 'shareit_' + site
    templates