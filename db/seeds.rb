r1 = Role.create({ name: 'Admin', description: 'Can do everything' })
r2 = Role.create({ name: 'Member', description: 'Can do all on things created by own' })
r3 = Role.create({ name: 'User', description: 'Can perform CRUD on posts' })

u1 = User.create({ name: 'Krzychu', email: 'krzychu@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r1.id })
u2 = User.create({ name: 'Asia', email: 'asia@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r2.id })
u3 = User.create({ name: 'Fred', email: 'fred@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r2.id })
u4 = User.create({ name: 'Wojtek', email: 'wojtek@example.com', password: "xxxxxxxx", password_confirmation: "xxxxxxxx", role_id: r3.id })
