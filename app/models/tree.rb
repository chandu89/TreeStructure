class Tree < ApplicationRecord
	scope :fetch_tree, -> (id) { where('id = ?', id) }
	serialize :child, JSON
end
