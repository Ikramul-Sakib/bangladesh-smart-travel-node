-- Optional starter content. Run: npm run seed
INSERT OR IGNORE INTO destinations(id,name,slug,division,district,description,image_path,is_active,is_demo) VALUES
(1,'Cox’s Bazar','coxs-bazar','Chattogram','Cox’s Bazar','Walk along the world-famous sandy coastline, watch the sunset and discover the Bay of Bengal.','',1,1),
(2,'Sajek Valley','sajek-valley','Chattogram','Rangamati','Cloud-kissed hills, green ridgelines and unforgettable sunrise views make Sajek a special escape.','',1,1),
(3,'Sundarbans','sundarbans','Khulna','Bagerhat','Explore the world’s largest mangrove forest through waterways, wildlife and quiet natural beauty.','',1,1),
(4,'Sylhet','sylhet','Sylhet','Sylhet','Tea gardens, waterfalls and rolling green landscapes welcome you to the northeast.','',1,1),
(5,'Bandarban','bandarban','Chattogram','Bandarban','A land of dramatic hills, winding roads and rich cultural traditions.','',1,1),
(6,'Srimangal','srimangal','Sylhet','Moulvibazar','Slow down among emerald tea estates, forest trails and peaceful countryside.','',1,1);
INSERT OR IGNORE INTO tourist_attractions(destination_id,name,description,entrance_fee_bdt,category,is_active,is_demo) VALUES
(1,'Laboni Beach','A popular stretch of Cox’s Bazar beach for sea views and sunset walks.',0,'Beach',1,1),
(1,'Himchari National Park','Green hills, forest trails and coastal viewpoints.',50,'Nature',1,1),
(2,'Sajek Viewpoint','Panoramic views across the hill landscape and clouds.',100,'Viewpoint',1,1),
(3,'Karamjal Wildlife Centre','A visitor gateway to learn about the mangrove ecosystem.',150,'Wildlife',1,1),
(4,'Jaflong','Riverside scenery and views toward the hills near the border.',0,'Nature',1,1),
(6,'Tea Garden Trails','Explore the region’s signature rolling tea gardens.',0,'Nature',1,1);
INSERT OR IGNORE INTO hotels(id,destination_id,name,category,address,facilities,is_active,is_demo) VALUES
(1,1,'Coastal Guesthouse','budget','Cox’s Bazar town','Wi-Fi, breakfast',1,1),(2,4,'Tea Garden Stay','standard','Sylhet region','Garden, restaurant',1,1),(3,6,'Green Hills Lodge','budget','Srimangal','Garden, parking',1,1);
INSERT OR IGNORE INTO hotel_room_types(hotel_id,room_type,price_per_night_bdt,max_guests,is_active) VALUES
(1,'Standard double',1800,2,1),(2,'Garden room',2500,2,1),(3,'Standard room',1600,2,1);
INSERT OR IGNORE INTO food_costs(destination_id,preference,breakfast_bdt,lunch_bdt,dinner_bdt,snacks_bdt,drinking_water_bdt,is_active,is_demo) VALUES
(1,'budget',100,180,200,70,30,1,1),(1,'standard',180,300,350,120,50,1,1),(2,'standard',150,250,300,100,40,1,1),(4,'standard',130,230,260,100,40,1,1);
