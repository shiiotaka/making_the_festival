User.seed(
  :id,
  { id: 1, name: 'shiohama', email: 'foobar@example.com', crypted_password: User.encrypt('foobar') }
)
