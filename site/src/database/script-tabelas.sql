create database projetoIndividual;

use projetoIndividual;

create table timeFavorito (
idTime int primary key,
nome varchar(45),
títulos int
);

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
fkTimeFav int,
foreign key (fkTimeFav) references timeFavorito(idTime)
);

create table historia (
idHistoria int auto_increment,
fkUsuario int,
foreign key (fkUsuario) references usuario(idUsuario),
descricao varchar(400),
primary key (idHistoria)
);

create table jogador (
idJogador int primary key,
nome varchar(45),
`time` varchar(45),
aneis int
);

create table votos (
fkUsuario int,
foreign key (fkUsuario) references usuario(idUsuario),
fkJogador int,
foreign key (fkJogador) references jogador(idJogador),
idVoto int unique auto_increment,
primary key (fkUsuario, fkJogador, idVoto)
);

insert into jogador values 
(1,"Chris Paul","Los Angeles Clippers", 0),
(2,"Kirye Irving","Cleveland Cavaliers", 1),
(3,"Magic Johnson","Los Angeles Lakers", 5),
(4,"Russel Westbrook","Oklahoma City Thunder", 1),
(5,"Steph Curry","Golden State Warriors", 4),
(6,"Allen Iverson","Philadelphia 76ers", 0),
(7,"Dwyane Wade","Miami heat", 3),
(8,"James Harden","Houston Rockets", 0),
(9,"Kobe Bryant","Los Angeles Lakers", 5),
(10,"Michael Jordan","Chicago Bulls", 6),
(11,"Kevin Durant","Oklahoma City Thunder", 2),
(12,"Kawhi Leonard","Los Angeles Clippers", 2),
(13,"Larry Bird","Boston Celtics",3),
(14,"Lebron James","Cleveland Cavaliers", 4),
(15,"Scottie Pipen","Chicago Bulls", 6),
(16,"Anthony Davis","Los Angeles Lakers", 1),
(17,"DirK Nowitzki","Dallas Mavericks", 1),
(18,"Giannis Antetokounmpo","Milwaukee Bucks", 1),
(19,"Kevin Garnett","Boston Celtics", 1),
(20,"Tim Duncan","San Antonio Spurs", 5),
(21,"Bill Russell","Boston Celtics", 11),
(22,"Hakeem Olajuwon","Houston Rockets", 2),
(23,"Kareem Abdul Jabbar","Los Angeles Lakers", 6),
(24,"Shaquille O'Neal","Los Angeles Lakers", 4),
(25,"Wilt Chamberlain","Los Angeles Lakers", 2);

insert into timeFavorito values
(1,'Atlanta Hawks',1),
(2,'Boston Celtics',17),
(3,'Brooklyn Nets',0),
(4,'Charlotte Hornets',0),
(5,'Chicago Bulls',6),
(6,'Cleveland Cavaliers',1),
(7,'Dallas Mavericks',1),
(8,'Denver Nuggets',0),
(9,'Detroit Pinstons',3),
(10,'Golden State Warriors',7),
(11,'Houston Rockets',2),
(12,'Indiana Pacers',0),
(13,'Los angeles Clippers',0),
(14,'Los Angeles Lakers',17),
(15,'Memphis Grizzlies',0),
(16,'Miami Heat',3),
(17,'Milwaukee Bucks',2),
(18,'Minnesota Timberwolves',0),
(19,'New Orleans Pelicans',0),
(20,'New York Knicks',2),
(21,'Oklahoma City Thunder',1),
(22,'Orlando Magic',0),
(23,'Philadelphia 76ers',3),
(24,'Phoenix Suns',0),
(25,'Portland Trail Blazers',1),
(26,'Sacramento Kings',1),
(27,'San Antonio Spurs',5),
(28,'Toronto Raptors',1),
(29,'Utah Jazz',0),
(30,'Washington Wizards',1);

select * from usuario;
select * from timeFavorito;
select * from votos;
select * from historia;

select descricao from historia;

select usuario.nome, timeFavorito.nome
from usuario
join timeFavorito on fkTimeFav = idTime; 

select count(idVoto) from votos
join usuario on fkUsuario = idUsuario
join jogador on fkJogador = idJogador;

select count(idVoto) as Total, jogador.nome from votos
join usuario on fkUsuario = idUsuario
join jogador on fkJogador = idJogador
group by idJogador order by Total desc;