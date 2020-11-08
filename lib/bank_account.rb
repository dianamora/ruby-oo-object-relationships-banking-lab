class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount) #can deposit money into its account #balance will say the same or be more
    self.balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{balance}." 
    #why don't we need 'self.'' here but need it for above method? is it b/c we are just 
    #displaying the current balance so referring to instance varialbe instead of the class?
  end 

  def valid?
    # valid = true if self.status == "open" && self.balance > 0 #why did this code not work?
    balance > 0 && status == "open"
  end

  def close_account
    self.status = "closed"
  end
end



