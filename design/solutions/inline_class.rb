
# NOTE: this seems like an anti-pattern sort of...

# move all logic that the class contains into its consumers
# - dont do this if there are more than 2 consumers

# uses
# - eliminate small, in-frequently used classes
# - classes are easier to understand because there are less class dependencies
# - eliminate feature envy by inlining the envied class into the envious one

class Invitation
  def initialize(user)
    @user = user
  end

  def deliver
    body = InvitationMessage.new(self).body

    # there used to be an abstraction here where there were 2 different delivery strageties
    # now, there's only one and the abstraction was removed because it was similer to eliminate
    # that class and iniline the logic into the cosumer class
    Mailer.invitation_notification(self, body).deliver
  end
end