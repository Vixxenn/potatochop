# Potatochop
_A simple server for HAML & SASS mock ups_

[![Build Status](https://travis-ci.org/VersaHQ/potatochop.svg?branch=master)](https://travis-ci.org/VersaHQ/potatochop)
[![Gem Version](https://badge.fury.io/rb/potatochop.svg)](http://badge.fury.io/rb/potatochop)

[VersaHQ blog post on Potatochop](http://blog.versahq.com/post/82290792427/potatochop)

## Installation

Install Potatochop as a gem in the usual way:

    $ gem install potatochop


## Usage

To use Potatochop, you also need a folder where you keep your mock ups. Ideally this folder would be under version control, but it is not required.

Once the Potatochop gem is installed, cd into your comps directory and run `potatochop`.

```
$ cd ~/mock_ups # or wherever you keep your mock_ups
$ potatochop
```
or pass in the path to your mock ups folder with the `--mockups` flag

```
$ potatochop --mockups ~/mock_ups
```

This will start up the Potatochop server on port 4567. By default, Potatochop will serve files in the same hierarchy as the mock ups folder.

For example, if you start Potatochop in a folder with a file called `new_homepage.html.haml` you can see it in your browser at `http://localhost:4567/new_homepage.html`

## The Mock Ups folder

For lack of a better name, the folder where you store your haml, sass, js, etc. files is called the mock ups folder.

Out of the box, Potatochop processes and serves any haml or sass file in this folder. Vanilla HTML & JavaScript files are served directly. For example, your mock ups folder could be organized like this:

```
~/mock_ups
	about.html
	faq.html.haml
	index.html.haml
	css/
		about.css
		faq.css.scss
		index.css.scss
	js/
		interactions.js
```

**ProTip:** There is an example mock ups folder in the [spec/fake_mockups](https://github.com/VersaHQ/potatochop/tree/master/spec/fake_mockups) folder (it's used by our automated tests).

When you want to include stylesheets in your haml/html pages, refer to them only by their `.css` extension. Using the above folder layout:

```
 # index.html.haml
 %link{ rel: 'stylesheet', href: 'css/index.css' }
```
## Serving files from a GitHub repo
Let's say you have a repository on GitHub where you keep your mockups (i.e [https://github.com/mertonium/potatochop_comps](https://github.com/mertonium/potatochop_comps)).

You can serve this repo by passing `potatochop` the `--interface` flag along with the repo path:

```
# Serve files from a public repository on GitHub
$ potatochop --interface github --repo mertonium/potatochop_comps
```
If your mock ups folder is in a private repo, you must also pass `potatochop` the `--token` flag, along with a [personal access token](https://github.com/settings/tokens/new):

```
# Serve files from a private repository on GitHub
$ potatochop --interface github --repo mertonium/potatochop_comps_private --token=GITHUB_ACCESS_TOKEN
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
