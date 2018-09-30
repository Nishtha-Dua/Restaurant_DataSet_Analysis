View(userprofile)

userdata <-  data.frame("userID" = userprofile$userID,
                        "drink_lvl" = userprofile$drink_level,
                        "company" = userprofile$ambience,
                        "martial_status" = userprofile$marital_status,
                        "birth_year" = userprofile$birth_year,
                        "emp_status" = userprofile$activity,
                        "weight" = userprofile$weight,
                        "budget" = userprofile$budget,
                        "age" = userprofile$age)

str(userdata)

View(userdata)

aggregate(Rating ~ Year, data = movie_ratings_year, sum)

library(ggplot2)

#which category has the highest visits, help the managers to come up with good schemes for those category
qplot(data = userdata, age, fill = emp_status, bins= 30)

# shows which category carry what kind of budgest, and accordingly price menu's can be adjusted
qplot(data = userdata, emp_status, fill = budget, bins= 30)

#which category likes what kind of comapy and according to that family and friend offers can be made
qplot(data = userdata, emp_status, fill = company, bins= 30)

#which categor drinks a lot and what is there martial status, help in deciding schems on drinks
ggplot(userdata,aes(x=emp_status,y=age))+geom_point(aes(size=drink_lvl,col= martial_status))


ggplot(userdata,aes(x=emp_status,y=age))+geom_point(aes(size=weight,col= martial_status))

View(geoplaces2)

user_cuisine_data <- data.frame(user_id = usercuisine$userID, Cuisine = usercuisine$Rcuisine)

View(user_cuisine_data)

user_cuisine_comb_data <- merge(userdata, user_cuisine_data, by = "user_id")

View(user_cuisine_comb_data)                                                                                                                                                      

library(ggplot2)

qplot(data = user_cuisine_comb_data, age, fill = Cuisine, bins= 30)

qplot(data = user_cuisine_comb_data, emp_status, fill = Cuisine, bins= 30)

ggplot(user_cuisine_comb_data,aes(x=emp_status,y=age))+geom_point(aes(size=Cuisine,col= martial_status))

ggplot(user_cuisine_comb_data,aes(x=emp_status,y=age))+geom_point(aes(size=drink_lvl,col= Cuisine))

user_place_cuisine_data <- merge(geoplaces2, chefmozcuisine, by = "placeID")

View(user_place_cuisine_data)

library(ggplot2)
ggplot(user_cuisine_comb_data,aes(x=emp_status,y=age))+geom_point(aes(size=Cuisine,col= martial_status))

qplot(data = user_place_cuisine_data, Rcuisine, fill = state, bins= 30)

ggplot(user_place_cuisine_data,aes(x=state,y=accessibility))+geom_point(aes(size=price,col= Rcuisine))

ggplot(user_place_cuisine_data,aes(x=state,y=Rcuisine))+geom_point(aes(size=price,col= accessibility))

user_final_rating <- merge(rating_final, user_place_cuisine_data, by = "placeID")

View(user_final_rating)

d <- density(user_final_rating$rating)
plot(d)

ggplot(user_final_rating, aes(x = state, y = rating, colour = "blue" )) + geom_line()

qplot(data = user_final_rating, rating, fill = state, bins= 30)

qplot(data = user_final_rating, rating, fill = Rcuisine, bins= 30)

qplot(data = user_final_rating, food_rating, fill = Rcuisine, bins= 30)

ggplot(user_final_rating,aes(x=state,y=Rcuisine))+geom_point(aes(size=accessibility,col=service_rating))

colnames(user_final_rating)[2] <- "user_id"

View(user_final_rating)

user_final_rating <- merge(user_final_rating, userdata, by = "userID")

View(user_final_rating)

ggplot(user_final_rating,aes(x=state,y=Rcuisine))+geom_point(aes(size= price, col= emp_status))

ggplot(user_final_rating,aes(x=state,y=Rcuisine))+geom_point(aes(size= accessibility, col=emp_status))

       