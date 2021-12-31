#!/usr/bin/env ruby

# transactions

def transfer_money
    ActiveRecord::Base.transaction do
        # have to use the update bang method so it raises errors and triggers a rollback in the transaction
        john.update!(money: john.money + 100)
        ted.update!(money: ted.money - 100)
        
        if some_business_logic == false
            raise ActiveRecord::Rollback
        end
    end
end

# three ways to initiate transactions
ActiveRecord::Base.transaction do ... end
SomeModel.transaction do ... end
my_record.transaction do ... end

# exceptions

ActiveRecord::RecordInvalid     # a records fields are not valid (valid? == false)
ActiveRecord::Rollback          # rolls back a transaction