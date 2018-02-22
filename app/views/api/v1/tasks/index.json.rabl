if @tasks.empty?
	node(:message){"No tasks found"}
else
	collection @tasks
	attributes :id, :title, :is_completed
end
