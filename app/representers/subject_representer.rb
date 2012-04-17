module SubjectRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :id
  property :title
  property :description
  property :created_at

  link :self do
    api_subject_url(self)
  end

  link :lectures do
    api_course_spaces_subjects_lectures_url(self)
  end

  link :space do
    api_course_url(self.space)
  end

  link :course do
    api_course_url(self.space.course)
  end

  link :environment do
    api_environment_url(self.space.course.environment)
  end

  link :enrollments do
    api_course_space_subject_enrollments_url(self)
  end

end
