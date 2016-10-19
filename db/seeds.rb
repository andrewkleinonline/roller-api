Roll.destroy_all
Tag.destroy_all

  roll = Roll.create(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
  tag1 = Tag.create(name: 'surprise')
  tag2 = Tag.create(name: 'anime')

  roll.tags << tag1
  roll.tags << tag2