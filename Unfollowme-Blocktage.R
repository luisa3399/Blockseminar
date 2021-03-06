library("igraph")
library("igraphdata")

# unfollowme 


unfollowed <- read.csv("https://raw.githubusercontent.com/birx/Blockseminar/master/03UFEdgelist.csv", header=T, as.is=T) # Liest die Edgelist ein.
unfollownod <- read.csv("https://raw.githubusercontent.com/birx/Blockseminar/master/01UFNodelist.csv", header=T, as.is=T) # Liest die Nodelist ein.
unfollowed <- as.matrix(unfollowed) # Erstellt aus der Edgelist eine Matrix.
unfollow<- graph_from_data_frame(d=unfollowed, vertices=unfollownod, directed=F) # Fuegt die Edge- und Nodelist zu einem igraph-Objekt zusammen.
plot(unfollow, layout=layout_with_kk)
LGN <- delete_vertices(unfollow, V(unfollow)[name = "Laut gegen Nazis"])
plot(LGN, layout=layout_nicely, main= "LGN") #vertex.color= "peru", vertex.label.color="grey27"

# counterspeech

csnod <- read.csv("https://raw.githubusercontent.com/birx/Blockseminar/master/02CSNodelist.csv", header=T, as.is=T)
csedge <- read.csv("https://raw.githubusercontent.com/birx/Blockseminar/master/03CSEdgelist.csv", header=T, as.is=T)
countered <- as.matrix(csedge)
counterspeech<- graph_from_data_frame(d=csedge, vertices=csnod, directed=F)
plot(counterspeech, layout=layout_with_kk)
CS2<- delete_vertices(counterspeech, V(counterspeech)[name="Laut gegen Nazis"])
plot(CS2, layout=layout_with_kk)
plot(CS2)# vertex.color=c("pink", "skyblue")[1+(V(CS2)$type=="1")], layout=layout_with_kk(CS2))

# zusammen
zusnod <- read.csv("https://raw.githubusercontent.com/birx/Blockseminar/master/GemeinsamNodes02.csv", header=T, as.is=T)
zusedge <-  read.csv("https://raw.githubusercontent.com/birx/Blockseminar/master/GemeinsamEdges01.csv", header=T, as.is=T)
zusmatrix <- as.matrix(zusedge)
zusammen <- graph_from_data_frame(d=zusedge, vertices=zusnod, directed=F)
plot(zusammen)
plot(zusammen, edge.arrow.size=.5, vertex.label.color="black",
     
     vertex.color=c( "pink", "skyblue")[1+(V(zusammen)$Projekt=="1")] ) 
LGN2 <- delete_vertices(zusammen, V(zusammen)[name="Laut gegen Nazis"]) # gemeinsames Netzwerk ohne LGN
plot(LGN2, layout=layout_nicely, vertex.color=c( "pink", "skyblue")[1+(V(zusammen)$Projekt=="1")]  )

