class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

 #rejects a transfer if the sender does not have enough funds (does not have a valid account)
    def reject_transfer
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
      end

  def execute_transaction #can have sender send $ successfully to receiver #what needs to be in place in order for this to happen?
    #both acounts have to be valid #sender has to have money to send
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount 
      receiver.balance += amount
      self.status = "complete"
    else 
      reject_transfer
    end

  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end




#   def reverse_transfer
#     if valid? && receiver.balance > amount && self.status == "complete"
#       receiver.balance -= amount
#       sender.balance += amount
#       self.status = "reversed"
#     else
#       reject_transfer
#     end
#   end
# end