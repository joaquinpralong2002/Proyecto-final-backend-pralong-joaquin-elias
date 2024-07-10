create database peliculas;

use peliculas;

create table movies (
id_movie int auto_increment,
nombre varchar(50) not null,
descripcion text not null,
genero varchar(50) not null,
calificacion float check(calificacion >= 1 and calificacion <= 5),
año year not null,
estrellas float not null check(estrellas >= 1 and estrellas <= 5),
director int, 
primary key (id_movie)
);


create table directores (
id_director int auto_increment,
nombre varchar(50) not null,
apellido varchar(50) not null,
edad int not null, 
nacionalidad varchar(50) not null,
primary key (id_director)
);

ALTER TABLE movies
ADD CONSTRAINT fk_DirectoresMovies
FOREIGN KEY (director) REFERENCES directores(id_director);

select * from directores;
select * from movies;
--------------------------------------------------------------------------


/* INSERCIONES DE DATOS */

/*Spiderman*/
insert into directores (nombre, apellido, edad, nacionalidad)
values ('Sam', 'Raimi', 64, 'Estados Unidos');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Spider-Man',
 'Al ser mordido por una araña modificada genéticamente, un chico de instituto tímido y estudioso
 adquiere habilidades de araña que al final 
tendrá que usar para luchar contra el mal como un superhéroe tras una tragedia familiar.',
 'Acción, Aventura, Ciencia ficción',
 4.3,
 2002,
 3.8,
 (select id_director from directores where apellido = 'Raimi' and nombre = 'Sam'));


/*El Señor de los Anillos*/
insert into directores (nombre, apellido, edad, nacionalidad)
values ('Peter', 'Jackson', 62, 'Neozelandés');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('El Señor de los Anillos: La Comunidad del Anillo',
 'En este episodio de la trilogía, el joven y tímido hobbit, Frodo Bolsón, 
hereda un anillo. Lejos de ser una simple baratija, se trata del Anillo único, un instrumento de poder que permitiría a Sauron,
 el Señor Oscuro, reinar en la Tierra Media y convertir en esclavos a sus habitantes. Frodo, con la ayuda de una Compañía 
 formada por hobbits, hombres, un mago, un enano y un elfo, tiene la misión de llevar el Anillo viajando por toda la Tierra
 Media hasta el Monte del Destino, lugar donde fue forjado, y destruirlo para siempre. Un tal periplo supone aventurarse 
 muy lejos en Mordor, la tierra del Señor Oscuro, donde se concentra su ejército de orcos maléficos... La Compañía,
 no solo debe combatir las fuerzas externas del mal, sino también las fuerzas internas y la influencia corruptora
 que ejerce el propio anillo. El final de la historia está íntimamente ligado a la suerte de la Compañía.',
 'Aventura, Fantasía', 
 4.5,
 2001,
 4.6,
 (select id_director from directores where apellido = 'Jackson' and nombre = 'Peter'));
 
 
/*El planeta de los simios*/

insert into directores (nombre, apellido, edad, nacionalidad)
values ('Wes', 'Ball', 43, 'Norteamericano');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('El reino del planeta de los simios',
 'Muchos años después del reinado de César, un nuevo y tiránico líder simio construye su imperio. 
 Por su parte, un joven simio emprenderá un complicado viaje que lo llevará a cuestionar todo lo que le habían enseñado 
 sobre el pasado. En su aventura, tendrá que tomar decisiones que definirán el futuro tanto para los simios como para los humanos.',
 'Aventura, Accion, Ciencia ficción', 
 3.7,
 2024,
 3.0,
 (select id_director from directores where apellido = 'Ball' and nombre = 'Wes'));
 
 /*Deadpool*/
 
 insert into directores (nombre, apellido, edad, nacionalidad)
