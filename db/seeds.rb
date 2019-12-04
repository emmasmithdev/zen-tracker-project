require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/yoga.rb')
require_relative('../models/yoga_experience.rb')
require('pry')

YogaExperience.delete_all
City.delete_all
Country.delete_all
Continent.delete_all
Yoga.delete_all

continent1 = Continent.new({"name" => "Asia", "visited" => "f", "size" => 45000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/a52768d2692488c78a959a7093d0992556b3a9f0aedc4ce6ddc0eb3406dd784e.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
continent2 = Continent.new({"name" => "Africa", "visited" => "f", "size" => 30000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/945ca1ef65539fd0a4b15a4aae5e84e43782b3a3858249f16dad7443ffae9ac6.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
continent3 = Continent.new({"name" => "North America", "visited" => "f", "size" => 25000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/e4f70bf29a988b6c3213a35085cdc230650ec56f442c752895b3339fd7042441.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
continent4 = Continent.new({"name" => "South America", "visited" => "f", "size" => 18000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/f7c34695119505c8f2446faaec02443c00682b32ed2e567b0b88e1c008d0c2f2.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
continent5 = Continent.new({"name" => "Antarctica", "visited" => "f", "size" => 14000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/745e5e9819311f2bc05467f2b0048d7ecb8eac6afaf7113507c69b1ad1ffda34.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
continent6 = Continent.new({"name" => "Europe", "visited" => "f", "size" => 10000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/64275521.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
continent7 = Continent.new({"name" => "Australia", "visited" => "f", "size" => 9000000, "image_url" => "https://lp-cms-production.imgix.net/2019-06/53238cf5242a2bd0b030e066c6c9b0a9-whitsunday-dive-adventures.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})

continent1.save
continent2.save
continent3.save
continent4.save
continent5.save
continent6.save
continent7.save

country1 = Country.new({"name" => "Thailand", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/a/g/hi/t/e618e98dd3e7ef671a1edb90643755eb-wat-phumin.jpg?fit=crop&w=1920&h=832"})
country2 = Country.new({"name" => "India", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/mastheads/283389.jpg?fit=crop&w=1920&h=832"})
country3 = Country.new({"name" => "Cambodia", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/a/g/hi/t/301b3bac3047bbc59e86b0083ceeb05f-angkor-wat.jpg?fit=crop&w=1920&h=832"})
country4 = Country.new({"name" => "Canada", "visited" => "t", "continent_id" => continent3.id, "image_url" => "https://lp-cms-production.imgix.net/2019-06/80814111.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
country5 = Country.new({"name" => "USA", "visited" => "f", "continent_id" => continent3.id, "image_url" => "https://lp-cms-production.imgix.net/2019-06/93cbcf5a52559e6649736e18aaca98cc-usa.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
country6 = Country.new({"name" => "Ethiopia", "visited" => "t", "continent_id" => continent2.id, "image_url" => "https://lp-cms-production.imgix.net/2019-06/c2af3eb20b44c86b0420b6d698107b21-tis-abay.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
country7 = Country.new({"name" => "Tanzania", "visited" => "f", "continent_id" => continent2.id, "image_url" => "https://lp-cms-production.imgix.net/2019-06/330f4d6ee95597157960e3f3056b4c9f-serengeti-national-park.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
country8 = Country.new({"name" => "Brazil", "visited" => "f", "continent_id" => continent4.id, "image_url" => "https://lp-cms-production.imgix.net/2019-06/iStock_000038277788XXXLarge.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
country9 = Country.new({"name" => "Turkey", "visited" => "f", "continent_id" => continent6.id, "image_url" => "https://lp-cms-production.imgix.net/2019-06/64275521.jpg?auto=format&fit=crop&q=40&ixlib=react-8.6.4&h=446&w=594"})
country10 = Country.new({"name" => "Nepal", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/mastheads/104733483%20.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
country11 = Country.new({"name" => "Kuwait", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/mastheads/GettyImages-155675188_super.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
country12 = Country.new({"name" => "China", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/a/g/hi/t/dcf1e0ec17d14df8fac9a7a57c7af63d-china.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
country13 = Country.new({"name" => "Japan", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/a/g/hi/t/d150c8c399f2d41ecf8864b69ddc7a35-mt-fuji.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
country14 = Country.new({"name" => "Singapore", "visited" => "f", "continent_id" => continent1.id, "image_url" => "https://lonelyplanetimages.imgix.net/mastheads/GettyImages-481194521_high.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})


country1.save
country2.save
country3.save
country4.save
country5.save
country6.save
country7.save
country8.save
country9.save
country10.save
country11.save
country12.save
country13.save
country14.save

city1 = City.new({"name" => "Bangkok", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 9632, "image_url" => "https://lonelyplanetimages.imgix.net/a/g/hi/t/81d257161719d9da921211ddd8242449-bangkok.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
city2 = City.new({"name" => "Delhi", "visited" => "f", "country_id" => country2.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2017/11/map-126.png", "distance" => 6875, "image_url" => "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/6c/80/9b.jpg?fit=crop"})
city3 = City.new({"name" => "Phnom Penh", "visited" => "f", "country_id" => country3.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2017/01/map-gla-ncl-sin.png", "distance" => 10096, "image_url" => "https://lonelyplanetimages.imgix.net/mastheads/iStock_000031715564Medium.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
city4 = City.new({"name" => "Chiang Mai", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 9073, "image_url" => "https://bkkaruncloud.b-cdn.net/wp-content/uploads/2017/12/chiang-mai-to-phuket.jpg"})
city5 = City.new({"name" => "Phuket", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 10053, "image_url" => "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.travelandleisure.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F1600x1000%2Fpublic%2Fphuket-thailand-karst-formation-phuket0327.jpg%3Fitok%3DA7Wg1eBR&w=400&c=sc&poi=face&q=85"})
city6 = City.new({"name" => "Chiang Rai", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 9021, "image_url" => "https://bkkaruncloud.b-cdn.net/wp-content/uploads/2019/07/pai-to-chiang-rai.jpg"})
city7 = City.new({"name" => "Kuwait City", "visited" => "f", "country_id" => country11.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2018/09/map-38.png", "distance" => 6500, "image_url" => "https://atlas-network.com/wp-content/uploads/2019/09/shutterstock_1228516114.jpg"})
city8 = City.new({"name" => "Mumbai", "visited" => "f", "country_id" => country2.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2018/01/m-1.jpg", "distance" => 10096, "image_url" => "https://cdn.britannica.com/26/84526-050-45452C37/Gateway-monument-India-entrance-Mumbai-Harbour-coast.jpg"})
city9 = City.new({"name" => "Au Nang", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 10065, "image_url" => "http://static.asiawebdirect.com/m/phuket/portals/krabi-hotels-com/homepage/seedo/ao-nang/pagePropertiesImage/ao-nang.jpg.jpg"})
city10 = City.new({"name" => "Pattaya", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 10065, "image_url" => "https://lonelyplanetimages.imgix.net/a/g/hi/t/049df2f9e2818623c6671cefc8990cf8-sanctuary-of-truth.jpg?fit=crop&h=170&sharp=10&vib=20&w=170"})
city11 = City.new({"name" => "Udon Thani", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 10065, "image_url" => "http://static.asiawebdirect.com/m/phuket/portals/thaiwave-com/homepage/udon-thani/pagePropertiesImage/udon-thani_1.jpg.jpg"})
city12 = City.new({"name" => "Hat Yai", "visited" => "f", "country_id" => country1.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 10065, "image_url" => "http://static.asiawebdirect.com/m/phuket/portals/thaiwave-com/homepage/hat-yai/pagePropertiesImage/hat-yai.jpg.jpg"})
city13 = City.new({"name" => "Varanasi", "visited" => "f", "country_id" => country2.id, "map_url" => "https://www.fly4free.com/wp-content/uploads/2016/12/brs1.png", "distance" => 10065, "image_url" => "https://k6u8v6y8.stackpathcdn.com/blog/wp-content/uploads/2015/10/Varanasi-Best-Places-to-Visit-in-Uttar-Pradesh.jpg"})

city1.save
city2.save
city3.save
city4.save
city5.save
city6.save
city7.save
city8.save
city9.save
city10.save
city11.save
city12.save
city13.save

yoga1 = Yoga.new({"type" => "Hatha", "description" => "Hatha yoga is a generic term that refers to any type of yoga that teaches physical postures.
  When a class is marketed as Hatha, it generally means that you will get a gentle introduction to the most basic yoga postures.
  You probably won't work up a sweat in a hatha yoga class, but you should end up leaving class feeling longer, looser, and more relaxed.", "image_url" => "https://i.ytimg.com/vi/bkbtXQrUl_w/maxresdefault.jpg"})
yoga2 = Yoga.new({"type" => "Bikram", "description" => "About 30 years ago, Bikram Choudhury developed this school of yoga where classes are held in artificially heated rooms.
  In a Bikram class, you will sweat like never before as you work your way through a series of 26 poses.", "image_url" => "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/01/19/08/bikram-yoga.jpg?w968h681"})
yoga3 = Yoga.new({"type" => "Ashtanga", "description" => "Ashtanga is based on ancient yoga teachings. It's a rigorous style of yoga that follows a specific sequence of postures and is similar to vinyasa yoga,
  as each style links every movement to a breath. The difference is that Ashtanga always performs the exact same poses in the exact same order.", "image_url" => "https://cdn.doyouyoga.com/wp/2012/01/Ashtanga-Yoga1.jpg=w768"})
yoga4 = Yoga.new({"type" => "Vinyasa", "description" => "Vinyasa is a Sanskrit word for a phrase that roughly translates as \"to place in a special way\", referring—in hatha yoga—to a sequence of poses.
  Vinyasa classes are known for their fluid, movement-intensive practices. Vinyasa teachers sequence their classes to smoothly transition from pose to pose, with the intention of linking breath to movement,
  and often play music to keep things lively.", "image_url" => "https://cdn.doyouyoga.com/articles/7-reasons-to-practice-vinyasa-yoga.jpg=w768"})
yoga5 = Yoga.new({"type" => "Iyengar", "description" => "Iyengar Yoga, named after and developed by B. K. S. Iyengar, and described in his bestselling 1966 book Light on Yoga, is a form of yoga as exercise that has an emphasis on detail, precision and alignment in the performance of yoga postures (asanas).
The style often makes use of props, such as belts, blocks, and blankets, as aids in performing the asanas. The props enable beginning students, the elderly, or those with physical limitations to perform the asanas correctly, minimising the risk of injury or strain.", "image_url" => "https://www.healthyfood.co.uk/wp-content/uploads/2017/04/yoga-header.jpg"})
yoga6 = Yoga.new({"type" => "Kundalini", "description" => "Kundalini yoga is a school of yoga that is influenced by Shaktism and Tantra schools of Hinduism. It derives its name through a focus on awakening kundalini energy through regular practice of mantra, tantra, yantra, yoga or meditation. Kundalini yoga is often identified as the most dangerous form of yoga because of the involvement of subtle energies", "image_url" => "https://miro.medium.com/max/10792/1*MzJNw-XsE47GCaKep2OP5A.jpeg"})
yoga7 = Yoga.new({"type" => "Yin", "description" => "Yin Yoga is a slow-paced style of yoga as exercise, incorporating principles of Traditional Chinese Medicine, with asanas (postures) that are held for longer periods of time. For beginners, asanas may be held from 45 seconds to two minutes; more advanced practitioners may stay in one asana for five minutes or more.", "image_url" => "https://vikasayoga.com/wp-content/uploads/2019/04/Things-to-Know-before-you-try-Yin-Yoga-1321x623.png"})

yoga1.save
yoga2.save
yoga3.save
yoga4.save
yoga5.save
yoga6.save
yoga7.save

yoga_experience1 = YogaExperience.new({"studio_name" => "Absolute Yoga", "city_id" => city1.id, "yoga_id" => yoga2.id, "description" => "Absolute Yoga is Thailand's largest yoga centre that also specialises in
  Pilates reformer and core blast programs. Having been Thailand's first hot yoga studio since 2002, Absolute Yoga is a pioneer in the yoga community in Southeast Asia with 7 studios throughout Bangkok.",
  "bucket_list" => "f", "visited" => "f", "image_url" => "http://yogainbangkok.com/wp-content/uploads/2016/11/absolut-yoga-03.jpg"})
yoga_experience2 = YogaExperience.new({"studio_name" => "Shambhavi Yoga Studio", "city_id" => city2.id, "yoga_id" => yoga1.id, "description" => "When you combine ancient yoga traditions with breathing, moving and meditation,
  it brings a new awareness and awakens you to a deeper connection to yourself and others. In every class you will experience strength, flexibility, and endurance training.", "bucket_list" => "f", "visited" => "f", "image_url" => "https://lh3.googleusercontent.com/fz_Ja9MN3xU9ARLUVDn36aynTgatPvcMv6_jDz6O-s1_8FBLpvPbO3uhiIm5s2mF0U_4z9YA=w1080-h608-p-no-v0"})
yoga_experience3 = YogaExperience.new({"studio_name" => "Meira's Ashtanga Yoga", "city_id" => city3.id, "yoga_id" => yoga3.id, "description" => "Ashtanga based flow classes focus on moving with the fluidity of the breath,
  bringing together a combination of strength, flexibility and balance. I try to incorporate a wide range of modifications to my classes, creating an environment that is suitable for all levels of yoga practitioners.",
  "bucket_list" => "t", "visited" => "f", "image_url" => "https://www.spicenotsugar.co.uk/wp-content/uploads/2017/07/ashtanga-yoga-1024x755.jpg"})
yoga_experience4 = YogaExperience.new({"studio_name" => "Yogatique Bangkok", "city_id" => city1.id, "yoga_id" => yoga7.id, "description" => " At Yogatique we believe in the power of Yoga.
When you enter our doors you’ll encounter a warm welcoming energy and a friendly neighborhood vibe, where you are welcome to explore the teachings of Yoga on your own terms. There are many compelling paths to Yoga and we want to feed your curiosity and sense of adventure by offering an array of styles and teachers under one roof.",
  "bucket_list" => "f", "visited" => "f", "image_url" => "https://yogatiquebangkok.files.wordpress.com/2019/06/yogatique-transparent1.png"})
yoga_experience5 = YogaExperience.new({"studio_name" => "Ashtanga Yoga Bangkok", "city_id" => city1.id, "yoga_id" => yoga3.id, "description" => "Ashtanga Vinyasa Yoga is a style of yoga as exercise created by K. Pattabhi Jois during the 20th century, often promoted as a modern-day form of classical Indian yoga. He claimed to have learnt the system from his teacher, Tirumalai Krishnamacharya. The style is hot and energetic, synchronising breath with movements.
  Come and learn with us Ashtanga Yoga, an ancient system of Yoga that was taught by Vamana Rishi in the Yoga Korunta.", "bucket_list" => "f", "visited" => "f", "image_url" => "https://www.aybkk.org/wp-content/uploads/2018/08/AYBKK-gallery_008-400x284.jpg"})
yoga_experience6 = YogaExperience.new({"studio_name" => "Yoga Elements", "city_id" => city2.id, "yoga_id" => yoga5.id, "description" => "Yoga Elements is a method of teaching breath-focused yoga and holistic body-mind-spirit wellness. It is based on scientific understanding of the body and mind and taught using NLP-based communcation skills.",
  "bucket_list" => "f", "visited" => "f", "image_url" => "https://www.yogajournal.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_620/MTY1OTAxNTQ2NTg2OTA4MDQy/irene-pappas-wheel-pose-drill.jpg"})
yoga_experience7 = YogaExperience.new({"studio_name" => "Freedom Ashtanga", "city_id" => city1.id, "yoga_id" => yoga3.id, "description" => "Challenge your body and mind to achieve ultimate peace and tranquility.",
  "bucket_list" => "f", "visited" => "f", "image_url" => "https://www.rishikulyogshala.org/wp-content/uploads/2018/09/Ashtanga-Yoga-800x480.jpg"})
yoga_experience8 = YogaExperience.new({"studio_name" => "More Yoga", "city_id" => city2.id, "yoga_id" => yoga6.id, "description" => "Challenge your body and mind to achieve ultimate peace and tranquility.",
  "bucket_list" => "f", "visited" => "f", "image_url" => "https://previews.123rf.com/images/gbrjo/gbrjo1604/gbrjo160400014/57670834-yoga-asana-set-with-cartoon-woman-exercising-various-different-yoga-poses-training.jpg"})

yoga_experience1.save
yoga_experience2.save
yoga_experience3.save
yoga_experience4.save
yoga_experience5.save
yoga_experience6.save
yoga_experience7.save
yoga_experience8.save

binding.pry
nil
