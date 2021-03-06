# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.


.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

pat_meds <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Relationships_in_Clinical_Data", "fabricated_pt_nsaids.csv"))
demographics <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Relationships_in_Clinical_Data", "fabricated_pt_demo.csv"),
                         stringsAsFactors = FALSE)
demographics$SEX <- factor(demographics$SEX, levels = c(0,1), labels=c("Female", "Male"))
demographics$RACE <- factor(demographics$RACE, levels=c(1:8,99), labels=c("American Indian or Alaska Native", "Asian", 
                                                                          "Black or African-American", 
                                                                          "Native Hawaiian or Other Pacific Islander",
                                                                          "White", "More Than One Race", "Other", 
                                                                          "Refused", "Unknown or not reported"))
demographics$ETHNICITY <- factor(demographics$ETHNICITY, levels = c(1,2,99), labels = c("Hispanic or Latino", "Not Hispanic or Latino", "Unknown or Not Reported"))
demographics$PAT_DOB <- as.Date(demographics$PAT_DOB, format = "%m/%d/%y")