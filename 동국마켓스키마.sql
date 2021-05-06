-- 데이터베이스 생성
CREATE DATABASE dgumarket;
use dgumarket;

--게시판 테이블
create table board(
id int not null,
isbuy varchar(10),
category varchar(10),
name varchar(20),
title varchar(30),
content varchar(300),
imgfile varchar(300),
primary key(id));

-- 회원 테이블
CREATE TABLE user (
userID varchar(20) not null,
 userPassword varchar(20),
userName varchar(20),
userGender varchar(1),
 userDate date, primary key (userID));

--메세지 테이블
CREATE TABLE message_3(
  msgnum int,
  msgsendid varchar(20),
  msgid varchar(20),
  msgtitle varchar(20),
  msgcontents varchar(200),
  msgdate varchar(20));
