# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ email: 'bob@google.com'}, { email: 'George@yahoo.com'}])
short_urls = [ShortenedUrl.create_sh_url(users.first, 'www.google.com'), ShortenedUrl.create_sh_url(users.last, 'www.yahoo.com')]
short_urls.each { |url| url.save }
Visit.record_visit!(users.first, short_urls.first)
Visit.record_visit!(users.last, short_urls.first)
Visit.record_visit!(users.last, short_urls.first)
Visit.record_visit!(users.last, short_urls.last)

tag_topics = TagTopic.create( [{ tag: 'test' }, {tag: 'test2'}])
taggings = Tagging.create( [{ tag_id: tag_topics.first.id, url_id: short_urls.first.id }] )
