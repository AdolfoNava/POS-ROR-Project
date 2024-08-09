class CustomerModerationService
  attr_reader :reasons

  def initialize(input)
    @input = input.downcase
    @flagged = false
    @reasons = []
  end

  def callNumber
    auditNumber
    self
  end
  def callEmail
    auditEmail
    self
  end
  def flagged?
    @flagged
  end

  private
  def auditNumber
    if !@input.numeric?
      @flagged = true
      @reasons << "Failed to input a valid number #{@input}"
    end
  end
  def auditEmail
    if !@input =~ URI::MailTo::EMAIL_REGEXP
      @flagged = true
      @reasons << "Failed to input a valid Email #{@input}"
    end
  end
end
