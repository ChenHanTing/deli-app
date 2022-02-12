# 德利App

#### 前置作業

查看可安裝的版本

````ruby
rbenv install --list
````

查看的結果為

````shell
2.6.8
2.7.4
3.0.2
jruby-9.3.1.0
mruby-3.0.0
rbx-5.0
truffleruby-21.3.0
truffleruby+graalvm-21.3.0

Only latest stable releases for each Ruby implementation are shown.
Use 'rbenv install --list-all / -L' to show all local versions.
````

依照要求安裝ruby版本

````shell
rbenv install 3.0.2
````

這會安裝一段時間...

````shell
rbenv: /Users/chenhanting/.rbenv/versions/3.0.2 already exists
continue with installation? (y/N) y
Downloading openssl-1.1.1l.tar.gz...
-> https://dqw8nmjcqpjn7.cloudfront.net/0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1
Installing openssl-1.1.1l...
Installed openssl-1.1.1l to /Users/chenhanting/.rbenv/versions/3.0.2

Downloading ruby-3.0.2.tar.gz...
-> https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.2.tar.gz
Installing ruby-3.0.2...
ruby-build: using readline from homebrew
Installed ruby-3.0.2 to /Users/chenhanting/.rbenv/versions/3.0.2

rbenv: cannot rehash: /Users/chenhanting/.rbenv/shims/.rbenv-shim exists
````

發現已經有安裝ruby3，切換

````shell
rbenv shell 3.0.2
````

````shell
ruby -v
$ ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-darwin20]
````

安裝rails6

````shell
gem install rails -v 6.1.4.6
````

建立專案

````shell
rails new deliapp
cd deliapp
````

安裝devise

````ruby
bundle add devise
````

安裝bootstrap

````shell
yarn add bootstrap                                                               ✔
yarn add v1.22.17
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
warning " > bootstrap@5.1.3" has unmet peer dependency "@popperjs/core@^2.10.2".
[4/4] 🔨  Building fresh packages...
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
└─ bootstrap@5.1.3
info All dependencies
└─ bootstrap@5.1.3
✨  Done in 4.36s.
````

啟動專案

````shell
rails s                                                                          ✔
````

````txt
=> Booting Puma
=> Rails 6.1.4.6 application starting in development
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 5.6.2 (ruby 2.7.2-p137) ("Birdie's Version")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 29664
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
````

可以成功看到首頁

#### devise

````shell
rails generate devise:install
````

````txt
Running via Spring preloader in process 32797
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

     * Not required *

===============================================================================
````

user

````shell
rails generate devise user
rails db:migrate
````

in controllers/application.rb

````ruby
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
````

加入畫面

````shell
rails generate devise:views users
````

````txt
Running via Spring preloader in process 35406
      invoke  Devise::Generators::SharedViewsGenerator
      create    app/views/users/shared
      create    app/views/users/shared/_error_messages.html.erb
      create    app/views/users/shared/_links.html.erb
      invoke  form_for
      create    app/views/users/confirmations
      create    app/views/users/confirmations/new.html.erb
      create    app/views/users/passwords
      create    app/views/users/passwords/edit.html.erb
      create    app/views/users/passwords/new.html.erb
      create    app/views/users/registrations
      create    app/views/users/registrations/edit.html.erb
      create    app/views/users/registrations/new.html.erb
      create    app/views/users/sessions
      create    app/views/users/sessions/new.html.erb
      create    app/views/users/unlocks
      create    app/views/users/unlocks/new.html.erb
      invoke  erb
      create    app/views/users/mailer
      create    app/views/users/mailer/confirmation_instructions.html.erb
      create    app/views/users/mailer/email_changed.html.erb
      create    app/views/users/mailer/password_change.html.erb
      create    app/views/users/mailer/reset_password_instructions.html.erb
      create    app/views/users/mailer/unlock_instructions.html.erb
````

目前所擁有的路徑

| To     | Path           |
| ------ | -------------- |
| 登入頁 | /users/sign_in |
| 註冊頁 | /users/sign_up |

建立dashboard

````ruby
Rails.application.routes.draw do
  # 會員
  devise_for :users
  # 首頁
  root to: 'pages#index'
end
````

建立首頁

````shell
rails g controller pages index
````

````txt
Running via Spring preloader in process 37272
      create  app/controllers/pages_controller.rb
       route  get 'pages/index'
      invoke  erb
      create    app/views/pages
      create    app/views/pages/index.html.erb
      invoke  test_unit
      create    test/controllers/pages_controller_test.rb
      invoke  helper
      create    app/helpers/pages_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    scss
      create      app/assets/stylesheets/pages.scss
````

#### bootstrap

layout必須要有些使用者登入及登出資訊，首先先從bootstrap官方找個導覽列加入，再來為寫入客製css，來建立application.scss

```shell
mkdir app/javascript/stylesheets
echo > app/javascript/stylesheets/application.scss
```

在 app/javascript/packs/application.js

````js
import 'bootstrap/dist/css/bootstrap'
import 'stylesheets/application'
import 'bootstrap/dist/js/bootstrap'

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
````

出現一點小插曲

````txt
Module not found: Error: Can't resolve '@popperjs/core' in '/Users/chenhanting/deliapp/node_modules/bootstrap/dist/js'
````

````shell
yarn add @popperjs/core
````

畫面執行成功後，我們將layout畫面改成

````erb
<!DOCTYPE html>
<html>
  <head>
    <title>Deliapp</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
	  <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		  <div class="container-fluid">
			  <a class="navbar-brand" href="javascript:void(0)">Deli App</a>
			  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
				  <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="mynavbar">
				  <ul class="navbar-nav me-auto">
					  <li class="nav-item">
						  <a class="nav-link" href="javascript:void(0)">Link</a>
					  </li>
				  </ul>
				  <ul class="navbar-nav">
					  <li class="nav-item dropdown">
						  <a class="nav-link dropdown-toggle"
						     href="#"
						     id="navbarDropdown"
						     role="button"
						     data-bs-toggle="dropdown"
						     aria-expanded="false">
							  User
						  </a>
						  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							  <% if user_signed_in? %>
								  <li class="nav-item">
									  <%= link_to "logout", destroy_user_session_path, method: :delete, class: "dropdown-item" %>
								  </li>
							  <% else %>
								  <li class="nav-item">
									  <%= link_to "login", new_user_session_path, class: "dropdown-item" %>
								  </li>
								  <li class="nav-item">
									  <%= link_to "register", new_user_registration_path, class: "dropdown-item" %>
								  </li>
							  <% end %>
						  </ul>
					  </li>
				  </ul>
				  <form class="d-flex mx-lg-2">
					  <input class="form-control me-2" type="text" placeholder="Search">
					  <button class="btn btn-primary" type="button">Search</button>
				  </form>
			  </div>
		  </div>
	  </nav>
	  
	  <div class="container mt-4">
		  <%= yield %>
	  </div>
  </body>
</html>
````

先將以上做的用git做第一筆紀錄

````git
git add .
git commit -m "feat: init"
````



#### 參考資料

- [安裝ruby3版本](https://richstone.io/where-is-ruby-3-0-0-on-rbenv/)
- [建立新專案](https://www.aloucaslabs.com/miniposts/using-a-specific-rails-version-when-you-generate-a-new-rails-app-with-rails-new-command)

- [安裝bootstrap5](https://blog.corsego.com/rails-bootstrap-5-yarn)
- [navbar bootstrap](https://getbootstrap.com/docs/5.0/components/navbar/)
- [devise](https://github.com/heartcombo/devise)

