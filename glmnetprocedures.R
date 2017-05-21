# Project 2 glmnet procedure
library(glmnet)

# Low-Income Owners in NJ
owner_NJ <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/ownerNJ.csv")
Affordability <- owner_NJ$Aff 
names(owner_NJ)
owner_NJ <- owner_NJ[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_NJ),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_NJ),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Low-Income Rentals in NJ
rental_NJ <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/rentalNJ.csv")
Affordability <- rental_NJ$Aff 
names(rental_NJ)
rental_NJ <- rental_NJ[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_NJ),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_NJ),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Owners in NJ
owner_NJ_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/ownerNJ_superlow.csv")
Affordability <- owner_NJ_superlow$Aff 
names(owner_NJ_superlow)
owner_NJ_superlow <- owner_NJ_superlow[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_NJ_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_NJ_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Renters in NJ
rental_NJ_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/rentalNJ_superlow.csv")
Affordability <- rental_NJ_superlow$Aff 
names(rental_NJ_superlow)
rental_NJ_superlow <- rental_NJ_superlow[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_NJ_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_NJ_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Low Income Homeowners in MD
owner_MD <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/ownerMD.csv")
Affordability <- owner_MD$Aff 
names(owner_MD)
owner_MD <- owner_MD[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_MD),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_MD),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Low-Income Rentals in MD
rental_MD <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/rentalMD.csv")
Affordability <- rental_MD$Aff 
names(rental_MD)
rental_MD <- rental_MD[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_MD),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_MD),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Owners in MD
owner_MD_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/ownerMD_superlow.csv")
Affordability <- owner_MD_superlow$Aff 
names(owner_MD_superlow)
owner_MD_superlow <- owner_MD_superlow[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_MD_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_MD_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Renters in MD
rental_MD_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/rentalMD_superlow.csv")
Affordability <- rental_MD_superlow$Aff 
names(rental_MD_superlow)
rental_MD_superlow <- rental_MD_superlow[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_MD_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_MD_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Low-Income Owners in WV
owner_WV <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/ownerWV.csv")
Affordability <- owner_WV$Aff 
names(owner_WV)
owner_WV <- owner_WV[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_WV),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_WV),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Low-Income Rentals in WV
rental_WV <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/rentalWV.csv")
Affordability <- rental_WV$Aff 
names(rental_WV)
rental_WV <- rental_WV[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_WV),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_WV),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Owners in WV
owner_WV_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/ownerWV_superlow.csv")
Affordability <- owner_WV_superlow$Aff 
names(owner_WV_superlow)
owner_WV_superlow <- owner_WV_superlow[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_WV_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_WV_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Renters in WV
rental_WV_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/Project_2/rentalWV_superlow.csv")
Affordability <- rental_WV_superlow$Aff 
names(rental_WV_superlow)
rental_WV_superlow <- rental_WV_superlow[,-c(1:3,5:7,9:15,20:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_WV_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_WV_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

#EC
# Low-Income Owners in WV
owner_WV <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/EC/ownerWV.csv")
Affordability <- owner_WV$Aff 
names(owner_WV)
owner_WV <- owner_WV[,-c(1:3,5:7,9:11,16:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_WV),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_WV),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Low-Income Rentals in WV
rental_WV <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/EC/rentalWV.csv")
Affordability <- rental_WV$Aff 
names(rental_WV)
rental_WV <- rental_WV[,-c(1:3,5:7,9:11,16:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_WV),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_WV),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Owners in WV
owner_WV_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/EC/ownerWV_superlow.csv")
Affordability <- owner_WV_superlow$Aff 
names(owner_WV_superlow)
owner_WV_superlow <- owner_WV_superlow[,-c(1:3,5:7,9:11,16:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(owner_WV_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(owner_WV_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta

# Super Low-Income Renters in WV
rental_WV_superlow <- read.csv("C:/Users/Owner/Documents/Grad School/MS Statistics/Fall 2016/Interpretation of Data I/Project 2/EC/rentalWV_superlow.csv")
Affordability <- rental_WV_superlow$Aff 
names(rental_WV_superlow)
rental_WV_superlow <- rental_WV_superlow[,-c(1:3,5:7,9:11,16:26,29:38)]
set.seed(92781)
hcv = cv.glmnet(as.matrix(rental_WV_superlow),Affordability,alpha=0.8,family="binomial")
b = glmnet(as.matrix(rental_WV_superlow),Affordability,alpha=0.8,lambda=hcv$lambda.1se)
b$beta