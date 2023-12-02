show tables;

create table views (
	idx 		int not null auto_increment,		/* 조회수 테이블 고유번호 */
	boardType	varchar(10) not null,				/* 게시판 타입 */
	boardIdx	int not null,						/* 게시물의 고유번호 */
	memberIdx	int not null,						/* 조회한 유저의 고유번호 */
	viewDate	datetime not null default now(),	/* 조회한 날짜 */
	
	primary key(idx),
	foreign key(boardIdx) references board1(idx) on delete cascade
);
desc views;
drop table views;

create table recommend (
	idx 		int not null auto_increment,		/* 추천 테이블 고유번호 */
	boardType	varchar(10) not null,				/* 게시판 타입 */
	boardIdx	int not null,						/* 게시판 고유번호 */
	memberIdx	int not null,						/* 추천 유저의 고유번호 */
	flag		int not null,						/* 추천값(1:추천 0:없음 2:비추천) */
	
	primary key(idx),
	foreign key(boardIdx) references board1(idx) on delete cascade
);
desc recommend;
drop table recommend;
select * from recommend;
insert into recommend values (default,'자유게시판',8,1,1)
update recommend set flag = flag + 1 where idx = 1;