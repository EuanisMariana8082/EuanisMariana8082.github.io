# okay so i am starting to work on a new project 11/21 the currrent one 

# Set the file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/UVST_ALBUM.csv"

# Read the CSV file
UVST_ALBUM <- read.csv(file_path)

# View the first few rows of the data
head(UVST_ALBUM)

# View the entire data
View(UVST_ALBUM)

row.names(UVST_ALBUM)


# this is just a basic plot 
# Convert plays to numeric
UVST_ALBUM$Plays <- as.numeric(gsub(",", "", UVST_ALBUM$Plays))

# Create a bar plot
barplot(UVST_ALBUM$Plays, names.arg = UVST_ALBUM$Song.Name, las = 2, col = "lightblue", 
        main = "Number of Plays for Each Song", xlab = "Song Name", ylab = "Number of Plays")



# a different plot
install.packages("hrbrthemes")
library(hrbrthemes)
library(ggplot2)
# Convert plays to numeric
UVST_ALBUM$Plays <- as.numeric(gsub(",", "", UVST_ALBUM$Plays))

# Create a scatter plot
ggplot(UVST_ALBUM, aes(x = Song.Name, y = Plays)) +
  geom_point() +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 1.2, color = "lightpink"),
        panel.grid.minor = element_line(size = 1.2, color = "lightblue"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))  # Rotate x-axis text


# Convert plays to numeric
UVST_ALBUM$Plays <- as.numeric(gsub(",", "", UVST_ALBUM$Plays))

# Create a scatter plot
ggplot(UVST_ALBUM, aes(x = Song.Name, y = Plays)) +
  geom_point() +
  geom_text(aes(label=Plays), vjust=-0.5, size=3.5) +  # Add text labels
  theme_bw() +
  theme(panel.grid.major = element_line(size = 1.2, color = "lightpink"),
        panel.grid.minor = element_line(size = 1.2, color = "lightblue"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))  # Rotate x-axis text

# keep this one it is cute ##################### looks organized ##########
# Convert plays to numeric
UVST_ALBUM$Plays <- as.numeric(gsub(",", "", UVST_ALBUM$Plays))

# Create a scatter plot
ggplot(UVST_ALBUM, aes(x = Song.Name, y = Plays)) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +  # Format y-axis labels
  theme_bw() +
  theme(panel.grid.major = element_line(size = 1.2, color = "lightpink"),
        panel.grid.minor = element_line(size = 1.2, color = "lightblue"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))  # Rotate x-axis text

# another plot this one DID NOT WORK AT ALL 
install.packages("ggExtra")
library(ggExtra)


# Convert plays to numeric
UVST_ALBUM$Plays <- as.numeric(gsub(",", "", UVST_ALBUM$Plays))

# Create a scatter plot
p <- ggplot(UVST_ALBUM, aes(x = Song.Name, y = Plays)) +
  geom_point() +
  theme(legend.position="none")

# Set relative size of marginal plots (main plot 10x bigger than marginals)
p1 <- ggMarginal(p, type="histogram", size=10)

# Custom marginal plots:
p2 <- ggMarginal(p, type="histogram", fill = "slateblue", xparams = list(bins=10))

# Show only marginal plot for x axis
p3 <- ggMarginal(p, margins = 'x', color="purple", size=4)

##### TRYING A DIFFERENT PLOT PiE CHART DON'T ERASE IT WORKED
install.packages("ggplot2")
library(ggplot2)

# Create a data frame with the count of each song
song_counts <- data.frame(table(UVST_ALBUM$Song.Name))

# Rename the columns
colnames(song_counts) <- c("Song.Name", "Count")


# Create a pie chart
ggplot(song_counts, aes(x = "", y = Count, fill = Song.Name)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  theme(legend.position = "right")

###################################LET'S TRY THIS #######################################
# Install and load the necessary packages
install.packages("gganimate")
library(gganimate)

# Install and load the necessary packages
install.packages("wordcloud")
library(wordcloud)

# Convert plays to numeric
UVST_ALBUM$Plays <- as.numeric(gsub(",", "", UVST_ALBUM$Plays))


# Create a word cloud
wordcloud(words = UVST_ALBUM$Song.Name, freq = UVST_ALBUM$Plays, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))







############################# now we plot UVST_Album 
##### trying a different plot now #####
install.packages('devtools')
devtools::install_github('smin95/smplot')
library(tidyverse) # it has ggplot2 package
library(cowplot) # it allows you to save figures in .png file
library(smplot)

