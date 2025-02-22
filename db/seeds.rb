User.destroy_all
Project.destroy_all
Comment.destroy_all
StatusHistory.destroy_all

users = User.create!([
  { email: 'alice@example.com', name: 'Alice', password: 'securepass', password_confirmation: 'securepass' },
  { email: 'bob@example.com', name: 'Bob', password: 'strongpass', password_confirmation: 'strongpass' }
])

projects = Project.create!([
  { name: 'Website Redesign', status: 'not_started' },
  { name: 'Mobile App Development', status: 'in_progress' },
  { name: 'Marketing Campaign', status: 'completed' }
])

comments = Comment.create!([
  { content: 'Looking forward to starting this project!', user: users.first, project: projects.first },
  { content: 'We need to finalize the wireframes.', user: users.last, project: projects.second },
  { content: 'Great job on completing this task!', user: users.first, project: projects.third }
])

status_histories = StatusHistory.create!([
  { old_status: 'not_started', new_status: 'in_progress', user: users.first, project: projects.first },
  { old_status: 'in_progress', new_status: 'completed', user: users.last, project: projects.second },
])

puts 'Seed data successfully created!'
