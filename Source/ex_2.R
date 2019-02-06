

sports.df$income = with(sports.df, 
                        ifelse(income == "5 000$", "< 5 000$", income))

sports.df$partner = 
  with(sports.df,
       ifelse(partner == "NAP (married and living w legal spouse, Code 1 in MARITAL)", "Yes",
              ifelse(partner == "NA,refused", NA, partner)))

sports.df$ethnicity =
  with(sports.df, 
       ifelse(ethnicity == "China,Cantonese,Hakka,Mandarin", "Asian", 
              ifelse(ethnicity == "Europe,White/European", "Euro", 
                     ifelse(ethnicity == "India,Hindi,Urdu,Gujarati,Tamil", "Asian", 
                            ifelse(ethnicity == "Maori+New Zealand", "Maori", 
                                   ifelse(ethnicity == "NA, dont know", NA,
                                          ifelse(ethnicity == "Other,mixed origin", "Other",
                                                 "Pacific")))))))
