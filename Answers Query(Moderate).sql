-- Q1) Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--      Return your list ordered alphabetically by email starting with A

SELECT first_name, last_name, email 
From customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
where track_id IN(
	 Select track_id From Track
	 Join genre ON track.genre_id = genre.genre_id
	 where genre.name LIKE 'Rock'
)
ORDER by email;

-- Q2) Let's invite the artists who have written the most rock music in our dataset. 
--     Write a query that returns the Artist name and total track count of the top 10 rock bands.
Select artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
Where genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10

-- Q3) Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. 
--     Order by the song length with the longest songs listed first.

SELECT name, milliseconds
from track
Where milliseconds > (
	Select AVG(milliseconds) as avg_song_length
	from track
)
Order By milliseconds desc;
