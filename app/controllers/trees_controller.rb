class TreesController < ApplicationController
	include Ancestry

	def index
		render json: fetch_or_create_tree
	end
	
	def child_tree
		tree = fetch_or_create_tree 
		unless tree == "There is no tree with this tree id"
			tree = JSON.parse(tree.to_json).with_indifferent_access.extend(Ancestry)
			tree = tree.node(params[:id].to_i).child
		end
		render json: tree
	end

	def parent_tree
		tree = fetch_or_create_tree
		unless tree == "There is no tree with this tree id"
			tree = JSON.parse(tree.to_json).with_indifferent_access.extend(Ancestry)
			parent_ids = tree.parent_ids
		else
			parent_ids = tree
		end
		render json: parent_ids
	end
  private

  def fetch_or_create_tree
  	tree = Tree.fetch_tree(params[:tree_id].to_i).first
  	unless tree.present?
  		response_tree = JSON.parse(Faraday.get(ENV["TREE_URI"]).body)
  		begin
      	tree = Tree.create(response_tree)
      	raise ActiveRecord::RecordNotFound unless tree.id == params[:tree_id].to_i
    	rescue Exception => ex
      	tree = "There is no tree with this tree id"
    	end
  	end
  	tree
  end
  
end
