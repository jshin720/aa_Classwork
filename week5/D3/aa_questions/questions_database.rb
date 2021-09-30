require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end


end

class Users
  attr_accessor :fname, :lname, :id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |options| Users.new(options) }
  end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first)
  end

  def self.find_by_name(fname, lname)
    name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT *
    FROM users
    WHERE fname = ?
    AND
    lname = ?
    SQL
    return nil unless name.length > 0
    Users.new(name.first)
  end

  def authored_questions
    questions = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT *
    FROM questions 
    WHERE id = ?
    SQL

    return nil unless questions.length > 0 
    
    questions.map { |options| Questions.new(options) }
  end

  def authored_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL
    return nil unless replies.length > 0
    replies.map { |options| Replies.new(options) }

  end

end

class Questions
  attr_accessor :title, :body, :id, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL

    return nil unless question.length > 0 
    Questions.new(question.first)
  end

  def self.find_by_author_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE author_id = ?
    SQL

    return nil unless question.length > 0 
    Questions.new(question.first)
  end

  def author
    name = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    return nil unless name.length > 0
    author = Users.new(name.first)
    "#{author.fname} #{author.lname}"

  end

  def replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT * 
    FROM replies
    WHERE question_id = ?
    SQL

    return nil unless replies.length > 0
    replies.map { |options| Replies(options) }

  end


end

class QuestionFollows
  attr_accessor :user_id, :question_id, :id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_follows
    WHERE id = ?
    SQL

    return nil unless follows.length > 0 
    QuestionFollows.new(follows.first)
  end

end


class Replies
  attr_accessor :user_id, :question_id, :id, :body, :parent_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @body = options['body']
    @parent_id = options['parent_id']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL

    return nil unless reply.length > 0 
    Replies.new(reply.first)
  end

  def self.find_by_user_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE user_id = ?
    SQL

    return nil unless reply.length > 0 
    Replies.new(reply.first)
  end 

  def self.find_by_question_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE question_id = ?
    SQL

    return nil unless reply.length > 0 
    Replies.new(reply.first)
  end

  def author
    users = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    return nil unless users.length > 0 
    Users.new(users)
  end

  def question
    quest = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL
    return nil if quest.length <= 0
    Questions.new(quest)
  end

  def parent_reply
    parent = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL
    return nil if parent.length <= 0
    Replies.new(parent)
  end

  def child_replies
    child = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT *
    FROM replies
    WHERE parent_id = ?
    SQL
    return nil if child.length <= 0
    Replies.new(child.first)
  end


end


class QuestionLikes
  attr_accessor :user_id, :question_id, :id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_likes
    WHERE id = ?
    SQL

    return nil unless like.length > 0 
    QuestionLikes.new(like.first)
  end

end


u = Users.all.first
p u.authored_questions
p u.authored_questions
p u.authored_questions
p u.authored_questions
p u.authored_questions
p u.authored_questions
p u.authored_questions
p u.authored_questions
p u.authored_questions
