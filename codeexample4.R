
aravindlastdata <- aravindlastdata %>%
  rowwise() %>%
  mutate(sum_all_variable = sum(c_across(c(sub_1,sub_2,sub_3,sub_4,sub_5,sub_6,sub_7,sub_8,obj_1,obj_2,obj_3,obj_4,obj_5,obj_6,obj_7,obj_8)), na.rm = TRUE)) %>%
  ungroup()           
View(sum_all_variable)


for(level in c("subject", "object")) {
  subset_df <- aravindlastdata[aravindlastdata$cond == level, ]

  cat("Normality test for level:", level, "\n")
  

  shapiro_result <- shapiro.test(subset_df$sum_all_variable)
  print(shapiro_result)


subject_indices <- 4:11
object_indices <- 12:19


aravindlastdata$percent_subject_correct <- rowSums(aravindlastdata[, subject_indices]) / length(subject_indices) * 100


aravindlastdata$percent_object_correct <- rowSums(aravindlastdata[, object_indices]) / length(object_indices) * 100

wilcox.test(sum_all_variable ~ cond, data = aravindlastdata)

friedman.test(
  cbind(aravindlastdata$subj_incong, aravindlastdata$sub_cong)
)

krus



