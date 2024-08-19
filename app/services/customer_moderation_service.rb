# frozen_string_literal: true

class CustomerModerationService # rubocop:disable Style/Documentation
  attr_reader :reasons

  def initialize(input)
    @input = input
    @flagged = false
    @reasons = []
  end

  def callNumber # rubocop:disable Naming/MethodName
    auditNumber
    self
  end

  def callEmail # rubocop:disable Naming/MethodName
    auditEmail
    self
  end

  def flagged?
    @flagged
  end

  private

  def auditNumber # rubocop:disable Naming/MethodName
    return if @input =~ /\A\d+\z/

    @flagged = true
    @reasons << "Failed to input a valid number #{@input}"
  end

  def auditEmail # rubocop:disable Naming/MethodName
    @input = @input.downcase
    return if @input.downcase =~ URI::MailTo::EMAIL_REGEXP

    @flagged = true
    @reasons << "Failed to input a valid Email #{@input}"
  end
end
