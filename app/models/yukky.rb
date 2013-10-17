class Yukky
  include Mongoid::Document
  include Mongoid::Timestamps

  field :desc, type: String
  field :label, type: String
  field :user, type: String
end
