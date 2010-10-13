module EmailValidator
  module ClassMethods
    def validate_email_format(attribute, options = {})
      options.reverse_merge! :message => 'is invalid'

      validates_each([attribute], options) do |record, attr, value|
        valid_email = true
        begin
          TMail::Address.parse record.send(attr)
        rescue TMail::SyntaxError
          valid_email = false
        end
        record.errors.add attr, options[:message] unless valid_email
      end
    end
  end
end

ActiveRecord::Base.send(:extend, EmailValidator::ClassMethods)
