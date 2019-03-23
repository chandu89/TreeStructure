module Ancestry

  def self.extended(receiver)
    receiver.class_eval do 

      define_method(:parent_ids) do |parents_ary=[]|
        if receiver[:child].any?
          parents_ary << receiver[:id]
          receiver[:child].each_with_object(parents_ary) do |child, parents_ary|
            child.extend(Ancestry).parent_ids(parents_ary)
          end
        end
      end

      define_method(:node) do |node_id|
        return receiver if receiver[:id] == node_id
        receiver[:child].each do |child|
          child.extend(Ancestry).node(node_id).tap do |x| 
            return x unless x.blank?
          end
        end if receiver[:child]
        {}.extend(Ancestry)
      end
      
      define_method(:child) do 
        receiver[:child] || []
      end
      
    end
  end

end