require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {"id"=> 1,
    "name" => "Visit of Nantes",
    "category" => "Visits",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 10,
    "price" => 100,
    "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"},
    {"id"=> 2,
    "name" => "Survival workshop",
    "category" => "Adventure",
    "city" => "Rambouillet",
    "duration" => 240,
    "number_of_participants" => 8,
    "price" => 500,
    "img" => "https://cdn.website-editor.net/4a7d6960d9b248328a840828d29c3951/dms3rep/multi/mobile/Survival+immersion+Pascal+immersion.jpg"},
    {"id"=> 3,
    "name" => "Mixology",
    "category" => "Workshop",
    "city" => "Paris",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 200,
    "img" => "https://images.unsplash.com/photo-1509669803555-fd5edd8d5a41?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"},
    {"id"=> 4,
    "name" => "Visit of Marseilles",
    "category" => "Adventure",
    "city" => "Marseilles",
    "duration" => 360,
    "number_of_participants" => 20,
    "price" => 50,
    "img" => "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/France/Marseille/marseille-lead-image-guide.jpg?imwidth=450"},
    {"id"=> 5,
    "name" => "Escape game",
    "category" => "Adventure",
    "city" => "Paris",
    "duration" => 240,
    "number_of_participants" => 6,
    "price" => 180,
    "img" => "https://images.unsplash.com/photo-1508345228704-935cc84bf5e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"},
    {"id"=> 6,
    "name" => "Lego Serious Game",
    "category" => "Workshop",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 250,
    "img" => "https://images.unsplash.com/photo-1516981879613-9f5da904015f?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"},
  ]

  erb :index
end

get "/activity/:activity_id" do

  activities = [
    {"id"=> 1,
    "name" => "Visit of Nantes",
    "category" => "Visits",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 10,
    "price" => 100,
    "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"},
    {"id"=> 2,
    "name" => "Survival workshop",
    "category" => "Adventure",
    "city" => "Rambouillet",
    "duration" => 240,
    "number_of_participants" => 8,
    "price" => 500,
    "img" => "https://cdn.website-editor.net/4a7d6960d9b248328a840828d29c3951/dms3rep/multi/mobile/Survival+immersion+Pascal+immersion.jpg"},
    {"id"=> 3,
    "name" => "Mixology",
    "category" => "Workshop",
    "city" => "Paris",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 200,
    "img" => "https://images.unsplash.com/photo-1509669803555-fd5edd8d5a41?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"},
    {"id"=> 4,
    "name" => "Visit of Marseilles",
    "category" => "Adventure",
    "city" => "Marseilles",
    "duration" => 360,
    "number_of_participants" => 20,
    "price" => 50,
    "img" => "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/France/Marseille/marseille-lead-image-guide.jpg?imwidth=450"},
    {"id"=> 5,
    "name" => "Escape game",
    "category" => "Adventure",
    "city" => "Paris",
    "duration" => 240,
    "number_of_participants" => 6,
    "price" => 180,
    "img" => "https://images.unsplash.com/photo-1508345228704-935cc84bf5e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"},
    {"id"=> 6,
    "name" => "Lego Serious Game",
    "category" => "Workshop",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 250,
    "img" => "https://images.unsplash.com/photo-1516981879613-9f5da904015f?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"},
  ]

  @descriptions = [
    { "short" => "The best activity to build your team.",
      "long" => "The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
      "},
    { "short" => "A teambuilding like no others.",
    "long" => "Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.
    "},
    { "short" => "A teambuilding you'll remember.",
      "long" => "You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.
      "},
    { "short" => "You'll help each other or kill each other. But you'll love it!",
    "long" => "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.
    "},
    { "short" => "Teambuilding for dummies.",
      "long" => "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.
        "},
    { "short" => "The best teambuilding in the world. Period.",
    "long" => "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.
    "},
    { "short" => "You can hate your coworkers but you'll love this activity.",
      "long" => "My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?
      "},
    { "short" => "Not the best teambuilding but it's cheap!",
    "long" => "You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.
    "},
    { "short" => "Binge drinking not included.",
      "long" => "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?
        "},
    { "short" => "If you don't like your team you can just get wasted.",
    "long" => "Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.
    "}
  ]

  activities.each do |activity|
    if activity["id"] == params["activity_id"].to_i
      @activity = activity
    end
  end
  erb :activity

end
