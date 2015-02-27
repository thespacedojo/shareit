Template.shareit.helpers
  siteTemplates: () ->
    templates = []
    for site in ShareIt.settings.siteOrder
        if ShareIt.settings.sites[site]?
            templates.push 'shareit_' + site
    return templates