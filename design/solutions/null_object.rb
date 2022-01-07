
# use this to replace conditionals where you are checking for nils
# - remove shotgun surgery when existing method begins returning nil
# - remove duplicated code related to checking nil
# - improve readability
# - logic related to presence / absence is easier to reuse
# - replace conditional logic with simple commands (tell, don't ask)

# only introduce nil object when you're checking nil enough to be annoyed
# - it can make code more confusing (return NullObject instead of Object)
# - also may need to implement MORE logic in the actual model

# /app/models/answer.rb
class Answer
  belongs_to :question
  belongs_to :completion

  validates :text, presence: true

  def self.for_user(user)
    answer = joins(:completion)
      .where(completions: { user_id: user.id })
      .last

    answer || Answer::Null.new
  end

  class Null
    def text
      "No response"
    end
  end
end

# /app/models/user.rb
def answer_text_for(question)
   question.answers.for_user(self).text   # even if the record doesn't exist, the null object will respond to the text message
end