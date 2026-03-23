# Generate mock ADSL-style dataset

set.seed(123)

n_subj <- 120

adsl <- data.frame(
  STUDYID = "DEMO001",
  USUBJID = sprintf("DEMO001-%03d", 1:n_subj),
  TRT01A = sample(c("Placebo", "Drug A"), n_subj, replace = TRUE),
  SEX = sample(c("M", "F"), n_subj, replace = TRUE),
  AGE = sample(18:75, n_subj, replace = TRUE),
  RACE = sample(c("White", "Asian", "Black or African American", "Other"),
                n_subj, replace = TRUE,
                prob = c(0.45, 0.25, 0.20, 0.10)),
  SAFFL = "Y",
  EFFFL = "Y",
  stringsAsFactors = FALSE
)

if (!dir.exists("data")) dir.create("data", recursive = TRUE)
write.csv(adsl, "data/adsl_mock.csv", row.names = FALSE)

message("Created data/adsl_mock.csv")
