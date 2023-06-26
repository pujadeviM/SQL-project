--SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.
select * from  Actor where act_id in (select act_id from Movie_Cast 
where mov_id in (select mov_id from Movie where mov_title='Annie Hall'));

--SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. Return director first name, last name
select dir_fname,dir_lname from director 
where dir_id in (select dir_id from movie_direction where  mov_id in (select mov_id from Movie where 
	mov_title= 'Eyes Wide Shut'));

--find for movies whose reviewer is unknown.Return movie title,year,release date, director first name, last name, actor first name, last name.
SELECT mov_title, mov_year, format(mov_dt_rel,'yyyy-MM-dd') as MovieReleaseDate, dir_fname, dir_lname,act_fname, act_lname
FROM movie a, movie_direction b, director c, rating d, reviewer e, actor f, movie_cast g
WHERE a.mov_id=b.mov_id  and  b.dir_id=c.dir_id  and a.mov_id=d.mov_id   and  d.rev_id=e.rev_id 
and  a.mov_id=g.mov_id   and g.act_id=f.act_id 	 and e.rev_name is null;

--SQL query to find those movies directed by the director whose first name is Woody and last name is Allen. Return movie title
SELECT mov_title from Movie 
where mov_id in (select mov_id from movie_direction where dir_id in
	(select dir_id from director where  dir_fname='Woody' and dir_lname='Allen'))

--SQL query to determine those years in which there was at least one movie that received a rating of at least three stars. 
--Sort the result-set in ascending order by movie year. Return movie year
select distinct mov_year from Movie 
where mov_id in (select mov_id from rating where rev_stars > 3) 
order by mov_year;

--SQL query to search for movies that do not have any ratings. Return movie title.     
select distinct mov_title  from movie  
where mov_id IN ( select mov_id  FROM movie  where mov_id NOT IN (select mov_id FROM Rating));

--SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.or Find the names of all reviewers who have ratings with a NULL value
select rev_name from Reviewer 
where rev_id in (Select rev_id from Rating where rev_stars is null )

--SQL query to find movies that have been reviewed by a reviewer and received a rating. Sort the result-set in ascending order by
--reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.
select mov_title, rev_name, rev_stars  from  Rating r ,Reviewer v,Movie m 
where v.rev_id =r.rev_id  and m.mov_id=r.mov_id  
and v.rev_name is not null 
And  r.rev_stars  is not null 
order by v.rev_name,m.mov_title,r.rev_stars ;

--SQL query to find those movies, which have received highest number of stars. Group the result set on movie title and sorts the result-set in
--ascending order by movie title. Return movie title and maximum number of review stars.
select mov_title , max(rev_stars) as Max_RAting from Movie m ,Rating r  
where m.mov_id=r.mov_id and r.rev_stars is not null
group by mov_title 
order by mov_title;   

--SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.
select rev_name from Reviewer
where rev_id in(select rev_id from Rating where mov_id in(select mov_id from Movie where mov_title ='American Beauty'));
--or
select rev_name from Reviewer v,Rating r , Movie m 
where m.mov_id=r.mov_id  and  v.rev_id= r.rev_id  and m.mov_title ='American Beauty';

--SQL query to find the movies that have not been reviewed by any reviewer body other than 'Paul Monks'. Return movie title.
select mov_title from Movie 
where mov_id in(select  mov_id from Rating where rev_id not in (select rev_id from Reviewer where rev_name ='Paul Monks'));

--SQL query to find the movies with the lowest ratings. Return reviewer name, movie title, and number of stars for those movies.
select mov_title, rev_name, [rev_stars ]  from  Rating r ,Reviewer v,Movie m 
where r.rev_stars in ( select min(rev_stars) from Rating) 
and m.mov_id=r.mov_id and r.rev_id=v.rev_id ;

 --SQL query to find the movies directed by 'James Cameron'. Return movie title.   
select mov_title from Movie where mov_id in(select mov_id from Movie_Direction
where dir_id in (select dir_id from Director where dir_fname='James' and dir_lname = 'Cameron'));
 
--SQL to find the movies in which one or more actors appeared in more than one film.Return  movie title and mov_id
select mov_id,mov_title from Movie 
where mov_id in( select mov_id from Movie_Cast where act_id in (select act_id from Actor
	where act_id in ( select act_id from Movie_Cast group by act_id having count(act_id)>1)));



