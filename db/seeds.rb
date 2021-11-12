r1 = Role.create({ name: 'Admin', description: 'Can do everything' })
r2 = Role.create({ name: 'Member', description: 'Can do all on things created by own' })
r3 = Role.create({ name: 'User', description: 'Can perform CRUD on posts' })

u1 = User.create({ name: 'Krzychu', email: 'krzychu@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r1.id })
u2 = User.create({ name: 'Asia', email: 'asia@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r2.id })
u3 = User.create({ name: 'Fred', email: 'fred@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r2.id })
u4 = User.create({ name: 'Wojtek', email: 'wojtek@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r3.id })

c1 = Category.create({ name: 'Category A', user_id: u1.id})
c2 = Category.create({ name: 'Category B', user_id: u1.id})
c3 = Category.create({ name: 'Category C', user_id: u2.id})

t1 = Topic.create({ name: 'Topic 1', description: 'About topic 1', user_id: u1.id})
t2 = Topic.create({ name: 'Topic 2', description: 'About topic 2', user_id: u2.id})
t3 = Topic.create({ name: 'Topic 3', description: 'About topic 3', user_id: u2.id})

p1 = Post.create({ name: 'Post 1', body: 'Content for post 1', user_id: u1.id, topic_id: t1.id})
p1 = Post.create({ name: 'Post 2', body: 'Content for post 2', user_id: u2.id, topic_id: t1.id})
p1 = Post.create({ name: 'Post 3', body: 'Content for post 3', user_id: u3.id, topic_id: t1.id})
p1 = Post.create({ name: 'Post 4', body: 'Content for post 4', user_id: u1.id, topic_id: t2.id})
p1 = Post.create({ name: 'Post 5', body: 'Content for post 5', user_id: u2.id, topic_id: t2.id})
p1 = Post.create({ name: 'Post 6', body: 'Content for post 6', user_id: u3.id, topic_id: t2.id})
p1 = Post.create({ name: 'Post 7', body: 'Content for post 7', user_id: u1.id, topic_id: t3.id})
p1 = Post.create({ name: 'Post 8', body: 'Content for post 8', user_id: u2.id, topic_id: t3.id})
p1 = Post.create({ name: 'Post 9', body: 'Content for post 9', user_id: u3.id, topic_id: t3.id})