values ('Tim', 'Miller', 54, 'Norteamericano');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Deadpool',
 'Basado en el anti-héroe menos convencional de Marvel Cómics, Deadpool narra el origen de este ex-agente de las fuerzas especiales, 
 reconvertido en mercenario, que tras pasar por un cruel experimento adquiere poderes sobrenaturales de curación y 
 otras sorprendentes cualidades. Armado con sus nuevas habilidades, y un oscuro y retorcido sentido del humor, 
 Deadpool intentará dar caza al hombre que casi destruye su vida.',
 'Acción, Comedia',
 4.2,
 2016,
 3.9,
 (select id_director from directores where apellido = 'Miller' and nombre = 'Tim'));
 
 /*El padrino*/
 
  insert into directores (nombre, apellido, edad, nacionalidad)
values ('Francis', 'Ford Coppola', 85, 'Norteamericano');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('El padrino',
 'En el verano de 1945, se celebra la boda de Connie y Carlo Rizzi. 
 Connie es la única hija de Don Vito Corleone, 
 jefe de una de las familias que ejercen el mando de la Cosa Nostra en la ciudad de Nueva York. 
 Don Vito además tiene otros tres hijos: su primogénito Sonny, 
 el endeble Fredo y el más joven de todos, Michael, 
 un marine condecorado por su lucha en la Segunda Guerra Mundial que acaba de regresar a su hogar en Nueva York.
 Por designios de la fortuna, Michael terminará llevando la vida que no deseaba,
 tomando las riendas del negocio familiar, cambiando su moral y sus valores, para defender a toda costa a su familia.',
 'Crimen, Drama',
 4.7,
 1972,
 4.8,
 (select id_director from directores where apellido = 'Ford Coppola' and nombre = 'Francis'));
 
 /*Joker*/
 
 insert into directores (nombre, apellido, edad, nacionalidad)
values ('Todd', 'Phillips', 53, 'Norteamericano');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Joker',
 'La historia sigue de cerca la vida de Arthur Fleck, 
 un hombre con problemas psiquiátricos que vivirá una serie de acontecimientos
 que le harán convertirse en uno de los grandes villanos de DC Comics.',
 'Drama',
 4.4,
 2019,
 3.9,
 (select id_director from directores where apellido = 'Phillips' and nombre = 'Todd'));


/*El renacido*/

 insert into directores (nombre, apellido, edad, nacionalidad)
values ('Alejandro', 'González Iñárritu', 60, 'Mejicano');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('El renacido',
 'Hugh Glass, un trampero y explorador de finales del siglo XIX resulta herido de muerte por el ataque de un oso. 
 Sus compañeros deciden dejarle para proseguir con la expedición.
 Glass deberá enfrentarse a un territorio hostil para poder vengarse de quienes lo abandonaron a su suerte, 
 especialmente de la traición llevada a cabo por quien consideraba su fiel confidente.',
 'Aventura, Western',
 4.1,
 2016,
 4.2,
 (select id_director from directores where apellido = 'González Iñárritu' and nombre = 'Alejandro'));


/*Bad boys*/

 insert into directores (nombre, apellido, edad, nacionalidad)
values ('Michael', 'Bay', 59, 'Norteamericano');


insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Bad Boys',
 'Dos policías de Miami tienen 72 horas para encontrar 100 millones de dólares en heroína robada 
 del almacén de evidencias de su comisaría, pero, para lograrlo, deben intercambiar sus identidades.',
 'Acción, Comedia, Crimen',
 3.9,
 1995,
 2.5,
 (select id_director from directores where apellido = 'Bay' and nombre = 'Michael'));
 
 /*X-men*/
 
  insert into directores (nombre, apellido, edad, nacionalidad)
values ('Matthew', 'Vaughn', 53, 'Británico');

insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('X-Men: Primera generación',
 'A principios de los años 60, Charles y Erik, dos jóvenes de grandes habilidades y orígenes distintos, 
 se hacen grandes amigos y se unen para proteger al mundo de una guerra nuclear.',
 'Acción, Ciencia ficción',
 4.0,
 2011,
 3.5,
 (select id_director from directores where apellido = 'Vaughn' and nombre = 'Matthew'));


/*Jumanji*/

  insert into directores (nombre, apellido, edad, nacionalidad)
