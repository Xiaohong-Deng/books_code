You won't be able to run jasmine tests in the browser smoothly by just following the SaaS book $6.7. At least not by Aug. 2017.

First make sure you installed `gem jasmine-rails` and `gem jasmine-jquery-rails`. After `rails g jasmine_rails:install`, add `//= require jasmine-jquery` to `application.js`. This would load matchers from `jasmine-jquery`. The default fixtures loading path is `spec/javascripts/fixtures` but testing in the browser is not able to load fixtures. The workaround can be found at [this jasmine-jquery-rails issue](https://github.com/travisjeffery/jasmine-jquery-rails/issues/4)

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

On [jasmine-jquery github page](https://github.com/travisjeffery/jasmine-jquery-rails) it implies that it takes effect through asset pipeline. That expains why the above settings are effective in browser, not in terminal.

`jasmine-rails` doesn't support fixtures. It recommend [jasmine-fixture](https://github.com/searls/jasmine-fixture). It provides syntax for loading fixtures that is different from `jasmine-jquery`. So in order to use it you need to rewrite part of your tests first.
