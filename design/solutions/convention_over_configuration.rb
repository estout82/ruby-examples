
# - eliminate case statements by finding class name
# - eliminate "shotgun surgery" (edit long case / if statement)
# - prevent / avoid duplication

class SummariesController
  def show
    @summary = summarizer.text
  end

  private

  def summarizer
    # make sure you have good conventions so you won't have to change all the other classes when you need to a dd a new summarizer strategy
    summarizer_class.new(user: current_user)
  end

  def summarizer_class
    # "my_class" => MyClass
    # looks for a class in the application and returns it so it can be instantiated by the summarizer method
    params[:entity_name].classify.constantize
  end
end