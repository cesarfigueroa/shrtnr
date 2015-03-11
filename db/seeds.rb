bookmarks = [
  {
    :title => 'Designing Short URLs (for Last.fm)',
    :url => 'http://dsingleton.github.io/short-urls/'
  },

  {
    :title => 'It’s Only Color',
    :url => 'https://robots.thoughtbot.com/Its-only-color'
  },
  {
    :title => 'Hands-on Backbone.js on Rails',
    :url => 'https://upcase.com/hands-on-backbone-js-on-rails'
  },
  {
    :title => 'What Screens Want',
    :url => 'http://frankchimero.com/talks/what-screens-want/transcript/'
  },
  {
    :title => 'More Transparent UI Code with Namespaces',
    :url => 'http://csswizardry.com/2015/03/more-transparent-ui-code-with-namespaces/'
  },
  {
    :title => 'A Statement of Intentions',
    :url => 'http://thecompleti.st/no1'
  },
  {
    :title => 'Adding Support for Custom Domains in Rails',
    :url => 'http://kyle.conarro.com/rails-custom-domain-support'
  },
  {
    :title => 'Passing Blocks in Ruby Without &block',
    :url => 'http://mudge.name/2011/01/26/passing-blocks-in-ruby-without-block.html'
  },
  {
    :title => 'Creating Harmonious Color Schemes',
    :url => 'http://methodandcraft.com/videos/creating-harmonious-color-schemes'
  }
]

bookmarks.each do |bookmark|
  Bookmark.where(:title => bookmark[:title]).first_or_create(bookmark)
end
