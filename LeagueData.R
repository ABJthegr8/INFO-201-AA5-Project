name <- c("Lissandra", "Lucian", "Kayn", "Kindred", "Kled", "Ivern", "Illaoi", "Jhin", "Kalista", 
          "Jinx", "Camille", "Braum", "Azir", "Aurelion Sol", "Bard", "Aatrox", "Ekko", "Gnar", 
          "Rek'Sai", "Nami", "Ornn", "Quinn", "Rakan", "Taliyah", "Tahm Kench", "Thresh", "Xayah", 
          "Vel'Koz", "Vi", "Zed", "Zac", "Graves", "Irelia", "Kog'Maw", "Kha'Zix", "Kennen", 
          "Leona", "Lee Sin", "Lulu", "Malzahar", "Maokai", "Viktor", "Yorick", "Volibar", "Wukong", 
          "Vladimir", "Talon", "Swain", "Syndra", "Trundle", "Vayne", "Varus", "Nocturne", 
          "Orianna", "Nautilus", "Sejuani", "Riven", "Rumble", "Renekton", "Rengar", "Skarner", 
          "Fizz", "Ezreal", "Fiona", "Diana", "Darius", "Draven", "Elise", "Ahri", "Brand", "Caitlyn", 
          "Cassiopeia", "Jarvan IV", "Jayce", "Hecarim", "Zyra", "Xerath", "Ziggs", "Shyvana", 
          "Nidalee", "Miss Fortune", "Shaco", "Pantheon", "Olaf", "Urgot", "Twitch", "Lux", "Katarina", 
          "LeBlanc", "Gragas", "Heimerdinger", "Kassadin", "Karthus", "Karma", "Blitzcrank", "Anivia",
          "Shen", "Sona", "Galio", "Gangplank", "Corki", "Akali", "Zilean", "Malphite", "Janna", "Jax", 
          "Alistar", "Evelynn", "FiddleSticks", "Cho'Gath", "Dr. Mundo", "Morgana", "Nasus", "Rammus",
          "Sion", "Mordekaiser", "Teemo", "Tristana", "Tryndamere", "Twisted Fate", "Udyr", "Veigar", 
          "Taric", "Xin Zhao")

actual.role <- c("Mid", "ADC", "Jungle", "Jungle", "Top", "Jungle", "Top", "ADC", "ADC", "ADC",
                 "Top", "Support", "Mid", "Mid","Support", "Top", "Mid", "Top", "Jungle", 
                 "Support", "Top", "Top", "Support", "Mid", "Support", "Support", "ADC", "Mid",
                 "Jungle", "Mid", "Jungle", "Jungle", "Top", "ADC", "Jungle", "Top", "Support", 
                 "Jungle", "Support", "Mid", "Top", "Mid", "Top", NA, "Top", "Mid", "Mid", "Top", 
                 "Mid", "Top", "ADC", "ADC", "Jungle", "Mid", "Support", "Jungle", "Top", "Top", 
                 "Top", "Jungle", "Jungle", "Mid", "ADC", "Top", "Mid", "Top", "ADC", "Jungle",
                 "Mid", "Support", "ADC", "Mid", "Jungle", "Top", "Jungle", "Support", "Mid", "Mid", 
                 "Top", "Mid", "ADC", "Jungle", "Top", "Top", "Top", "ADC", "Mid", "Mid", "Mid", 
                 "Mid", "Mid", "Mid", "Mid", "Support", "Support", "Mid", "Top", "Support", "Mid",
                 "Top", "ADC", "Mid")

supposed.role <- c("Mid", "ADC", "Jungle", "Jungle", "Top", "Jungle", "Top", "ADC", "ADC", "ADC",
                 "Top", "Support", "Mid", "Mid","Support", "Top", "Mid", "Top", "Jungle", 
                 "Support", "Top", "ADC", "Support", "Mid", "Top", "Support", "ADC", "Mid",
                 "Top", "Mid", "Top", "Jungle", "Top", "ADC", "Jungle", "ADC", "Support", 
                 "Jungle", "Support", "Mid", "Top", "Mid", "Top", NA, "Top", "Mid", "Mid", "Mid", 
                 "Mid", "Top", "ADC", "ADC", "Jungle", "Mid", "Support", "Jungle", "Top", "Top", 
                 "Top", "Jungle", "Jungle", "Mid", "ADC", "Top", "Mid", "Top", "ADC", "Jungle",
                 "Mid", "Mid", "ADC", "Mid", "Jungle", "Top", "Jungle", "Support", "Mid", "Mid",
                 "Top", "Mid", "ADC", "Jungle", "Top", "Top", "Top", "ADC", "Mid", "Mid", "Mid", 
                 "Mid", "Mid", "Mid", "Mid", "Support", "Support", "Mid", "Top", "Support", "Mid",
                 "Top", "ADC", "Mid")


