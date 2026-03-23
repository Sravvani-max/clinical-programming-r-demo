# Create simple TLF-style summary outputs

if (!file.exists("data/adsl_mock.csv") || !file.exists("data/adlb_mock.csv")) {
  stop("Required mock datasets not found. Run prior scripts first.")
}

adsl <- read.csv("data/adsl_mock.csv", stringsAsFactors = FALSE)
adlb <- read.csv("data/adlb_mock.csv", stringsAsFactors = FALSE)

if (!dir.exists("output")) dir.create("output", recursive = TRUE)

# Table 1: Demographics summary by treatment
summary_by_trt <- aggregate(AGE ~ TRT01A, data = adsl, function(x) {
  c(N = length(x), Mean = round(mean(x), 1), SD = round(sd(x), 1),
    Min = min(x), Max = max(x))
})

table_01 <- data.frame(
  TRT01A = summary_by_trt$TRT01A,
  N = sapply(summary_by_trt$AGE, function(x) x[1]),
  AGE_MEAN = sapply(summary_by_trt$AGE, function(x) x[2]),
  AGE_SD = sapply(summary_by_trt$AGE, function(x) x[3]),
  AGE_MIN = sapply(summary_by_trt$AGE, function(x) x[4]),
  AGE_MAX = sapply(summary_by_trt$AGE, function(x) x[5])
)

write.csv(table_01, "output/table_01_demographics.csv", row.names = FALSE)

# Table 2: Mean change from baseline by treatment and visit (post-baseline)
post_base <- subset(adlb, AVISITN > 0)
summary_chg <- aggregate(CHG ~ TRT01A + AVISIT + AVISITN, data = post_base, function(x) {
  c(N = length(x), Mean = round(mean(x), 2), SD = round(sd(x), 2))
})

table_02 <- data.frame(
  TRT01A = summary_chg$TRT01A,
  AVISIT = summary_chg$AVISIT,
  AVISITN = summary_chg$AVISITN,
  N = sapply(summary_chg$CHG, function(x) x[1]),
  CHG_MEAN = sapply(summary_chg$CHG, function(x) x[2]),
  CHG_SD = sapply(summary_chg$CHG, function(x) x[3])
)

table_02 <- table_02[order(table_02$AVISITN, table_02$TRT01A), ]

write.csv(table_02, "output/table_02_change_from_baseline.csv", row.names = FALSE)

message("Created output/table_01_demographics.csv")
message("Created output/table_02_change_from_baseline.csv")
