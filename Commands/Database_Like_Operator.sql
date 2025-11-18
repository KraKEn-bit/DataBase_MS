#### Like: (used to search for a pattern inside text, not an exact match)
## % → matches any number of characters
## _ → matches exactly one character


#| Pattern  | Meaning                                                |
#| -------- | ------------------------------------------------------ |
#| `'A%'`   | Starts with A (e.g., **Arafat, Ali, Ahmed**)           |
#| `'%A'`   | Ends with A (e.g., **Mina, Liza**)                     |
#| `'%an%'` | Contains "an" anywhere (e.g., **Rana, Tanvir, Anika**) |
#| `'__a%'` | Third letter is 'a'                                    |


use sakila;
select * from film
where title like "A%"; # starts with 'A'


select * from film 
where title like "%A"; # ends with 'A'


select * from film
where title like "%LE%"; # contains "LE" anywhere


select * from film
where title like '___a%'; # third letter is 'a'


select * from film
where special_features like "Behind the Scenes"; # Filters out 


select * from film 
where description like "%Epic%"; # Filtering out


select * from actor
where last_name like "%__a"; # It means there should be 2 character text that ends with 'a' within the word 


select * from actor
where last_name like "____a%" # It means there should be 4 character text that starts with 'a' within the word 