actual.role1 <- c("Top", "Mid", "ADC", "Jungle", "Top", "Top", "Top", "ADC", "Mid", "Mid", "Mid", 
                  "Mid", "Mid", "Mid", "Mid", "Support", "Support", "Mid", "Top", "Support", "Mid",
                  "Top", "ADC", "Mid")

#"Shyvana", "Nidalee", "Miss Fortune", "Shaco", "Pantheon", "Olaf", "Urgot", "Twitch", 
#"Lux", "Katarina", "LeBlanc", "Gragas", "Heimerdinger", "Kassadin", "Karthus", "Karma",
#"Blitzcrank", "Anivia", "Shen", "Sona", "Galio", "Gangplank", "Corki", "Akali"

temp.champ <- c("Zilean", "Malphite", "Janna", "Jax", "Alistar", "Evelynn", "FiddleSticks", 
                   "Cho'Gath", "Dr. Mundo", "Morgana", "Nasus", "Rammus", "Sion", "Mordekaiser", 
                   "Teemo", "Tristana", "Tryndamere", "Twisted Fate", "Udyr", "Veigar", "Taric", 
                   "Xin Zhao")

temp.supposed <- c("Support", "Top", "Support", "Top", "Top", "Jungle", "Jungle", "Top", "Top",
                   "Support", "Top", "Jungle", "Top", "ADC", "Mid", "ADC", "Top", "Mid", "Jungle",
                   "Mid", "Support", "Jungle")

temp.actual <- c("Support", "Top", "Support", "Top", "Support", "Jungle", "Jungle", "Top", "Top",
                 "Support", "Top", "Jungle", "Top", "Top", "Top", "ADC", "Top", "Mid", "Jungle",
                 "Mid", "Support", "Jungle")

temp.gender <- c("Male", NA, "Female", "Male", "Male", "Female", "Male", "Male", "Male", "Female",
                 "Male", NA, "Male", "Male", "Male", "Female", "Male", "Male", "Male", "Male", "Male", 
                 "Male")

temp.price <- c(1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350,
                1350, 1350, 1350, 1350, 1350, 1350, 1350)

price <- c(6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 
           6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300, 6300,
           6300, 6300, 6300, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 
           4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 
           4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 
           4800, 4800, 4800, 4800, 4800, 4800, 4800, 4800, 3150, 3150, 3150, 3150, 3150, 3150, 
           3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 3150, 
           3150, 3150, 3150, 3150, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 
           1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350, 1350)
gender <- c("Female", "Male", "Male", NA, "Male", "Male", "Female", "Male", "Female", "Female", 
            "Female", "Male", "Male", NA, NA, "Male", "Male", "Male", "Female", "Female", "Male",
            "Female", "Male", "Female", "Male", "Male", "Female", "Male", "Female", "Male", "Male",
            "Male", "Female", NA, "Male", "Male", "Female", "Male", "Female", "Male", "Male", 
            "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Female", "Male", "Female", 
            "Male", "Male", "Female", "Male", "Female", "Female", "Male", "Male", "Male", "Male", 
            "Male", "Male", "Female", "Female", "Male", "Male", "Female", "Female", "Male", "Female", 
            "Female", "Male", "Male", "Male", "Female", "Male", "Male", "Female", "Female", "Female",
            NA, "Male", "Male", "Male", "Male", "Female", "Female", "Female", "Male", "Male", "Male",
            "Male", "Female", NA, "Female", "Male", "Female", "Male", "Male", "Male", "Female", "Male", 
            NA, "Female", "Male", "Male", "Female", "Male", "Male", "Male", "Female", "Male", NA, "Male", 
            "Male", "Male", "Female", "Male", "Male", "Male", "Male", "Male", "Male")

champions.league <- data.frame(name,price, gender, supposed.role, actual.role, stringsAsFactors = FALSE)