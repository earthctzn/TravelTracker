usr1 = User.create(username: "Morpheus", password: "bluepill")
usr2 = User.create(username: "Micah", password: "thor")
usr3 = User.create(username: "Caleb", password: "test")
usr4 = User.create(username: "Bonny", password: "bark")

story1 = Story.create(title: "Shwifty times", content: "Super schwifty ipsum lormen artic daft drunken fart", user: usr1)
story2 = Story.create(title: "Squanchy times", content: "Super schwifty ipsum lormen artic daft drunken fart", user: usr2)
story3 = Story.create(title: "Wubba lubba times", content: "Super schwifty ipsum lormen artic daft drunken fart", user: usr3)
story4 = Story.create(title: "A boogaloo time", content: "Super schwifty ipsum lormen artic daft drunken fart", user: usr4)

plc1 = Place.create(city: "Phoenix", state: "Arizona", country: "USA", visit_date: "June 1980")
plc2 = Place.create(city: "Kopenhagen", state: "Kopenhagen", country: "Demark", visit_date: "June 2017")
plc3 = Place.create(city: "Barcelona", state: "Cataluña", country: "Spain", visit_date: "June 2018")
plc4 = Place.create(city: "Valencia", state: "Cataluña", country: "Spain", visit_date: "June 2018")

story1.places << plc1
story2.places << plc2
story3.places << plc3
story4.places << plc4