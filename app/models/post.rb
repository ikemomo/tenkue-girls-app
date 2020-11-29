class Post < ApplicationRecord
  belongs_to :user
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :employment_status, presence: true, acceptance: { accept: ['正社員', '契約社員','業務委託', 'フリーランス', 'アルバイト', 'その他'] }
  validates :marriage, presence: true, acceptance: { accept: ['未婚', '既婚', '離別'] }
  validates :childcare, presence: true, acceptance: { accept: ['子供なし', '子供あり(育児なし)', '子供あり(育児あり)'] }
end