# Set the file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/NSLQVAPM_ALBUM.csv"

# Read the CSV file
NSLQVAPM_ALBUM <- read.csv(file_path)

# View the first few rows of the data
head(NSLQVAPM_ALBUM)

# View the entire data
View(NSLQVAPM_ALBUM)

row.names(NSLQVAPM_ALBUM)

##### let's plot this ####################################################

library(plotly)

# Assuming 'Plays' column contains numeric data
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))
# Create a matrix from your data
data_matrix <- matrix(NSLQVAPM_ALBUM$Plays, nrow = 22, ncol = 1)

fig <- plot_ly(
  type = "contour", 
  z = data_matrix, 
  autocontour = TRUE, 
  contours = list(
    end = max(NSLQVAPM_ALBUM$Plays), 
    size = 2, 
    start = min(NSLQVAPM_ALBUM$Plays)
  ), 
  line = list(smoothing = 0)
)


fig



########################################### this one works but it's not what i need#####

# Load the necessary library
library(ggplot2)

# Create a bar plot
ggplot(NSLQVAPM_ALBUM, aes(x = Name.of.Song, y = Plays)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))




###### this is another plot 
library(ggplot2)

# Assuming 'Plays' column contains numeric data
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Create a scatter plot
ggplot(NSLQVAPM_ALBUM, aes(x = Name.of.Song, y = Plays)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  labs(x = 'Song Name', y = 'Play Count')


library(ggplotify)
library(GGally)


library(plotly)

# Convert 'Plays' to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

fig <- plot_ly(NSLQVAPM_ALBUM, x = ~Name.of.Song, y = ~Plays, type = 'bar') %>%
  layout(title = list(text ='NSLQVAPM_ALBUM data', font = list(size = 17)),
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig



#### okay 


# Libraries
library(viridis)
library(hrbrthemes)
library(ggplot2)

# Convert 'Plays' to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Plot
ggplot(NSLQVAPM_ALBUM, aes(x=Name.of.Song, y=Plays, fill=Name.of.Song)) + 
  geom_area(alpha=0.6 , size=.5, colour="white") +
  scale_fill_viridis(discrete = T) +
  theme_ipsum() + 
  ggtitle("The race between songs")

install.packages("tidyverse")
library(later)
library(KernSmooth)
library(lattice)

############################## this one worked but i still need to edit a couple of things on it ##########
# Libraries
library(ggplot2)
library(gganimate)

# Convert 'Plays' to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Plot
p <- ggplot(NSLQVAPM_ALBUM, aes(x=Name.of.Song, y=Plays, fill=Name.of.Song)) + 
  geom_boxplot() + 
  # Here comes the gganimate code
  transition_states(
    Name.of.Song,
    transition_length = 4,
    state_length = 1
  ) +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out') +
  scale_fill_brewer(palette="Set1") +  # Change the color palette
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate the x-axis labels

animate(p)



################### a single histogram ################## not much too look at 
# Libraries
library(plotly)

# Convert 'Plays' to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Plot
fig <- plot_ly(alpha = 0.6)
fig <- fig %>% add_histogram(x = ~NSLQVAPM_ALBUM$Plays)
fig <- fig %>% layout(barmode = "overlay")

fig



# here is another one################################

# Libraries
library(plotly)

# Convert 'Plays' to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Create a separate histogram for each song
for(song in unique(NSLQVAPM_ALBUM$Name.of.Song)) {
  song_data <- NSLQVAPM_ALBUM[NSLQVAPM_ALBUM$Name.of.Song == song, ]
  fig <- plot_ly(y = ~song_data$Plays, type = "histogram", name = song)
  fig
}





###### 11/25/23

# Set the new file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/NSLQVPM_COLLABS_Origin.csv"

# Read the CSV file
NSLQVPM_COLLABS_Origin <- read.csv(file_path)

# Print the column names
print(colnames(NSLQVPM_COLLABS_Origin))





#### plotting  it didn't work!!!!!!!!!!!!!!!!!!!!
# Set the new file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/NSLQVPM_COLLABS_Origin.csv"

# Read the CSV file
NSLQVPM_COLLABS_Origin <- read.csv(file_path)

# Print the column names
print(colnames(NSLQVPM_COLLABS_Origin))

# Load the necessary libraries
library(plotly)
library(remotes)

# Force reinstall the dash package from GitHub
remotes::install_github("plotly/dashR", upgrade = "never", force = TRUE)

# Load the dash library
library(dash)

# Create a plotly figure
fig <- plot_ly(NSLQVPM_COLLABS_Origin, x = ~Longitude, y = ~Latitude, color = ~monthly.listeners, type = "scatter", mode = "markers")

# Create a new Dash app
app <- Dash$new()

# Define the app layout
app$layout(
  htmlDiv(
    list(
      dccGraph(figure=fig) 
    )
  )
)

# Run the app
app$run_server(debug=TRUE, dev_tools_hot_reload=FALSE)



# To view the plot in R Studio
fig

# To view the plot in a Dash app
app$run_server(debug=TRUE, dev_tools_hot_reload=FALSE)

################################################################################





# Set the new file path   
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/NSLQVPM_COLLABS_Origin.csv"

# Read the CSV file
NSLQVPM_COLLABS_Origin <- read.csv(file_path)

# Print the column names
print(colnames(NSLQVPM_COLLABS_Origin))


# Load necessary libraries      ######## this plot actually ran ############### don't forget to add a title 
library(ggplot2)
library(maps)
library(mapdata)

# the data
artist_data <- data.frame(
  Artist_Name = c("Young Miko", "Mora", "Byrant Myers", "Luar La L", "Yovngchimi", "Eladio Carrion", "feid", "arcangel", "Rafael Castillo", "nengo flow"),
  monthly_listeners = c(30172477, 25268540, 16082345, 9006894, 10122460, 20951154, 44330186, 25869232, 18421243, 19617966),
  origin = c("Añasco, Puerto Rico", "Bayamón, Puerto Rico", "Carolina, Puerto Rico", "Carolina, Puerto Rico", "San Juan, Puerto Rico", "Kansas City, MO", "Medellín, Colombia", "East Harlem, New York", "The Bronx, New York", "San Juan, Puerto Rico"),
  Latitude = c(18.28273, 18.39856, 18.38078, 18.38078, 18.466333, 39.099724, 6.25184, 40.816357, 40.837048, 18.466333),
  Longitude = c(-67.13962, -66.15572, -65.95739, -65.95739, -66.105721, -94.578331, -75.56359, -73.962898, -73.865433, -66.105721)
)

# Get world map data
world_map <- map_data("world")

# Plot the map and points
ggplot() +
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill = "#D0EBBF", color = "black") +
  geom_point(data = artist_data, aes(x = Longitude, y = Latitude, color = Artist_Name), size = 3) +
  coord_fixed(1.3) +
  scale_color_discrete(name = "Artist Name")


################### what is my data telling me????? tell me about it don't forget 

###################### trying a new plot ########################





# Specify the file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/UVST_COLLABS_Origin.csv"

# Read the CSV file
UVST_COLLABS_Origin <- read.csv(file_path)

# Print the column names
print(colnames(UVST_COLLABS_Origin))


# Load necessary libraries      ######## this plot actually ran ############### don't forget to add a title 
library(ggplot2)
library(maps)
library(mapdata)


# Specify the file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/UVST_COLLABS_Origin.csv"

# Read the CSV file
UVST_COLLABS_Origin <- read.csv(file_path)

# Print the column names
print(colnames(UVST_COLLABS_Origin))

head(UVST_COLLABS_Origin)

# Load necessary libraries
library(ggplot2)
library(maps)






####################################### 12/4/23 

# Load necessary libraries
library(ggplot2)
library(scales)

# Read the file
NSLQVAPM_ALBUM <- read.csv("C:\\Users\\Rushe\\EuanisMariana8082.github.io\\My_Final_Project\\NSLQVAPM_ALBUM.csv")

# Convert plays to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Create a scatter plot
ggplot(NSLQVAPM_ALBUM, aes(x = Song.Name, y = Streams)) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +  # Format y-axis labels
  theme_bw() +
  theme(panel.grid.major = element_line(size = 1.2, color = "lightpink"),
        panel.grid.minor = element_line(size = 1.2, color = "lightblue"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))  # Rotate x-axis text

colnames(NSLQVAPM_ALBUM)









############################################
 ######this one worked so don't delete 

# Load necessary libraries
library(ggplot2)
library(scales)

# Read the file
NSLQVAPM_ALBUM <- read.csv("C:\\Users\\Rushe\\EuanisMariana8082.github.io\\My_Final_Project\\NSLQVAPM_ALBUM.csv")

# Convert plays to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))


# Create a scatter plot
ggplot(NSLQVAPM_ALBUM, aes(x = Name.of.Song, y = Plays)) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +  # Format y-axis labels
  theme_bw() +
  theme(panel.grid.major = element_line(size = 1.2, color = "lightpink"),
        panel.grid.minor = element_line(size = 1.2, color = "lightblue"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))  # Rotate x-axis text





##################################### trying this one IT WORKED !!!!!!!!!!!!!!!!!!!!!

# Load necessary libraries
library(wordcloud)
library(RColorBrewer)

# Read the file
NSLQVAPM_ALBUM <- read.csv("C:\\Users\\Rushe\\EuanisMariana8082.github.io\\My_Final_Project\\NSLQVAPM_ALBUM.csv")

# Convert plays to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Create a word cloud
wordcloud(words = NSLQVAPM_ALBUM$Name.of.Song, freq = NSLQVAPM_ALBUM$Plays, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



# Load necessary libraries
library(wordcloud)
library(RColorBrewer)

# Read the file
NSLQVAPM_ALBUM <- read.csv("C:\\Users\\Rushe\\EuanisMariana8082.github.io\\My_Final_Project\\NSLQVAPM_ALBUM.csv")

# Convert plays to numeric
NSLQVAPM_ALBUM$Plays <- as.numeric(gsub(",", "", NSLQVAPM_ALBUM$Plays))

# Create a word cloud
#wordcloud(words = NSLQVAPM_ALBUM$Name.of.Song, freq = NSLQVAPM_ALBUM$Plays, min.freq = 8,
         # max.words=500, random.order=FALSE, rot.per=0.35, scale=c(1,.5),
          #colors=brewer.pal(8, "Dark2"))




# Create a word cloud
wordcloud(words = NSLQVAPM_ALBUM$Name.of.Song, freq = NSLQVAPM_ALBUM$Plays, min.freq = 4,
          max.words=700, random.order=FALSE, rot.per=0.35, scale=c(0.5,0.1),
          colors=brewer.pal(8, "Dark2"))








#################################### trying the map 

# Load necessary libraries
library(ggplot2)
library(maps)
library(mapdata)

# Set the file path
file_path <- "C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/UVST_COLLABS.csv"

# Read the CSV file
UVST_COLLABS <- read.csv(file_path, sep = ";")  # Adjust the 'sep' parameter as needed


# Print the column names
print(colnames(UVST_COLLABS))

# Assuming the data in UVST_COLLABS is similar to the example data
# Create a data frame with the artist data
artist_data <- data.frame(
  Artist_Name = UVST_COLLABS$Artist_Name,
  monthly_listeners = UVST_COLLABS$monthly_listeners,
  origin = UVST_COLLABS$origin,
  Latitude = UVST_COLLABS$Latitude,
  Longitude = UVST_COLLABS$Longitude
)

# Get world map data
world_map <- map_data("world")

# Plot the map and points
ggplot() +
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill = "#D0EBBF", color = "black") +
  geom_point(data = artist_data, aes(x = Longitude, y = Latitude, color = Artist_Name), size = 3) +
  coord_fixed(1.3) +
  scale_color_discrete(name = "Artist Name") +
  ggtitle("Your Title Here")  # Add a title to the plot



colnames(UVST_COLLABS)







# Specify the delimiter
delimiter <- ","  # Replace this with the actual delimiter in your file

# Read the file
UVST_COLLABS <- read.csv("C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/UVST_COLLABS.csv", sep = delimiter)

# Print the column names
print(colnames(UVST_COLLABS))







# Load necessary libraries
library(tidyr)

# Read the CSV file
UVST_COLLABS <- read.csv("C:/Users/Rushe/EuanisMariana8082.github.io/My_Final_Project/UVST_COLLABS.csv")

# Print the column names
print(colnames(UVST_COLLABS))

# Split the column into multiple columns
UVST_COLLABS <- separate(UVST_COLLABS, "Artist.Name.Monthly.Listeners..s.Monthly.Listeners.Origin..Latitude.Longitude", 
                         into = c("Artist_Name", "Monthly_Listeners", "Origin", "Latitude", "Longitude"), sep = "\\.")

# Print the column names to check if the separation was successful
print(colnames(UVST_COLLABS))

