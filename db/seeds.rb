%w[registered banned admin].each do |role|
  Role.find_or_create_by({ name: role })
end

user = User.create!(name: "Hanting", email: "admin@gmail.com", password: "12345678", role: Role.find_by_name("admin"))
blog = user.blogs.create(name: "Blog 1st")
# build 30 blogs
(1...30).each { blog.articles.create(title: "title #{_1}", content: "content #{_1}") }

# user = User.find_by_name("Hanting")
# blog = user.blogs.create(name: "Blog 1st")
# (1...30).each { blog.articles.create(title: "title #{_1}", content: "content #{_1}") }