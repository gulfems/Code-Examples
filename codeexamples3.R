
aravindlastdata$subj_percent = (aravindlastdata$sub_cong / 8) * 100
aravindlastdata$obj_percent = (aravindlastdata$obj_cong / 8) * 100
wilcox.test(aravindlastdata$percent_subject_correct, aravindlastdata$percent_object_correct, paired = TRUE)

wilcox.test(aravindlastdata$sub_cong, aravindlastdata$obj_cong, paired = TRUE)

kruskal.test(percent_subject_correct ~ age, data = aravindlastdata)
kruskal.test(percent_object_correct ~ age, data = aravindlastdata),
,

wilcox.test(percent_subject_correct ~ gen, data = aravindlastdata)
wilcox.test(percent_object_correct ~ gen, data = aravindlastdata)

