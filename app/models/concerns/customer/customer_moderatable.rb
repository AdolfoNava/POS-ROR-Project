# the issue in `app/services/customer_moderation_service.rb` affects this file as well

module Customer::CustomerModeratable
  extend ActiveSupport::Concern

  included do
    validate :permissible_content
  end

  private

  def permissible_content
    phone_number_moderation_service = CustomerModerationService.new(phone_number).callNumber
    if phone_number_moderation_service.flagged?
      phone_number_moderation_service.reasons.each do |reason|
        errors.add(:phone_number, reason)
      end
    end

    email_moderation_service = CustomerModerationService.new(email).callEmail
    if email_moderation_service.flagged?
      email_moderation_service.reasons.each do |reason|
        errors.add(:email, reason)
      end
    end
  end
end
