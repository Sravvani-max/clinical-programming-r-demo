# Generate mock ADLB-style longitudinal efficacy dataset

if (!file.exists("data/adsl_mock.csv")) {
  stop("ADSL mock dataset not found. Run generate_mock_adsl.R first.")
}

adsl <- read.csv("data/adsl_mock.csv", stringsAsFactors = FALSE)

visits <- data.frame(
  AVISIT = c("Baseline", "Week 4", "Week 8", "Week 12"),
  AVISITN = c(0, 4, 8, 12),
  stringsAsFactors = FALSE
)

adlb <- merge(adsl[, c("USUBJID", "TRT01A")], visits, by = NULL)

baseline_map <- setNames(rnorm(nrow(adsl), mean = 65, sd = 10), adsl$USUBJID)

adlb$AVAL <- NA_real_

for (i in seq_len(nrow(adlb))) {
  subj <- adlb$USUBJID[i]
  trt  <- adlb$TRT01A[i]
  visitn <- adlb$AVISITN[i]
  base <- baseline_map[[subj]]

  if (visitn == 0) {
    adlb$AVAL[i] <- round(base, 1)
  } else {
    treatment_effect <- ifelse(trt == "Drug A", -1.5 * (visitn / 4), -0.3 * (visitn / 4))
    adlb$AVAL[i] <- round(base + treatment_effect + rnorm(1, 0, 2), 1)
  }
}

baseline_values <- adlb[adlb$AVISITN == 0, c("USUBJID", "AVAL")]
names(baseline_values)[2] <- "BASE"

adlb <- merge(adlb, baseline_values, by = "USUBJID")
adlb$CHG <- round(adlb$AVAL - adlb$BASE, 1)

adlb <- adlb[order(adlb$USUBJID, adlb$AVISITN), ]

write.csv(adlb, "data/adlb_mock.csv", row.names = FALSE)

message("Created data/adlb_mock.csv")
