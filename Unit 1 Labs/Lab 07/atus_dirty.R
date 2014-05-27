# Each designated reporting day includes a 24-hour period that begins at 
# 4 a.m. and ends at 4 a.m. the following day. A time use variable returns 
# the number of minutes for each ATUS respondent meeting user-specified criteria.

# This script makes a purposely 'dirty' data file for students to 
# munge in lab 1.7

df <- read.table("~/Dropbox/IDS Curriculum Design/Folder-James/Unit 1/Data/ATUS Data/atusx2.dat")
df_strings <- as.character(df$V1)
line_string <- strsplit(df_strings, "")

## Diagnostics ##
#  line_length <- sapply(line_string, length)
#  summary(line_length)

caseid            <- sapply(line_string, function (x) {paste(x[1:14], collapse = "")})
age               <- sapply(line_string, function (x) {paste(x[31:33], collapse = "")})
gender            <- sapply(line_string, function (x) {paste(x[34:35], collapse = "")})
fulltime_emp      <- sapply(line_string, function (x) {paste(x[64:65], collapse = "")})
phys_challenge    <- sapply(line_string, function (x) {paste(x[94:95], collapse = "")})
sleep             <- sapply(line_string, function (x) {paste(x[160:163], collapse = "")})
homework          <- sapply(line_string, function (x) {paste(x[224:227], collapse = "")})
socializing       <- sapply(line_string, function (x) {paste(x[236:239], collapse = "")})  

atus_dirty <- data.frame(caseid, V1 =  as.character(age), 
                         V2 = as.factor(gender), 
                         V3 = as.factor(fulltime_emp), 
                         V4 = as.factor(phys_challenge), 
                         V5 = as.character(sleep), 
                         V6 = as.character(homework), 
                         V7 = as.character(socializing), 
                         stringsAsFactors = FALSE)
atus_dirty$V3 <- as.factor(atus_dirty$V3)
levels(atus_dirty$V3) <- c("Full time",
                            "Part time",
                            "No answer")

View(atus_dirty)
save(atus_dirty, file = "~/Dropbox/IDS Curriculum Design/Labs/Unit 1 Labs/Data/atus_dirty.RData")
