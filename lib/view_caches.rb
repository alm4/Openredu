module ViewCaches
  def expire_sidebar_environments_for(users)
    expire_fragments('home_sidebar_environments', users)
  end

  def expire_sidebar_connections_for(users)
    expire_fragments('home_sidebar_connections', users)
  end

  def expire_friends_requisitions_for(users)
    expire_fragments('home_friends_requisitions', users)
  end

  def expire_courses_requisitions_for(users)
    expire_fragments('home_courses_requisitions', users)
  end

  protected
  def expire_fragments(name, entities)
    ([] << entities).flatten.each do |entity|
      ActionController::Base.new.expire_fragment([name, entity.id])
    end
  end
end
