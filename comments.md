# Notes on Geospatial Lesson from Workshop at UMB
## 2019-01-22 and 23

From @jebyrnes, @DrK-Lo, and @KlausVigo

## General:
- Can the R general stuff be integrated more into the geospatial teaching? So, get through the basics of how to use R, and then move into rasters. Introduce ggplot, dplyr, subsetting, etc as a part of working with rasters. Or sf objects instead of data frames, and then end with rasters? Basicaly, we thought tighter integration would make this an overall better workshop, and our learners agreed. SO, intro to R would only really go through lesson 3, but in lesson 3, we would include loading both sf and raster objects as two data types.

- Can we move the intro to geospatial to after the intro to R, if they are both going to remain.

- Each geospatial lesson takes 1 hour, not 30 minutes. If we get through lesson 10, we are lucky.

## Intro to Geospatial
- Slides should be provided - easy with RMarkdown. Maybe move code chunks into .R files, and use those chunks to generate imagery for slides? Would promote tighter integration.

## Intro to R
- To what extent are all of the rbind, cbind, etc., stuff in Exploring Data Frames necessary?
- The R piece is too long - is it all needed? Should we just do dplyr for subsetting/manipulations, and use that and tidyr throughout? Might be worth having a few people sit down and really think about what is versus is not needed to get to the geospatial bit
- Way too much time spent on data frames in detail rather than moving on to rasters.
- Dplyr section too long? Do they need to know more than filter? And I say this loving dplyr.


## Raster Lessons
- Why use capture output when you can save output of GDALinfo into an object if you need it?
- Intro lesson took 1 hour
- Cut out multiband bit from lesson 1. Confusing. We dropped it, and moved the material to the multiband lesson
- The Find Bad Values bit in lesson 1 seems orphaned, and can be cut
- Challenge at end of the plot raster data lesson has **so** many parts. It's enormous.
- Cut publication quality graphics episode unless it's folded into a more general ggplot episode?
- Make the ggplot code in the lessons and exercises less detailed, as every line requires more cognitive load
- Maybe even ditch multiband rasters alltogether and/or make it part of temporal rasters at the end?
- Overlay is great, but.... is this the right place to teach about how to write a function?

## One Up, One Downs

I'm including the one up one downs as they say a lot about how our learners preceived the class.
\

### Day 1

**One Up**
++++Shortcuts to make our lives easier.
Everyone helping out was extremely patient with me
i+ntro to R had many clear examples of structure of code. And shortcuts!!!!! Great pace
Nice pace +
+++frendly and helpfull staff
the assistants were really dynamic and helpful - they were invaluable to understanding the lessons
++ Having challenges and making sufre everyone was able to accomplish and understand
+ I appreciated the help from the assistants and patience as they helped me with my learning curve.
Etherpad Superhelpful!+
+having all of the materials and examples organized on the website, allowing me to reference them and follow along ++
highlighting good coding practices++
Great use of practical examples to get an adequate understanding of how to use this on my own outside of the workshop
+Exercises were really helpful! +
organized layout/flow of intro to R and geospatial technical termology  +
Live assistant was the most helpful.  Thanks for being patient w me!!
having downloaded everything prior streamlined the course
+Good pace; and I even learned a few new things
I like the carpentry green and red stickers
good reintroduction to data and file organization, which is especially helpful with spatial data!
good step-wise rundown of pipeline function of dplyr


