# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.destroy_all
Channel.destroy_all
Message.destroy_all
Subscription.destroy_all

# USERS
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  photo_url       :string
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  firstname       :string
#  lastname        :string
#
user0 = User.create(username: 'sortinghat', email: 'sortinghat@hogwarts.com', firstname: 'Sorting', lastname: 'Hat', password: 'sortinghat')

user1 = User.create(username: 'hpotter', email: 'hpotter@hogwarts.com', firstname: 'Harry', lastname: 'Potter', password: 'hpotter')
user2 = User.create(username: 'jpotter', email: 'jpotter@hogwarts.com', firstname: 'James', lastname: 'Potter', password: 'jpotter')
user3 = User.create(username: 'lpotter', email: 'lpotter@hogwarts.com', firstname: 'Lily', lastname: 'Potter', password: 'lpotter')

user4 = User.create(username: 'hgranger', email: 'hgranger@hogwarts.com', firstname: 'Hermione', lastname: 'Granger', password: 'hgranger')
user5 = User.create(username: 'rweasely', email: 'rweasely@hogwarts.com', firstname: 'Ron', lastname: 'Weasely', password: 'rweasely')

user6 = User.create(username: 'adumbledore', email: 'adumbledore@hogwarts.com', firstname: 'Albus', lastname: 'Dumbledore', password: 'adumbledore')
user7 = User.create(username: 'ssnape', email: 'ssnape@hogwarts.com', firstname: 'Severus', lastname: 'Snape', password: 'ssnape')

user8 = User.create(username: 'dmalfoy', email: 'dmalfoy@hogwarts.com', firstname: 'Draco', lastname: 'Malfoy')
user9 = User.create(username: 'voldemort', email: 'HeWhoMustNotBeNamed@hogwarts.com', firstname: 'Tom', lastname: 'Riddle', password: 'voldemort')

# CHANNELS
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string           not null
#  private     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

channel1 = Channel.create(name: 'PotterFamily', description: 'Chat Room for Potters', private: true)
channel2 = Channel.create(name: 'Gryffindor', description: 'Chat Room for Gryffindors', private: false)
channel3 = Channel.create(name: 'Slytherin', description: 'Chat Room for Slytherins', private: false)
channel4 = Channel.create(name: 'ProfessorsOnly', description: 'Chat Room for Professors at Hogwarts', private: true)
channel5 = Channel.create(name: 'DeathEaters', description: 'Chat Room for Death Eaters', private: true)

# MESSAGES
#  id         :integer          not null, primary key
#  content    :string
#  kind       :string           not null
#  user_id    :integer          not null
#  channel_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

message1 = Message.create(content: 'Hi Harry!', kind: 'normal', user_id: user4.id, channel_id: channel2.id)
message1 = Message.create(content: 'Hi Hermione!', kind: 'normal', user_id: user1.id, channel_id: channel2.id)
message1 = Message.create(content: 'What about me?!', kind: 'normal', user_id: user5.id, channel_id: channel2.id)

# SUBSCRIPTIONS
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  channel_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

subscription1 = Subscription.create(user_id: user1.id, channel_id: channel2.id)
subscription2 = Subscription.create(user_id: user2.id, channel_id: channel2.id)
subscription3 = Subscription.create(user_id: user3.id, channel_id: channel2.id)
subscription4 = Subscription.create(user_id: user4.id, channel_id: channel2.id)
subscription5 = Subscription.create(user_id: user5.id, channel_id: channel2.id)
subscription6 = Subscription.create(user_id: user6.id, channel_id: channel2.id)
