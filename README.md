# Share it

We've built social sharing buttons a few times and decided it was time to extract it to a package!  The goal of this package is to do a few things:

* Render proper OG and Twitter meta tags
* Support social sharing buttons with bootstrap-3 and font-awesome
* Expand to support other social platforms besides just twitter & facebook, in a configurable way

See more in our [documentation](http://github.differential.io/shareit/)

## Quick Start

    meteor add joshowens:shareit

## Configuration

Somewhere in your client (not server) code you can configure ShareIt.  This is completely optional and the defaults are listed below:

    ShareIt.configure({
      useFB: true,      // boolean (default: true)
                        // Whether to show the Facebook button
      useTwitter: true, // boolean (default: true)
                        // Whether to show the Twitter button
      useGoogle: true,  // boolean (default: true)
                        // Whether to show the Google+ button
      buttons: 'large'  // string ('large' (default), 'small', 'responsive')
                        // Whether to use large or small buttons or both in a responsive manner.
    })
