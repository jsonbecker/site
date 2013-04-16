# Mobility

01 IF MORE THAN ONE SCHOOL
02    CHECK DIFFERENCE BETWEEN SCHOOL 2 ENTRANCE AND SCHOOL 1 EXIT < 14
03    & SCHOOL 1 = SCHOOL 2
04      IF TRUE THEN REMOVE SCHOOL 2, return to 01
05      ELSE IF DIFFERENCE < 14
06        MOVES++, return to 01
07      ELSE
08        MOVES = MOVES + 2, return to 01
09 IF FIRST SCHOOL ENTRANCE AFTER 9/15
10    MOVES ++
11 IF LAST SCHOOL EXIT BEFORE 6/1
12    MOVES ++


df <- data.frame(sasid = c(1:10), enroll_date=c(rep(as.Date('2005-08-24'), 7),
                                                seq(as.Date('2005-11-12'),
                                                    by='months', length.out=3)))
df <- mutate(df, exit_date = enroll_date + c(rep(300, 4), 150, 35, 100, 
                                             102, 190, 160))
df <- rbind(df, data.frame(sasid = c(6, 7, 8, 8), 
                          enroll_date = c(df$exit_date[6] + 10,
                                          df$exit_date[7] + 50, 
                                          df$exit_date[8] + 30,
                                          df$exit_date[8] + 85),
                          exit_date = c(rep(as.Date('2006-06-20'), 2),
                                        df$exit_date[8]+ 60,
                                        as.Date('2006-06-20'))))
df <- arrange(df, sasid)
df$schno <- c(seq(1,4), rep(1, 3), 2, 3, 3, 2, 4, 1, 1)


mobility_calc <- function(df){
  require(plyr)
  require(data.table)
  if (!inherits(df$enroll_date, "Date") | !inherits(df$exit_date, "Date"))
    stop("Both enroll_date and exit_date must be Date objects")
  dt <- data.table(df, key=c('sasid', 'enroll_date', 'exit_date'))
  dt$moves <- 0
  for(i in 1:(length(dt$sasid)-1)){
    # Because rows are removed in the control flow, the for loop can extend
    # out of bounds. This check leads to a break out of the for loop when the
    # true bound is met, which is dynamically determined based on the conditions
    # within the loop.
    if(i>=length(dt$sasid-1)){
      break
    }
    if(dt[['sasid']][i]==dt[['sasid']][i+1]){
      if(difftime(dt[['enroll_date']][i+1], 
                  dt[['exit_date']][i], units='days')<14 &
         dt[['schno']][i+1]==dt[['schno']][i]){
        
          dt[['exit_date']][i] <- dt[['exit_date']][i+1]
          dt <- dt[-(i+1),]
      }else if(difftime(dt[['enroll_date']][i+1], 
                        dt[['exit_date']][i], units='days')<14){
        dt[['moves']][i] <- dt[['moves']][i] + 1
      }else{
        dt[['moves']][i] <- dt[['moves']][i] + 2
      }
    }
  }
  min <- dt[, .SD[which.min(enroll_date)], by=sasid]
  max <- dt[, .SD[which.max(exit_date)], by=sasid]
  min[, moves:= ifelse(min$enroll_date > paste(year(min$enroll_date),
                                              '-09-15', sep=''),
                       1,0)]
  max[, moves:= ifelse(max$exit_date < paste(year(max$exit_date),
                                              '-06-15', sep=''),
                       1,0)]
  dt
}
  dt_complex <- subset(dt, sasid %in% subset(dt[,length(schno)>1, by=sasid], 
                                             V1>1)$sasid)
  

  if(length(dt$schno)>1){
    for(i in 1:length(df$schno)-1){
      ifelse(datediff(df$exit[i], df$exit[i+1])<14 & , 
    }
  }
}

ddply(enrollment, .(sasid schoolyear),)