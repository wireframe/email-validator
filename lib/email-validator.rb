require File.join(File.dirname(__FILE__), 'rfc822')

module EmailValidator
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

ActiveRecord::Base.send(:extend, EmailValidator::ClassMethods)
