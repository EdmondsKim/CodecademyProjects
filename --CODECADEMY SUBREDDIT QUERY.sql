--CODECADEMY SUBREDDIT QUERY
--Looking at all 3 tables
SELECT *
FROM users
LIMIT 10;
SELECT *
FROM posts
LIMIT 10;
SELECT *
FROM subreddits
LIMIT 10;

--How many subreddits are there?
SELECT COUNT(id)
FROM subreddits;

--Which user has the post with the highest 'score'?
SELECT user_id, MAX(score)
FROM posts;

SELECT id, MAX(score)
FROM posts;

--Which subreddit has the most subscribers?
SELECT name, subscriber_count
FROM subreddits
ORDER BY 2 desc
LIMIT 5;

--How many posts have these users made?
SELECT users.username, COUNT(posts.id) AS NumberOfPosts
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.username
ORDER BY NumberOfPosts DESC;

--Looking at posts where the user did not delete their acount
SELECT posts.id, users.username, posts.created_date
FROM posts
INNER JOIN users
ON posts.user_id = users.id
WHERE username IS NOT NULL
ORDER BY created_date ASC;

--Looking at original database and new database
SELECT *
FROM posts
WHERE created_date IS NOT NULL
UNION
SELECT *
FROM posts2
WHERE created_date IS NOT NULL
ORDER BY 6 ASC;

--Which subreddits have the most popular posts (>5000)?
WITH popular_posts AS(
  SELECT *
  FROM posts
  WHERE score >= 5000
)
SELECT name, title, score
FROM subreddits
INNER JOIN popular_posts
ON subreddits. = popular_posts
ORDER BY score DESC;

--What is the highest scoring post from each subreddit?
SELECT subreddits.name, MAX(posts.score) AS HighestScore
FROM posts
INNER JOIN subreddits
ON posts.subreddit_id = subreddits.id
GROUP BY subreddits.name
ORDER BY 2 DESC;

--What is the average score of all posts from each subreddit?
SELECT subreddits.name, ROUND(AVG(posts.score)) AS AvgScore
FROM subreddits
JOIN posts
ON subreddits.id = posts.subreddit_id
GROUP BY subreddits.name
ORDER BY AvgScore DESC;