SELECT users.first_name, users.last_name, friends.first_name, friends.last_name  FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users as friends ON friendships.friend_id  = friends.id;

/*Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.*/

SELECT users.first_name, users.last_name  FROM users 
JOIN friendships ON users.id = friendships.user_id 
WHERE friendships.friend_id = 4;

/*Devuelve el recuento de todas las amistades.*/

SELECT COUNT(id) AS friendships FROM friendships;

/*Descubre quién tiene más amigos y devuelve el recuento de sus amigos.*/

SELECT users.first_name, users.last_name, COUNT(users.id) AS friendships  FROM users 
JOIN friendships ON users.id = friendships.user_id 
GROUP BY users.first_name, users.last_name;

/*Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.*/

INSERT INTO users (first_name, last_name) VALUES ('Nixi', 'Muñoz');

INSERT INTO friendships (user_id, friend_id) VALUES ('6', '4');
INSERT INTO friendships (user_id, friend_id) VALUES ('6', '5');


/*Devuelve a los amigos de Eli en orden alfabético.*/

SELECT CONCAT(users.first_name,' ', users.last_name) AS user, 
	CONCAT(friends.first_name,' ', friends.last_name) AS friend  
FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id  = friends.id
WHERE users.id = 2
ORDER BY CONCAT(friends.first_name,' ', friends.last_name);


/*Eliminar a Marky Mark de los amigos de Eli.*/

DELETE FROM friendships WHERE user_id = 2 AND friend_id = 5;

/*Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos*/

SELECT users.first_name, 
		users.last_name, 
        friends.first_name, 
        friends.last_name  
FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id  = friends.id;

