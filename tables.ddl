create sequence scorekeeper.hibernate_sequence;

create table scorekeeper.tournaments (
  id bigint primary key,
  version bigint,
  name varchar(50) not null unique
);

create table scorekeeper.matches (
  id bigint primary key,
  version bigint,
  time timestamp with time zone,
  tnmt_id bigint not null references scorekeeper.tournaments
);

create table scorekeeper.scores (
  id bigint primary key,
  version bigint,
  mtch_id bigint not null references scorekeeper.matches,
  team_id bigint not null references scorekeeper.teams,
  score bigint not null
);

create table scorekeeper.teams (
  id bigint primary key,
  version bigint,
  name varchar (20) not null
);

create table scorekeeper.players (
  id bigint primary key,
  version bigint,
  name varchar (50) not null
);

create table scorekeeper.teams_players (
  id bigint primary key,
  team_id bigint not null references scorekeeper.teams,
  plyr_id bigint not null references scorekeeper.players
);
