######################
# Feladatok          #
# Programozás I      #
# 2016/2017 II.félév #
# Hőbér Boglárka     #
#2017-03-25          #
######################

#II.feladat#
#1.lista készítése, ami 5 vektort tartalmaz
lista <- list(seq(1, 2, length.out = sample(10:20,1)),
              seq(1, 2, length.out = sample(10:20,1)),
              seq(1, 2, length.out = sample(10:20,1)),
              seq(1, 2, length.out = sample(10:20,1)),
              seq(1, 2, length.out = sample(10:20,1)))
lista

#2.Milyen hosszúak a lista elemei for ciklussal?
hossz <- NA
for (i in 1:length(lista)){
  hossz[i] <- length(lista[[i]])
}
hossz
#Vektor lett-e az eredmény?
is.vector(hossz)

#3.Apply függvénnyel
#A végeredmény lista kell, hogy legyen, ezért lapply-t használok
lapply(lista, length)

#4.feladat
#A végeremény vektor kell, ezért sapply-t használok
sapply(lista, length)


#III.feladat
#1.Dataset behívása
data("chickwts")
?chickwts

#2.Átlagsúly a különbözőképpen táplált csirkéknek
átlagsúly <- aggregate(chickwts$weight,by = list(feed = chickwts$feed), mean)
átlagsúly

#3. csökkenő sorrendbe rendezés
library(dplyr)
átlagsúly_rendezve <- arrange(átlagsúly, desc(x))
átlagsúly_rendezve

#IV.feladat
#1.Mátrix létrehozása
matrix <- matrix(rnorm(500), nrow = 50, ncol = 10)
#Minden sor szórása legyen egyenlő a sor számával
for (i in 1:nrow(matrix)) {
  matrix [i, ] <- rnorm(ncol(matrix), mean = 0, sd = i)
}

#2. Minden sor szórása for ciklussal, a végeredmény vektor legyen
szórás <- NA
for (i in 1:nrow(matrix)){
  szórás [i] <- sd (matrix[i,])
}
szórás
is.vector(szórás)

#3.Apply függvénnyel
#Mivel mátrixból kell vektor, ezért apply-t használok
szórás_v2 <- apply(matrix, 1, sd)
szórás_v2
is.vector(szórás_v2)

#4.feladat
#-1-től 1-ig tartó intervallumra állítani
uj_matrix <- runif (matrix, -1, 1)
uj_matrix
#Sorok átlaga
mean(uj_matrix, 2)

#5.feladat
#1.dataset behívása
install.packages("fivethirtyeight")
library("fivethirtyeight")
data()
data("comic_characters")

#2.name oszlop kettévágása
comic_characters$name <-
  sapply (strsplit(as.character(comic_characters$name), "[][()]"), '[', 1)

#3.karakter rész levágása hasonló módszerrel
comic_characters$sex <-
  sapply (strsplit(as.character(comic_characters$sex), 
                                         "Characters"), '[', 1)
#Gender kiíratása
source('src/homework-03-functions.R')
get_gender("Thor")
get_gender("Katherine Pryde")
get_gender("Loki Laufeyson")

#A függévényem még mindig nem jó, nem tudom hogy lehetne megcsinálni a feladatot