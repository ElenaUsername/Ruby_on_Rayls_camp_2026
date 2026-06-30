Create a parser with three option
--search                    for the keyword in gem list
--show                      the information of the gem
--licence                   filter search result based on the licence
--most-downloads-first      filter search result based on the most downloads

Precondition:
Verify that the arguments are acordingly
Used RUBYGEMS_API_KEY
Catche memory is saved for 2 days 

Show option: 
the user should provide a gem name to show the information of the gem
verify that the gem name is valid and exists in the gem list

Search option: 
the user should provide a keyword to search for gems
the program should return a list of gems that match the keyword

Search option filter by licence:
Will filter the search result based on licence that you will introduce

Search option filter by most downloaded:
Will arange the result based on the most downloaded

example of usage:
--show rails
--search rails
--search rails --licence MIT
--search rails --most-downloads-first 