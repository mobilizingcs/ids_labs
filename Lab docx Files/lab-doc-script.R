library(stringr)

#  Get file locations, file names and the eventual reponse file names.
labs_folder <- "~/Documents/ids_labs/"

lab_file_locations <- list.files(labs_folder, pattern = "^lab[1-9]+[a-z].Rpres", recursive = TRUE, full.names = TRUE)

lab_file_names <- str_extract(lab_file_locations, "lab[1-9]+[a-z].Rpres")

response_file_names <- gsub("(^lab[1-9][a-z]).Rpres", "\\1\\2.Rmd", lab_file_names) 

# Loop through labs to create response sheets
for (i in seq_along(lab_file_locations)) {
  # i = 2
  # Read in the regular lines from the .Rmd
  lab_lines <- readLines(lab_file_locations[i], warn = FALSE)

  # Grab titles and lab numbers
  lab_title <- lab_lines[1]
  lab_number <- gsub("\\s+$", "", lab_lines[6])
  header <- paste0("---", "\n",  
        "title: \"", lab_number, " - ", lab_title, "\"\n",
        "output: ", "word_document", "\n",
        "---", "\n", "\n",
        "\nDirections: Follow along with the slides and answer the questions in **bold** font in your journal.", "\n\n", "\\newline", "\n")
  # writeLines(header, paste0("Lab Response Sheets/Rmd/", 
                            # response_file_names[i]))
  
  # questions <- grep("\\*\\*(.*)\\*\\*", lab_lines, value = TRUE)[-1]
  # questions <- gsub("^\\s+", "", questions)
  # questions <- gsub("^- ", "", questions)
  # questions <- gsub("\\*\\*", "", questions)
  # 
  # questions <- paste(questions, 
  #                    collapse = "\n\n\\newline\n\n\\newline\n\n\\newline\n\n")
  response_dest_file <- paste0("Lab docx Files/Rmd/", 
                               response_file_names[i])
  
  # # Find identifiers for the content
  equal_signs <- grep("===+", lab_lines[9:length(lab_lines)])
  lab_lines[equal_signs + 8] <- gsub("=+", "", lab_lines[equal_signs + 8])
  lab_lines[equal_signs + 7] <- gsub("^", "## ", lab_lines[equal_signs + 7])
  code_issue <- grep("`r nrow\\(cdc\\)`", lab_lines[1:length(lab_lines)])
  lab_lines[code_issue] <- gsub("`r nrow\\(cdc\\)`", "15,624", lab_lines[code_issue])
  
  # slide_titles <- equal_signs - 1
  # spaces <- slide_titles - 1
  # asterisks <- grep("\\*\\*", lab_lines)
  # 
  # # Change directions
  # lab_lines[asterisks[1]] <- "Directions: Record your responses to the lab questions in the spaces provided."
  # 
  # # Create the response header and text
  # response_header <- lab_lines[minus_signs[1]:minus_signs[2]]
  # response_text <- lab_lines[sort(c(equal_signs, slide_titles, spaces, asterisks))]
  # response <- c(response_header, response_text)
  # response <- gsub("^\\s+", "", response)
  # response <- gsub("`r ", "`", response)
  # 
  # Write the response files
  # response_dest_file <- paste0("~/Dropbox/IDS Curriculum Design/ids_labs/extras/responses/rmd/", response_file_names[i])
  # writeLines(response, con = response_dest_file)
  writeLines(c(header, lab_lines[9:length(lab_lines)]), response_dest_file)
  rmarkdown::render(response_dest_file, output_dir = "Lab docx Files/docx/")
}
