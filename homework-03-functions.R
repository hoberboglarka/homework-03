#get_gender függvény megírása
name <- comic_characters$name
get_gender <- function(name){
  if(is.na(comic_characters$gsm[comic_characters$name == name])){
    print(comic_characters$sex[comic_characters$name == name])
  }
  else {
    print(comic_characters$gsm[comic_characters$name == name])
  }
}

#Vektorral térjen vissza
sapply(name, function (x)x)

