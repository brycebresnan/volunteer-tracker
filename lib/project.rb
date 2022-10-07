class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end
  
  def self.all
    results = DB.exec("SELECT * FROM projects;")
    projects = []
    results.each do |project|
      id = project.fetch('id').to_i
      title = project.fetch('title')
      projects.push(Project.new({id: id, title: title}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  
  def self.find(find_id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{find_id}").first
    title = result.fetch('title')
    id = result.fetch('id').to_i
    Project.new({id: id, title: title})
  end

  def update(update_hash)
    if update_hash.has_key?(:title)
      updated = DB.exec("UPDATE projects SET title = '#{title}' WHERE id = #{@id}")
      @title = update_hash.fetch(:title)
    else
      nil
    end
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id}")
  end
end