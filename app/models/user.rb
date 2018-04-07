# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  def self.from_token_request(request)
    login = request.params.dig('auth', 'login')
    self.find_by_login(login)
  end
end
