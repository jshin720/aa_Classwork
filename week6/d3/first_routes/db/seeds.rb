# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    users = User.create([{ username: 'jefftheartist'}, {username: 'emilytheaspirer'}, {username: 'picassothecrazyman'} ])
    Artwork.create(title: 'untitled', artist_id: User.first.id, image_url: 'www.untitled.org')
    Artwork.create(title: 'guernica', artist_id: User.last.id, image_url: 'www.spain.artist')
    Artwork.create(title: 'untitled', artist_id: User.last.id, image_url: 'www.untitled.com')
    Artwork.create(title: 'nyc_traffic', artist_id: User.first.id, image_url: 'www.bigcity.edu')
    Artwork.create(title: 'lemons', artist_id: User.offset(1).first.id, image_url: 'www.lemons.org')

    ArtworkShare.create(viewer_id: User.last.id, artwork_id: Artwork.offset(3).first.id)
    ArtworkShare.create(viewer_id: User.last.id, artwork_id: Artwork.offset(4).first.id)
    ArtworkShare.create(viewer_id: User.first.id, artwork_id: Artwork.last.id)
    ArtworkShare.create(viewer_id: User.offset(1).first.id, artwork_id: Artwork.first.id)
    ArtworkShare.create(viewer_id: User.first.id, artwork_id: Artwork.offset(2).first.id)

