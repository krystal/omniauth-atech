# Omniauth Strategy for aTech Media

This Omniauth strategy is for authenticating using the aTech Media 
authentication system. 

You can create an OAuth application from within the identity website at
[https://identity.atechmedia.com](https://identity.atechmedia.com).

Once you have created this, you can define your Omniauth strategy.

```ruby
use OmniAuth::Builder do
  provider :atech, ENV['ATECH_CLIENT_ID'], ENV['ATECH_CLIENT_SECRET']
end
```
