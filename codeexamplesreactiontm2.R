AravindLikeReactionTime$subject_sum <- rowSums(AravindLikeReactionTime[, paste0("subj_", 1:8)])
AravindLikeReactionTime$object_sum <- rowSums(AravindLikeReactionTime[, paste0("obj_", 1:8)])

AravindLikeReactionTime$congruent_sum <- rowSums(AravindLikeReactionTime[, paste0("subj_", 1:8)])
AravindLikeReactionTime$incongruent_sum <- rowSums(AravindLikeReactionTime[, paste0("obj_", 1:8)])

AravindLikeReactionTime$condition <- ifelse(AravindLikeReactionTime$par_num >= 5 & AravindLikeReactionTime$par_num <= 26, "subject", "object")


shapiro_test_subject_sum <- shapiro.test(AravindLikeReactionTime$subject_sum)
print(shapiro_test_subject_sum)


shapiro_test_object_sum <- shapiro.test(AravindLikeReactionTime$object_sum)
print(shapiro_test_object_sum)

shapiro_test_congruent_sum <- shapiro.test(AravindLikeReactionTime$congruent_sum)
print(shapiro_test_congruent_sum)

shapiro_test_incongruent_sum <- shapiro.test(AravindLikeReactionTime$incongruent_sum)
print(shapiro_test_incongruent_sum)



anova_result <- aov(cbind(subject_sum, object_sum, congruent_sum, incongruent_sum) ~ condition, data = AravindLikeReactionTime)


summary(anova_result)

#t_tests

subject_sum_subject <- subset(AravindLikeReactionTime, condition == "subject")$subject_sum
subject_sum_object <- subset(AravindLikeReactionTime, condition == "object")$subject_sum

independent_ttest_subject_sum <- t.test(subject_sum_subject, subject_sum_object)

print(independent_ttest_subject_sum)



object_sum_subject <- subset(AravindLikeReactionTime, condition == "subject")$object_sum
object_sum_object <- subset(AravindLikeReactionTime, condition == "object")$object_sum

independent_ttest_object_sum <- t.test(object_sum_subject, object_sum_object)
print(independent_ttest_object_sum)

wilcox_test_subject_sum <- wilcox.test(subject_sum_subject, subject_sum_object)

print(wilcox_test_subject_sum)

wilcox_test_object_sum <- wilcox.test(object_sum_subject, object_sum_object)



#desc
summary(AravindLikeReactionTime[c("subject_sum", "object_sum", "congruent_sum", "incongruent_sum")])


