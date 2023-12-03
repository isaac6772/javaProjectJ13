show tables;

create table member1 (
	idx 		int not null auto_increment,		/* 회원 고유 번호 */
	mid			varchar(15) not null,				/* 회원 아이디 */
	pwd			varchar(100) not null,				/* 회원 비밀번호 */
	nickName	varchar(7) not null,				/* 회원 닉네임 */
	name		varchar(20) not null,				/* 회원 성명 */
	phone		varchar(15) not null,				/* 회원 전화번호 */
	gender		varchar(3) not null,				/* 회원 성별 */
	level		int default 1,						/* 회원 등급 */
	visitCnt	int default 0,						/* 방문횟수 */
	point 		int default 0,						/* 보유 포인트 */
	joinDate	datetime default now(),				/* 가입날짜 */
	lastDate	datetime default now(),				/* 마지막방문일자 */
	profile		varchar(150) default 'noImage.jpg',	/* 프로필사진 */
	userInfo	varchar(5) default 'y',				/* 정보공개여부 */
	
	primary key(idx),								/* 기본키 고유 번호 */
	unique(mid)										/* 유니크키 아이디 */
);
desc member1;
select * from member1;
drop table member1;
insert into member1 values (default,'admin','1234','관리자','관리자','01012345678','남자',0,0,100,default,default,default,'n');
select *,sum(good) as good, sum(bad) as bad from member1 join board1 on member1.idx = board1.memberIdx and member1.mid = 'admin'

