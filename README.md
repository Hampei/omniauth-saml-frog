# OmniAuth SAML Frog

An Frog Education SAML strategy for OmniAuth.

https://github.com/hampei/omniauth-saml-frog

* It's a simple subclass of omniauth-saml with more sensible info keys for Frog.
* [Frog API information](http://partners-frog.frogos.net/app/os?site=partners)
* It's mostly a translation of the keys: key.tr(' ', '_').lower.downcase
* Added are :email and :name (display_name or first+last).

## Requirements

* [omniauth-saml](https://github.com/PracticallyGreen/omniauth-saml) '~> 1.1.0'

## Usage

See omniauth-saml for more options.

In your Rails application:

in `Gemfile`:

```ruby
gem 'omniauth-saml-frog'
```

and in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml_frog,
  base_url:                       "https://federation-misc.frogosdev.co.uk",
  assertion_consumer_service_url: "https://#{host}/users/auth/saml_frog/callback",
  issuer:                         "https://#{host}",
  idp_sso_target_url:             "https://federation-misc.frogosdev.co.uk/saml2/idp/SSOService.php",
  idp_cert: "-----BEGIN CERTIFICATE-----
MIIDfzCCAmegAwIBAgIJAKnl9D1Rgap3MA0GCSqGSIb3DQEBBQUAMFYxCzAJBgNV
BAYTAlVLMRAwDgYDVQQHDAdIYWxpZmF4MRYwFAYDVQQKDA1Gcm9ndHJhZGUgTHRk
MR0wGwYDVQQDDBRzYW1sc3AuZnJvZ3RyYWRlLmNvbTAeFw0xMjA5MjgxMDQ0Mzda
Fw0yMjA5MjgxMDQ0MzdaMFYxCzAJBgNVBAYTAlVLMRAwDgYDVQQHDAdIYWxpZmF4
MRYwFAYDVQQKDA1Gcm9ndHJhZGUgTHRkMR0wGwYDVQQDDBRzYW1sc3AuZnJvZ3Ry
YWRlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOK9U0iYHhsR
xrH1Q7Auz8kMR+oLN7HzLiyLiqSJK6RpPj5VZ83nO5EE6Jaws2uzeuRSQ5lNTk2P
tlWqv2r0oXkMmVvFXozY/sPRWNH04XwMXiyv7cjjwBBhvj4vcrZ9ysQEg2I9iZ88
QCj6n9SUpwyfsWmeEppgmPwoXCTP6w4IhOV5XOjTL87NB609lT1sLANy9uSr/RK3
Wzqb+WKGemF8itEmmnbkU9p6yLmsSxVyQK2l35DU6JpFiLTkzuy1FLB6/M7HBrza
xsXzhzys+WiznH+DqQFMgLi2VcPzqZxMVtfMxKl/AOlTIt+XQ5XHshl6mrbCZUqU
YToDEBG23vcCAwEAAaNQME4wHQYDVR0OBBYEFJWPPbP4N3wMT8PuLD9q6Z6eaFzN
MB8GA1UdIwQYMBaAFJWPPbP4N3wMT8PuLD9q6Z6eaFzNMAwGA1UdEwQFMAMBAf8w
DQYJKoZIhvcNAQEFBQADggEBAGuN+ABo0bi22aC9AXEoKKKXFsp9P85plgcyvlkW
KXrRu7iC7C3d6TfP36OmflxaibFuBTf6KfzkgOXTj2A/z1uP9lKvIDZ3FzjYNHi6
8rz1N2SVuXcUxDPvsGzeSBy1SaUzlAyYBtBKqntZBfxlH5EZ1T9yNfnbmhCMlr/e
45ILf8BGdkaNz/TdYhepkhQ77DU2D6bNyq345B4zGb6wOg1fQEMv8bC8Ylt0wIBg
JYSrOkCipWKNqCLL+GbYD1+sNn8e+W2h3o9J482BzxVRw9V2DFR6/9I54rzI4bvZ
KcXk6imGhO+577qzZgffQnaI/SgjPVJIBuWxL3JJ+86COAc=
-----END CERTIFICATE-----\n",
  idp_slo_target_url:             "https://federation-misc.frogosdev.co.uk/saml2/idp/SingleLogoutService.php",
end
```

In your callback:

```ruby
  def saml_frog
    uid = request.env["omniauth.auth"].uid
    info = request.env["omniauth.auth"].info
    remote_id = "#{info.organisation_uuid}_#{info.froglearn_user_uuid}"
  end
```

## Authors

Authored by Henk van der Veen.

Maintained by [Henk van der Veen](http://hampei.github.io/).

## License

Copyright (c) 2014 [Henk van der Veen IT.](http://hampei.github.io/).
All rights reserved. Released under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
