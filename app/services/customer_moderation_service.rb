class CustomerModerationService
  attr_reader :reasons

  def initialize(input)
    @input = input
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
    unless @input =~ /\A\d+\z/
      @flagged = true
      @reasons << "Failed to input a valid number #{@input}"
    end
  end
  def auditEmail
    @input = @input.downcase
    unless @input.downcase =~ URI::MailTo::EMAIL_REGEXP
      @flagged = true
      @reasons << "Failed to input a valid Email #{@input}"
    end
  end
end
