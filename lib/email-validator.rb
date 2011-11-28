require 'email-validator/version'
require 'active_support/concern'
require 'active_record'
require File.join(File.dirname(__FILE__), 'rfc822')

module EmailValidator
  extend ActiveSupport::Concern

  module ClassMethods
    include RFC822

    def validate_email_format(attribute, options = {})
      options.reverse_merge! :message => 'is invalid'

      validates_each([attribute], options) do |record, attr, value|
        valid_email = record.send(attr).to_s.match EMAIL_ADDRESS_REGEX
        record.errors.add attr, options[:message] unless valid_email
      end
    end
  end
end

ActiveRecord::Base.send(:include, EmailValidator)
