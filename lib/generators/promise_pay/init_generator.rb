require "rails/generators/base"

module PromisePay
  module Generators
    class InitGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      argument :email,     type: :string
      argument :password,  type: :string

      desc "Initalize PromisePay API key"

      def marketplace
        @marketplace ||= PromisePay::Marketplace.new(user: email, password: password)
      end

      def token
        @token ||= marketplace.request_token
      end

      def copy_initializer
        template "promise_pay_initializer.rb", "config/initializers/promise_pay.rb"
      end
    end
  end
end