**One Down**
Pre-workshop practice of basics would make it smoother
Downtime between exercises seems like it was waiting on challenges, when thats in my mind the "reach" goal and time doesn't need to be spent on it
More challenges would be helpful to practice manipulating the commands and troubleshooting errors
Make it more clear that the first day of "geospatial workshop in R" will barely cover any geospatial data in R
A bit confusing on the intro to Rasters
the lecture didn't always follow the online materials so I sometimes got lost going back and forth
+Too fast too much info. Brain fried!  But the frequent break was helpful.
Maybe just use tidyverse from the start
A lot of info in one day
+It was hard to see the screen sometimes, which resulted in the symbols coming across   incorrectly- please make it bigger!
I had a hard time understanding Klaus and following along with the process of building rasters. - being able to see the powerpoint/deck/lesson plan at the same time as R studio would have been beneficial.
++Would be nice to have etherpad-esque feacture with the code
lectures felt slow
+review of what the packages we needed are for? what is sf?  Agreed! It's hard to keep track of what packages do what. is there a helpful list online? (not just for this class but for R in general) Goto this site: https://cran.r-project.org/web/packages/available_packages_by_name.html   or this one: https://support.rstudio.com/hc/en-us/articles/201057987-Quick-list-of-useful-R-packages
very rushed in some parts- that makes me feel skip the things I am doing properly
The last segment of class was difficult to follow and I don't feel like I was able to retain much information.
a little rushed at end. would also like a good source to learn how to keep up with packages. Last segment was hard to follow, but it was also end of the day so that makes it hard.
I was totally lost at the end
i am not really sure what the example raster data means, it is great to be able to polt and code the data, but without the context it is a little abstract
This was a bit too fast pased for me but that could be because I am a beginner and we are only doing a 2 day workshop
I'm not sure if I downloaded everything properly (I guess I'll find that out tomorrow!); so I'm still a bit confused as to what programs/packages we NEED and WHY
little bit more review of R and dplyr than I was expecting (but never bad to get a reminder)  

### Day 2
**One up**
Vectors
  Challenges  +
  I am no longer as intimidated by geospatial analysis in R as I was before; I feel like I can do it now
 Positive environment for learning!   +  ++++
    The vector examples and source code were super helpful, and I will definitely use them in the future+
    the online resources and cheat sheets were a great resource++
Staff help was very helpful Thank you!!      +++++++++
 Laid back atmosphere (instruction without a "classroom" feel that allowed tangents to assist on open questions
goodintro to new packages! ++
vector portion was great!
arithmetic function building for raster datasets will be super helpful for me!
I actually can do R!
patience by all was amazing, teachers and assistant and students!!  thanks to all!
the additional resources and cheatsheets are super good as well.
I enjoyed broader context, noticed that Jarrett often times gave us the "transitional statements" that filled the gap between code
nice pacing of breaks! helped me not feel burnt out

**One down**
Rasters
We sholud have 3 day instead of 2 day so we don't have to hurry so much++++
Too much information to quick- need more on what parts of code actually doing behind the scenes-
would like to see work flow for field collected GPS data into R+++
I feel that seperating the geospatial theory, coding and learning R and then the manipulaiton of data in a different way would be hrelpful - coding and R first --> then geospatial concepts with vector data handling ---> then raster data handling.  this i show the knowledge was presented in Intro. to GIS and I found it to be more cohesive, even having zero background in that case.
Although it may not be the carpentry way, learning R and the geospatial work must be seperated out into different courses or days
more manipulation of raster data+
pacing of the morning section was too fast to be able to do in action - easiest just to follow the notes
did not like repeating the material from the end of the day yesterday - wanted to move on to cover more/new material+
rename the raster files to something simpler and less cumbersome (and easier to follow along)
++++would have loved to have reached time-series stuff +++
the instructors had different styles, which made it hard to follow sometimes (I had a hard time following raster). Not everyone followed livecoding style+
Either extend the workshop to 3 days or shorten the R review from day 1 (so we have more time for geospatial!)


# Comments from sticky notes with number of sticky notes that echoed the same theme:

What was your favorite part of the course?  
13: liked overlaying vector and raster data  
2: versatility of ggplot2  
7: liked R/sf (general appreciation)  
1: quick plotting in R (vs ArcGIS)  
1: liked the reference materials for further self-learning  
\
What one thing would you like to change in this course?  
6: get into spatial materials earlier  
5: 3 day course / adjust balance of base R material vs. spatial material  
4: logistics of time to copy code, files were a bit difficult to read in because of file names, number of files, files nested in folders (clean up provided data)  
2: more general R material  
1: more break points  
1: more geospatial calculations and stats  
1: example of spreadsheet of field collected data brought into R  
1: combine R tutorials into the spatial parts to allow more time to focus one spatial components.  