values ('Joe', 'Johnston', 74, 'Norteamericano');


insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Jumanji',
 'Alan Parris queda atrapado en un juego de mesa mágico y muy antiguo llamado Jumanji. 
 Nadie cree a su compañera de juego cuando cuenta lo ocurrido. Veinticinco años más tarde, 
 es liberado por dos niños, pero una manada de animales exóticos queda también en libertad.',
 'Aventura, Fantasía',
 4.1,
 1996,
 3.5,
 (select id_director from directores where apellido = 'Johnston' and nombre = 'Joe'));
 
 
 /*Mi villano favorito*/
 
   insert into directores (nombre, apellido, edad, nacionalidad)
values ('Chris', 'Renaud', 57, 'Norteamericano');

 
 insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Gru, mi villano favorito',
 'Mientras intenta cumplir su diabólico plan para robarse a la luna, el acto criminal más increíble de la Historia, 
 un supervillano enfrenta su reto más grande, tres pequeñas huérfanas que desean convertirlo en su papá. 
 La visión de este supervillano, y de sus secuaces, irá cambiando poco a poco gracias a esas tres pequeñas que llegarán a su corazón.',
 'Animación',
 4.2,
 2010,
 3,
 (select id_director from directores where apellido = 'Renaud' and nombre = 'Chris'));
 
 
 /*Forrest Gump*/
 
    insert into directores (nombre, apellido, edad, nacionalidad)
values ('Robert', 'Zemeckis', 72, 'Norteamericano');


 insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Forrest Gump',
 'Sentado en un banco en Savannah, Georgia, Forrest Gump espera al autobús. 
 Mientras éste tarda en llegar, el joven cuenta su vida a las personas que se sientan a esperar con él. 
 Aunque sufre un pequeño retraso mental, esto no le impide hacer cosas maravillosas. 
 Sin entender del todo lo que sucede a su alrededor, 
 Forrest toma partido en los eventos más importantes de la historia de los Estados Unidos.',
 'Comedia, Drama, Romántico',
 4.6,
 1994,
 4.1,
 (select id_director from directores where apellido = 'Zemeckis' and nombre = 'Robert'));
 
 
 /*El rey león*/
 
     insert into directores (nombre, apellido, edad, nacionalidad)
values ('Rob', 'Minkoff', 61, 'Norteamericano');


 insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('El Rey León',
 'Tras la muerte de su padre, Simba deberá enfrentarse a su tío para recuperar el trono de Rey de la Selva. 
 Timón y Pumba le acompañarán en su misión.',
 'Aventura, Animación, Familia',
 4.6,
 1994,
 4.5,
 (select id_director from directores where apellido = 'Minkoff' and nombre = 'Rob'));
 
 
 /*Regreso al futuro*/
 
 insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Regreso al futuro',
 'El adolescente Marty McFly es amigo de Doc, 
 un científico que ha construido una máquina del tiempo.
 Cuando los dos prueban el artefacto, un error fortuito hace que Marty llegue a 1955,
 año en el que sus padres iban al instituto y todavía no se habían conocido.
 Después de impedir su primer encuentro, Marty deberá conseguir que se conozcan y se enamoren,
 de lo contrario su existencia no sería posible.',
 'Aventura, Comedia, Ciencia ficción',
 4.5,
 1985,
 3.9,
 (select id_director from directores where apellido = 'Zemeckis' and nombre = 'Robert'));
 
 
 /*Capitán américa*/
 
 
 insert into movies (nombre, descripcion, genero, calificacion, año, estrellas, director)
values ('Capitán América: El primer vengador',
 'Tras tres meses de someterse a un programa de entrenamiento físico y táctico, 
 Steve Rogers es encomendado su primera misión como Capitán América. Armado con un escudo indestructible, 
 emprenderá la guerra contra el Mal como líder de los Vengadores.',
 'Acción, Aventura, Ciencia ficción',
 3.9,
 2011,
 2.9,
 (select id_director from directores where apellido = 'Johnston' and nombre = 'Joe'));