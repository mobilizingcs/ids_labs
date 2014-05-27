# This script is the munged data file from lab 1.7


load("~/Dropbox/IDS Curriculum Design/Labs/Unit 1 Labs/Data/atus_dirty.RData")
atus_clean <- atus_dirty

names(atus_clean) <- c("caseid", "age", "gender", "fulltime_emp",
                       "phys_challenge", "sleep", "homework",
                       "socializing")
atus_clean$age <- as.numeric(atus_clean$age)
atus_clean$sleep <- as.numeric(atus_clean$sleep)
atus_clean$homework <- as.numeric(atus_clean$homework)
atus_clean$socializing <- as.numeric(atus_clean$socializing)

levels(atus_clean$gender) <- c("Male", "Female")
levels(atus_clean$phys_challenge) <- c("No difficulty", "Has difficutlty")

View(atus_clean)
save(atus_clean, file = "~/Dropbox/IDS Curriculum Design/Labs/Unit 1 Labs/Data/atus_clean.RData")
