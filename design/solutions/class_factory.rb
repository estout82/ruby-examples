
# an abstract factory is an object that knows how to build something

class SummariesController
  def show
    @survey = Survey.find(params[:survey_id])
    @summaries = @syrvey.summarize(summarizer)
  end

  private

  def summarizer
    case params[:id]
    when :breakdown
      Breakdown.new
    when :most_recent
      MostRecent.new
    when :your_answers
      UserAnswerFactory.new(current_user)
    end
  end
end

class UserAnswerFactory
  def initialize
    @user = user
  end

  def new
    # normally, there would be more logic here relating to actually building this object
    UserAnswer.new(@user)
  end
end