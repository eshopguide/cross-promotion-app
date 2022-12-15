# frozen_string_literal: true

def set_basic_auth_header
  @headers ||= {}
  @headers['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(
    ENV.fetch('CROSS_PROMOTION_USER'),
    ENV.fetch('CROSS_PROMOTION_PASSWORD')
  )
end
