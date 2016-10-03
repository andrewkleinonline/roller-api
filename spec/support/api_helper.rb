module ApiHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end
end

=begin
METHODS =
[
  :request,
  :get,
  :post,
  :put,
  :patch,
  :delete,
  :options,
  :head,
  :follow_redirect!,
  :header,
  :env,
  :set_cookie,
  :clear_cookies,
  :authorize,
  :basic_authorize,
  :digest_authorize,
  :last_response,
  :last_request
]
=end