class Article < ActiveRecord::Base
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories

	validates :title, presence: true, length: { minimum: 3 }

	before_save :calculate_word_count

	default_scope { where('word_count > 0') }

	private

		def calculate_word_count
			if self.description.present?
				self.word_count = description.split.size
			end
		end
		
end