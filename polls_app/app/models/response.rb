# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ApplicationRecord
  validates :user_id, :question_id, :answer_choice_id, presence: true
  validate :check_response, :check_own_poll

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'Question'

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  

  def sibling_responses 
    #Question.select(:responses).where()
    Response.joins(:question).where('questions.id = ?', self.question_id).select("responses.id, question_id, answer_choice_id, user_id")
  end

  def respondent_already_answered?
    #Response.first.respondent
    count = sibling_responses.count { |r| r.user_id == self.user_id}
    count >= 1
  end

  def check_response
    if respondent_already_answered?
      errors[:user_id] << 'can\'t respond again'
    end
  end
  
  def respond_to_own_poll?
    author_id = self.question.poll.author.id
    author_id == self.user_id
  end

  def check_own_poll
    if respond_to_own_poll?
      errors[:user_id] << 'can\'t respond to own poll'
    end
  end


  
end
