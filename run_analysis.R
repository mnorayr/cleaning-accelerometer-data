x_test<-read.table("UCI HAR Dataset/test/X_test.txt")

x_train<-read.table("UCI HAR Dataset/train/X_train.txt")


features<-read.table("UCI HAR Dataset/features.txt")

colnames(x_test)<-features[,2]

colnames(x_train)<-features[,2]

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test)<-c("Subject")

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train)<-c("Subject")

y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

y_train<-read.table("UCI HAR Dataset/train/y_train.txt")


activity_label<-c("WALKING","WALKING_UPSTAIRS","WALKING_DONWSTAIRS","SITTING","STANDING","LAYING")
#####################################################################################
## Naming the activities

yl_test<-data.frame()
for (i in 1:nrow(y_test)){
    yl_test[i,1]<- activity_label[y_test[i,1]]        
}
colnames(yl_test)<-c("Activity")


yl_train<-data.frame()
for (i in 1:nrow(y_train)){
    yl_train[i,1]<- activity_label[y_train[i,1]]        
}
colnames(yl_train)<-c("Activity")

###############################################################################
## binding the data


train<-cbind(x_train,subject_train, yl_train)

test<-cbind(x_test,subject_test,yl_test)

data<-rbind(train,test)

#################################################################################

selrowsmean<-grep("-mean()",colnames(data))
selrowsstd<-grep("-std()",colnames(data))
sel<-c(selrowsmean,selrowsstd,562,563)
datams<-data[,sel]
#############################################################################
library(dplyr)

grp<-group_by(datams,Subject,Activity)

summary<-summarise_each(grp, funs(mean))

#############################################################################

