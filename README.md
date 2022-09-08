# Excelsior-Mobile-Report
You are recently hired by Excelsior Mobile to be their new business analyst.
Excelsior Mobile is a very small mobile company and is looking to expand so they want you to run some analysis on their customer database 
and figure out where they should put their marketing efforts and some other important analytical questions.


PROJECT INSTRUCTIONS

The Report Questions (without Visualizations)
For the following questions, you do not need to create visualizations but rather it will be about answering questions based on the query results. Please copy the table into the sheet for the question section (so 1 is one sheet. 2 is another sheet with A, B and C on it). To the right of the table, do analysis on the table and answer the question posed by the question. The answer may be obvious and you are encouraged to analyze it anyway, providing recommendations on how to use the data. Be creative! You still need to have these SQL queries in the SQL file. This must be done in Excel.

Marketing asked where we should be focusing our new marketing at. We have decided that we want to put our efforts increasing our customer base in cities we currently have customers in instead of marketing in cities we have no customers in. Let's figure out which three cities we should point our markets to. (Hint: we should  be marketing to cities we have the least number of customers in. Be careful and keep this in mind when answering the three queries below.)
(A) First though, I want to know which two cities we have the most customers in.
(B) Then show me which cities we should increase our marketing in.
(C) Finally, show us which plan (only one) we should market the most based on the number of people who have them (independent of which city they live in).

Next we want some information on the actual devices our customers use.
(A) Show us the count of cell phone types among our customers. What type do most of our customers use?
(B) Show us which customers (first and last name) use the phone type that is least used by our customers so we can send them a promotion for their friends and family.  You can use the answer from 2A in this query.
(C) Finally, show us our customers and the year of their phones who have phones released before 2018?

Now we are trying to figure out if our customers are using our data plans efficiently. We have Unlimited plans that throttle the data at specific limits and then there are plans for caps on data usage. We want to know ultimately if there is a city that uses a lot of data (within the top 3 data using cities) but none of our customers in that city are using the Unlimited Plans. If there is a city like that, which one is it? Please only use query to complete this.

(How you do this is up to you. I was able to do it using two queries and then compared the two visually. That is fine. Someone may be brilliant enough to do it in one query and that is awesome. Please indicate each query you use with a letter, such as the  first will be A and so on. The answer should be included both in the Excel file and here in the SQL file. If you just give me the answer without queries of how you got there, you will get zero points.)

Our financial department has requested a few items of information.
(A) They wish to know the first and last name of the customer who has the most expensive bill every month.
(B) They also want to know which mobile plan delivers the highest total bill each month.

Finally, we want to get some information on minutes usage.
(A) Please tell us which area code (only the area code) uses the most minutes, return the minutes also.
(B) Lastly, Which cities do we see the biggest difference in terms of minutes usage? In other words, which cities have the biggest difference between the customers who use smallest amount of minutes to customers that use the largest. Use the difference of customers who use less than 200 and customers who use more than 700 minutes.
