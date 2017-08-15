You won't be able to run jasmine tests in the browser smoothly by just following the SaaS book $6.7. At least not by Aug. 2017.

First make sure you installed `gem jasmine-rails` and `gem jasmine-jquery-rails`. After `rails g jasmine_rails:install`, add `//= require jasmine-jquery` to `application.js`. Alternatively, `jasmine-jquery-rails` can be included by adding `src_file: - assets/jasmine-jquery.js` to `jasmine.yml`. This would load matchers from `jasmine-jquery`. Both `gem jasmine-rails` and `gem jasmine` depend on it. The default fixtures loading path is `spec/javascripts/fixtures` but testing in the browser is not able to load fixtures. The workaround can be found at [this jasmine-jquery-rails issue](https://github.com/travisjeffery/jasmine-jquery-rails/issues/4)

You need to create a `config/initializers/jasmine_fixtures.rb` and fill it with
```ruby

# Map fixtures directory for Jasmine suite
if defined?(Jasmine::Jquery::Rails::Engine)
  JasmineFixtureServer = Proc.new do |env|
    Rack::Directory.new('spec/javascripts/fixtures').call(env)
  end
end

```

Then open `routes.rb` and add

```ruby

  # mount spec/javascripts/fixtures directory
  mount JasmineFixtureServer => '/spec/javascripts/fixtures' if defined?(Jasmine::Jquery::Rails::Engine)

```

On [jasmine-jquery-rails github page](https://github.com/travisjeffery/jasmine-jquery-rails) it implies that it takes effect through asset pipeline. That explains why the above settings are effective in browser but when you run `rake spec:javascript` in CLI it fails.

`jasmine-rails` doesn't support fixtures. It recommend [jasmine-fixture](https://github.com/searls/jasmine-fixture). It provides syntax for loading fixtures that is different from `jasmine-jquery`. So in order to use it you need to rewrite part of your tests first. So much for loading fixtures while testing in CLI using `jasmine-rails`.

After you did all the settings for `jasmine-rails` and `jasmine-jquery-rails`, without removing the two gems, you can add `gem jasmine` and run `rake jasmine:install`. Then either you run `rake jasmine` and visit `localhost:8888` or run `rake jasmine:ci` to run the tests in the CLI, the tests will be run smoothly, all the matchers from `jasmine-jquery` and fixtures.

After poking around in the relavent files, I found that `gem jasmine` load fixtures perfectly fine without the routes hacking, no matter from a browser or CLI. But even in CLI from the message shown I think it relies on `jasmine-jquery-rails` through asset pipeline by firing up a server.
