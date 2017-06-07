require 'twitter'
$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "chF7RBVsalMaWkMz8NPUG4u1z"
  config.consumer_secret     = "VdpBwmyB4faN6I8Wm7v0UIJx3kEhECoBdzdYhtYpJt8uSw3gFZ"
  config.access_token        = "826599552-fKFFpe65htZIzVzXO89yOdmT8nL0flm7s2MkLZkm"
  config.access_token_secret = "dQlxAr9GN9me4crArv3AqT2iEwYrjTZ37roGtih6bXn0H"
end